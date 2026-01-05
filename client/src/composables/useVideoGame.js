import { ref, onUnmounted } from 'vue'
import { sessionService } from '../services/api'
import socket from '../services/socket'
import { useSpeech } from './useSpeech'
import { useGameTimer } from './useGameTimer'
import { ANSWER_CONNECTORS, NEXT_QUESTION_TRANSITIONS, INTRO_PHRASES, OUTRO_PHRASES, getRandomPhrase } from '../constants/speechPhrases'

/**
 * Composable pour le mode vidéo (pas de joueur, juste affichage)
 */
export function useVideoGame() {
  const session = ref(null)
  const currentQuestion = ref(null)
  const revealAnswer = ref(false)
  const currentPosition = ref(0) // AJOUTER
  const totalQuestions = ref(0)  // AJOUTER
  const showIntro = ref(true)       // AJOUTER
  const showOutro = ref(false)      // AJOUTER
  // const isFirstQuestion = ref(true)
  // const isLastQuestion = ref(false)

  const { speak, speakSequence, stop, isSpeaking, isSpeechEnabled } = useSpeech()
  const { timeLeft, progress, isPaused, start: startTimer, pause: pauseTimer } = useGameTimer()

  /**
   * Jouer l'introduction
   */
  const playIntro = async () => {
    const introPhrase = getRandomPhrase(INTRO_PHRASES)
    await speak(introPhrase)
    
    // Attendre 2 secondes après le speech
    await new Promise(resolve => setTimeout(resolve, 2000))
    
    showIntro.value = false
  }

  /**
   * Jouer l'outro
   */
  const playOutro = async () => {
    const outroPhrase = getRandomPhrase(OUTRO_PHRASES)
    showOutro.value = true
    await speak(outroPhrase)
  }

  /**
   * Jouer la transition vocale
   */
  const playTransition = async (question) => {
    const answerText = question.answer ? 'vrai' : 'faux'
    const connector = getRandomPhrase(ANSWER_CONNECTORS)
    const answerDetail = question.answer_detail || ''
    let transition = getRandomPhrase(NEXT_QUESTION_TRANSITIONS)

    /* ne pas mettre de transition si c'est la dernière question */
    if (currentPosition.value === totalQuestions.value) {
      transition = ''
    }

    // debugger

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
      socket.on('question:new', async (data) => {
        stop()

        // Extraire la question et les infos de position
        const { currentPosition: pos, totalQuestions: total, ...question } = data
        
        // Si c'est la première question, jouer l'intro
        if (pos === 1) {
          //isFirstQuestion.value = false
          await playIntro()
        }

        currentQuestion.value = question
        currentPosition.value = pos || 0      // AJOUTER
        totalQuestions.value = total || 0     // AJOUTER
        revealAnswer.value = false

        setTimeout(() => {
          speak(question.question)
        }, 100)

        startTimer(async () => {
          await playTransition(question)

          // Si c'était la dernière question, jouer l'outro
          if (pos === total) {
            await playOutro()
          }
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
    currentPosition,   // AJOUTER
    totalQuestions,    // AJOUTER
    showIntro,      // AJOUTER
    showOutro,     // AJOUTER
    isSpeaking,
    isSpeechEnabled,
    timeLeft,
    progress,
    isPaused,
    connectToSession,
    stop
  }
}