import { speechService } from './api'
import { isAnySpeechPlaying, waitForSpeechAvailability } from '@/utils/speechLock'

/**
 * Service pour gérer la lecture audio avec Piper
 */
class AudioPiperService {
  constructor() {
    this.audio = null
    this.isPiperSpeaking = false
  }

  /**
   * Générer et lire un texte
   */
  async speakPiper(text) {
    try {
      // Arrêter toute lecture en cours
      this.stopSpeakPiper()

      await waitForSpeechAvailability()
      isAnySpeechPlaying.value = true
      this.isPiperSpeaking = true

      // Si audio vide, ne rien faire
      if (!text || !text.trim()) {
        // Ne jamais appeler l'API si texte vide
        return null
      }

      // Générer l'audio depuis l'API Piper
      const audioBlob = await speechService.generateAudio(text)

      // Créer une URL pour le blob
      const audioUrl = URL.createObjectURL(audioBlob)

      // Créer et jouer l'audio
      this.audio = new Audio(audioUrl)
      this.audio.playbackRate = 1.25
      this.isPiperSpeaking = true

      // Attendre la fin de la lecture
      await new Promise((resolve, reject) => {
        this.audio.onended = () => {
          this.isPiperSpeaking = false
          isAnySpeechPlaying.value = false
          URL.revokeObjectURL(audioUrl)
          resolve()
        }

        this.audio.onerror = (error) => { 
          console.error('Erreur lecture audio:', error)
          this.isPiperSpeaking = false
          isAnySpeechPlaying.value = false
          URL.revokeObjectURL(audioUrl)
          reject(error)
        }

        this.audio.play().catch(reject)
      })

    } catch (error) {
      console.error('Erreur génération audio:', error)
      this.isPiperSpeaking = false
      isAnySpeechPlaying.value = false
      throw error
    }
  }

  /**
   * Arrêter la lecture
   */
  stopSpeakPiper() {
    if (this.audio) {
      this.audio.pause()
      this.audio.currentTime = 0
      this.isPiperSpeaking = false
    }
  }

  /**
   * Vérifier si en lecture
   */
  getIsPiperSpeaking() {
    return this.isPiperSpeaking
  }
}

export default new AudioPiperService()