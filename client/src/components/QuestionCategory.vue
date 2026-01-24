<template>
  <div class="question-category">
    <span class="category-text">
      <b>#</b>{{ category }}
    </span>
  </div>
</template>

<script setup>
defineProps({
  category: {
    type: String,
    default: 'general'
  }
})
</script>

<style scoped>
.question-category {
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

.category-text {
  font-size: 20px;
  font-weight: 600;
  text-transform: uppercase;
}
</style>