import { ref, onMounted, onUnmounted, computed } from 'vue'
import { sessionService, gameService } from '../services/api'
import socket from '../services/socket'
import { useSpeech } from './useSpeech' // AJOUTER
import { useGameTimer } from './useGameTimer'
import { ANSWER_CONNECTORS, NEXT_QUESTION_TRANSITIONS, getRandomPhrase } from '../constants/speechPhrases' // AJOUTER
import { useLeaderboard } from './useLeaderboard' // AJOUTER

/**
 * Composable pour le Player (viewers)
 */
export function usePlayerGame() {
    const session = ref(null)
    const player = ref(null)
    const currentQuestion = ref(null)
    const hasAnswered = ref(false)
    const answerResult = ref(null)
    const isLoading = ref(false)
    const { speak, speakSequence, stop, isSpeaking, isSpeechEnabled } = useSpeech()
    const { timeLeft, progress, isRunning, isPaused, start: startTimer, pause: pauseTimer } = useGameTimer()

    // AJOUTER : Utiliser le composable
    const sessionId = computed(() => session.value?.id)
    const { scoreLeaderboard, streakLeaderboard, loadLeaderboards, updateLeaderboards } = useLeaderboard(sessionId)

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
            socket.on('question:new', (question) => {

                // Arrêter toute lecture en cours
                stop()

                currentQuestion.value = question
                hasAnswered.value = false
                answerResult.value = null

                // AJOUTER : Lire la question
                setTimeout(() => {
                    speak(question.question)
                }, 100)

                // MODIFIER : Démarrer le timer avec callback pour jouer la transition
                startTimer(async () => {
                    await playTransition(question)

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

        //stop() enlevé pour ne pas interrompre la parole

        hasAnswered.value = true
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
   * Jouer la transition vocale côté player
   */
    const playTransition = async (question) => {
        const answerText = question.answer ? 'vrai' : 'faux'
        const connector = getRandomPhrase(ANSWER_CONNECTORS)
        const answerDetail = question.answer_detail || ''
        const transition = getRandomPhrase(NEXT_QUESTION_TRANSITIONS)

        const speechSequence = [
        `${connector}, ${answerText}.`,
            answerDetail,
            transition
        ]

        //debugger

        pauseTimer()
        await speakSequence(speechSequence)
    }

    // Nettoyer à la destruction
    onUnmounted(() => {
        socket.disconnect()
        stop()
    })

    return {
        session,
        player,
        scoreLeaderboard,
        streakLeaderboard,
        currentQuestion,
        hasAnswered,
        answerResult,
        isLoading,
        isSpeaking,
        isSpeechEnabled,
        timeLeft,
        progress,
        isPaused,
        joinSession,
        submitAnswer,
        loadLeaderboards,
        stop
    }
}