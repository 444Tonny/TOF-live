<template>
    <!-- AJOUTER : Image si présente -->
    <div v-if="question.image_file" class="question-image">
        <img :src="getImageUrl(question.image_file)" :alt="question.question" @error="handleImageError" />
    </div>
</template>

<script setup>
defineProps({
    question: {
        type: Object,
        required: true
    }
});

/**
 * Construire l'URL de l'image
 */
const getImageUrl = (filename) => {
    return `http://localhost:3000/images/questions/${filename}`
}

/**
 * Gérer l'erreur de chargement d'image
 */
const handleImageError = (event) => {
    console.error('Erreur chargement image:', event.target.src)
    //event.target.style.display = 'none'
}
</script>

<style>
/* AJOUTER : Style pour l'image */
.question-image {
    margin: auto;
    margin-top: 40px;
    width: 350px;
    border-radius: 6px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.question-image img {
    width: 100%;
    height: auto;
    display: block;
    object-fit: cover;
    max-height: 300px;
    animation: fadeIn 0.8s ease-out;
    animation: slideUp 0.8s ease-out;
}
</style>