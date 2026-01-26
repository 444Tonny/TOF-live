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
    return`${import.meta.env.VITE_BACKEND_BASE_URL}/images/questions/${filename}`;
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
    margin-top: 10px;
    width: 300px;
    height: 190px;
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