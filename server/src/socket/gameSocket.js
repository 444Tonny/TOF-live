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
        socket.on('host:broadcast-question', async ({ sessionId, questionId, currentPosition, totalQuestions }) => {
            try {
                // Récupérer la question
                const [rows] = await db.execute(
                    'SELECT id, question, answer, answer_detail, image_file, category FROM questions WHERE id = ? AND is_video_only = FALSE',
                    [questionId]
                );

                if (rows.length === 0) return;

                // AJOUTER: Enregistrer l'heure de début de la question
                await db.execute(
                    'UPDATE game_sessions SET current_question_id = ?, question_started_at = NOW() WHERE id = ?',
                    [questionId, sessionId]
                );

                await SessionModel.updateStatus(sessionId, 'active');

                const question = rows[0];

                // Mettre à jour la session
                await SessionModel.setCurrentQuestion(sessionId, questionId);
                await SessionModel.updateStatus(sessionId, 'active');

                // Envoyer la question avec les infos de position
                const payload = {
                    ...question,
                    currentPosition: currentPosition || null,
                    totalQuestions: totalQuestions || null
                };

                // Envoyer à tous les joueurs ET l'host
                io.to(`session:${sessionId}`).emit('question:new', payload);
                io.to(`host:${sessionId}`).emit('question:new', payload);

                // AJOUTER: Notifier TikTok service de la nouvelle question
                const TikTokService = require('../services/TikTokService');
                TikTokService.resetForNewQuestion(questionId);

            } catch (error) {
                console.error('Erreur broadcast-question:', error);
            }
        });

        /**
         * PLAYER : Réponse soumise (notification temps réel)
         */
        socket.on('player:answer-submitted', async ({ sessionId, playerId, isCorrect }) => {
            try 
            {
                await handleAnswerSubmitted(io, sessionId);
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
         * HOST : Broadcaster une pause mid-game (classement)
         */
        socket.on('host:broadcast-midgame-pause', ({ sessionId, currentPosition, totalQuestions }) => {
            // Envoyer à tous les joueurs qu'on entre en pause mid-game
            io.to(`session:${sessionId}`).emit('midgame-pause:start', {
                currentPosition,
                totalQuestions
            })
            
            console.log(`⏸️ Pause mid-game lancée pour session ${sessionId}`)
        })

        /**
         * PLAYER : Signaler que la pause mid-game est terminée
         */
        socket.on('player:midgame-pause-complete', ({ sessionId }) => {
            // Notifier le host que la pause mid-game est terminée
            io.to(`host:${sessionId}`).emit('midgame-pause:complete')
            
            console.log(`✅ Pause mid-game terminée pour session ${sessionId}`)
        })

        // AJOUTER après host:broadcast-midgame-pause
        socket.on('host:broadcast-endgame-pause', ({ sessionId, currentPosition, totalQuestions }) => {
            io.to(`session:${sessionId}`).emit('endgame-pause:start', {
                currentPosition,
                totalQuestions
            })
            
            console.log(`🏁 Pause fin de session pour session ${sessionId}`)
        })

        // AJOUTER après player:midgame-pause-complete
        socket.on('player:endgame-pause-complete', ({ sessionId }) => {
        io.to(`host:${sessionId}`).emit('endgame-pause:complete')
        
        console.log(`✅ Pause fin de session terminée pour session ${sessionId}`)
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



/*
    ✅ Flow complet maintenant
    Question 5 (pause mid-game) :

    Host : broadcastRandomQuestion() détecte position = 5
    Host : Émet host:broadcast-midgame-pause (PAS de question envoyée)
    Players : Reçoivent midgame-pause:start
    Players : Lancent playMidGameTransition() (intro → affichage 10s → outro)
    Players : Émettent player:midgame-pause-complete
    Host : Reçoit midgame-pause:complete
    Host : Appelle broadcastRandomQuestion() pour lancer la question 6

    Questions normales (1-4, 6-9, etc.) :

    Host : broadcastRandomQuestion() lance la question directement
    Players : Reçoivent question:new et jouent normalement

*/