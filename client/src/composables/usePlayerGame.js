import { ref, onMounted, onUnmounted, computed } from 'vue'
import { sessionService, gameService } from '../services/api'
import socket from '../services/socket'
import { usePiperSpeech } from './usePiperSpeech' // AJOUTER
import { useGameTimer } from './useGameTimer'
import { ANSWER_CONNECTORS, NEXT_QUESTION_TRANSITIONS, MID_GAME_LEADERBOARD_INTRO, MID_GAME_LEADERBOARD_OUTRO, getRandomPhrase } from '../constants/speechPhrases' // AJOUTER
import { GAME_CONFIG } from '../constants/gameConfig' // AJOUTER
import { useLeaderboard } from './useLeaderboard' // AJOUTER

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
            socket.on('leaderboard:update', (newLeaderboard) => {
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
                

                // AJOUTER : Vérifier si on doit afficher le classement mid-game
                if (shouldShowMidGameLeaderboard(pos)) {
                    await playMidGameTransition()
                }

                // AJOUTER : Lire la question
                setTimeout(() => {
                    speakPiper(dataQuestion.question)
                }, 100)

                // MODIFIER : Démarrer le timer avec callback pour jouer la transition
                startQuestionTimer(async () => {
                    await playTransition(dataQuestion.question)

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

            // Notifier via Socket.io pour mise à jour temps réel
            socket.emit('player:answer-submitted', {
                sessionId: session.value.id,
                playerId: player.value.platform_user_id,
                isCorrect: response.data.isCorrect
            })

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
    const playTransition = async (question) => {
        const answerText = question.answer ? 'true' : 'false'
        const connector = getRandomPhrase(ANSWER_CONNECTORS)
        const answerDetail = question.answer_detail || ''
        const transition = getRandomPhrase(NEXT_QUESTION_TRANSITIONS)

        const speechSequence = [
        `${connector}, ${answerText}.`,
            answerDetail,
            transition
        ]

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
        await new Promise(resolve => setTimeout(resolve, 10000))

        // Outro classement
        const outroPhraseLeaderboard = getRandomPhrase(MID_GAME_LEADERBOARD_OUTRO)
        await speakPiper(outroPhraseLeaderboard)

        // Cacher le classement
        showMidGameLeaderboard.value = false
    }

    /**
     * Vérifier si on doit afficher le classement mid-game
     */
    const shouldShowMidGameLeaderboard = (position) => {
        // Toutes les 5 questions (5, 10, 15, 20...)
        console.log("positon Question = " +position);
        return position > 0 && position % 5 === 0
    }

    // Nettoyer à la destruction
    onUnmounted(() => {
        socket.disconnect()
        stopSpeakPiper()
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
        joinSession,
        submitAnswer,
        loadLeaderboards,
        stopSpeakPiper
    }
}