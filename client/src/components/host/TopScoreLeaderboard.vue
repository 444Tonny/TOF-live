<template>
  <div class="overall-leaderboard">
    <h3>TOP SCORES</h3>
    <div v-if="players.length === 0" class="empty">
      Waiting for players…
    </div>
    <div v-else class="players-list">
      <div
        v-for="(player, index) in players.slice(0, 3)"
        :key="index"
        class="player-item"
        :class="{'top-3': index < 3, ['rank-' + (index + 1)]: true}"
      >
        <span class="username"><span class="rank">{{ index + 1 }}. </span>{{ player.username }}</span>
        <img 
          v-if="player.profile_picture"
          :src="player.profile_picture" 
          :alt="player.username"
          class="profile-picture"
        />
        <div v-else class="profile-placeholder">
          {{ player.username.charAt(0).toUpperCase() }}
        </div>
        <div class="scores">
          <span class="current-score">{{ player.score }}<i>{{ player.score === 1 ? 'pt' : 'pts' }}</i></span>
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
.overall-leaderboard {
  padding: 20px;
  width: 100%;
}

h3 {
  width: 100%;
  margin-bottom: 35px;
  color: #ffffff;
  font-size: 26px;
  text-transform: capitalize;
  text-align: center;
}

.empty {
  text-align: center;
  color: #999;
  padding: 20px;
}

.players-list {
  gap: 8px;
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
  padding: 12px;
  background: #f9fafb;
  border-radius: 8px;
  color: white;
}

.player-item.top-3 {
  background: #15002057;
  font-weight: bold;
}

.rank {
  width: 30px;
  text-align: center;
  font-weight: bold;
  font-size: 18px;
  margin-bottom: -10px;
  margin-right: 3px;
}

.username {
  flex: 1;
  margin-bottom: 15px;
  font-size: 21px;
  font-weight: 500;
  max-width: 161px;
  overflow-x: hidden;
  overflow-y: hidden;
}

.scores {
  display: flex;
  gap: 10px;
}

.current-score {
  font-weight: bold;
  font-size: 36px;
  color: #ffffff;
  position: relative;
  right: -10px;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.current-score i {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  font-weight: 400;
  font-size: 19px;
  font-style: normal;
  margin-left: 2px;
}

.best-streak {
  color: #f59e0b;
}

/* Photo de profil */
.profile-picture {
  width: 85px;
  height: 85px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid #667eea;
}

.profile-placeholder {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: linear-gradient(135deg, #667eea 0%, #667eea 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  font-size: 22px;
  color: white;
}

.rank-1
{
  order: 2;
}

.rank-2
{
  order: 1;
}

.rank-3
{
  order: 3;
}

.rank-1 .profile-picture
{
  width: 120px;
  height: 120px;
}

.rank-1 .rank
{
  color: #ffb22c;
  font-size: 22px;
}

.rank-2 .rank
{
  color: #f5f5f5;
}

.rank-3 .rank
{
  color: #864d2c;
}

</style>