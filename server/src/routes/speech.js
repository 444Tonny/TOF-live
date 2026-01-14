const express = require('express');
const router = express.Router();
const PiperSpeechController = require('../controllers/PiperSpeechController');

// POST /api/speech/generate - Générer audio depuis texte
router.post('/generate', PiperSpeechController.generateAudioFromText);

module.exports = router;