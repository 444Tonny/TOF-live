<template>
  <div class="question-category">
    <span class="category-text">
      {{ category }}
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
  width: 165px;
  border: 3px solid rgba(250, 250, 250, 0.2);
  border-bottom: none;
  color: rgba(158, 158, 158, 0.801);
  background-color: var(--color--bg3);
  padding: 6px 5px;
  border-top-right-radius: 10px;
  border-top-left-radius: 10px;
  text-align: center;
}

.category-text {
  font-size: 15px;
  font-weight: 600;
  text-transform: uppercase;
  width: 95%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  display: inline-block;
  vertical-align: middle;
}
</style>