<template>
  <div class="mid-game-leaderboard">
    <div class="countdown">{{ countdown }}s</div>
    <div class="leaderboards-wrapper">
       <Transition name="slide-fade">
        <Leaderboard 
          v-if="showScoreLeaderboard" 
          :players="scoreLeaderboard" 
        />
      </Transition>

      <Transition name="slide-fade">
        <StreakLeaderboard 
          v-if="!showScoreLeaderboard" 
          :players="streakLeaderboard" 
        />
      </Transition>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import Leaderboard from '../host/GeneralScorerLeaderboard.vue'
import StreakLeaderboard from '../host/GeneralStreakLeaderboard.vue'
import { GAME_CONFIG } from '../../constants/gameConfig' // AJOUTER

defineProps({
  scoreLeaderboard: {
    type: Array,
    required: true
  },
  streakLeaderboard: {
    type: Array,
    required: true
  }
})

const countdown = ref(GAME_CONFIG.DELAY_LEADERBOARD_MIDGAME / 1000)

// AJOUTER cette ref
const showScoreLeaderboard = ref(true)

// AJOUTER ces variables
let switchInterval = null

onMounted(() => {
  // Countdown existant
  const interval = setInterval(() => {
    countdown.value--
    if (countdown.value <= 0) {
      clearInterval(interval)
      clearInterval(switchInterval) // AJOUTER cette ligne
    }
  }, 1000) // CHANGER: était 20000

  // AJOUTER: Switch toutes les 10s
  switchInterval = setInterval(() => {
    showScoreLeaderboard.value = !showScoreLeaderboard.value
  }, (GAME_CONFIG.DELAY_LEADERBOARD_MIDGAME/2))
})

// AJOUTER onUnmounted
onUnmounted(() => {
  if (switchInterval) clearInterval(switchInterval)
})

</script>

<style scoped>
.mid-game-leaderboard {
  width: 100%;
  height: 100vh;
  background: linear-gradient(135deg, #667eea00 0%rgba(118, 75, 162, 0.205)a2 100%);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  animation: fadeIn 0.5s ease-out;
  box-sizing: border-box;
  padding: 10px 10px;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  align-content: start;
}

.countdown {
  margin-top: 10px;
  margin-bottom: 5px;
  width: 50px;
  min-height: 50px;
  background: #fffc57;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  font-weight: bold;
  color: #15192c;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

h2 {
  color: white;
  font-size: 36px;
  text-align: center;
  margin-bottom: 20px;
}

.leaderboards-wrapper {
  display: flex;
  gap: 20px;
  width: 100%;
  max-width: 900px;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: scale(0.95);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

@media (max-width: 768px) {
  .leaderboards-wrapper {
    flex-direction: column;
  }
}

/* Animations du midLeaderboard */ 
.slide-fade-enter-active,
.slide-fade-leave-active {
  transition: all 0.6s ease;
}

.slide-fade-enter-from {
  transform: translateX(100%);
  opacity: 0;
}

.slide-fade-leave-to {
  transform: translateX(-100%);
  opacity: 0;
  display: none;
}


/* MODIFIER .leaderboards-wrapper */
.leaderboards-wrapper {
  width: 100%;
  max-width: 500px; /* au lieu de 900px */
  position: relative;
  min-height: 600px;
}

/* SUPPRIMER: display: flex; gap: 20px; */

</style>