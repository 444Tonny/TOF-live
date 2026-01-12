/**
 * Service de synthèse vocale
 */
class SpeechService {
  constructor() {
    this.synth = window.speechSynthesis
    this.voices = []
    this.selectedVoice = null
    
    // Charger les voix disponibles
    this.loadVoices()
    
    // Les voix se chargent de manière asynchrone
    if (this.synth.onvoiceschanged !== undefined) {
      this.synth.onvoiceschanged = () => this.loadVoices()
    }
  }

  /**
   * Charger les voix disponibles
   */
  loadVoices() {
    this.voices = this.synth.getVoices()
    
    // Sélectionner une voix française par défaut
    this.selectedVoice = this.voices.find(
      voice => voice.lang.startsWith('fr')
    ) || this.voices[0]
  }

  /**
   * Obtenir toutes les voix françaises
   */
  getFrenchVoices() {
    return this.voices.filter(voice => voice.lang.startsWith('fr'))
  }

  /**
   * Lire un texte
   */
  speak(text, options = {}) {
    // Arrêter toute lecture en cours
    this.stop()

    const utterance = new SpeechSynthesisUtterance(text)
    
    // Configuration
    utterance.voice = this.selectedVoice
    utterance.rate = options.rate || 5      // Vitesse (0.1 à 10)
    utterance.pitch = options.pitch || 0.6    // Tonalité (0 à 2)
    utterance.volume = options.volume || 1.0  // Volume (0 à 1)
    utterance.lang = 'fr-FR'

    // Callbacks
    if (options.onStart) utterance.onstart = options.onStart
    if (options.onEnd) utterance.onend = options.onEnd
    if (options.onError) utterance.onerror = options.onError

    this.synth.speak(utterance)
  }

  /**
   * Arrêter la lecture
   */
  stop() {
    if (this.synth.speaking) {
      this.synth.cancel()
    }
  }

  /**
   * Mettre en pause
   */
  pause() {
    if (this.synth.speaking && !this.synth.paused) {
      this.synth.pause()
    }
  }

  /**
   * Reprendre
   */
  resume() {
    if (this.synth.paused) {
      this.synth.resume()
    }
  }

  /**
   * Changer de voix
   */
  setVoice(voiceName) {
    const voice = this.voices.find(v => v.name === voiceName)
    if (voice) {
      this.selectedVoice = voice
    }
  }

  /**
   * Vérifier si une lecture est en cours
   */
  isSpeaking() {
    return this.synth.speaking
  }
}

export default new SpeechService()