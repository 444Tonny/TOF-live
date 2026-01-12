<template>
  <div class="outro-screen">
    <div class="content">
      <div class="icon"></div>
      <div class="social-icons">
        <span class="social-icon">❤️</span>
      </div>
      <h1 class="title">Like for more</h1>
      <p class="subtitle">Write your score below</p>
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

.icon {
  font-size: 20px;
  margin-bottom: 20px;
  animation: bounceIn 1s ease-out;
}

.title {
  font-size: 70px;
  font-weight: 900;
  margin-bottom: 15px;
  animation: slideUp 1s ease-out 0.2s backwards;
  text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

.subtitle {
  font-size: 35px;
  font-weight: 700;
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
  font-size: 5rem;
  animation: float 2s ease-in-out infinite;
}

.social-icon:nth-child(2) {
  animation-delay: 0.2s;
}

.social-icon:nth-child(3) {
  animation-delay: 0.4s;
}
</style>