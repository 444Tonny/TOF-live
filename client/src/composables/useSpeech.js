import { ref } from 'vue'
import speechService from '../services/speechService'
import { useSpeechStore } from '../stores/speechStore'

/**
 * Composable pour gérer la synthèse vocale
 */
export function useSpeech() {
  const isSpeaking = ref(false)
  const availableVoices = ref([])
  const currentVoice = ref(null)

  // Accéder au store pour vérifier si le speech est activé
  const { isSpeechEnabled } = useSpeechStore()

  /**
   * Charger les voix disponibles
   */
  const loadVoices = () => {
    availableVoices.value = speechService.getFrenchVoices()
    if (availableVoices.value.length > 0) {
      currentVoice.value = availableVoices.value[0].name
    }
  }

  /**
   * Lire un texte
   */
  const speak = (text, options = {}) => {

    // Si le speech est désactivé, ne rien faire
    if (!isSpeechEnabled.value) {
      console.log('Speech désactivé, texte ignoré:', text)
      if (options.onEnd) options.onEnd()
      return
    }

    // Sinon si le speech est activé
    isSpeaking.value = true

    speechService.speak(text, {
      ...options,
      onEnd: () => {
        isSpeaking.value = false
        if (options.onEnd) options.onEnd()
      },
      onError: () => {
        isSpeaking.value = false
        if (options.onError) options.onError()
      }
    })
  }

  /**
   * Lire plusieurs textes en séquence
   */
  const speakSequence = async (texts) => {
    // Si le speech est désactivé, ne rien faire
    if (!isSpeechEnabled.value) {
      return
    }

    for (const text of texts) {
      await new Promise((resolve) => {
        speak(text, {
          onEnd: resolve,
          onError: resolve
        })
      })
      // Pause entre chaque phrase
      await new Promise(resolve => setTimeout(resolve, 400))
    }
  }

  /**
   * Arrêter la lecture
   */
  const stop = () => {
    speechService.stop()
    isSpeaking.value = false
  }

  /**
   * Changer de voix
   */
  const changeVoice = (voiceName) => {
    speechService.setVoice(voiceName)
    currentVoice.value = voiceName
  }

  // Charger les voix au démarrage
  loadVoices()

  // Recharger si les voix changent
  if (window.speechSynthesis.onvoiceschanged !== undefined) {
    window.speechSynthesis.onvoiceschanged = loadVoices
  }

  return {
    isSpeaking,
    isSpeechEnabled,
    availableVoices,
    currentVoice,
    speak,
    speakSequence,
    stop,
    changeVoice
  }
}