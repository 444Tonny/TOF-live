import { ref, onUnmounted } from 'vue'
import { sessionService } from '../services/api'
import socket from '../services/socket'
import { usePiperSpeech } from './usePiperSpeech'
import { useGameTimer } from './useGameTimer'
import { ANSWER_CONNECTORS, NEXT_QUESTION_TRANSITIONS, INTRO_PHRASES, OUTRO_PHRASES, getRandomPhrase } from '../constants/speechPhrases'
import speechifyService from '../services/speechifyService' // AJOUTER en haut


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

  const { speakPiper, speakSequencePiper, stopSpeakPiper, isPiperSpeaking, isPiperSpeechEnabled } = usePiperSpeech()
  const { timeQuestionLeft, progress, isQuestionTimerPaused, startQuestionTimer, pauseQuestionTimer } = useGameTimer()

  /**
   * Jouer l'introduction avec Speechify
   */
  const playIntroWithSpeechify = async () => {
    
    showOutro.value = false
    showIntro.value = true

    const introPhrase = getRandomPhrase(INTRO_PHRASES)
    
    // Utiliser Speechify pour l'intro - XYZ
    await speechifyService.speakSpeechify(introPhrase)
    
    await new Promise(resolve => setTimeout(resolve, 1000))

    showIntro.value = false
  }

   /**
   * Jouer l'outro avec Speechify
   */
  const playOutroWithSpeechify = async () => {
    const outroPhrase = getRandomPhrase(OUTRO_PHRASES)
    showOutro.value = true
    
    // Utiliser Speechify pour l'outro - XYZ
    await speechifyService.speakSpeechify(outroPhrase)
  }


  /**
   * Jouer la transition vocale
   */
  const playTransition = async (question) => {
    const answerText = question.answer ? 'true' : 'false'
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

    pauseQuestionTimer()
    revealAnswer.value = true
    
    await speakSequencePiper(speechSequence)

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
        stopSpeakPiper()

        // Extraire la question et les infos de position
        const { currentPosition: pos, totalQuestions: total, ...question } = data
        
        // Si c'est la première question, jouer l'intro avant de poser la question
        if (pos === 1) {
          //isFirstQuestion.value = false
          await playIntroWithSpeechify()
        }

        currentQuestion.value = question
        currentPosition.value = pos || 0      // AJOUTER
        totalQuestions.value = total || 0     // AJOUTER
        revealAnswer.value = false

        setTimeout(() => {
          speakPiper(question.question)
        }, 100)

        startQuestionTimer(async () => {
          await playTransition(question)

          // Si c'était la dernière question, jouer l'outro
          if (pos === total) {
            await playOutroWithSpeechify()
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
    stopSpeakPiper()
    speechifyService.stopSpeakSpeechify()
  })

  return {
    session,
    currentQuestion,
    revealAnswer,
    currentPosition,   // AJOUTER
    totalQuestions,    // AJOUTER
    showIntro,      // AJOUTER
    showOutro,     // AJOUTER
    isPiperSpeaking,
    isPiperSpeechEnabled,
    timeQuestionLeft,
    progress,
    isQuestionTimerPaused,
    connectToSession,
    stopSpeakPiper
  }
}

  /**
   * Jouer l'introduction avec Piper
  const playIntro = async () => {
    showOutro.value = false
    showIntro.value = true
    const introPhrase = getRandomPhrase(INTRO_PHRASES)
    await speakPiper(introPhrase)
    
    // Attendre 2 secondes après le speech
    await new Promise(resolve => setTimeout(resolve, 1000))
    
    showIntro.value = false
  }

  
  /**
   * Jouer l'outro avec Piper
  const playOutro = async () => {
    const outroPhrase = getRandomPhrase(OUTRO_PHRASES)
    showOutro.value = true
    await speakPiper(outroPhrase)
  }

*/