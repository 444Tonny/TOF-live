const speechify = require('@speechify/api');
/**
 * Service speechify pour générer uniquement les intro/outro
 * Utilise le SDK officiel @speechify/api
 */
class speechifyService {
  constructor() {
    // Initialiser le client speechify avec la clé API
    this.client = new speechify.SpeechifyClient({
      apiKey: process.env.speechify_API_KEY
    });
  }

  /**
   * Générer l'audio d'introduction ou d'outro avec speechify
   * @param {string} text - Texte à convertir en audio
   * @param {string} voiceId - ID de la voix speechify (optionnel)
   * @returns {Buffer} Audio en format MP3
   */
  async generateSpeechifyFromText(text, voiceId) { // 'henry' est une voix anglaise par défaut
    try {
      const ssmlText = `
        <speak>
          <speechify:style emotion="energetic">
            <prosody rate="+10%">
              ${text}
            </prosody>
          </speechify:style>
          <break time="400ms" />
        </speak>
      `;

      // Générer l'audio avec speechify
      const response = await this.client.tts.audio.speech({
        input: ssmlText,
        voiceId: voiceId,
        audioFormat: 'mp3',
        model: 'simba-multilingual'
      });

      // Retourner le buffer audio
      return Buffer.from(response.audioData, 'base64');
      //debugger

    } catch (error) {
      console.error('Erreur speechify intro/outro:', error);
      throw new Error('Impossible de générer l\'audio avec speechify');
    }
  }
}

module.exports = new speechifyService();

//console.log(speechify)
/*
{
  Speechify: { api: [Getter], tts: [Getter], AudioStreamRequestAccept: [Getter] },
  SpeechifyClient: [Getter],
  SpeechifyEnvironment: [Getter],
  SpeechifyError: [Getter],
  SpeechifyTimeoutError: [Getter],
  serialization: { api: [Getter], tts: [Getter], AudioStreamRequestAccept: [Getter] }
}
  */