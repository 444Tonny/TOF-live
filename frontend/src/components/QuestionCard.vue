<template>
  <div class="question-card">
    <!-- Loading state -->
    <div v-if="isLoading" class="loading">
      Chargement...
    </div>

    <!-- Question -->
    <div v-else>
      <p class="question-text">
        {{ question.question }}
      </p>

      <!-- Boutons -->
      <div class="buttons">
        <button 
          @click="$emit('answer', true)" 
          class="btn btn-true"
          :disabled="isLoading"
        >
          VRAI
        </button>
        
        <button 
          @click="$emit('answer', false)" 
          class="btn btn-false"
          :disabled="isLoading"
        >
          FAUX
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
/**
 * Composant qui affiche une question avec état de chargement
 */
defineProps({
  question: {
    type: Object,
    required: true
  },
  isLoading: {
    type: Boolean,
    default: false
  }
})

defineEmits(['answer'])
</script>

<style scoped>
.question-card {
  background: white;
  border-radius: 15px;
  padding: 40px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  min-height: 250px;
}

.loading {
  text-align: center;
  font-size: 1.5rem;
  color: #667eea;
  padding: 60px 0;
}

.question-text {
  font-size: 1.5rem;
  text-align: center;
  margin-bottom: 30px;
  color: #333;
  line-height: 1.6;
}

.buttons {
  display: flex;
  gap: 15px;
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
  opacity: 0.6;
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