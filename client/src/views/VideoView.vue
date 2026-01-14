<template>

  <IntroScreen v-if="showIntro" ref="introRef" />
  <OutroScreen v-if="showOutro" />

  <div v-show="!showIntro && !showOutro">
    <div class="player-view">
      <div class="game-interface">
        <!-- En attente de question -->
        <WaitingRoom v-if="!currentQuestion" />

        <!-- Question active -->
        <div v-else class="question-section">
          <QuestionCounter v-if="totalQuestions > 0" :current="currentPosition" :total="totalQuestions" />

          <QuestionCard :question="currentQuestion" :disabled="true" :isPlayerMode="true" :selectedAnswer="null"
            :revealAnswer="revealAnswer" />

          <!-- Timer -->
          <GameTimer v-if="currentQuestion" :timeQuestionLeft="timeQuestionLeft" :progress="progress" :isQuestionTimerPaused="isQuestionTimerPaused" />
        </div>

        <!-- Image -->
        <ImageIllustration v-if="currentQuestion" :question="currentQuestion" :key="currentQuestion.id"/>
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
import ImageIllustration from '@/components/ImageIllustration.vue'

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
  timeQuestionLeft,
  progress,
  isQuestionTimerPaused,
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
  width: 650px;
  padding: 30px;
  padding-top: 10px;
  border: 3px solid #231f3586;
  border-radius: 30px;
  background: #2726349c;
  animation: fadeIn 0.5s ease-out;
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
  animation: slideDown 0.5s ease-out;
}


@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-40px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>