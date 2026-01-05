<template>
  <div class="outro-screen">
    <div class="content">
      <div class="icon">👍</div>
      <h1 class="title">Like & Subscribe</h1>
      <p class="subtitle">Pour plus de quiz !</p>
      <div class="social-icons">
        <span class="social-icon">❤️</span>
        <span class="social-icon">🔔</span>
        <span class="social-icon">💬</span>
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
  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  animation: fadeIn 0.8s ease-out;
}

.content {
  text-align: center;
  color: white;
}

.icon {
  font-size: 5rem;
  margin-bottom: 20px;
  animation: bounceIn 1s ease-out;
}

.title {
  font-size: 3.5rem;
  font-weight: bold;
  margin-bottom: 15px;
  animation: slideUp 1s ease-out 0.2s backwards;
  text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
}

.subtitle {
  font-size: 1.5rem;
  animation: slideUp 1s ease-out 0.4s backwards;
  opacity: 0.95;
  margin-bottom: 40px;
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

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
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

@keyframes bounceIn {
  0% {
    opacity: 0;
    transform: scale(0.3);
  }
  50% {
    transform: scale(1.1);
  }
  100% {
    opacity: 1;
    transform: scale(1);
  }
}

@keyframes float {
  0%, 100% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-10px);
  }
}
</style>