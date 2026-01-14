import { ref } from 'vue'

/**
 * Store global pour gérer l'état du speech
 * Permet d'activer/désactiver la voix depuis n'importe où
 */
const isPiperSpeechEnabled = ref(true)

export function useSpeechStore() {
  
  /**
   * Activer/Désactiver le speech
   */
  const toggleSpeech = () => {
    isPiperSpeechEnabled.value = !isPiperSpeechEnabled.value
  }

  /**
   * Activer le speech
   */
  const enableSpeech = () => {
    isPiperSpeechEnabled.value = true
  }

  /**
   * Désactiver le speech
   */
  const disableSpeech = () => {
    isPiperSpeechEnabled.value = false
  }

  return {
    isPiperSpeechEnabled,
    toggleSpeech,
    enableSpeech,
    disableSpeech
  }
}