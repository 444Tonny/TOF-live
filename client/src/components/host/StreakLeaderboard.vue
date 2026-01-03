<template>
  <div class="streak-leaderboard">
    <h3>🔥 Classement Streak</h3>
    <div v-if="players.length === 0" class="empty">
      En attente de joueurs...
    </div>
    <div v-else class="players-list">
      <div
        v-for="(player, index) in players"
        :key="index"
        class="player-item"
        :class="{ 'top-3': index < 3 }"
      >
        <span class="rank">{{ index + 1 }}</span>
        <span class="username">{{ player.username }}</span>
        <div class="streaks">
          <span class="current-streak">🔥 {{ player.current_streak }}</span>
          <span class="best-streak">⭐ {{ player.best_streak }}</span>
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
  background: white;
  padding: 20px;
  border-radius: 10px;
}

h3 {
  margin-bottom: 15px;
  color: #333;
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
  padding: 12px;
  background: #f9fafb;
  border-radius: 8px;
}

.player-item.top-3 {
  background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
  font-weight: bold;
}

.rank {
  width: 30px;
  text-align: center;
  font-weight: bold;
  color: #ef4444;
}

.username {
  flex: 1;
  margin-left: 10px;
}

.streaks {
  display: flex;
  gap: 10px;
}

.current-streak {
  font-weight: bold;
  color: #ef4444;
}

.best-streak {
  font-size: 0.9rem;
  color: #f59e0b;
}
</style>