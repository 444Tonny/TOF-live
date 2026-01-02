import { ref } from 'vue'

/**
 * Store global pour gérer l'état du speech
 * Permet d'activer/désactiver la voix depuis n'importe où
 */
const isSpeechEnabled = ref(true)

export function useSpeechStore() {
  
  /**
   * Activer/Désactiver le speech
   */
  const toggleSpeech = () => {
    isSpeechEnabled.value = !isSpeechEnabled.value
  }

  /**
   * Activer le speech
   */
  const enableSpeech = () => {
    isSpeechEnabled.value = true
  }

  /**
   * Désactiver le speech
   */
  const disableSpeech = () => {
    isSpeechEnabled.value = false
  }

  return {
    isSpeechEnabled,
    toggleSpeech,
    enableSpeech,
    disableSpeech
  }
}