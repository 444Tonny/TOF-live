<template>
  <div class="outro-screen">
    <div class="content">
      <div class="icon"></div>
      <h1 class="title">What's Your Score ?</h1>
      <p class="subtitle">Challenge your friends</p>
      <div class="social-icons">
        <span class="social-icon">❤️</span>
      </div>
    </div>
  </div>
</template>

<script setup>
/**
 * Écran de fin avec animation
 */
</script>

<style scoped>
.outro-screen {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #090b1400; display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  animation: fadeIn 0.8s ease-out;
}

.content {
  position: relative;
  top: -150px;
  background: linear-gradient(135deg, #3f255fe1 0%, #161121e0 100%);
  width: 460px;
  border: 5px solid #252130;
  border-radius: 15px;
  box-sizing: border-box;
  padding: 40px 25px;
  text-align: center;
}

.icon {
  font-size: 20px;
  margin-bottom: 20px;
  animation: bounceIn 1s ease-out;
}

.title {
  font-size: 40px;
  font-weight: bold;
  margin-bottom: 15px;
  animation: slideUp 1s ease-out 0.2s backwards;
  text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

.subtitle {
  font-size: 22px;
  font-weight: 400;
  animation: slideUp 1s ease-out 0.4s backwards;
  opacity: 0.95;
  margin-bottom: 40px;
  color: rgba(255, 255, 255, 0.5);
}

.social-icons {
  display: flex;
  justify-content: center;
  gap: 30px;
  animation: slideUp 1s ease-out 0.6s backwards;
}

.social-icon {
  font-size: 3rem;
  animation: float 2s ease-in-out infinite;
}

.social-icon:nth-child(2) {
  animation-delay: 0.2s;
}

.social-icon:nth-child(3) {
  animation-delay: 0.4s;
}
</style>