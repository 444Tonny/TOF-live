import { ref, computed } from 'vue'

/**
 * Composable pour gérer le timer du jeu
 */
export function useGameTimer() {
  const timeLeft = ref(8) // Temps restant en secondes
  const isRunning = ref(false)
  const isPaused = ref(false)
  let intervalId = null

  /**
   * Progression du timer en pourcentage
   */
  const progress = computed(() => {
    return (timeLeft.value / 8) * 100
  })

  /**
   * Démarrer le timer
   */
  const start = (callback) => {
    if (isRunning.value) return

    timeLeft.value = 8
    isRunning.value = true
    isPaused.value = false

    intervalId = setInterval(() => {
      if (timeLeft.value > 0) {
        timeLeft.value--
      } else {
        stop()
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