<template>
  <div class="leaderboard">
    <h3>TOP 10 🏆 Most Correct Answers</h3>
    <div v-if="players.length === 0" class="empty">
      Waiting for players...
    </div>
    <div v-else class="players-list">
      <div
        v-for="(player, index) in players"
        :key="index"
        class="player-item"
        :class="{ 'top-3': index < 3 }"
      >
        <span class="rank">#{{ index + 1 }}</span>
        <img 
          v-if="player.profile_picture"
          :src="player.profile_picture" 
          :alt="player.username"
          class="profile-picture"
        />
        <div v-else class="profile-placeholder">
          {{ player.username.charAt(0).toUpperCase() }}
        </div>

        <span class="username">{{ player.username }}</span>
        <span class="score">{{ player.score }}<i></i></span>
      </div>
    </div>
  </div>
</template>

<script setup>
/**
 * Affichage du classement
 */
defineProps({
  players: {
    type: Array,
    default: () => []
  }
})
</script>

<style scoped>
.leaderboard {
  display: flex;
  flex-direction: column;
  flex: 1;
  padding: 20px;
  border-radius: 10px;
  color: #fdfdfd;
}

h3 {
  margin-bottom: 15px;
  color: #e7e7e7;
  text-align: center;
  font-weight: 600;
}

.empty {
  text-align: center;
  color: #999;
  padding: 20px;
}

.players-list {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.player-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 6px 18px;
  background: #15002057;
  border-radius: 8px;
  border: 2px solid #272f53;
}

.player-item.top-3 {
  background: linear-gradient(135deg, #667eea7c 0%, #667eeac5 100%);
  font-weight: bold;
}

.rank {
  width: 30px;
  text-align: center;
  font-weight: bold;
  font-size: 20px;
  color: #ffffff;
  margin-right: 8px;
}

.username {
  max-width: 275px;
  flex: 1;
  margin-left: 12px;
  margin-right: auto;
  font-size: 22px;
  font-weight: 500;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  display: inline-block;
}

.score {
  font-weight: bold;
  font-size: 30px;
  color: #ffffff;
}

.score i {
  font-style: normal;
  font-weight: 400;
  font-size: 22px;
  color: #ffffff;
  margin-left: 3px;
}

/* Photo de profil */
.profile-picture {
  width: 42px;
  height: 42px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid #ffffff;
  margin-right: 10px;
  margin-left: 10px;
}

.profile-placeholder {
  width: 42px;
  height: 42px;
  border-radius: 50%;
  background: linear-gradient(135deg, #ffffff 0%, #ffffff 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  font-size: 20px;
  color: #667eea;
}

</style>