const speechifyService = require('../services/speechifyService');

/**
 * Controller pour gérer les intro/outro avec Speechify
 */
class speechifyController {
  
  /**
   * Générer l'audio d'intro ou d'outro
   */
  static async generateSpeechifyAudio(req, res) {
    try {
      const { text, voiceId } = req.body;

      // Validation
      if (!text) {
        return res.status(400).json({ message: 'Texte requis' });
      }

      // Générer l'audio avec Speechify
      const audioBuffer = await speechifyService.generateSpeechifyFromText(text, voiceId);

      // Retourner l'audio MP3
      res.set({
        'Content-Type': 'audio/mpeg',
        'Content-Length': audioBuffer.length
      });
      res.send(audioBuffer);
      
    } catch (error) {
      console.error('Erreur génération intro/outro Speechify:', error);
      res.status(500).json({ message: 'Erreur serveur' });
    }
  }
}

module.exports = speechifyController;