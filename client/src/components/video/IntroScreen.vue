<template>
  <div class="intro-screen" :class="{ fadeOut: isClosing }">
    <div class="content">
      <h1 class="title">Quiz Culture</h1>
      <p class="subtitle">Essayez de faire 5/5</p>
      <div class="pulse-dot">⚽</div>
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
  margin: auto;
  top: 0;
  width: 100%;
  height: 100%;
  background: #090b1400;
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
  position: relative;
  top: -150px;
  text-align: center;
  color: var(--color--white);
  background: linear-gradient(135deg, #3f255fcb 0%, #33137eb9 100%);
  width: 460px;
  border: 5px solid #252130;
  border-radius: 15px;
  box-sizing: border-box;
  padding: 40px 30px;
}

.title {
  font-size: 52px;
  font-weight: bold;
  margin-bottom: 10px;
  animation: slideUp 1s ease-out;
  text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

.subtitle {
  font-size: 25px;
  font-weight: 400;
  animation: slideUp 1s ease-out 0.3s backwards;
  opacity: 0.95;
}

.pulse-dot {
  width: 20px;
  height: 20px;
  background: rgba(255, 255, 255, 0);
  border-radius: 50%;
  margin-top: 20px;
  margin-bottom: 40px;
  font-size: 50px;
  text-align: center;
  display: inline-block;
  animation: pulse 1.2s ease-in-out infinite;
  transform-origin: center center;
  position: relative;
  right: 30px;
}
</style>