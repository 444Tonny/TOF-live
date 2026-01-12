import api from './api'

/**
 * Service pour gérer la lecture des intro/outro avec Speechify
 * Séparé du service Piper pour éviter toute confusion
 */
class speechifyService {
  constructor() {
    this.currentAudio = null
    this.isSpeechifyPlaying = false
  }

  /**
   * Lire une phrase d'intro ou d'outro avec Speechify
   * @param {string} text - Texte à lire
   * @param {string} voiceId - ID de la voix Speechify
   */
  async speakSpeechify(text, voiceId = 'henry') { // XYZ
    try {
      // Arrêter toute lecture en cours
      this.stopSpeechify()

      // Appel API vers Speechify
      const response = await api.post('/speechify/generate-audio', 
        { text, voiceId },
        { responseType: 'blob' }
      )

      const audioBlob = response.data

      // Debug info
      console.log('Blob type:', audioBlob.type)
      console.log('Blob size:', audioBlob.size)

      const audioUrl = URL.createObjectURL(audioBlob)

      this.currentAudio = new Audio(audioUrl)
      this.isSpeechifyPlaying = true

      // Attendre la fin de la lecture
      await new Promise((resolve, reject) => {
        this.currentAudio.onended = () => {
          this.isSpeechifyPlaying = false
          URL.revokeObjectURL(audioUrl)
          resolve()
        }

        this.currentAudio.onerror = (error) => {
          console.error('Erreur lecture audio intro/outro:', error)
          this.isSpeechifyPlaying = false
          URL.revokeObjectURL(audioUrl)
          reject(error)
        }

        this.currentAudio.play().catch(reject)
      })

    } catch (error) {
      console.error('Erreur génération audio intro/outro Speechify:', error)
      this.isSpeechifyPlaying = false
      throw error
    }
  }

  /**
   * Arrêter la lecture intro/outro
   */
  stopSpeechify() {
    if (this.currentAudio) {
      this.currentAudio.pause()
      this.currentAudio.currentTime = 0
      this.isSpeechifyPlaying = false
    }
  }

  /**
   * Vérifier si une intro/outro est en cours de lecture
   */
  getIsSpeechifyPlaying() {
    return this.isSpeechifyPlaying
  }
}

export default new speechifyService()