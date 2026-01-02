<template>
  <div class="player-view">
    <header>
      <h1>🎯 Mode Joueur</h1>
      <div class="header-actions">
        <!-- AJOUTER : Bouton speech toggle (seulement si joueur connecté) -->
        <SpeechToggle v-if="player" />
        <router-link to="/" class="back-btn">← Retour</router-link>
      </div>
    </header>

    <!-- Formulaire de connexion -->
    <div v-if="!player" class="join-form">
      <h2>Entrez votre pseudo</h2>
      <input
        v-model="username"
        @keyup.enter="handleJoin"
        type="text"
        placeholder="Votre pseudo"
        class="username-input"
      />
      <button @click="handleJoin" :disabled="!username" class="join-btn">
        Rejoindre
      </button>
    </div>

    <!-- Interface de jeu -->
    <div v-else class="game-interface">
      
      <!-- AJOUTER : Indicateur vocal -->
      <div v-if="isSpeaking" class="voice-indicator">
        🎙️ Animateur en train de parler...
      </div>

      <!-- Info joueur -->
      <div class="player-info">
        <span class="player-name">{{ player.username }}</span>
        <span class="player-score">Score : {{ player.score }}</span>
      </div>

      <!-- En attente de question -->
      <WaitingRoom v-if="!currentQuestion" />

      <!-- Question active -->
      <div v-else class="question-section">
        <div class="question-card">
          <p class="question-text">{{ currentQuestion.question }}</p>
          
          <!-- Boutons de réponse -->
          <AnswerButtons
            v-if="!hasAnswered"
            @answer="submitAnswer"
            :disabled="isLoading"
          />

          <!-- Résultat -->
          <div v-if="answerResult" class="result" :class="{ correct: answerResult.isCorrect }">
            <span class="result-icon">{{ answerResult.isCorrect ? '✅' : '❌' }}</span>
            <span class="result-text">
              {{ answerResult.isCorrect ? 'Bonne réponse !' : 'Mauvaise réponse' }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { usePlayerGame } from '../composables/usePlayerGame'
import WaitingRoom from '../components/player/WaitingRoom.vue'
import AnswerButtons from '../components/player/AnswerButtons.vue'
import SpeechToggle from '../components/SpeechToggle.vue' // AJOUTER

/**
 * Interface joueur
 */
const username = ref('')

const {
  player,
  currentQuestion,
  hasAnswered,
  answerResult,
  isLoading,
  isSpeaking, 
  joinSession,
  submitAnswer
} = usePlayerGame()

/**
 * Rejoindre la session
 */
const handleJoin = async () => {
  if (!username.value.trim()) return
  
  try {
    await joinSession(username.value.trim())
  } catch (error) {
    alert('Erreur : Aucune session active')
  }
}
</script>

<style scoped>
.player-view {
  min-height: 100vh;
  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
  padding: 20px;
}

header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

/* AJOUTER ces styles */
.header-actions {
  display: flex;
  gap: 15px;
  align-items: center;
}

.voice-indicator {
  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
  color: white;
  padding: 12px 20px;
  border-radius: 10px;
  text-align: center;
  margin-bottom: 15px;
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
/* */

h1 {
  color: white;
  font-size: 2rem;
}

.back-btn {
  padding: 10px 20px;
  background: white;
  color: #10b981;
  text-decoration: none;
  border-radius: 8px;
  font-weight: bold;
  transition: transform 0.2s;
}

.back-btn:hover {
  transform: translateY(-2px);
}

/* Formulaire de connexion */
.join-form {
  max-width: 500px;
  margin: 100px auto;
  background: white;
  padding: 40px;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  text-align: center;
}

.join-form h2 {
  margin-bottom: 25px;
  color: #333;
}

.username-input {
  width: 100%;
  padding: 15px;
  font-size: 1.1rem;
  border: 2px solid #e5e7eb;
  border-radius: 8px;
  margin-bottom: 20px;
}

.username-input:focus {
  outline: none;
  border-color: #10b981;
}

.join-btn {
  width: 100%;
  padding: 15px;
  font-size: 1.1rem;
  font-weight: bold;
  background: #10b981;
  color: white;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background 0.3s;
}

.join-btn:hover:not(:disabled) {
  background: #059669;
}

.join-btn:disabled {
  background: #d1d5db;
  cursor: not-allowed;
}

/* Interface de jeu */
.game-interface {
  max-width: 700px;
  margin: 0 auto;
}

.player-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: white;
  padding: 20px;
  border-radius: 10px;
  margin-bottom: 20px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.player-name {
  font-size: 1.2rem;
  font-weight: bold;
  color: #333;
}

.player-score {
  font-size: 1.2rem;
  font-weight: bold;
  color: #10b981;
}

.question-section {
  margin-top: 20px;
}

.question-card {
  background: white;
  padding: 40px;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.question-text {
  font-size: 1.5rem;
  color: #333;
  text-align: center;
  margin-bottom: 30px;
  line-height: 1.6;
}

.result {
  text-align: center;
  padding: 30px;
  border-radius: 10px;
  margin-top: 20px;
  animation: fadeIn 0.5s;
}

.result.correct {
  background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
}

.result:not(.correct) {
  background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
}

.result-icon {
  font-size: 3rem;
  display: block;
  margin-bottom: 10px;
}

.result-text {
  font-size: 1.5rem;
  font-weight: bold;
  color: #333;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: scale(0.9);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}
</style>