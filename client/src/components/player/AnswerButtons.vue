<template>
  <div class="answer-buttons">
    <button
      @click="$emit('answer', true)"
      :disabled="disabled"
      class="btn btn-true"
    >
      VRAI
    </button>
    <button
      @click="$emit('answer', false)"
      :disabled="disabled"
      class="btn btn-false"
    >
      FAUX
    </button>
  </div>
</template>

<script setup>
/**
 * Boutons de réponse pour le joueur
 */
defineProps({
  disabled: {
    type: Boolean,
    default: false
  }
})

defineEmits(['answer'])
</script>

<style scoped>
.answer-buttons {
  display: flex;
  gap: 15px;
  margin-top: 30px;
}

.btn {
  flex: 1;
  padding: 20px;
  font-size: 1.2rem;
  font-weight: bold;
  border: none;
  border-radius: 10px;
  cursor: pointer;
  transition: transform 0.2s;
}

.btn:hover:not(:disabled) {
  transform: scale(1.05);
}

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.btn-true {
  background: #10b981;
  color: white;
}

.btn-false {
  background: #ef4444;
  color: white;
}
</style>