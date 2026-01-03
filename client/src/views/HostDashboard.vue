<template>
  <div class="host-dashboard">
    <header>
      <h1>🎬 Dashboard Host</h1>
      <div class="header-actions">
        <!-- AJOUTER : Bouton speech toggle -->
        <router-link to="/" class="back-btn">← Retour</router-link>
      </div>
    </header>

    <div v-if="isLoading" class="loading">
      Chargement...
    </div>

    <div v-else class="dashboard-content">

      <!-- AJOUTER : Contrôles mode automatique -->
      <div class="auto-controls">
        <h2>Mode Automatique</h2>
        <p class="description">
          Les questions tournent en boucle toutes les 15 secondes (sans répéter les 3 dernières)
        </p>
        <button 
          v-if="!isAutoMode"
          @click="startAutoMode" 
          class="btn-auto start"
        >
          ▶️ Démarrer le mode automatique
        </button>
        <button 
          v-else
          @click="stopAutoMode" 
          class="btn-auto stop"
        >
          ⏸️ Arrêter le mode automatique
        </button>
        <div v-if="isAutoMode" class="auto-status">
          🔄 Mode automatique actif
        </div>

         <!-- AJOUTER : Timer -->
        <GameTimer 
          v-if="isAutoMode"
          :timeLeft="timeLeft"
          :progress="progress"
          :isPaused="isPaused"
        />
      </div>

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
      <!-- Mode manuel (seulement si auto désactivé) -->
      <div v-if="!isAutoMode">
        <QuestionSelector
          :questions="availableQuestions"
        />
      </div>

      <!-- Classement -->
      <div class="leaderboards-container">
        <Leaderboard :players="scoreLeaderboard" />
        <StreakLeaderboard :players="streakLeaderboard" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { useHostGame } from '../composables/useHostGame'
import QuestionSelector from '../components/host/QuestionSelector.vue'
import Leaderboard from '../components/host/Leaderboard.vue'
import StreakLeaderboard from '../components/host/StreakLeaderboard.vue'
import GameTimer from '../components/GameTimer.vue' // AJOUTER

/**
 * Dashboard pour le host (contrôle du jeu)
 */
const {
  currentQuestion,
  scoreLeaderboard,
  streakLeaderboard,
  availableQuestions,
  isLoading,
  isAutoMode,
  timeLeft,        // AJOUTER
  progress,        // AJOUTER
  isPaused,
  startAutoMode,
  stopAutoMode
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

/* Auto controls */
/* AJOUTER ces styles */
.auto-controls {
  grid-column: 1 / -1;
  background: white;
  padding: 30px;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  margin-bottom: 20px;
  text-align: center;
}

.auto-controls h2 {
  margin-bottom: 10px;
  color: #333;
}

.description {
  color: #666;
  margin-bottom: 20px;
  font-size: 0.95rem;
}

.btn-auto {
  padding: 15px 40px;
  font-size: 1.1rem;
  font-weight: bold;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  transition: all 0.3s;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.btn-auto.start {
  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
  color: white;
}

.btn-auto.start:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(16, 185, 129, 0.3);
}

.btn-auto.stop {
  background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
  color: white;
}

.btn-auto.stop:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(239, 68, 68, 0.3);
}

.auto-status {
  margin-top: 15px;
  padding: 10px 20px;
  background: #d1fae5;
  color: #065f46;
  border-radius: 8px;
  font-weight: 600;
  display: inline-block;
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.7; }
}

/* Leaderboards container */
.leaderboards-container {
  grid-column: 1 / -1;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
}

@media (max-width: 968px) {
  .leaderboards-container {
    grid-template-columns: 1fr;
  }
}

</style>