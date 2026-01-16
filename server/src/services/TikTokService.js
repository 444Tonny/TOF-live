const { WebcastPushConnection } = require('tiktok-live-connector');

class TikTokService {
    constructor() {
        this.connection = null;
        this.isConnected = false;
    }

    /**
     * Se connecter au live TikTok
     * @param {string} username - Ton username TikTok (sans @)
     */
    async connect(username) {
        try {
            this.connection = new WebcastPushConnection(username, {
                processInitialData: false,
                enableExtendedGiftInfo: true,
                enableWebsocketUpgrade: true,
            });

            // Événement de connexion réussie
            this.connection.on('connected', () => {
                console.log(`✅ Connecté au live de @${username}`);
                this.isConnected = true;
            });

            // Événement de déconnexion
            this.connection.on('disconnected', () => {
                console.log('❌ Déconnecté du live TikTok');
                this.isConnected = false;
            });

            // Écouter les commentaires (réponses des joueurs)
            this.connection.on('chat', (data) => {
                this.handleComment(data);
            });

            // Démarrer la connexion
            await this.connection.connect();

        } catch (error) {
            console.error('Erreur connexion TikTok:', error);
            throw error;
        }
    }

    /**
     * Gérer les commentaires reçus
     */
    async handleComment(data) {
        const username = data.uniqueId; // Username TikTok
        const userId = data.userId; // ID unique TikTok
        const message = data.comment; // Le commentaire

        console.log(`💬 ${username}: ${message}`);

        // Vérifier si c'est une réponse (true/false ou 1/0)
        const answer = this.parseAnswer(message);
        
        if (answer !== null) {
            // Soumettre la réponse à ton API
            await this.submitToGame(username, userId, answer);
        }
    }

    /**
     * Parser la réponse du message
     */
    parseAnswer(message) {
        const msg = message.toLowerCase().trim();
        
        // Accepter différents formats
        if (['true', 'vrai', '1', 'oui', 'yes', 'v'].includes(msg)) {
            return true;
        }
        if (['false', 'faux', '0', 'non', 'no', 'f'].includes(msg)) {
            return false;
        }
        
        return null; // Pas une réponse valide
    }

    /**
     * Soumettre la réponse à ton API de jeu
     */
    async submitToGame(username, userId, answer) {
        try {
            const response = await fetch('http://localhost:3000/api/game/answer', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    username: username,
                    platform_user_id: `tiktok_${userId}`,
                    answer: answer
                })
            });

            const result = await response.json();
            
            if (result.success) {
                console.log(`✅ ${username}: Réponse ${answer} - ${result.isCorrect ? 'CORRECT' : 'INCORRECT'}`);
            } else {
                console.log(`⚠️ ${username}: ${result.message}`);
            }

        } catch (error) {
            console.error('Erreur submitToGame:', error);
        }
    }

    /**
     * Déconnecter du live
     */
    disconnect() {
        if (this.connection) {
            this.connection.disconnect();
        }
    }
}

module.exports = new TikTokService();