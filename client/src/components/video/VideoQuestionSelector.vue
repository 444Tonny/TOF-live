<template>
  <div class="video-question-selector">
    <h3>📝 Sélectionner les questions</h3>
    
    <!-- Barre de recherche -->
    <input
      v-model="searchQuery"
      type="text"
      placeholder="Rechercher une question..."
      class="search-input"
    />

    <!-- Liste des questions disponibles -->
    <div class="questions-list">
      <div
        v-for="question in filteredQuestions"
        :key="question.id"
        class="question-item"
        :class="{ selected: isSelected(question.id) }"
        @click="toggleQuestion(question)"
      >
        <span class="question-text">{{ question.question }}</span>
        <span class="question-badge">
          {{ isSelected(question.id) ? '✓' : '+' }}
        </span>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

/**
 * Sélecteur de questions avec recherche
 */
const props = defineProps({
  questions: {
    type: Array,
    required: true
  },
  selectedQuestions: {
    type: Array,
    required: true
  }
})

const emit = defineEmits(['add', 'remove'])

const searchQuery = ref('')

/**
 * Questions filtrées par recherche
 */
const filteredQuestions = computed(() => {
  if (!searchQuery.value) return props.questions
  
  const query = searchQuery.value.toLowerCase()
  return props.questions.filter(q => 
    q.question.toLowerCase().includes(query)
  )
})

/**
 * Vérifier si une question est sélectionnée
 */
const isSelected = (questionId) => {
  return props.selectedQuestions.some(q => q.id === questionId)
}

/**
 * Ajouter/Retirer une question
 */
const toggleQuestion = (question) => {
  if (isSelected(question.id)) {
    emit('remove', question.id)
  } else {
    emit('add', question)
  }
}
</script>

<style scoped>
.video-question-selector {
  background: white;
  padding: 20px;
  border-radius: 10px;
  height: 500px;
  display: flex;
  flex-direction: column;
}

h3 {
  margin-bottom: 15px;
  color: #333;
}

.search-input {
  width: 100%;
  padding: 12px;
  font-size: 1rem;
  border: 2px solid #e5e7eb;
  border-radius: 8px;
  margin-bottom: 15px;
}

.search-input:focus {
  outline: none;
  border-color: #667eea;
}

.questions-list {
  flex: 1;
  overflow-y: auto;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.question-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px;
  background: #f9fafb;
  border: 2px solid #e5e7eb;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.2s;
}

.question-item:hover {
  background: #f3f4f6;
  border-color: #667eea;
}

.question-item.selected {
  background: #e0e7ff;
  border-color: #667eea;
}

.question-text {
  flex: 1;
  font-size: 0.95rem;
  color: #333;
}

.question-badge {
  font-size: 1.2rem;
  font-weight: bold;
  color: #667eea;
}
</style>