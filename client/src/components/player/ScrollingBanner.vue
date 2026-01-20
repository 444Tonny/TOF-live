<template>
  <div class="scrolling-banner">
    <Transition name="slide-left" mode="out-in">
      <div :key="currentIndex" class="banner-text">
        {{ currentMessage }}
      </div>
    </Transition>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted, computed } from 'vue'
import { BANNER_MESSAGES } from '@/constants/bannerMessages'

const currentIndex = ref(0)
let interval = null

const currentMessage = computed(() => BANNER_MESSAGES[currentIndex.value])

onMounted(() => {
  interval = setInterval(() => {
    currentIndex.value = (currentIndex.value + 1) % BANNER_MESSAGES.length
  }, 8000) // Change toutes les 8 secondes
})

onUnmounted(() => {
  if (interval) clearInterval(interval)
})
</script>

<style scoped>
.scrolling-banner {
  width: 100%;
  background: linear-gradient(90deg, #b80940 0%, #b80940 100%);
  padding: 12px 0;
  overflow: hidden;
  position: relative;
}

.banner-text {
  color: white;
  font-size: 21px;
  font-weight: 400;
  text-align: center;
  white-space: nowrap;
}

/* Animation slide vers la gauche */
.slide-left-enter-active,
.slide-left-leave-active {
  transition: all 0.5s ease;
}

.slide-left-enter-from {
  transform: translateX(100%);
  opacity: 0;
}

.slide-left-leave-to {
  transform: translateX(-100%);
  opacity: 0;
}

.slide-left-enter-to,
.slide-left-leave-from {
  transform: translateX(0);
  opacity: 1;
}
</style>