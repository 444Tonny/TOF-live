<template>
  <button 
    @click="toggleSpeech" 
    class="speech-toggle"
    :class="{ active: isSpeechEnabled }"
  >
    <span class="icon">{{ isSpeechEnabled ? '🔊' : '🔇' }}</span>
    <span class="label">{{ isSpeechEnabled ? 'Voix ON' : 'Voix OFF' }}</span>
  </button>
</template>

<script setup>
import { useSpeechStore } from '../stores/speechStore'

/**
 * Bouton pour activer/désactiver la voix
 */
const { isSpeechEnabled, toggleSpeech } = useSpeechStore()
</script>

<style scoped>
.speech-toggle {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 10px 20px;
  background: white;
  border: 2px solid #e5e7eb;
  border-radius: 10px;
  cursor: pointer;
  transition: all 0.3s;
  font-weight: 600;
  color: #666;
}

.speech-toggle:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.speech-toggle.active {
  background: linear-gradient(135deg, #10b981 0%, #059669 100%);
  color: white;
  border-color: #10b981;
}

.icon {
  font-size: 1.2rem;
}

.label {
  font-size: 0.9rem;
}
</style>