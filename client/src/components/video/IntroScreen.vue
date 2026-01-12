<template>
  <div class="intro-screen" :class="{ fadeOut: isClosing }">
    <div class="content">
      <h1 class="title">GEOGRAPHY<br> QUIZ</h1>
      <!-- <p class="subtitle">Essayez de faire 5/5</p> -->
      <div class="pulse-dot">🌎</div>
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
  text-align: center;
  color: var(--color--white);
  background: linear-gradient(135deg, #3f255fcb 0%, #33137eb9 100%);
  width: 650px;
  height: 1100px;
  border: 5px solid #252130;
  border-radius: 15px;
  box-sizing: border-box;
  padding: 350px 30px 490px 30px;
  background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
    url('@/assets/images/background/general.png');
  background-size: cover;
  background-position: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  align-content: center;
}

.title {
  font-size: 60px;
  font-weight: 900;
  line-height: 80px;
  margin-bottom: 0px;
  animation: slideUp 1s ease-out;
  text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
  color: rgba(255, 255, 255, 0.945) !important;
}

.subtitle {
  font-size: 35px;
  font-weight: 600;
  animation: slideUp 1s ease-out 0.3s backwards;
  opacity: 0.95;
}

.pulse-dot {
  width: 20px;
  height: 20px;
  background: rgba(255, 255, 255, 0);
  border-radius: 50%;
  margin-top: 0px;
  margin-bottom: 40px;
  font-size: 70px;
  text-align: center;
  display: inline-block;
  animation: pulse 1.2s ease-in-out infinite;
  transform-origin: center center;
  position: relative;
  right: 35px;
  top: -10px;
}
</style>