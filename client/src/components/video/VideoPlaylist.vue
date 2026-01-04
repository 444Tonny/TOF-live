<template>
  <div class="video-playlist">
    <h3>🎬 Playlist ({{ questions.length }} questions)</h3>
    
    <div v-if="questions.length === 0" class="empty">
      Aucune question sélectionnée
    </div>
    
    <div v-else class="playlist">
      <div
        v-for="(question, index) in questions"
        :key="question.id"
        class="playlist-item"
        :class="{ active: index === currentIndex }"
      >
        <span class="item-number">{{ index + 1 }}</span>
        <span class="item-text">{{ question.question }}</span>
        <button @click="$emit('remove', question.id)" class="btn-remove">
          ✕
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
/**
 * Liste des questions sélectionnées (playlist)
 */
defineProps({
  questions: {
    type: Array,
    required: true
  },
  currentIndex: {
    type: Number,
    default: 0
  }
})

defineEmits(['remove'])
</script>

<style scoped>
.video-playlist {
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

.empty {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #999;
  font-size: 1rem;
}

.playlist {
  flex: 1;
  overflow-y: auto;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.playlist-item {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 12px;
  background: #f9fafb;
  border: 2px solid #e5e7eb;
  border-radius: 8px;
  transition: all 0.2s;
}

.playlist-item.active {
  background: #fef3c7;
  border-color: #f59e0b;
}

.item-number {
  min-width: 30px;
  height: 30px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #667eea;
  color: white;
  border-radius: 50%;
  font-weight: bold;
  font-size: 0.9rem;
}

.playlist-item.active .item-number {
  background: #f59e0b;
}

.item-text {
  flex: 1;
  font-size: 0.95rem;
  color: #333;
}

.btn-remove {
  padding: 5px 10px;
  background: #ef4444;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 1rem;
  transition: background 0.2s;
}

.btn-remove:hover {
  background: #dc2626;
}
</style>