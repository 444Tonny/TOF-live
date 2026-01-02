import { ref, onMounted, onUnmounted } from 'vue'
import { sessionService, questionService } from '../services/api'
import socket from '../services/socket'

/**
 * Composable pour le Host (vous qui contrôlez le jeu)
 */
export function useHostGame() {
  const session = ref(null)
  const currentQuestion = ref(null)
  const leaderboard = ref([])
  const availableQuestions = ref([])
  const isLoading = ref(false)

  /**
   * Créer ou récupérer la session active
   */
  const initSession = async () => {
    isLoading.value = true
    try {
      // Essayer de récupérer une session active
      const response = await sessionService.getActiveSession()
      session.value = response.data
    } catch (error) {
      // Si aucune session active, en créer une
      if (error.response?.status === 404) {
        const response = await sessionService.createSession()
        session.value = response.data.session
      }
    } finally {
      isLoading.value = false
    }

    // Connecter au WebSocket
    if (session.value) {
      socket.connect()
      socket.emit('host:join', session.value.id)

      // Écouter les mises à jour du classement
      socket.on('leaderboard:update', (newLeaderboard) => {
        leaderboard.value = newLeaderboard
      })

      // Charger le classement initial
      await loadLeaderboard()
    }
  }

  /**
   * Charger toutes les questions disponibles
   */
  const loadQuestions = async () => {
    try {
      const response = await questionService.getAllQuestions()
      availableQuestions.value = response.data
    } catch (error) {
      console.error('Erreur chargement questions:', error)
    }
  }

  /**
   * Lancer une question
   */
  const broadcastQuestion = (questionId) => {
    currentQuestion.value = availableQuestions.value.find(q => q.id === questionId)
    socket.emit('host:broadcast-question', {
      sessionId: session.value.id,
      questionId
    })
  }

  /**
   * Charger le classement
   */
  const loadLeaderboard = async () => {
    if (!session.value) return
    try {
      const response = await sessionService.getLeaderboard(session.value.id)
      leaderboard.value = response.data
    } catch (error) {
      console.error('Erreur chargement classement:', error)
    }
  }

  // Initialiser au montage
  onMounted(() => {
    initSession()
    loadQuestions()
  })

  // Nettoyer à la destruction
  onUnmounted(() => {
    socket.disconnect()
  })

  return {
    session,
    currentQuestion,
    leaderboard,
    availableQuestions,
    isLoading,
    broadcastQuestion,
    loadLeaderboard
  }
}