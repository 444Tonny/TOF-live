
<template>
  <div v-if="imageExists" class="question-image">
    <img :src="getImageUrl(question.image_file)" @error="imageExists = false" />
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

const props = defineProps({
  question: {
    type: Object,
    required: true
  }
})

const imageExists = ref(!!props.question.image_file)

const getImageUrl = (filename) => {
  return `${import.meta.env.VITE_BACKEND_BASE_URL}/images/questions/${filename}`
}
</script>

<style>
/* AJOUTER : Style pour l'image */
.question-image {
    margin: auto;
    margin-top: 2px;
    width: 250px;
    height: 125px;
    overflow: hidden;
}

.question-image img {
    width: 100%;
    height: auto;
    display: block;
    object-fit: cover;
    animation: fadeIn 0.8s ease-out;
    animation: slideUp 0.8s ease-out;
    border-radius: 6px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}
</style>