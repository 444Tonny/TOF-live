<template>
<div class="video-background">
  <video autoplay muted loop playsinline preload="auto">
    <source :src="`${BACKEND_BASE_URL}/images/background/loop1.mp4`" type="video/mp4">
  </video>
  <div class="video-overlay"></div>
</div>

  <router-view />
</template>

<script setup>
  import { ref, onMounted, } from 'vue'

  const BACKEND_BASE_URL = import.meta.env.VITE_BACKEND_BASE_URL
  const bgVideo = ref(null)

  onMounted(() => {
    if (bgVideo.value) {
      bgVideo.value.play().catch(() => {})
    }
  })

</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif !important;
}

#app {
  min-height: fit-content;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0px 5px !important;
}

:root {
  /* Couleurs principales */
  --color--bg1: #1e1d2a;  
  --color--bg3: #0f0f0fb5;         /* texte clair */
  --color--primary: #5e3681 ;  /* vert principal */

  /* États */
  --color--white: #f0f0f0;
  --color-disabled: #6b7280;

  /* Boutons */
  --color--success: #10b981;
  --color--success2: #10b9815b;
  --color--fail: #ff4949;
  --color--fail2: #ef444442;
}

/* Background vidéo */
.video-background {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: -1;
  overflow: hidden;
  padding-top: 150px;
  padding-bottom: 150px;
}

.video-background video {
  position: absolute;
  top: 50%;
  left: 50%;
  min-width: 100%;
  min-height: 100%;
  width: auto;
  height: auto;
  transform: translate(-50%, -50%);
  object-fit: cover;
}

/* Overlay pour assombrir la vidéo (optionnel) */
.video-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #220202;
  opacity: 0.65;
  filter: 
    brightness(0.6)
    contrast(1.1)
    saturate(1.2)
    hue-rotate(300deg);
}

</style>