const express = require('express');
const router = express.Router();
const SpeechController = require('../controllers/SpeechController');

// POST /api/speech/generate - Générer audio depuis texte
router.post('/generate', SpeechController.generateQuestionAudio);

module.exports = router;