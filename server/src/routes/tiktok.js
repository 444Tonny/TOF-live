const express = require('express');
const router = express.Router();
const TikTokService = require('../services/TikTokService');

/**
 * Démarrer l'écoute TikTok Live
 */
router.post('/start', async (req, res) => {
    try {
        const { username } = req.body;
        
        if (!username) {
            return res.status(400).json({ message: 'Username TikTok requis' });
        }

        await TikTokService.connect(username);
        
        res.json({ 
            success: true, 
            message: `Écoute du live @${username} démarrée` 
        });

    } catch (error) {
        res.status(500).json({ 
            message: 'Erreur lors de la connexion',
            error: error.message 
        });
    }
});

/**
 * Arrêter l'écoute TikTok Live
 */
router.post('/stop', (req, res) => {
    TikTokService.disconnect();
    res.json({ success: true, message: 'Écoute arrêtée' });
});

/**
 * Statut de la connexion
 */
router.get('/status', (req, res) => {
    res.json({ 
        connected: TikTokService.isConnected 
    });
});

module.exports = router;