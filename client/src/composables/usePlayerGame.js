import { ref, onMounted, onUnmounted, computed } from 'vue'
import { sessionService, gameService } from '../services/api'
import socket from '../services/socket'
import { usePiperSpeech } from './usePiperSpeech' // AJOUTER
import { useGameTimer } from './useGameTimer'
import { ANSWER_CONNECTORS, NEXT_QUESTION_TRANSITIONS, MID_GAME_LEADERBOARD_INTRO, MID_GAME_LEADERBOARD_OUTRO, TOP_STREAK_ENTRY_MESSAGES, getRandomPhrase } from '../constants/speechPhrases' // AJOUTER
import { GAME_CONFIG } from '../constants/gameConfig' // AJOUTER
import { useLeaderboard } from './useLeaderboard' // AJOUTER
import speechifyService from '../services/speechifyService'
/**
 * Composable pour le Player (viewers)
 */
export function usePlayerGame() {
    const session = ref(null)
    const player = ref(null)

    const currentQuestion = ref(null)
    const currentQuestionPosition = ref(0) // AJOUTER : pour tracker la position
    const totalQuestionsInSession = GAME_CONFIG.NUMBER_OF_QUESTION_IN_SESSION

    const hasAnswered = ref(false)
    const answerResult = ref(null)
    const isLoading = ref(false)
    const { speakPiper, speakSequencePiper, stopSpeakPiper, isPiperSpeaking, isPiperSpeechEnabled } = usePiperSpeech()
    const { timeQuestionLeft, progress, isQuestionTimerRunning, isQuestionTimerPaused, startQuestionTimer, pauseQuestionTimer } = useGameTimer()

    // AJOUTER : Utiliser le composable
    const sessionId = computed(() => session.value?.id)
    const { scoreLeaderboard, streakLeaderboard, loadLeaderboards, updateLeaderboards } = useLeaderboard(sessionId)

    const revealAnswer = ref(false) // AJOUTER
    const selectedAnswer = ref(null) // AJOUTER

    const showMidGameLeaderboard = ref(false) // AJOUTER - midgame leaderboard

    const previousTop3Ids = ref([]) // Garder les IDs du top 3 précédent

    const showTopStreakAnnouncement = ref(false)
    const announcedPlayer = ref(null)
    const announcedPosition = ref(0)

    /**
     * Rejoindre la session active
     */
    const joinSession = async (username) => {
        isLoading.value = true
        try {
            // Récupérer la session active
            const sessionResponse = await sessionService.getActiveSession()
            session.value = sessionResponse.data

            // Générer un ID unique basé sur le username + timestamp
            const platformUserId = `web_${username}_${Date.now()}`

            // Stocker les infos du joueur
            player.value = {
                username,
                platform_user_id: platformUserId,
                score: 0
            }

            // Connecter au WebSocket
            socket.connect()
            socket.emit('player:join', {
                sessionId: session.value.id,
                playerId: platformUserId
            })            

            /* Écouter les mises à jour du classement
                socket.on('leaderboard:update', (newLeaderboard) => {
                leaderboard.value = newLeaderboard
            }) */
            socket.on('leaderboard:update', async (newLeaderboard) => {
                console.log("Mise à jour du classement reçue:", newLeaderboard);
                updateLeaderboards(newLeaderboard)
            })

            // Écouter les nouvelles questions
            socket.on('question:new', async (dataQuestion) => {

                // Arrêter toute lecture en cours
                stopSpeakPiper()

                // AJOUTER : Extraire currentQuestionPosition
                const { currentPosition: pos, totalQuestions: total, ...question } = dataQuestion

                currentQuestionPosition.value = pos || 0
                currentQuestion.value = dataQuestion
                hasAnswered.value = false
                answerResult.value = null
                revealAnswer.value = false // AJOUTER : Reset la révélation
                selectedAnswer.value = null // AJOUTER : Reset la sélection
                
                // AJOUTER : Lire la question
                setTimeout(() => {
                    speakPiper(dataQuestion.question)
                }, 400)

                // MODIFIER : Démarrer le timer avec callback pour jouer la transition
                startQuestionTimer(async () => {
                    
                    // 1. Détecter s'il y a un nouveau joueur
                    const newPlayerInfo = detectNewTopStreakPlayer(streakLeaderboard.value)

                    // 2. Jouer la transition (sans "Next" si nouveau joueur)
                    await playTransition(currentQuestion.value, !!newPlayerInfo)

                    // 3. Si nouveau joueur, annoncer avec Speechify
                    if (newPlayerInfo) {
                        await announceNewTopStreakPlayer(newPlayerInfo)
                    }

                    // AJOUTER : Signaler au host que la transition est terminée
                    socket.emit('player:transition-complete', {
                        sessionId: session.value.id
                    })
                })
            })

            // Écouter les résultats
            socket.on('answer:result', (result) => {
                answerResult.value = result
                if (result.isCorrect) {
                    player.value.score++
                }
            })

            // AJOUTER : Écouter le signal de pause mid-game
            socket.on('midgame-pause:start', async ({ currentPosition, totalQuestionsInSession }) => {
                console.log(`⏸️ Pause mid-game détectée à la question ${currentPosition}`)
     
                stopSpeakPiper()
                
                // Lancer la transition mid-game
                await playMidGameTransition()
                
                // Signaler au host que la pause est terminée
                socket.emit('player:midgame-pause-complete', {
                    sessionId: session.value.id
                })
            })

            // AJOUTER après midgame-pause:start
            socket.on('endgame-pause:start', async ({ currentPosition, totalQuestions }) => {
                console.log(`🏁 Pause fin de session détectée`)
                
                // Même transition que mid-game
                await playMidGameTransition()
                
                socket.emit('player:endgame-pause-complete', {
                    sessionId: session.value.id
                })
            })

            // Charger le classement initial
            await loadLeaderboards()

        } catch (error) {
            console.error('Erreur rejoindre session:', error)
            throw error
        } finally {
            isLoading.value = false
        }
    }

    /**
     * Soumettre une réponse
     */
    const submitAnswer = async (answer) => {
        if (hasAnswered.value || !currentQuestion.value || !player.value) return

        //stopSpeakPiper() enlevé pour ne pas interrompre la parole

        hasAnswered.value = true
        selectedAnswer.value = answer // AJOUTER : Stocker la réponse choisie
        isLoading.value = true

        try {
            const response = await gameService.submitAnswer(
                player.value.username,
                player.value.platform_user_id,
                answer
            )

            // MODIFIER : Stocker le résultat mais ne pas l'afficher tout de suite
            answerResult.value = response.data

        } catch (error) {
            console.error('Erreur soumission réponse:', error)
            hasAnswered.value = false
        } finally {
            isLoading.value = false
        }
    }

    /**
   * Jouer la transition vocale côté player apres une question
   */
    const playTransition = async (question, skipTransition = false) => {
        const answerText = question.answer ? 'true' : 'false'
        const connector = getRandomPhrase(ANSWER_CONNECTORS)
        const answerDetail = question.answer_detail || ''

        // Ne pas jouer de transition si skipTransition = true
        const transition = skipTransition ? '' : getRandomPhrase(NEXT_QUESTION_TRANSITIONS)

        const speechSequence = [
        `${connector}, ${answerText}.`,
            answerDetail,
            transition
        ].filter(text => text)

        //debugger
        pauseQuestionTimer()

        // AJOUTER : Révéler la réponse maintenant
        revealAnswer.value = true

        await speakSequencePiper(speechSequence)
    }

    /**
     * Jouer la transition mid-game (classement)
     */
    const playMidGameTransition = async () => {
        // Intro classement
        const introPhraseLeaderboard = getRandomPhrase(MID_GAME_LEADERBOARD_INTRO)
        await speakPiper(introPhraseLeaderboard)

        // Afficher le classement
        showMidGameLeaderboard.value = true

        // Attendre 10 secondes
        await new Promise(resolve => setTimeout(resolve, GAME_CONFIG.DELAY_LEADERBOARD_MIDGAME))

        // Outro classement
        const outroPhraseLeaderboard = getRandomPhrase(MID_GAME_LEADERBOARD_OUTRO)
        await speakPiper(outroPhraseLeaderboard)

        // Cacher le classement
        showMidGameLeaderboard.value = false

        stopSpeakPiper()
    }

    /**
     * Détecter et annoncer un nouveau joueur dans le top 3 streak
     */
    /**
     * Détecte s'il y a un nouveau joueur dans le top 3
     * @returns {Object|null} - {player, position} ou null
     */
    const detectNewTopStreakPlayer = (newStreakLeaderboard) => {
        if (!newStreakLeaderboard || newStreakLeaderboard.length === 0) return null

        const currentTop3 = newStreakLeaderboard.slice(0, 3)
        const currentTop3Ids = currentTop3.map(p => p.id)

        // Première fois : initialiser
        if (previousTop3Ids.value.length === 0) {
            previousTop3Ids.value = currentTop3Ids
            return null
        }

        // Trouver les nouveaux joueurs
        const newPlayers = currentTop3.filter(player => {
            return !previousTop3Ids.value.includes(player.id)
        })

        // Mettre à jour
        previousTop3Ids.value = currentTop3Ids

        // S'il y a un nouveau joueur
        if (newPlayers.length > 0) {
            const topNewPlayer = newPlayers[0]
            const position = currentTop3.findIndex(p => p.id === topNewPlayer.id) + 1
            
            return {
                player: topNewPlayer,
                position: position
            }
        }

        return null
    }

    /**
     * Annonce un nouveau joueur dans le top 3 avec Speechify
     */
    const announceNewTopStreakPlayer = async (playerInfo) => {
        if (!playerInfo) return

        const messages = TOP_STREAK_ENTRY_MESSAGES[playerInfo.position]
        const randomMessage = messages[Math.floor(Math.random() * messages.length)]
        const message = randomMessage.replace('{username}', playerInfo.player.username)

        console.log(`🎤 Position ${playerInfo.position}: ${playerInfo.player.username}`)

        // AJOUTER: Afficher l'annonce avant le speech
        announcedPlayer.value = playerInfo.player
        announcedPosition.value = playerInfo.position
        showTopStreakAnnouncement.value = true

        // Petit délai avant le speech
        await new Promise(resolve => setTimeout(resolve, 400))
        
        // Speech
        await speechifyService.speakSpeechify(message)

        // AJOUTER: Cacher l'annonce
        showTopStreakAnnouncement.value = true
    }

    // Nettoyer à la destruction
    onUnmounted(() => {
        socket.disconnect()
        stopSpeakPiper()
        speechifyService.stopSpeakSpeechify() // AJOUTER
    })

    return {
        session,
        player,
        scoreLeaderboard,
        streakLeaderboard,
        currentQuestion,
        currentQuestionPosition,
        totalQuestionsInSession,
        hasAnswered,
        answerResult,
        isLoading,
        isPiperSpeaking,
        isPiperSpeechEnabled,
        timeQuestionLeft,
        progress,
        isQuestionTimerPaused,
        revealAnswer,
        selectedAnswer,
        showMidGameLeaderboard, // AJOUTER
        showTopStreakAnnouncement,
        announcedPlayer,
        announcedPosition,
        joinSession,
        submitAnswer,
        loadLeaderboards,
        stopSpeakPiper
    }
}