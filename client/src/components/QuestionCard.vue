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
      :key="question.id"
    />

    <!-- Mode Solo : Boutons simples -->
    <div v-else-if="!isPlayerMode && !revealAnswer" class="buttons">
      <button 
        @click="$emit('answer', true)" 
        class="btn btn-true"
        :disabled="disabled"
      >
        TRUE
      </button>
      
      <button 
        @click="$emit('answer', false)" 
        class="btn btn-false"
        :disabled="disabled"
      >
        FALSE
      </button>
    </div>

    <!-- Révélation de la réponse (mode Player) -->
    <div v-if="revealAnswer && isPlayerMode" :key="question.id" class="answer-reveal">
      <p class="reveal-text">
        It's 
        <strong
          :class="question.answer ? 'answer-true' : 'answer-false'"
        >
          {{ question.answer ? 'TRUE' : 'FALSE' }}
        </strong>
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
  width: 100%;
  max-width: 490px;
  background: var(--color--bg3);
  margin-left: 5px;
  margin-right: 5px;
  padding: 20px;
  padding-bottom: 20px;
  border: 3px solid rgba(250, 250, 250, 0.2);
  border-bottom: none;
}

.question-text {
  font-size: 27px;
  font-weight: 700;
  line-height: 38px;
  text-align: center;
  margin-bottom: 20px;
  color: #e6e6e6;
}

.buttons
{
  animation: ease-in-out 0.6s bounceIn;
  animation: ease-in-out 0.6s fadeIn;
}

.answer-reveal {
  display: flex;
  align-items: center;
  box-sizing: border-box;
  height: 52px;
  background: white;
  border-radius: 10px;
  margin-top: 20px;
  animation: ease-in-out 0.6s bounceIn;
  animation: ease-in-out 0.6s fadeIn;
}

.reveal-text {
  display: block;
  text-align: center;
  margin: auto;
  font-size: 20px;
  font-weight: 600;
  color: #b4b4b4;
  
}

.reveal-text strong {
  font-size: 32px;
  text-shadow: 1px 1px 2px #dadada;
  text-transform: capitalize;
}

.answer-true {
  color: var(--color--success) 
}

.answer-false {
  color: var(--color--fail) 
}

</style>