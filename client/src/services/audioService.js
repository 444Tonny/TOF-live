import { speechService } from './api'

/**
 * Service pour gérer la lecture audio avec Piper
 */
class AudioService {
  constructor() {
    this.audio = null
    this.isPlaying = false
  }

  /**
   * Générer et lire un texte
   */
  async speak(text) {
    try {
      // Arrêter toute lecture en cours
      this.stop()

      // Générer l'audio depuis l'API Piper
      const audioBlob = await speechService.generateAudio(text)

      // Créer une URL pour le blob
      const audioUrl = URL.createObjectURL(audioBlob)

      // Créer et jouer l'audio
      this.audio = new Audio(audioUrl)
      this.audio.playbackRate = 1.25
      this.isPlaying = true

      // Attendre la fin de la lecture
      await new Promise((resolve, reject) => {
        this.audio.onended = () => {
          this.isPlaying = false
          URL.revokeObjectURL(audioUrl)
          resolve()
        }

        this.audio.onerror = (error) => {
          console.error('Erreur lecture audio:', error)
          this.isPlaying = false
          URL.revokeObjectURL(audioUrl)
          reject(error)
        }

        this.audio.play().catch(reject)
      })

    } catch (error) {
      console.error('Erreur génération audio:', error)
      this.isPlaying = false
      throw error
    }
  }

  /**
   * Arrêter la lecture
   */
  stop() {
    if (this.audio) {
      this.audio.pause()
      this.audio.currentTime = 0
      this.isPlaying = false
    }
  }

  /**
   * Vérifier si en lecture
   */
  getIsPlaying() {
    return this.isPlaying
  }
}

export default new AudioService()