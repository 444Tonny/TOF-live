<template>
  <div class="scrolling-banner">
    <Transition name="slide-left" mode="out-in">
      <div :key="currentIndex" class="banner-text">
        {{ currentMessage }}
      </div>
    </Transition>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted, computed } from 'vue'
import { BANNER_MESSAGES } from '@/constants/bannerMessages'

const props = defineProps({
  scoreLeaderboard: {
    type: Array,
    default: () => []
  },
  streakLeaderboard: {
    type: Array,
    default: () => []
  }
})

const currentIndex = ref(0)
let interval = null

const currentMessage = computed(() => {
  let message = BANNER_MESSAGES[currentIndex.value]
  
  // Remplacer les placeholders par les vraies données
  if (message.includes('{topScorePlayer}')) {
    const topPlayer = props.scoreLeaderboard[0]
    if (topPlayer) {
      message = message
        .replace('{topScorePlayer}', topPlayer.username)
        .replace('{topScore}', topPlayer.score)
    } else {
      message = "🏆 Be the first to score!"
    }
  }
  
  if (message.includes('{topStreakPlayer}')) {
    const topStreakPlayer = props.streakLeaderboard[0]
    if (topStreakPlayer) {
      message = message
        .replace('{topStreakPlayer}', topStreakPlayer.username)
        .replace('{topStreak}', topStreakPlayer.current_streak)
    } else {
      message = "🔥 Start your winning streak now!"
    }
  }
  
  return message
})

onMounted(() => {
  interval = setInterval(() => {
    currentIndex.value = (currentIndex.value + 1) % BANNER_MESSAGES.length
  }, 8000)
})

onUnmounted(() => {
  if (interval) clearInterval(interval)
})

</script>

<style scoped>
.scrolling-banner {
  width: 100%;
  background: linear-gradient(90deg, #b80940 0%, #b80940 100%);
  padding: 12px 0;
  overflow: hidden;
  position: relative;
}

.banner-text {
  color: white;
  font-size: 21px;
  font-weight: 400;
  text-align: center;
  white-space: nowrap;
}

/* Animation slide vers la gauche */
.slide-left-enter-active,
.slide-left-leave-active {
  transition: all 0.5s ease;
}

.slide-left-enter-from {
  transform: translateX(100%);
  opacity: 0;
}

.slide-left-leave-to {
  transform: translateX(-100%);
  opacity: 0;
}

.slide-left-enter-to,
.slide-left-leave-from {
  transform: translateX(0);
  opacity: 1;
}
</style>