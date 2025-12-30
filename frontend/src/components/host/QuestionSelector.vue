<template>
  <div class="question-selector">
    <h3>Sélectionner une question</h3>
    <div class="questions-list">
      <button
        v-for="question in questions"
        :key="question.id"
        @click="$emit('select', question.id)"
        class="question-item"
      >
        {{ question.question }}
      </button>
    </div>
  </div>
</template>

<script setup>
/**
 * Liste des questions pour le host
 */
defineProps({
  questions: {
    type: Array,
    required: true
  }
})

defineEmits(['select'])
</script>

<style scoped>
.question-selector {
  background: white;
  padding: 20px;
  border-radius: 10px;
  margin-bottom: 20px;
}

h3 {
  margin-bottom: 15px;
  color: #333;
}

.questions-list {
  display: flex;
  flex-direction: column;
  gap: 10px;
  max-height: 400px;
  overflow-y: auto;
}

.question-item {
  padding: 15px;
  background: #f3f4f6;
  border: 2px solid #e5e7eb;
  border-radius: 8px;
  cursor: pointer;
  text-align: left;
  transition: all 0.2s;
}

.question-item:hover {
  background: #667eea;
  color: white;
  border-color: #667eea;
}
</style>