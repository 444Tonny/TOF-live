<template>
  <div class="game-timer" :class="{ warning: timeQuestionLeft <= 6, paused: isQuestionTimerPaused }">
    <div class="timer-circle" :style="{ '--progress': progress }">
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
        <span class="time">{{ timeQuestionLeft }}</span>
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
  timeQuestionLeft: {
    type: Number,
    required: true
  },
  progress: {
    type: Number,
    required: true
  },
  isQuestionTimerPaused: {
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

<style>
.game-timer {
  display: flex;
  width: 100%;
  max-width: 490px;
  justify-content: center;
  background: var(--color--bg3);
  padding: 0px 0 15px;
  margin: 5px;
  margin-top: 0;
  border-radius: 0 0 7px 7px;
  border: 3px solid rgba(255,255,255,0.15);
  border-top: none;
}

/* Container */
.timer-circle {
  position: relative;
  width: 72px;
  height: 72px;
  overflow: hidden !important;
  border-radius: 50%;
  background: none;;
  border: 4px solid #2b2b2b;
}

/* SVG invisible, utilisé seulement pour le calcul */
.timer-svg {
  position: absolute;
  inset: 0;
  opacity: 0;
}

/* === FILL EFFECT === */
.timer-circle::before {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: calc(var(--progress, 100) * 1%);
  background: #202020;
  transition: height 1s linear;
  border-radius: 50%;
}

/* === TEXT === */
.timer-text {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 2;
}

.time {
  font-size: 40px;
  font-weight: 800;
  color: #E6E6E6;
}

/* === WARNING MODE === */
.game-timer.warning .timer-circle::before {
  background: #4a1d1f;
  animation: warning-pulse 0.8s infinite;
}

.game-timer.warning .time {
  color: #b80940;
}

/* === PAUSED === */
.game-timer.paused .timer-circle::before {
  animation-play-state: paused;
  filter: grayscale(1);
}

/* === ANIMATIONS === */
@keyframes warning-pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.7; }
}

</style>