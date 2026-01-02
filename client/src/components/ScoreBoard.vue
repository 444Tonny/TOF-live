<template>
  <!-- Affichage du score -->
  <div class="scoreboard">
    <span class="label">Score</span>
    <span class="value">{{ score }}</span>
  </div>
</template>

<script setup>
/**
 * Composant d'affichage du score
 * Reçoit le score via les props
 */
defineProps({
  score: {
    type: Number,
    required: true
  }
})
</script>

<style scoped>
.scoreboard {
  background: white;
  padding: 20px;
  border-radius: 10px;
  text-align: center;
  margin-bottom: 30px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.label {
  font-size: 1rem;
  color: #666;
  margin-right: 10px;
}

.value {
  font-size: 2rem;
  font-weight: bold;
  color: #667eea;
}
</style>