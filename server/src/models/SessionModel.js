const db = require('../config/database');

/**
 * Model pour gérer les sessions de jeu
 */
class SessionModel {

    /**
     * Créer une nouvelle session
     */
    static async create() {
        const [result] = await db.execute(
            'INSERT INTO game_sessions (status) VALUES (?)',
            ['waiting']
        );
        return { id: result.insertId };
    }

    /**
     * Récupérer la session active actuelle
     */
    static async getActiveSession() {
        const [rows] = await db.execute(
            "SELECT * FROM game_sessions WHERE status IN ('waiting', 'active') ORDER BY created_at DESC LIMIT 1"
        );
        return rows[0] || null;
    }

    /**
     * Récupérer une session par ID
     */
    static async findById(sessionId) {
        const [rows] = await db.execute(
            'SELECT * FROM game_sessions WHERE id = ?',
            [sessionId]
        );
        return rows[0] || null;
    }

    /**
     * Mettre à jour le statut
     */
    static async updateStatus(sessionId, status) {
        await db.execute(
            'UPDATE game_sessions SET status = ? WHERE id = ?',
            [status, sessionId]
        );
    }

    /**
     * Définir la question actuelle
     */
    static async setCurrentQuestion(sessionId, questionId) {
        await db.execute(
            'UPDATE game_sessions SET current_question_id = ? WHERE id = ?',
            [questionId, sessionId]
        );
    }

    /**
     * Récupérer le classement
     */
    static async getLeaderboard(sessionId) {
        const [rows] = await db.execute(
            'SELECT username, score, profile_picture FROM players WHERE session_id = ? ORDER BY score DESC, created_at ASC LIMIT 10',
            [sessionId]
        );
        return rows;
    }

    /**
     * Récupérer le classement par streak
     */
    static async getStreakLeaderboard(sessionId) {
    const [rows] = await db.execute(
        'SELECT username, current_streak, best_streak, profile_picture FROM players WHERE session_id = ? ORDER BY current_streak DESC, best_streak DESC, created_at ASC LIMIT 10',
        [sessionId]
    );
    return rows;
    }
}

module.exports = SessionModel;