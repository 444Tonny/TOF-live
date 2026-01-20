// services/gameService.js
const SessionModel = require('../models/SessionModel');

async function handleAnswerSubmitted(io, sessionId) {
    const scoreLeaderboard = await SessionModel.getLeaderboard(sessionId);
    const streakLeaderboard = await SessionModel.getStreakLeaderboard(sessionId);

    const data = {
        score: scoreLeaderboard,
        streak: streakLeaderboard
    };

    console.log("Reponse soumis");

    io.to(`session:${sessionId}`).emit('leaderboard:update', data);
    io.to(`host:${sessionId}`).emit('leaderboard:update', data);

    // Notifier le joueur du résultat pour actualiser son score dans le composable
    //socket.emit('answer:result', { isCorrect });
}

module.exports = { handleAnswerSubmitted };
