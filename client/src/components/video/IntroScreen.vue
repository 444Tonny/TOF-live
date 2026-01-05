<template>
  <div class="intro-screen" :class="{ fadeOut: isClosing }">
    <div class="content">
      <h1 class="title">Quiz Challenge</h1>
      <p class="subtitle">Défiez vos amis !</p>
      <div class="pulse-dot"></div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'

/**
 * Écran d'introduction avec animation
 */
const isClosing = ref(false)

defineExpose({
  close: () => {
    isClosing.value = true
  }
})
</script>

<style scoped>
.intro-screen {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  animation: fadeIn 0.8s ease-out;
}

.intro-screen.fadeOut {
  animation: fadeOut 0.8s ease-out forwards;
}

.content {
  text-align: center;
  color: white;
}

.title {
  font-size: 4rem;
  font-weight: bold;
  margin-bottom: 20px;
  animation: slideUp 1s ease-out;
  text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

.subtitle {
  font-size: 1.8rem;
  animation: slideUp 1s ease-out 0.3s backwards;
  opacity: 0.95;
}

.pulse-dot {
  width: 20px;
  height: 20px;
  background: white;
  border-radius: 50%;
  margin: 40px auto 0;
  animation: pulse 1.5s infinite;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes fadeOut {
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
  }
}

@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes pulse {
  0%, 100% {
    transform: scale(1);
    opacity: 1;
  }
  50% {
    transform: scale(1.5);
    opacity: 0.5;
  }
}
</style>