<template>
  <div class="question-card">
    <!-- Texte de la question -->
    <p class="question-text">
      {{ question.question }}
    </p>

    <!-- Mode Player : Boutons avec état sélectionné/désactivé -->
    <AnswerButtons
      v-if="isPlayerMode && !revealAnswer"
      @answer="$emit('answer', $event)"
      :disabled="disabled"
      :selectedAnswer="selectedAnswer"
    />

    <!-- Mode Solo : Boutons simples -->
    <div v-else-if="!isPlayerMode && !revealAnswer" class="buttons">
      <button 
        @click="$emit('answer', true)" 
        class="btn btn-true"
        :disabled="disabled"
      >
        VRAI
      </button>
      
      <button 
        @click="$emit('answer', false)" 
        class="btn btn-false"
        :disabled="disabled"
      >
        FAUX
      </button>
    </div>

    <!-- Révélation de la réponse (mode Player) -->
    <div v-if="revealAnswer && isPlayerMode" class="answer-reveal">
      <p class="reveal-text">
        La réponse était : <strong>{{ question.answer ? 'VRAI' : 'FAUX' }}</strong>
      </p>
    </div>
  </div>
</template>

<script setup>
import AnswerButtons from './player/AnswerButtons.vue'

/**
 * Composant qui affiche une question et les boutons de réponse
 * Supporte mode Solo et mode Player
 */
defineProps({
  question: {
    type: Object,
    required: true
  },
  isLoading: {
    type: Boolean,
    default: false
  },
  disabled: {
    type: Boolean,
    default: false
  },
  isPlayerMode: {
    type: Boolean,
    default: false
  },
  selectedAnswer: {
    default: null
  },
  revealAnswer: {
    type: Boolean,
    default: false
  }
})

defineEmits(['answer'])
</script>

<style scoped>
.question-card {
  background: var(--color-bg3);
  border-top-left-radius: 15px;
  border-top-right-radius: 15px;
  padding: 40px;
  padding-bottom: 20px;
}

.question-text {
  font-size: 25px;
  font-weight: 700;
  text-align: center;
  margin-bottom: 30px;
  color: #e6e6e6;
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

.answer-reveal {
  text-align: center;
  padding: 30px;
  background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
  border-radius: 10px;
  margin-top: 20px;
}

.reveal-text {
  font-size: 1.3rem;
  color: #1e3a8a;
}

.reveal-text strong {
  font-size: 1.5rem;
  color: #1e40af;
}
</style>