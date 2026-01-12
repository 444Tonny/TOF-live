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
  border-bottom: 1px solid rgba(43, 43, 43, 0.404);
  color: rgba(158, 158, 158, 0.801);
  background-color: var(--color--bg3);
  padding: 10px 10px;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
  text-align: center;
  margin: auto;
}

.counter-text {
  font-size: 23px;
  font-weight: 600;
}

.counter-text strong {
  font-size: 25px;
  font-weight: 600;
}
</style>