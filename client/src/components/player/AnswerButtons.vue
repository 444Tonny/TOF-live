<template>
  <div class="answer-buttons">
    <button
      @click="$emit('answer', true)"
      :disabled="disabled"
      :class="getButtonClass(true)"
      class="btn btn-true"
    >
      VRAI
    </button>
    <button
      @click="$emit('answer', false)"
      :disabled="disabled"
      :class="getButtonClass(false)"
      class="btn btn-false"
    >
      FAUX
    </button>
  </div>
</template>

<script setup>
const props = defineProps({
  disabled: {
    type: Boolean,
    default: false
  },
  selectedAnswer: {
    default: null
  }
})

defineEmits(['answer'])

// Fonction pour déterminer les classes CSS
const getButtonClass = (value) => {
  if (props.selectedAnswer === null) {
    return '' // Aucune sélection
  }
  if (props.selectedAnswer === value) {
    return 'selected' // Bouton sélectionné
  }
  return 'unselected' // Bouton non sélectionné (grisé)
}
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
  transition: all 0.2s;
}

.btn:hover:not(:disabled) {
  transform: scale(1.05);
}

.btn:disabled {
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

/* Bouton sélectionné reste normal */
.btn.selected {
  opacity: 1;
}

/* Bouton non sélectionné devient grisé */
.btn.unselected {
  background: #d1d5db;
  color: #6b7280;
  opacity: 0.5;
}
</style>