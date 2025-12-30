<template>
  <!-- Boutons de contrôle du jeu -->
  <div class="game-controls">
    <button @click="$emit('reset')" class="btn-reset">
      Recommencer
    </button>
  </div>
</template>

<script setup>
/**
 * Composant pour les contrôles du jeu (bouton recommencer)
 */
defineEmits(['reset'])
</script>

<style scoped>
.game-controls {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.btn-reset {
  padding: 15px 30px;
  font-size: 1.1rem;
  font-weight: bold;
  background: #667eea;
  color: white;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  transition: background 0.3s;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.btn-reset:hover {
  background: #5568d3;
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}
</style>