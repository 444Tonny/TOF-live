<template>
  <div class="video-dashboard">
    <header>
      <h1>🎥 Video Dashboard</h1>
      <router-link to="/" class="back-btn">← Retour</router-link>
    </header>

    <div v-if="isLoading" class="loading">
      Chargement...
    </div>

    <div v-else class="dashboard-content">
      
      <!-- Contrôles -->
      <div class="controls">
        <button 
          v-if="!isPlaying"
          @click="startPlaylist" 
          :disabled="selectedQuestions.length === 0"
          class="btn-control start"
        >
          ▶️ Démarrer
        </button>
        <button 
          v-else
          @click="stopPlaylist" 
          class="btn-control stop"
        >
          ⏹️ Arrêter
        </button>

        <!-- Compteur de questions -->
        <QuestionCounter
          v-if="isPlaying && currentQuestion"
          :current="currentPosition"
          :total="totalQuestions"
        />
      </div>

      <!-- Question actuelle -->
      <div v-if="currentQuestion" class="current-question">
        <h2>Question actuelle</h2>
        <div class="question-display">
          <p>{{ currentQuestion.question }}</p>
          <span class="answer-badge">
            Réponse : {{ currentQuestion.answer ? 'VRAI' : 'FAUX' }}
          </span>
        </div>
        
        <!-- Timer -->
        <GameTimer 
          :timeLeft="timeLeft"
          :progress="progress"
          :isPaused="isPaused"
        />
      </div>

      <!-- Sélection et Playlist -->
      <div class="selection-area">
        <VideoQuestionSelector
          :questions="availableQuestions"
          :selectedQuestions="selectedQuestions"
          @add="addQuestion"
          @remove="removeQuestion"
        />
        
        <VideoPlaylist
          :questions="selectedQuestions"
          :currentIndex="currentQuestionIndex"
          @remove="removeQuestion"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import { useVideoDashboard } from '../composables/useVideoDashboard'
import QuestionCounter from '../components/QuestionCounter.vue'
import GameTimer from '../components/GameTimer.vue'
import VideoQuestionSelector from '../components/video/VideoQuestionSelector.vue'
import VideoPlaylist from '../components/video/VideoPlaylist.vue'

const {
  currentQuestion,
  currentQuestionIndex,
  currentPosition,
  totalQuestions,
  availableQuestions,
  selectedQuestions,
  isPlaying,
  isLoading,
  timeLeft,
  progress,
  isPaused,
  addQuestion,
  removeQuestion,
  startPlaylist,
  stopPlaylist
} = useVideoDashboard()
</script>

<style scoped>
.video-dashboard {
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
  display: flex;
  flex-direction: column;
  gap: 20px;
  max-width: 1400px;
  margin: 0 auto;
}

.controls {
  background: white;
  padding: 20px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  gap: 20px;
}

.btn-control {
  padding: 15px 40px;
  font-size: 1.1rem;
  font-weight: bold;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  transition: all 0.3s;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.btn-control.start {
  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
  color: white;
}

.btn-control.start:disabled {
  background: #d1d5db;
  cursor: not-allowed;
}

.btn-control.start:not(:disabled):hover {
  transform: translateY(-2px);
}

.btn-control.stop {
  background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
  color: white;
}

.current-question {
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
  margin-bottom: 20px;
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

.selection-area {
  display: flex;
  gap: 20px;
}

@media (max-width: 968px) {
  .selection-area {
    flex-direction: column;
  }
}
</style>