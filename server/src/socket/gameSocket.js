const SessionModel = require('../models/SessionModel');
const PlayerModel = require('../models/PlayerModel');
const db = require('../config/database');

/**
 * Gestion des événements Socket.io
 */
function setupGameSocket(io) {

    io.on('connection', (socket) => {
        console.log('✅ Client connecté:', socket.id);

        /**
         * HOST : Rejoindre en tant qu'hôte
         */
        socket.on('host:join', async (sessionId) => {
            try {
                socket.join(`host:${sessionId}`);
                console.log(`🎮 Host rejoint session: ${sessionId}`);
            } catch (error) {
                console.error('Erreur host:join:', error);
            }
        });

        /**
         * PLAYER : Rejoindre en tant que joueur
         */
        socket.on('player:join', async ({ sessionId, playerId }) => {
            try {
                socket.join(`session:${sessionId}`);
                socket.playerId = playerId;

                // Notifier l'host
                const player = await PlayerModel.findById(playerId);
                io.to(`host:${sessionId}`).emit('player:joined', player);

                console.log(`👤 Joueur ${playerId} rejoint session: ${sessionId}`);
            } catch (error) {
                console.error('Erreur player:join:', error);
            }
        });

        /**
         * HOST : Lancer une question
         */
        socket.on('host:broadcast-question', async ({ sessionId, questionId }) => {
            try {
                // Récupérer la question
                const [rows] = await db.execute(
                    'SELECT id, question, answer, answer_detail FROM questions WHERE id = ?',
                    [questionId]
                );

                if (rows.length === 0) return;

                const question = rows[0];

                // Mettre à jour la session
                await SessionModel.setCurrentQuestion(sessionId, questionId);
                await SessionModel.updateStatus(sessionId, 'active');

                // Envoyer à tous les joueurs ET l'host
                io.to(`session:${sessionId}`).emit('question:new', question);
                io.to(`host:${sessionId}`).emit('question:new', question);

                //console.log(`📢 Question ${questionId} envoyée à session ${sessionId}`);

            } catch (error) {
                console.error('Erreur broadcast-question:', error);
            }
        });

        /**
         * PLAYER : Réponse soumise (notification temps réel)
         */
        socket.on('player:answer-submitted', async ({ sessionId, playerId, isCorrect }) => {
            try {
                // Récupérer le classement mis à jour
                const leaderboard = await SessionModel.getLeaderboard(sessionId);

                // Envoyer le classement à l'host
                io.to(`host:${sessionId}`).emit('leaderboard:update', leaderboard);

                // Notifier le joueur du résultat
                socket.emit('answer:result', { isCorrect });

            } catch (error) {
                console.error('Erreur answer-submitted:', error);
            }
        });

        /**
         * PLAYER : Signaler que la transition est terminée
         */
        socket.on('player:transition-complete', ({ sessionId }) => {
            // Notifier le host que la transition est terminée
            io.to(`host:${sessionId}`).emit('transition:complete')
        })

        /**
         * Déconnexion
         */
        socket.on('disconnect', () => {
            console.log('❌ Client déconnecté:', socket.id);
        });
    });
}

module.exports = setupGameSocket;