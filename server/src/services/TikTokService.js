const { WebcastPushConnection } = require('tiktok-live-connector');
const axios = require('axios');

class TikTokService {
    constructor() {
        this.connection = null;
        this.isConnected = false;
        this.baseUrl = process.env.BASE_URL || 'http://localhost:3000';
        
        // Configuration axios optimisée pour high-traffic
        this.axiosInstance = axios.create({
            baseURL: this.baseUrl,
            timeout: 5000, // 5 secondes max par requête
            headers: {
                'Content-Type': 'application/json'
            }
        });

        // Queue pour gérer les commentaires
        this.commentQueue = [];
        this.isProcessingQueue = false;
    }

    async connect(username) {
        try {
            this.connection = new WebcastPushConnection(username, {
                processInitialData: false,
                enableExtendedGiftInfo: true,
                enableWebsocketUpgrade: true,
            });

            this.connection.on('connected', () => {
                console.log(`✅ Connecté au live de @${username}`);
                this.isConnected = true;
            });

            this.connection.on('disconnected', () => {
                console.log('❌ Déconnecté du live TikTok');
                this.isConnected = false;
            });

            this.connection.on('chat', (data) => {
                // Ajouter à la queue au lieu de traiter immédiatement
                this.addToQueue(data);
            });

            this.connection.on('error', (err) => {
                console.error('❌ Erreur TikTok:', err);
            });

            await this.connection.connect();
            console.log('🎥 Écoute TikTok démarrée avec succès');

            // Démarrer le traitement de la queue
            this.startQueueProcessing();

        } catch (error) {
            console.error('Erreur connexion TikTok:', error);
            throw error;
        }
    }

    /**
     * Ajouter un commentaire à la queue
     */
    addToQueue(data) {
        this.commentQueue.push(data);
    }

    /**
     * Traiter la queue de commentaires (évite la surcharge)
     */
    startQueueProcessing() {
        if (this.isProcessingQueue) return;

        this.isProcessingQueue = true;

        // Traiter les commentaires toutes les 100ms
        this.queueInterval = setInterval(() => {
            if (this.commentQueue.length > 0) {
                const comment = this.commentQueue.shift();
                this.handleComment(comment);
            }
        }, 100);
    }

    stopQueueProcessing() {
        if (this.queueInterval) {
            clearInterval(this.queueInterval);
            this.isProcessingQueue = false;
        }
    }

    handleComment(data) {
        // Afficher les infos
        console.log('\n💬 COMMENTAIRE:');
        console.log('👤 Username:', data.uniqueId);
        console.log('🆔 User ID:', data.userId);
        console.log('💬 Message:', data.comment);
        console.log('🖼️  Photo:', data.profilePictureUrl);

        // Parser la réponse
        const answer = this.parseAnswer(data.comment);
        
        if (answer !== null) {
            console.log(`🎯 Réponse détectée: ${answer}`);
            this.submitToGame(data.uniqueId, data.userId, answer, data.profilePictureUrl);
        }
    }

    parseAnswer(message) {
        const msg = message.toLowerCase().trim();
        
        if (['true', '1'].includes(msg)) {
            return true;
        }
        if (['false', '0'].includes(msg)) {
            return false;
        }
        
        return null;
    }

    async submitToGame(username, userId, answer, profilePicture) {
        try {
            const response = await this.axiosInstance.post('/api/game/answer', {
                username: username,
                platform_user_id: `tiktok_${userId}`,
                answer: answer,
                profile_picture: profilePicture
            });

            if (response.data.success) {
                console.log(`✅ @${username}: ${answer} → ${response.data.isCorrect ? 'CORRECT ✓' : 'INCORRECT ✗'}`);
            } else {
                console.log(`⚠️ @${username}: ${response.data.message}`);
            }

        } catch (error) {
            // Ne pas logger les erreurs "déjà répondu" pour éviter le spam
            if (error.response?.data?.message !== 'Déjà répondu à cette question') {
                console.error('❌ Erreur submitToGame:', error.response?.data || error.message);
            }
        }
    }

    disconnect() {
        this.stopQueueProcessing();
        this.commentQueue = [];
        
        if (this.connection) {
            this.connection.disconnect();
            this.isConnected = false;
            console.log('⏹️ Écoute TikTok arrêtée');
        }
    }

    getStatus() {
        return {
            connected: this.isConnected,
            queueSize: this.commentQueue.length
        };
    }
}

module.exports = new TikTokService();