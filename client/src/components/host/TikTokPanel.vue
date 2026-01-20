<template>
  <div class="tiktok-panel">
    <h2>🎥 TikTok Live</h2>
    
    <!-- Formulaire de connexion -->
    <div v-if="!isTikTokConnected" class="connect-form">
      <input 
        v-model="usernameInput" 
        placeholder="Ton username TikTok (sans @)"
        @keyup.enter="handleConnectTikTok"
        :disabled="isLoading"
        class="username-input"
      />
      <button 
        @click="handleConnectTikTok" 
        :disabled="!usernameInput || isLoading"
        class="btn-connect"
      >
        {{ isLoading ? 'Connexion...' : '🔗 Connecter' }}
      </button>
    </div>
    
    <!-- Statut connecté -->
    <div v-else class="connected-status">
      <div class="status-badge">
        <span class="pulse-dot"></span>
        <span>En direct sur @{{ currentTikTokUsername }}</span>
      </div>
      <p class="info">
        💬 Les commentaires "true" ou "false" sont captés automatiquement
      </p>
      <button @click="handleDisconnectTikTok" class="btn-disconnect">
        ⏹️ Déconnecter
      </button>
    </div>

    <!-- Message d'erreur -->
    <div v-if="error" class="error-message">
      <span>⚠️ {{ error }}</span>
      <button @click="clearError" class="btn-close">✕</button>
    </div>

    <!-- Instructions -->
    <div v-if="!isTikTokConnected" class="instructions">
      <p><strong>📝 Instructions :</strong></p>
      <ol>
        <li>Lance un live TikTok depuis ton téléphone</li>
        <li>Entre ton username TikTok ici</li>
        <li>Clique sur "Connecter"</li>
        <li>Les joueurs peuvent commenter "true" ou "false" sur ton live</li>
      </ol>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useTikTok } from '@/composables/useTikTok'

const {
  isTikTokConnected,
  currentTikTokUsername,
  isLoading,
  error,
  connectTikTok,
  disconnectTikTok,
  checkStatusTikTok,
  clearError
} = useTikTok()

const usernameInput = ref('')

/**
 * Gérer la connexion
 */
const handleConnectTikTok = async () => {
  const success = await connectTikTok(usernameInput.value)
  if (success) {
    usernameInput.value = ''
  }
}

/**
 * Gérer la déconnexion
 */
const handleDisconnectTikTok = async () => {
  await disconnectTikTok()
}

/**
 * Vérifier le statut au montage
 */
onMounted(() => {
  checkStatusTikTok()
})
</script>

<style scoped>
.tiktok-panel {
  background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
  padding: 24px;
  border-radius: 16px;
  margin: 20px 0;
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
}

.tiktok-panel h2 {
  color: #ff0050;
  margin: 0 0 20px 0;
  font-size: 24px;
  display: flex;
  align-items: center;
  gap: 8px;
}

/* Formulaire de connexion */
.connect-form {
  display: flex;
  gap: 12px;
  margin-bottom: 20px;
}

.username-input {
  flex: 1;
  padding: 14px 16px;
  font-size: 16px;
  border: 2px solid #333;
  border-radius: 10px;
  background: #0f0f1e;
  color: white;
  transition: all 0.3s ease;
}

.username-input:focus {
  outline: none;
  border-color: #ff0050;
  box-shadow: 0 0 0 3px rgba(255, 0, 80, 0.1);
}

.username-input:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.btn-connect {
  padding: 14px 28px;
  background: linear-gradient(135deg, #ff0050 0%, #ff4081 100%);
  color: white;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  font-size: 16px;
  font-weight: bold;
  transition: all 0.3s ease;
  white-space: nowrap;
}

.btn-connect:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(255, 0, 80, 0.4);
}

.btn-connect:disabled {
  opacity: 0.5;
  cursor: not-allowed;
  transform: none;
}

/* Statut connecté */
.connected-status {
  text-align: center;
  padding: 20px;
  background: rgba(0, 200, 83, 0.1);
  border-radius: 12px;
  margin-bottom: 20px;
}

.status-badge {
  display: inline-flex;
  align-items: center;
  gap: 10px;
  padding: 12px 24px;
  background: rgba(0, 200, 83, 0.2);
  border-radius: 30px;
  font-size: 18px;
  font-weight: bold;
  color: #00c853;
  margin-bottom: 12px;
}

.pulse-dot {
  width: 12px;
  height: 12px;
  background: #00c853;
  border-radius: 50%;
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0%, 100% {
    opacity: 1;
    transform: scale(1);
  }
  50% {
    opacity: 0.5;
    transform: scale(1.2);
  }
}

.info {
  color: #888;
  font-size: 14px;
  margin: 12px 0;
}

.btn-disconnect {
  margin-top: 16px;
  padding: 12px 30px;
  background: #f44336;
  color: white;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  font-size: 16px;
  font-weight: bold;
  transition: all 0.3s ease;
}

.btn-disconnect:hover {
  background: #d32f2f;
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(244, 67, 54, 0.4);
}

/* Message d'erreur */
.error-message {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 14px 18px;
  background: rgba(244, 67, 54, 0.1);
  border-left: 4px solid #f44336;
  border-radius: 8px;
  color: #f44336;
  margin-top: 16px;
  animation: slideIn 0.3s ease;
}

@keyframes slideIn {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.btn-close {
  background: none;
  border: none;
  color: #f44336;
  font-size: 20px;
  cursor: pointer;
  padding: 0;
  width: 24px;
  height: 24px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  transition: background 0.2s ease;
}

.btn-close:hover {
  background: rgba(244, 67, 54, 0.1);
}

/* Instructions */
.instructions {
  background: rgba(255, 255, 255, 0.05);
  padding: 16px;
  border-radius: 10px;
  margin-top: 20px;
}

.instructions p {
  color: #aaa;
  margin: 0 0 10px 0;
}

.instructions ol {
  color: #888;
  margin: 0;
  padding-left: 20px;
}

.instructions li {
  margin: 6px 0;
  line-height: 1.5;
}

/* Responsive */
@media (max-width: 768px) {
  .connect-form {
    flex-direction: column;
  }

  .btn-connect {
    width: 100%;
  }
}
</style>