const express = require('express');
const router = express.Router();
const speechifyController = require('../controllers/SpeechifyController');

/**
 * Route pour générer les intro/outro avec Speechify
 */
router.post('/generate-audio', speechifyController.generateSpeechifyAudio);

module.exports = router;