<template>
  <div id="app">
    <div class="container">
      <h1>Vrai ou Faux</h1>

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
import { onMounted } from 'vue'
import ScoreBoard from '../components/ScoreBoard.vue'
import QuestionCard from '../components/QuestionCard.vue'
import EndMessage from '../components/EndMessage.vue'
import GameControls from '../components/GameControls.vue'
import { useGameLogic } from '../composables/useGameLogic'

const {
  score,
  currentQuestion,
  isLoading,
  error,
  loadRandomQuestion,
  submitAnswer,
  resetGame
} = useGameLogic()

onMounted(() => {
  loadRandomQuestion()
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
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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

h1 {
  text-align: center;
  color: white;
  font-size: 2.5rem;
  margin-bottom: 30px;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
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
</style>