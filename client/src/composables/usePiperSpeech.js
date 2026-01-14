import { ref } from 'vue'
import audioPiperService from '../services/audioPiperService'
import { useSpeechStore } from '../stores/speechStore'

/**
 * Composable pour gérer la synthèse vocale avec Piper
 */
export function usePiperSpeech() {
  const isPiperSpeaking = ref(false)
  const availableVoicesPiper = ref([]) // Pour compatibilité, mais Piper n'a qu'une voix
  const currentVoicePiper = ref('Piper TTS')

  // Accéder au store pour vérifier si le speech est activé
  const { isPiperSpeechEnabled } = useSpeechStore()

  /**
   * Charger les voix disponibles (pour compatibilité)
   */
  const loadPiperVoices = () => {
    // Piper a une seule voix configurée
    availableVoicesPiper.value = [{ name: 'Piper TTS' }]
    currentVoicePiper.value = 'Piper TTS'
  }

  /**
   * Lire un texte
   */
  const speakPiper = async (text, options = {}) => {
    // Si le speech est désactivé, ne rien faire
    if (!isPiperSpeechEnabled.value) {
      console.log('Speech désactivé, texte ignoré:', text)
      if (options.onEnd) options.onEnd()
      return
    }

    isPiperSpeaking.value = true

    try {
      await audioPiperService.speakPiper(text)
      
      isPiperSpeaking.value = false
      if (options.onEnd) options.onEnd()
      
    } catch (error) {
      console.error('Erreur speech:', error)
      isPiperSpeaking.value = false
      if (options.onError) options.onError()
    }
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
        speakPiper(text, {
          onEnd: resolve,
          onError: resolve
        })
      })
      // Pause entre chaque phrase
      await new Promise(resolve => setTimeout(resolve, 200))
    }
  }

  /**
   * Arrêter la lecture
   */
  const stopSpeakPiper = () => {
    audioPiperService.stopSpeakPiper()
    isPiperSpeaking.value = false
  }

  /**
   * Changer de voix (pour compatibilité, pas d'effet avec Piper)
   */
  const changeVoice = (voiceName) => {
    console.log('Changement de voix non supporté avec Piper')
    currentVoicePiper.value = voiceName
  }

  // Charger les voix au démarrage
  loadPiperVoices()

  return {
    isPiperSpeaking,
    isPiperSpeechEnabled,
    availableVoicesPiper,
    currentVoicePiper,
    speakPiper,
    speakSequencePiper,
    stopSpeakPiper
  }
}

/**
   * Changer de voix (pour compatibilité, pas d'effet avec Piper)
  const changeVoice = (voiceName) => {
    console.log('Changement de voix non supporté avec Piper')
    currentVoicePiper.value = voiceName
  }
*/