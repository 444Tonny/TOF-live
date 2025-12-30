const express = require('express');
const router = express.Router();
const QuestionController = require('../controllers/QuestionController');

/**
 * Routes pour les questions
 */

// GET /api/questions/random - Récupérer une question aléatoire
router.get('/random', QuestionController.getRandomQuestion);

// POST /api/questions/check - Vérifier une réponse
router.post('/check', QuestionController.checkAnswer);

// GET /api/questions - Récupérer toutes les questions
router.get('/', QuestionController.getAllQuestions);

module.exports = router;