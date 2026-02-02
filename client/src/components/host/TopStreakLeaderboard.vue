<template>
  <div class="streak-leaderboard">
    <h3>TOP 3 🔥 STREAKS</h3>
    <p class="h3_subtitle1">(Most consecutive right answers)</p>
    <div v-if="players.length === 0" class="empty">
      Waiting for players…
    </div>
    <div v-else class="players-list">
      <div v-for="(player, index) in players.slice(0, 3)" :key="index" class="player-item"
        :class="{ 'top-3': index < 3, ['rank-' + (index + 1)]: true }">
        <span class="ranked-username">
          <span class="rank">{{ index + 1 }}<i style="font-weight: 100;">.</i></span>
          <span class="username">{{ player.username }} </span>
        </span>

        <img v-if="player.profile_picture" :src="player.profile_picture" :alt="player.username"
          class="profile-picture" />
        <div v-else class="profile-placeholder">
          {{ player.username.charAt(0).toUpperCase() }}
        </div>
        <div class="streaks">
          <Transition name="zoom">
            <span class="current-streak" :key="player.current_streak">
              {{ player.current_streak }}<i>{{ player.current_streak === 1 ? 'pt' : 'pts' }}</i>
            </span>
          </Transition>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
/**
 * Affichage du classement par streak
 */
defineProps({
  players: {
    type: Array,
    default: () => []
  }
})
</script>

<style scoped>
.streak-leaderboard {
  padding: 15px 5px;
  width: 100%;
}

h3 {
  width: 100%;
  margin-bottom: 5px;
  margin-top: 5px;
  color: #ffffff;
  font-size: 20px;
  text-transform: capitalize;
  text-align: center;
}

.h3_subtitle1 {
  color: #ffffffd9;
  text-align: center;
  margin-bottom: 25px;
  font-size: 11px;
  font-weight: 400;
  text-transform: uppercase;
}

.empty {
  text-align: center;
  color: #999;
  padding: 20px;
}

.players-list {
  gap: 3px;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-content: end;
  align-items: end;
}

.player-item {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  padding: 6px;
  background: #f9fafb;
  border-radius: 8px;
  color: white;
}

.player-item.top-3 {
  background: #15002057;
  font-weight: bold;
}

.ranked-username {
  display: flex;
  flex-direction: column;
  gap: 4px;
  margin-bottom: 10px;
  font-size: 16px;
  font-weight: 500;
  max-width: 160px;
  width: 125px;
}

.rank {
  width: 25px;
  text-align: left;
  font-weight: bold;
  font-size: 16px;
  margin-bottom: -5px;
  margin-right: 2px;
  opacity: 0.6;
}

.username {
  width: 100%;
  text-align: center;
  overflow-x: hidden;
  overflow-y: hidden;
  white-space: nowrap;
  overflow-x: hidden;
  text-overflow: ellipsis;
}

.streaks {
  display: flex;
  gap: 10px;
}

.current-streak {
  font-weight: bold;
  font-size: 30px;
  color: #ffffff;
  position: relative;
  right: -5px;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.current-streak i {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  font-weight: 400;
  font-size: 17px;
  font-style: normal;
  margin-left: 2px;
}

.best-streak {
  color: #f59e0b;
}

/* Photo de profil */
.profile-picture {
  width: 68px;
  height: 68px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid #667eea;
}

.profile-placeholder {
  width: 68px;
  height: 68px;
  border-radius: 50%;
  background: linear-gradient(135deg, #667eea 0%, #667eea 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  font-size: 32px;
  color: white;
}

.rank-1 {
  order: 2;
}

.rank-2 {
  order: 1;
}

.rank-3 {
  order: 3;
}

.rank-1 .profile-picture,
.rank-1 .profile-placeholder {
  width: 88px !important;
  height: 88px !important;
}

.rank-1 .rank {
  color: #ffb22c;
  font-size: 18px;
}

.rank-2 .rank {
  color: #f5f5f5;
}

.rank-3 .rank {
  color: #864d2c;
}

.rank-2 .ranked-username,  
.rank-3 .ranked-username {
  width: 107px;
  font-size: 15px;
}

/* Animation */
.zoom-enter-active {
  animation: zoomOut 0.45s ease-out;
}

@keyframes zoomOut {
  from {
    transform: scale(1.4);
    opacity: 0;
  }

  to {
    transform: scale(1);
    opacity: 1;
  }
}
</style>