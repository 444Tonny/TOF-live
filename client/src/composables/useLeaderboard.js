import { ref } from 'vue'
import { sessionService } from '../services/api'

/**
 * Composable réutilisable pour gérer le classement
 */
export function useLeaderboard(sessionId) {
  const scoreLeaderboard = ref([])
  const streakLeaderboard = ref([])
  const isLoading = ref(false)
  const error = ref(null)

  /**
   * Charger le classement
   */
  const loadLeaderboards = async () => {
    if (!sessionId.value) return

    isLoading.value = true
    error.value = null

    try {
      const [scoreRes, streakRes] = await Promise.all([
        sessionService.getLeaderboard(sessionId.value),
        sessionService.getStreakLeaderboard(sessionId.value)
      ])

      scoreLeaderboard.value = scoreRes.data
      streakLeaderboard.value = streakRes.data
    } catch (err) {
      console.error('Erreur chargement classement:', err)
      error.value = 'Impossible de charger le classement'
    } finally {
      isLoading.value = false
    }
  }

  /**
   * Mettre à jour le classement (depuis socket)
   */
  const updateLeaderboards = (data) => {
    scoreLeaderboard.value = data.score
    streakLeaderboard.value = data.streak
  }

  return {
    scoreLeaderboard,
    streakLeaderboard,
    isLoading,
    error,
    loadLeaderboards,
    updateLeaderboards
  }
}