import { ref } from 'vue'
import speechService from '../services/speechService'
import { useSpeechStore } from '../stores/speechStore'

/**
 * Composable pour gérer la synthèse vocale
 */
export function useSpeech() {
  const isPiperSpeaking = ref(false)
  const availableVoices = ref([])
  const currentVoice = ref(null)

  // Accéder au store pour vérifier si le speech est activé
  const { isPiperSpeechEnabled } = useSpeechStore()

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
    if (!isPiperSpeechEnabled.value) {
      console.log('Speech désactivé, texte ignoré:', text)
      if (options.onEnd) options.onEnd()
      return
    }

    // Sinon si le speech est activé
    isPiperSpeaking.value = true

    speechService.speak(text, {
      ...options,
      onEnd: () => {
        isPiperSpeaking.value = false
        if (options.onEnd) options.onEnd()
      },
      onError: () => {
        isPiperSpeaking.value = false
        if (options.onError) options.onError()
      }
    })
  }

  /**
   * Lire plusieurs textes en séquence
   */
  const speakSequencePiper = async (texts) => {
    // Si le speech est désactivé, ne rien faire
    if (!isPiperSpeechEnabled.value) {
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
    isPiperSpeaking.value = false
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
    isPiperSpeaking,
    isPiperSpeechEnabled,
    availableVoices,
    currentVoice,
    speak,
    speakSequencePiper,
    stop,
    changeVoice
  }
}