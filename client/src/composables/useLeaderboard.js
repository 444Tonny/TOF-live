import { ref } from 'vue'
import { sessionService } from '../services/api'

/**
 * Composable réutilisable pour gérer le classement
 */
export function useLeaderboard(sessionId) {
  const leaderboard = ref([])
  const isLoading = ref(false)
  const error = ref(null)

  /**
   * Charger le classement
   */
  const loadLeaderboard = async () => {
    if (!sessionId.value) return
    
    isLoading.value = true
    error.value = null

    try {
      const response = await sessionService.getLeaderboard(sessionId.value)
      leaderboard.value = response.data
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
  const updateLeaderboard = (newLeaderboard) => {
    leaderboard.value = newLeaderboard
  }

  return {
    leaderboard,
    isLoading,
    error,
    loadLeaderboard,
    updateLeaderboard
  }
}