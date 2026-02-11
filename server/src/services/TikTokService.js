const { WebcastPushConnection } = require('tiktok-live-connector');
const axios = require('axios');

class TikTokService {
    constructor() {
        this.connection = null;
        this.isConnected = false;
        this.baseUrl = process.env.BASE_URL;
        
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
        
        // AJOUTER: Tracker la question actuelle
        this.currentQuestionId = null;
        this.questionStartTime = null;
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
        // Parser la réponse
        const answer = this.parseAnswer(data.comment);
        
        if (answer !== null) {
            console.log(`🎯 Réponse détectée: ${answer}`);

            // AJOUTER: Vérifier si la réponse est dans les temps
            const elapsed = Date.now() - this.questionStartTime;
            const ANSWER_TIMER = 15; // xxx
            const MAX_TIME = (ANSWER_TIMER * 1000) + 2500;

            if (elapsed > MAX_TIME) {
                console.log(`⏰ Réponse tardive de ${data.uniqueId} (${Math.floor(elapsed/1000)}s écoulées) - IGNORÉE`);
                return; // Ne pas soumettre
            }

            console.log(`🎯 Réponse détectée: ${answer} (${Math.floor(elapsed/1000)}s)`);
            
            this.submitToGame(data.uniqueId, data.userId, answer, data.profilePictureUrl);
        }
    }

    parseAnswer(message) {
        const msg = message.toLowerCase().trim();
        
        if (['true', 't'].includes(msg)) {
            return true;
        }
        if (['false', 'f'].includes(msg)) {
            return false;
        }
        
        return null;
    }

    /**
     * Appelé quand une nouvelle question est diffusée
     */
    resetQueueForNewQuestion(questionId) {
        console.log(`🔄 Nouvelle question ${questionId} - vidage de la queue`);
        
        // Vider la queue des anciens commentaires
        this.commentQueue = [];
        
        // Mettre à jour la question actuelle
        this.currentQuestionId = questionId;
        this.questionStartTime = Date.now();
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