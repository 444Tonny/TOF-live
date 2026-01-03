const db = require('../config/database');

/**
 * Model pour gérer les joueurs
 */
class PlayerModel {

    /**
     * Trouver ou créer un joueur automatiquement
     */
    static async findOrCreate(sessionId, username, platformUserId) {
        // Chercher si le joueur existe déjà dans cette session
        const [existing] = await db.execute(
            'SELECT * FROM players WHERE session_id = ? AND platform_user_id = ?',
            [sessionId, platformUserId]
        );

        if (existing.length > 0) {
            return existing[0];
        }

        // Créer le joueur
        const [result] = await db.execute(
            'INSERT INTO players (username, session_id, platform_user_id) VALUES (?, ?, ?)',
            [username, sessionId, platformUserId]
        );

        return {
            id: result.insertId,
            username,
            score: 0,
            platform_user_id: platformUserId
        };
    }

    /**
     * Récupérer un joueur par ID
     */
    static async findById(playerId) {
        const [rows] = await db.execute(
            'SELECT * FROM players WHERE id = ?',
            [playerId]
        );
        return rows[0] || null;
    }

    /**
     * Incrémenter le score
     */
    static async incrementScore(playerId) {
        await db.execute(
            'UPDATE players SET score = score + 1 WHERE id = ?',
            [playerId]
        );
    }

    /**
     * Enregistrer une réponse
     */
    static async saveAnswer(playerId, questionId, userAnswer, isCorrect) {
        try {
            await db.execute(
                'INSERT INTO player_answers (player_id, question_id, user_answer, is_correct) VALUES (?, ?, ?, ?)',
                [playerId, questionId, userAnswer, isCorrect]
            );
            return true;
        } catch (error) {
            // Si erreur (déjà répondu), retourner false
            if (error.code === 'ER_DUP_ENTRY') {
                return false;
            }
            throw error;
        }
    }

    /**
     * Vérifier si un joueur a déjà répondu
     */
    static async hasAnswered(playerId, questionId) {
        const [rows] = await db.execute(
            'SELECT id FROM player_answers WHERE player_id = ? AND question_id = ?',
            [playerId, questionId]
        );
        return rows.length > 0;
    }

    /**
     * Incrémenter le streak
     */
    static async incrementStreak(playerId) {
        await db.execute(
            'UPDATE players SET current_streak = current_streak + 1 WHERE id = ?',
            [playerId]
        );
        
        // Mettre à jour le best_streak si nécessaire
        await db.execute(
            'UPDATE players SET best_streak = GREATEST(best_streak, current_streak) WHERE id = ?',
            [playerId]
        );
        }

        /**
         * Réinitialiser le streak
         */
        static async resetStreak(playerId) {
        await db.execute(
            'UPDATE players SET current_streak = 0 WHERE id = ?',
            [playerId]
        );
    }
}

module.exports = PlayerModel;