import { ref } from 'vue'
import { tiktokApi } from '@/services/tiktokApi'

/**
 * Composable pour gérer la connexion TikTok Live
 */
export function useTikTok() {
  const isTikTokConnected = ref(false)
  const currentTikTokUsername = ref('')
  const isLoading = ref(false)
  const error = ref(null)

  /**
   * Connecter au live TikTok
   */
  const connectTikTok = async (username) => {
    if (!username || !username.trim()) {
      error.value = 'Username requis'
      return false
    }

    isLoading.value = true
    error.value = null

    try {
      // Nettoyer le username (enlever @)
      const cleanUsername = username.trim().replace('@', '')

      const result = await tiktokApi.connectTikTok(cleanUsername)

      if (result.success) {
        isTikTokConnected.value = true
        currentTikTokUsername.value = cleanUsername
        return true
      } else {
        error.value = result.message || 'Connexion échouée'
        return false
      }
    } catch (err) {
      error.value = err.response?.data?.message || err.message || 'Erreur de connexion'
      console.error('Erreur connexion TikTok:', err)
      return false
    } finally {
      isLoading.value = false
    }
  }

  /**
   * Déconnecter du live TikTok
   */
  const disconnectTikTok = async () => {
    isLoading.value = true
    error.value = null

    try {
      await tiktokApi.disconnectTikTok()
      isTikTokConnected.value = false
      currentTikTokUsername.value = ''
      return true
    } catch (err) {
      error.value = err.response?.data?.message || err.message || 'Erreur de déconnexion'
      console.error('Erreur déconnexion TikTok:', err)
      return false
    } finally {
      isLoading.value = false
    }
  }

  /**
   * Vérifier le statut actuel
   */
  const checkStatusTikTok = async () => {
    try {
      const status = await tiktokApi.getStatusTikTok()
      isTikTokConnected.value = status.connected
      return status
    } catch (err) {
      console.error('Erreur récupération statut:', err)
      return { connected: false }
    }
  }

  /**
   * Réinitialiser les erreurs
   */
  const clearError = () => {
    error.value = null
  }

  return {
    // État
    isTikTokConnected,
    currentTikTokUsername,
    isLoading,
    error,

    // Actions
    connectTikTok,
    disconnectTikTok,
    checkStatusTikTok,
    clearError
  }
}