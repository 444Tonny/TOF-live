<template>
  <div class="mid-game-leaderboard">
    <div class="countdown">{{ countdown }}s</div>
    
    <h2>📊 LEADERBOARD</h2>
    
    <div class="leaderboards-wrapper">
      <Leaderboard :players="scoreLeaderboard" />
      <StreakLeaderboard :players="streakLeaderboard" />
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import Leaderboard from '../host/Leaderboard.vue'
import StreakLeaderboard from '../host/StreakLeaderboard.vue'

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

const countdown = ref(10)

onMounted(() => {
  const interval = setInterval(() => {
    countdown.value--
    if (countdown.value <= 0) {
      clearInterval(interval)
    }
  }, 1000)
})
</script>

<style scoped>
.mid-game-leaderboard {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  animation: fadeIn 0.5s ease-out;
  padding: 40px;
}

.countdown {
  position: absolute;
  top: 20px;
  right: 20px;
  width: 60px;
  height: 60px;
  background: white;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  font-weight: bold;
  color: #667eea;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

h2 {
  color: white;
  font-size: 2.5rem;
  margin-bottom: 30px;
  text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
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
</style>