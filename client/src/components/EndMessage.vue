<template>
  <!-- Message affiché quand toutes les questions sont terminées -->
  <div class="end-message">
    <p class="title">Fin du jeu !</p>
    <p class="score">Score final : {{ score }}</p>
  </div>
</template>

<script setup>
/**
 * Composant qui affiche le message de fin de partie
 */
defineProps({
  score: {
    type: Number,
    required: true
  }
})
</script>

<style scoped>
.end-message {
  background: white;
  border-radius: 15px;
  padding: 40px;
  text-align: center;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.title {
  font-size: 1.5rem;
  font-weight: bold;
  color: #667eea;
  margin-bottom: 15px;
}

.score {
  font-size: 1.5rem;
  color: #333;
}
</style>