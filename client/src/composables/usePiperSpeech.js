import { ref } from 'vue'
import audioService from '../services/audioService'
import { useSpeechStore } from '../stores/speechStore'

/**
 * Composable pour gérer la synthèse vocale avec Piper
 */
export function useSpeech() {
  const isSpeaking = ref(false)
  const availableVoices = ref([]) // Pour compatibilité, mais Piper n'a qu'une voix
  const currentVoice = ref('Piper TTS')

  // Accéder au store pour vérifier si le speech est activé
  const { isSpeechEnabled } = useSpeechStore()

  /**
   * Charger les voix disponibles (pour compatibilité)
   */
  const loadVoices = () => {
    // Piper a une seule voix configurée
    availableVoices.value = [{ name: 'Piper TTS' }]
    currentVoice.value = 'Piper TTS'
  }

  /**
   * Lire un texte
   */
  const speak = async (text, options = {}) => {
    // Si le speech est désactivé, ne rien faire
    if (!isSpeechEnabled.value) {
      console.log('Speech désactivé, texte ignoré:', text)
      if (options.onEnd) options.onEnd()
      return
    }

    isSpeaking.value = true

    try {
      await audioService.speak(text)
      
      isSpeaking.value = false
      if (options.onEnd) options.onEnd()
      
    } catch (error) {
      console.error('Erreur speech:', error)
      isSpeaking.value = false
      if (options.onError) options.onError()
    }
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
    audioService.stop()
    isSpeaking.value = false
  }

  /**
   * Changer de voix (pour compatibilité, pas d'effet avec Piper)
   */
  const changeVoice = (voiceName) => {
    console.log('Changement de voix non supporté avec Piper')
    currentVoice.value = voiceName
  }

  // Charger les voix au démarrage
  loadVoices()

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