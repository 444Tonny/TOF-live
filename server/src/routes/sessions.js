const express = require('express');
const router = express.Router();
const SessionController = require('../controllers/SessionController');

// POST /api/sessions - Créer une session
router.post('/', SessionController.createSession);

// GET /api/sessions/active - Récupérer la session active
router.get('/active', SessionController.getActiveSession);

// GET /api/sessions/:sessionId/leaderboard - Récupérer le classement
router.get('/:sessionId/leaderboard', SessionController.getLeaderboard);

module.exports = router;