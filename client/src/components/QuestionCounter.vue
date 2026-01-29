<template>
  <div class="question-counter">
    <span class="counter-text">
      Question <strong>{{ current }}</strong>/<strong>{{ total }}</strong>
    </span>
  </div>
</template>

<script setup>
/**
 * Composant réutilisable pour afficher le compteur de questions
 */
defineProps({
  current: {
    type: Number,
    required: true
  },
  total: {
    type: Number,
    required: true
  }
})
</script>

<style scoped>
.question-counter {
  width: 200px;
  border: 3px solid rgba(250, 250, 250, 0.2);
  border-bottom: none;
  color: rgba(158, 158, 158, 0.801);
  background-color: var(--color--bg3);
  padding: 10px 10px;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
  text-align: center;
}

.counter-text {
  font-size: 20px;
  font-weight: 600;
  text-transform: capitalize;
  
  width: 160px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  display: inline-block;
}

.counter-text strong {
  font-size: 20px;
  font-weight: 600;
}
</style>