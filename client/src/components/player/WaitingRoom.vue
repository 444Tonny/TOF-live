<template>
  <div class="waiting-room">
    <h2>En attente...</h2>
    <p>Le host va bientôt lancer une question</p>
    <div class="loader"></div>
  </div>
</template>

<style scoped>
.waiting-room {
  text-align: center;
  padding: 60px 20px;
}

h2 {
  color: #667eea;
  margin-bottom: 15px;
}

p {
  color: #666;
  margin-bottom: 30px;
}

.loader {
  border: 4px solid #f3f3f3;
  border-top: 4px solid #667eea;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  animation: spin 1s linear infinite;
  margin: 0 auto;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>