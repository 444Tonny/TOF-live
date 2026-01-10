import { ref, computed } from 'vue'

/**
 * Composable pour gérer le timer du jeu
 */
export function useGameTimer() {
  const timeLeft = ref(8) // Temps restant en secondes
  const isRunning = ref(false)
  const isPaused = ref(false)
  let intervalId = null
  let countdownAudio = null

  /**
   * Progression du timer en pourcentage
   */
  const progress = computed(() => {
    return (timeLeft.value / 8) * 100
  })

  /**
   * Initialiser l'audio du countdown
   */
  const initCountdownAudio = () => {
    if (!countdownAudio) {
      countdownAudio = new Audio('/audio/timer2.mp3')
      countdownAudio.volume = 0.8 // Ajustez le volume (0 à 1)
    }
  }

  /**
   * Jouer l'audio du countdown
   */
  const playCountdownAudio = () => {
    initCountdownAudio()
    countdownAudio.currentTime = 0
    countdownAudio.play().catch(err => {
      console.error('Erreur lecture audio countdown:', err)
    })
  }

  /**
   * Arrêter l'audio du countdown
   */
  const stopCountdownAudio = () => {
    if (countdownAudio) {
      countdownAudio.pause()
      countdownAudio.currentTime = 0
    }
  }

  /*
  * Fade out progressif
    const stopCountdownAudio = () => {
    if (countdownAudio) {
      const fadeOut = setInterval(() => {
        if (countdownAudio.volume > 0.1) {
          countdownAudio.volume -= 0.1
        } else {
          clearInterval(fadeOut)
          countdownAudio.pause()
          countdownAudio.currentTime = 0
          countdownAudio.volume = 0.5 // Reset volume
        }
      }, 50)
    }
  }
  */

  /**
   * Démarrer le timer
   */
  const start = (callback) => {
    if (isRunning.value) return

    timeLeft.value = 8
    isRunning.value = true
    isPaused.value = false
    stopCountdownAudio() // Arrêter l'audio au cas où

    intervalId = setInterval(() => {
      if (timeLeft.value > 0) {
        timeLeft.value--

        // Jouer l'audio quand on atteint 5 secondes
        if (timeLeft.value === 5) {
          playCountdownAudio()
        }
      } else {
        stop()
        stopCountdownAudio() // Arrêter l'audio à 0
        if (callback) callback() // Appeler la fonction quand le timer atteint 0
      }
    }, 1000)
  }

  /**
   * Arrêter le timer
   */
  const stop = () => {
    if (intervalId) {
      clearInterval(intervalId)
      intervalId = null
    }
    isRunning.value = false
    stopCountdownAudio() // Arrêter l'audio
  }

  /**
   * Mettre en pause (pour les transitions vocales)
   */
  const pause = () => {
    isPaused.value = true
    stop()
  }

  /**
   * Réinitialiser
   */
  const reset = () => {
    stop()
    timeLeft.value = 8
    isPaused.value = false
  }

  return {
    timeLeft,
    progress,
    isRunning,
    isPaused,
    start,
    stop,
    pause,
    reset
  }
}