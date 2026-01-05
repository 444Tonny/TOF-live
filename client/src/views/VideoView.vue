<template>
  <div class="player-view">

    
    <!-- Écran d'introduction -->
    <IntroScreen v-if="showIntro" ref="introRef" />

    <!-- Écran de fin -->
    <OutroScreen v-if="showOutro" />

    
    <div v-show="!showIntro && !showOutro">
      <div class="game-interface">
        <!-- En attente de question -->
        <WaitingRoom v-if="!currentQuestion" />

        <!-- Question active -->
        <div v-else class="question-section">
          <QuestionCounter
            v-if="totalQuestions > 0"
            :current="currentPosition"
            :total="totalQuestions"
          />

          <QuestionCard
            :question="currentQuestion"
            :disabled="true"
            :isPlayerMode="true"
            :selectedAnswer="null"
            :revealAnswer="revealAnswer"
          />
        </div>

        <!-- Timer -->
        <GameTimer 
          v-if="currentQuestion"
          :timeLeft="timeLeft"
          :progress="progress"
          :isPaused="isPaused"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted } from 'vue'
import { useVideoGame } from '../composables/useVideoGame'
import WaitingRoom from '../components/player/WaitingRoom.vue'
import QuestionCard from '../components/QuestionCard.vue'
import GameTimer from '../components/GameTimer.vue'
import QuestionCounter from '../components/QuestionCounter.vue'
import IntroScreen from '../components/video/IntroScreen.vue'
import OutroScreen from '../components/video/OutroScreen.vue'

/**
 * Interface vidéo pour enregistrements
 */
const {
  currentQuestion,
  revealAnswer,
  currentPosition,   // AJOUTER
  totalQuestions,    // AJOUTER
  showIntro,      // AJOUTER
  showOutro,
  timeLeft,
  progress,
  isPaused,
  connectToSession
} = useVideoGame()

// Se connecter automatiquement au démarrage
onMounted(() => {
  connectToSession()
})
</script>

<style scoped>
.player-view {
  min-height: 100vh;
  width: 500px;
  padding: 30px;
  padding-top: 10px;
  border: 3px solid #3a3a3a86;
  border-radius: 30px;
}

header {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 25px;
}


.game-interface {
  max-width: 700px;
  margin: 0 auto;
}

.question-section {
  margin-top: 20px;
}
</style>