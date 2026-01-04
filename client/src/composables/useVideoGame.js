import { ref, onUnmounted } from 'vue'
import { sessionService } from '../services/api'
import socket from '../services/socket'
import { useSpeech } from './useSpeech'
import { useGameTimer } from './useGameTimer'
import { ANSWER_CONNECTORS, NEXT_QUESTION_TRANSITIONS, getRandomPhrase } from '../constants/speechPhrases'

/**
 * Composable pour le mode vidéo (pas de joueur, juste affichage)
 */
export function useVideoGame() {
  const session = ref(null)
  const currentQuestion = ref(null)
  const revealAnswer = ref(false)

  const { speak, speakSequence, stop, isSpeaking, isSpeechEnabled } = useSpeech()
  const { timeLeft, progress, isPaused, start: startTimer, pause: pauseTimer } = useGameTimer()

  /**
   * Jouer la transition vocale
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

    pauseTimer()
    revealAnswer.value = true
    
    await speakSequence(speechSequence)

    // AJOUTER : Signaler au host que la transition est terminée
    socket.emit('player:transition-complete', {
        sessionId: session.value.id
    })
  }

  /**
   * Se connecter à la session active (mode spectateur)
   */
  const connectToSession = async () => {
    try {
      const sessionResponse = await sessionService.getActiveSession()
      session.value = sessionResponse.data

      socket.connect()
      
      // Rejoindre en mode spectateur (pas de player ID)
      socket.emit('player:join', {
        sessionId: session.value.id,
        playerId: `video_viewer_${Date.now()}`
      })

      // Écouter les nouvelles questions
      socket.on('question:new', (question) => {
        stop()
        
        currentQuestion.value = question
        revealAnswer.value = false

        setTimeout(() => {
          speak(question.question)
        }, 100)

        startTimer(async () => {
          await playTransition(question)
        })
      })

    } catch (error) {
      console.error('Erreur connexion session:', error)
      throw error
    }
  }

  onUnmounted(() => {
    socket.disconnect()
    stop()
  })

  return {
    session,
    currentQuestion,
    revealAnswer,
    isSpeaking,
    isSpeechEnabled,
    timeLeft,
    progress,
    isPaused,
    connectToSession,
    stop
  }
}