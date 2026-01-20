const express = require('express');
const cors = require('cors');
const http = require('http');
const { Server } = require('socket.io');
const path = require('path');
require('dotenv').config();

const questionRoutes = require('./routes/questions');
const sessionRoutes = require('./routes/sessions');
const gameRoutes = require('./routes/game');
const setupGameSocket = require('./socket/gameSocket');

const speechRoutes = require('./routes/speech'); // piper
const speechifyRoutes = require('./routes/speechify'); // NOUVEAU
const tiktokRoutes = require('./routes/tiktok');


const app = express();
const server = http.createServer(app);

/* Configuration Socket.io avec CORS
const io = new Server(server, {
  cors: {
    origin: 'http://localhost:5173',
    methods: ['GET', 'POST']
  }
}); */

const io = new Server(server, {
  cors: {
    origin: '*',
    methods: ['GET', 'POST']
  }
});

const PORT = process.env.PORT || 3000;

/**
 * Middlewares
 */
app.use(cors()); // Permettre les requêtes depuis le frontend
app.use(express.json()); // Parser le JSON

// ===============================
// SERVIR LE FRONTEND (VUE BUILD)
// ===============================
const clientDistPath = path.join(__dirname, '../../client/dist');

// servir les fichiers statiques Vue
app.use(express.static(clientDistPath));

// AJOUTER : Servir les fichiers statiques
app.use('/images', express.static(path.join(__dirname, '../public/images')));
app.use('/audio', express.static(path.join(__dirname, '../public/audio'))); // AJOUTER

// AJOUTER : Servir les images statiques
app.use('/images', express.static(path.join(__dirname, '../public/images')));

/**
 * Routes API
 */
app.use('/api/sessions', sessionRoutes);
app.use('/api/game', gameRoutes);
app.use('/api/questions', questionRoutes);

app.use('/api/speech', speechRoutes); 
app.use('/api/speechify', speechifyRoutes);

/**
 * Routes TikTok
 */
app.use('/api/tiktok', tiktokRoutes); 

// Route de test
app.get('/api/health', (req, res) => {
  res.json({ status: 'OK', message: 'Serveur opérationnel' });
});

// ===============================
// SPA fallback (Vue Router)
// ===============================
app.get(/.*/, (req, res) => {
  res.sendFile(path.join(clientDistPath, 'index.html'));
});

// AJOUTER : Rendre io accessible dans les routes
app.set('io', io);

/**
 * Setup Socket.io
 */
setupGameSocket(io);

/**
 * Démarrer le serveur
 */
server.listen(PORT, () => {
  console.log(`🚀 Serveur démarré sur http://localhost:${PORT}`);
  console.log(`🔌 WebSocket disponible sur ws://localhost:${PORT}`);
});