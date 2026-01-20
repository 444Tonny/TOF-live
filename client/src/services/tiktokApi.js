import api from './api'

/**
 * Service API pour TikTok Live
 */
export const tiktokApi = {
  /**
   * Démarrer l'écoute d'un live TikTok
   */
  async connectTikTok(username) {
    const response = await api.post('/tiktok/start', { username })
    return response.data
  },

  /**
   * Arrêter l'écoute TikTok
   */
  async disconnectTikTok() {
    const response = await api.post('/tiktok/stop')
    return response.data
  },

  /**
   * Vérifier le statut de la connexion
   */
  async getStatusTikTok() {
    const response = await api.get('/tiktok/status')
    return response.data
  }
}