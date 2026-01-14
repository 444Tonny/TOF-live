const piperService = require('../services/piperService');

/**
 * Controller pour la synthèse vocale avec Piper
 */
class PiperSpeechController {
  
  /**
   * Générer l'audio d'une question
   */
  static async generateAudioFromText(req, res) {
    try {
      const { text } = req.body;

      if (!text) {
        return res.status(400).json({ message: 'Texte requis' });
      }

      // Générer l'audio avec Piper
      const audioFilePath = await piperService.textToSpeech(text);

      // Retourner le fichier audio
      res.sendFile(audioFilePath);

    } catch (error) {
      console.error('Erreur génération audio:', error);
      res.status(500).json({ message: 'Erreur lors de la génération audio' });
    }
  }
}

module.exports = PiperSpeechController;