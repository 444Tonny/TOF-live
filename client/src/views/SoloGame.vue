<template>
  <div id="app">
    <div class="container">
      <div class="header">
        <h1>True or False</h1>
        <SpeechToggle />
      </div>

      <!-- Indicateur voix active -->
      <div v-if="isSpeaking" class="voice-indicator">
        🔊 Lecture en cours...
      </div>

      <!-- Feedback réponse -->
      <div 
        v-if="lastAnswerWasCorrect !== null && !isSpeaking" 
        class="answer-feedback"
        :class="{ correct: lastAnswerWasCorrect, incorrect: !lastAnswerWasCorrect }"
      >
        {{ lastAnswerWasCorrect ? '✅ Bonne réponse !' : '❌ Mauvaise réponse' }}
      </div>

      <div v-if="error" class="error">
        {{ error }}
      </div>

      <ScoreBoard :score="score" />

      <QuestionCard 
        v-if="currentQuestion"
        :question="currentQuestion"
        :is-loading="isLoading"
        @answer="submitAnswer"
      />
      <EndMessage 
        v-else-if="!isLoading"
        :score="score"
      />

      <GameControls @reset="resetGame" />
      
      <!-- Bouton retour -->
      <div class="back-link">
        <router-link to="/">← Retour au menu</router-link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, onUnmounted } from 'vue'
import ScoreBoard from '../components/ScoreBoard.vue'
import QuestionCard from '../components/QuestionCard.vue'
import EndMessage from '../components/EndMessage.vue'
import GameControls from '../components/GameControls.vue'
import SpeechToggle from '../components/SpeechToggle.vue'
import { useGameLogic } from '../composables/useGameLogic'

const {
  score,
  currentQuestion,
  isLoading,
  error,
  isSpeaking,
  lastAnswerWasCorrect,
  loadRandomQuestion,
  submitAnswer,
  resetGame,
  stop,
} = useGameLogic()

onMounted(() => {
  loadRandomQuestion()
})

// Arrêter la voix quand on quitte la page
onUnmounted(() => {
  stop()
})

</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  background: linear-gradient(135deg, #1f1f2e 0%, #18161a 100%);
  min-height: 100vh;
}

#app {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
}

.container {
  width: 100%;
  max-width: 600px;
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
  flex-wrap: wrap;
  gap: 15px;
}

h1 {
  text-align: center;
  color: white;
  font-size: 2.5rem;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
  flex: 1;
  min-width: 200px;
}

@media (max-width: 640px) {
  .header {
    flex-direction: column;
  }
  
  h1 {
    font-size: 2rem;
  }
}

.error {
  background: #fee2e2;
  color: #991b1b;
  padding: 15px;
  border-radius: 10px;
  text-align: center;
  margin-bottom: 20px;
  font-weight: bold;
}

.back-link {
  text-align: center;
  margin-top: 20px;
}

.back-link a {
  color: white;
  text-decoration: none;
  font-size: 1rem;
  opacity: 0.9;
}

.back-link a:hover {
  opacity: 1;
  text-decoration: underline;
}

/* Voice indicator */

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
  0%, 100% { opacity: 1; }
  50% { opacity: 0.7; }
}

/* Answer feedback */
.answer-feedback {
  padding: 15px;
  border-radius: 10px;
  text-align: center;
  font-weight: bold;
  font-size: 1.1rem;
  margin-bottom: 15px;
  animation: fadeIn 0.5s;
}

.answer-feedback.correct {
  background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
  color: #065f46;
}

.answer-feedback.incorrect {
  background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
  color: #991b1b;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

</style>