<template>
  <div class="host-dashboard">
    <header>
      <h1>🎬 Dashboard Host</h1>
      <div class="header-actions">
        <!-- AJOUTER : Bouton speech toggle -->
        <router-link to="/" class="back-btn">← Retour</router-link>
      </div>
      <SpeechToggle />
    </header>

    <!-- AJOUTER : Indicateur vocal -->
    <div v-if="isSpeaking" class="voice-indicator">
      🎙️ Lecture en cours...
    </div>

    <div v-if="isLoading" class="loading">
      Chargement...
    </div>

    <div v-else class="dashboard-content">
      <!-- Question actuelle -->
      <div class="current-question">
        <h2>Question actuelle</h2>
        <div v-if="currentQuestion" class="question-display">
          <p>{{ currentQuestion.question }}</p>
          <span class="answer-badge">
            Réponse : {{ currentQuestion.answer ? 'VRAI' : 'FAUX' }}
          </span>
        </div>
        <div v-else class="no-question">
          Aucune question lancée
        </div>
      </div>

      <!-- Sélecteur de questions -->
      <QuestionSelector
        :questions="availableQuestions"
        @select="broadcastQuestion"
      />

      <!-- Classement -->
      <Leaderboard :players="leaderboard" />
    </div>
  </div>
</template>

<script setup>
import { useHostGame } from '../composables/useHostGame'
import QuestionSelector from '../components/host/QuestionSelector.vue'
import Leaderboard from '../components/host/Leaderboard.vue'
import SpeechToggle from '../components/SpeechToggle.vue' // AJOUTER

/**
 * Dashboard pour le host (contrôle du jeu)
 */
const {
  currentQuestion,
  leaderboard,
  availableQuestions,
  isLoading,
  isSpeaking,
  broadcastQuestion
} = useHostGame()
</script>

<style scoped>
.host-dashboard {
  min-height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  padding: 20px;
}

header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

h1 {
  color: white;
  font-size: 2rem;
}

.back-btn {
  padding: 10px 20px;
  background: white;
  color: #667eea;
  text-decoration: none;
  border-radius: 8px;
  font-weight: bold;
  transition: transform 0.2s;
}

.back-btn:hover {
  transform: translateY(-2px);
}

.loading {
  text-align: center;
  color: white;
  font-size: 1.5rem;
  padding: 100px 0;
}

.dashboard-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  max-width: 1400px;
  margin: 0 auto;
}

.current-question {
  grid-column: 1 / -1;
  background: white;
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.current-question h2 {
  margin-bottom: 20px;
  color: #333;
}

.question-display {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.question-display p {
  font-size: 1.5rem;
  color: #333;
  font-weight: 500;
}

.answer-badge {
  display: inline-block;
  padding: 8px 16px;
  background: #10b981;
  color: white;
  border-radius: 20px;
  font-size: 0.9rem;
  font-weight: bold;
  width: fit-content;
}

.no-question {
  text-align: center;
  color: #999;
  padding: 40px;
  font-size: 1.2rem;
}

@media (max-width: 968px) {
  .dashboard-content {
    grid-template-columns: 1fr;
  }
}

/* voice indicator */
.voice-indicator {
  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
  color: white;
  padding: 12px 20px;
  border-radius: 10px;
  text-align: center;
  margin-bottom: 20px;
  font-weight: 600;
  box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0%, 100% { 
    opacity: 1;
  }
  50% { 
    opacity: 0.85;
  }
}

</style>