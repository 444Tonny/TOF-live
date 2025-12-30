const SessionModel = require('../models/SessionModel');

/**
 * Controller pour les sessions
 */
class SessionController {

    /**
     * Créer une nouvelle session (pour le host)
     */
    static async createSession(req, res) {
        try {
            const session = await SessionModel.create();
            res.json({
                success: true,
                session
            });
        } catch (error) {
            console.error('Erreur création session:', error);
            res.status(500).json({ message: 'Erreur serveur' });
        }
    }

    /**
     * Récupérer la session active
     */
    static async getActiveSession(req, res) {
        try {
            const session = await SessionModel.getActiveSession();

            if (!session) {
                return res.status(404).json({ message: 'Aucune session active' });
            }

            res.json(session);
        } catch (error) {
            console.error('Erreur récupération session:', error);
            res.status(500).json({ message: 'Erreur serveur' });
        }
    }

    /**
     * Récupérer le classement
     */
    static async getLeaderboard(req, res) {
        try {
            const { sessionId } = req.params;
            const leaderboard = await SessionModel.getLeaderboard(sessionId);
            res.json(leaderboard);
        } catch (error) {
            console.error('Erreur récupération classement:', error);
            res.status(500).json({ message: 'Erreur serveur' });
        }
    }
}

module.exports = SessionController;