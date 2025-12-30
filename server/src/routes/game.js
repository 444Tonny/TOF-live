const express = require('express');
const router = express.Router();
const GameController = require('../controllers/GameController');

// POST /api/game/answer - Soumettre une réponse
router.post('/answer', GameController.submitAnswer);

module.exports = router;