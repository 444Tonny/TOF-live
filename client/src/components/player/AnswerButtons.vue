<template>
  <div class="answer-buttons">
    <button
      @click="$emit('answer', true)"
      :disabled="disabled"
      :class="getButtonClass(true)"
      class="btn btn-true"
    >
      TRUE
    </button>
    <button
      @click="$emit('answer', false)"
      :disabled="disabled"
      :class="getButtonClass(false)"
      class="btn btn-false"
    >
      FALSE
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
  width: 170px;
  height: 65px;
  font-size: 22px;
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
  border: 3px solid var(--color--success);
  background: var(--color--success2);
  color: white;
}

.btn-false {
  border: 3px solid var(--color--fail);
  background: var(--color--fail2);
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