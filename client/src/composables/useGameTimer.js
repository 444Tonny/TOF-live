import { ref, computed } from 'vue'
import { GAME_CONFIG } from '@/constants/gameConfig'

/**
 * Composable pour gérer le timer du jeu
 */
export function useGameTimer() {
  const timeQuestionLeft = ref(GAME_CONFIG.ANSWER_TIMER) // Temps restant en secondes
  const isQuestionTimerRunning = ref(false)
  const isQuestionTimerPaused = ref(false)
  let intervalId = null
  let countdownTimerAudio = null

  /**
   * Progression du timer en pourcentage
   */
  const progress = computed(() => {
    return (timeQuestionLeft.value / GAME_CONFIG.ANSWER_TIMER) * 100
  })

  /**
   * Initialiser l'audio du countdown
   */
  const initcountdownTimerAudio = () => {
    if (!countdownTimerAudio) {
      countdownTimerAudio = new Audio('/audio/timer2.mp3')
      countdownTimerAudio.volume = 0.6 // Ajustez le volume (0 à 1)
    }
  }

  /**
   * Jouer l'audio du countdown
   */
  const playcountdownTimerAudio = () => {
    initcountdownTimerAudio()
    countdownTimerAudio.currentTime = 0
    countdownTimerAudio.play().catch(err => {
      console.error('Erreur lecture audio countdown:', err)
    })
  }

  /**
   * Arrêter l'audio du countdown
   */
  const stopCountdownTimerAudio = () => {
    if (countdownTimerAudio) {
      countdownTimerAudio.pause()
      countdownTimerAudio.currentTime = 0
    }
  }

  /*
  * Fade out progressif
    const stopCountdownTimerAudio = () => {
    if (countdownTimerAudio) {
      const fadeOut = setInterval(() => {
        if (countdownTimerAudio.volume > 0.1) {
          countdownTimerAudio.volume -= 0.1
        } else {
          clearInterval(fadeOut)
          countdownTimerAudio.pauseQuestionTimer()
          countdownTimerAudio.currentTime = 0
          countdownTimerAudio.volume = 0.5 // Reset volume
        }
      }, 50)
    }
  }
  */

  /**
   * Démarrer le timer
   */
  const startQuestionTimer = (callback) => {
    if (isQuestionTimerRunning.value) return

    timeQuestionLeft.value = GAME_CONFIG.ANSWER_TIMER
    isQuestionTimerRunning.value = true
    isQuestionTimerPaused.value = false
    stopCountdownTimerAudio() // Arrêter l'audio au cas où

    intervalId = setInterval(() => {
      if (timeQuestionLeft.value > 0) {
        timeQuestionLeft.value--

        // Jouer l'audio quand on atteint 5 secondes
        if (timeQuestionLeft.value === GAME_CONFIG.PLAY_TIMER_AUDIO_AT) {
          playcountdownTimerAudio()
        }
      } else {
        stopQuestionTimer()
        stopCountdownTimerAudio() // Arrêter l'audio à 0
        if (callback) callback() // Appeler la fonction quand le timer atteint 0
      }
    }, 1000)
  }

  /**
   * Arrêter le timer
   */
  const stopQuestionTimer = () => {
    if (intervalId) {
      clearInterval(intervalId)
      intervalId = null
    }
    isQuestionTimerRunning.value = false
    stopCountdownTimerAudio() // Arrêter l'audio
  }

  /**
   * Mettre en pause (pour les transitions vocales)
   */
  const pauseQuestionTimer = () => {
    isQuestionTimerPaused.value = true
    stopQuestionTimer()
  }

  /**
   * Réinitialiser
   */
  const resetQuestionTimer = () => {
    stopQuestionTimer()
    timeQuestionLeft.value = GAME_CONFIG.ANSWER_TIMER
    isQuestionTimerPaused.value = false
  }

  return {
    timeQuestionLeft,
    progress,
    isQuestionTimerRunning,
    isQuestionTimerPaused,
    startQuestionTimer,
    stopQuestionTimer,
    pauseQuestionTimer,
    resetQuestionTimer
  }
}