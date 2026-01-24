<template>
  <Transition name="announce">
    <div v-if="show" class="top-streak-announcement">
      <div class="announcement-card">
        <!-- Photo de profil -->
        <div class="player-avatar">
          <img 
            v-if="player.profile_picture"
            :src="player.profile_picture"
            :alt="player.username"
          />
          <div v-else class="avatar-placeholder">
            {{ player.username.charAt(0).toUpperCase() }}
          </div>
        </div>

        <!-- Badge position -->
        <div class="position-badge" :class="`position-${position}`">
          {{ position === 1 ? '🥇' : position === 2 ? '🥈' : '🥉' }}
          TOP {{ position }}
        </div>

        <!-- Nom du joueur -->
        <h2 class="player-name">{{ player.username }}</h2>
      </div>
    </div>
  </Transition>
</template>

<script setup>
defineProps({
  show: {
    type: Boolean,
    required: true
  },
  player: {
    type: Object,
    required: true
  },
  position: {
    type: Number,
    required: true
  }
})
</script>

<style scoped>
.top-streak-announcement {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  background: rgba(0, 0, 0, 0.1);
  z-index: 9999;
  backdrop-filter: blur(1px);
}

.announcement-card {
  background: rgba(21, 1, 29, 0.582);
  padding: 30px;
  border-radius: 30px;
  text-align: center;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.5);
  position: relative;
  top: -130px;
}

.player-avatar {
  width: 150px;
  height: 150px;
  margin: 0 auto 20px;
  border-radius: 50%;
  overflow: hidden;
  border: 5px solid white;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
}

.player-avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.avatar-placeholder {
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, #ff0050 0%, #ff4081 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 60px;
  font-weight: bold;
  color: white;
}

.position-badge {
  display: inline-block;
  padding: 8px 20px;
  border-radius: 20px;
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 15px;
  color: white;
}

.position-badge.position-1 {
  background: linear-gradient(135deg, #ffd700 0%, #ffed4e 100%);
  color: #000;
}

.position-badge.position-2 {
  background: linear-gradient(135deg, #c0c0c0 0%, #e8e8e8 100%);
  color: #000;
}

.position-badge.position-3 {
  background: linear-gradient(135deg, #cd7f32 0%, #e8a87c 100%);
  color: #fff;
}

.player-name {
  font-size: 42px;
  font-weight: bold;
  color: white;
  margin: 0;
  text-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
}

/* Animation rotate + zoom */
.announce-enter-active {
  animation: rotateZoomIn 0.6s cubic-bezier(0.68, -0.55, 0.27, 1.55);
}

.announce-leave-active {
  animation: rotateZoomOut 0.4s ease-in;
}

@keyframes rotateZoomIn {
  from {
    opacity: 0;
    transform: scale(0.3) rotate(-180deg);
  }
  to {
    opacity: 1;
    transform: scale(1) rotate(0deg);
  }
}

@keyframes rotateZoomOut {
  from {
    opacity: 1;
    transform: scale(1) rotate(0deg);
  }
  to {
    opacity: 0;
    transform: scale(0.3) rotate(180deg);
  }
}
</style>