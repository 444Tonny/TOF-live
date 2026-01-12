<template>
  <div class="game-timer" :class="{ warning: timeLeft <= 6, paused: isPaused }">
    <div class="timer-circle">
      <svg class="timer-svg" viewBox="0 0 100 100">
        <circle
          class="timer-bg"
          cx="50"
          cy="50"
          r="45"
        />
        <circle
          class="timer-progress"
          cx="50"
          cy="50"
          r="45"
          :style="{ strokeDashoffset: strokeDashoffset }"
        />
      </svg>
      <div class="timer-text">
        <span class="time">{{ timeLeft }}</span>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'

/**
 * Timer visuel circulaire
 */
const props = defineProps({
  timeLeft: {
    type: Number,
    required: true
  },
  progress: {
    type: Number,
    required: true
  },
  isPaused: {
    type: Boolean,
    default: false
  }
})

// Calcul pour l'animation circulaire
const circumference = 2 * Math.PI * 45
const strokeDashoffset = computed(() => {
  return circumference - (props.progress / 100) * circumference
})
</script>

<style scoped>
.game-timer {
  display: flex;
  justify-content: center;
  background: var(--color--bg3);
  padding-bottom: 25px;
  border-bottom-left-radius: 15px;
  border-bottom-right-radius: 15px;
}

.timer-circle {
  position: relative;
  width: 80px;
  height: 80px;
}

.timer-svg {
  transform: rotate(-90deg);
  width: 100%;
  height: 100%;
}

.timer-bg {
  fill: none;
  stroke: var(--color--bg3);
  stroke-width: 8;
}

.timer-progress {
  fill: none;
  stroke: var(--color--white);
  stroke-width: 10;
  stroke-linecap: round;
  stroke-dasharray: 283;
  transition: stroke-dashoffset 1s linear, stroke 0.3s;
}

.game-timer.warning .timer-progress {
  stroke: var(--color--fail);
  animation: pulse-stroke 0.5s infinite;
}

.game-timer.paused .timer-progress {
  stroke: var(--color--white);
}

@keyframes pulse-stroke {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.6; }
}

.timer-text {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

.time {
  display: block;
  font-size: 32px;
  font-weight: bold;
  color: #E6E6E6;
  line-height: 4px;
}

.game-timer.warning .time {
  color: var(--color--fail);
  animation: pulse-text 0.5s infinite;
}

.game-timer.paused .time {
  color: var(--color--white);
}

@keyframes pulse-text {
  0%, 100% { transform: scale(1); }
  50% { transform: scale(1.1); }
}
</style>