const SessionModel = require('../models/SessionModel');
const PlayerModel = require('../models/PlayerModel');
const db = require('../config/database');

/**
 * Controller pour le jeu (réponses des joueurs)
 */
class GameController {

    /**
     * Soumettre une réponse depuis TikTok/Twitch/Web
     */
    static async submitAnswer(req, res) {
        try {
            const { username, platform_user_id, answer } = req.body;

            // Validation
            if (!username || !platform_user_id || answer === undefined) {
                return res.status(400).json({ message: 'Données manquantes' });
            }

            // Récupérer la session active
            const session = await SessionModel.getActiveSession();
            if (!session) {
                return res.status(404).json({ message: 'Aucune session active' });
            }

            // Vérifier qu'il y a une question en cours
            if (!session.current_question_id) {
                return res.status(400).json({ message: 'Aucune question active' });
            }

            // Trouver ou créer le joueur automatiquement
            const player = await PlayerModel.findOrCreate(
                session.id,
                username,
                platform_user_id
            );

            // Vérifier s'il a déjà répondu
            const hasAnswered = await PlayerModel.hasAnswered(player.id, session.current_question_id);
            if (hasAnswered) {
                return res.status(400).json({ message: 'Déjà répondu à cette question' });
            }

            // Récupérer la bonne réponse
            const [rows] = await db.execute(
                'SELECT answer FROM questions WHERE id = ?',
                [session.current_question_id]
            );

            if (rows.length === 0) {
                return res.status(404).json({ message: 'Question non trouvée' });
            }

            const correctAnswer = rows[0].answer;
            const isCorrect = Boolean(answer) === Boolean(correctAnswer);

            // Enregistrer la réponse
            await PlayerModel.saveAnswer(player.id, session.current_question_id, answer, isCorrect);

            // Mettre à jour le score si correct
            if (isCorrect) {
                await PlayerModel.incrementScore(player.id);
            }

            res.json({
                success: true,
                isCorrect,
                player: {
                    id: player.id,
                    username: player.username,
                    score: isCorrect ? (player.score + 1) : player.score
                }
            });

        } catch (error) {
            console.error('Erreur submitAnswer:', error);
            res.status(500).json({ message: 'Erreur serveur' });
        }
    }
}

module.exports = GameController;