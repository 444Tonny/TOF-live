import axios from 'axios'

/**
 * Configuration de l'API * Centralise tous les appels vers le backend
 */
//const API_URL = 'http://localhost:3000/api'
const API_URL = import.meta.env.VITE_API_URL

const api = axios.create({
  baseURL: API_URL,
  headers: {
    'Content-Type': 'application/json'
  }
})

/**
 * Service pour les questions
 */
export const questionService = {
  /**
   * Récupérer une question aléatoire
   * @param {Array} excludeIds - IDs des questions déjà utilisées
   */
  getRandomQuestion(excludeIds = []) {
    const params = excludeIds.length > 0
      ? { exclude: excludeIds.join(',') }
      : {}
    return api.get('/questions/random', { params })
  },

  /**
   * Vérifier une réponse
   * @param {Number} questionId - ID de la question
   * @param {Boolean} userAnswer - Réponse de l'utilisateur
   */
  checkAnswer(questionId, userAnswer) {
    return api.post('/questions/check', {
      questionId,
      userAnswer
    })
  },

  /**
   * Récupérer toutes les questions
   */
  getAllQuestions() {
    return api.get('/questions')
  }
}

export const sessionService = {
  createSession() {
    return api.post('/sessions')
  },

  getActiveSession() {
    return api.get('/sessions/active')
  },

  getLeaderboard(sessionId) {
    return api.get(`/sessions/${sessionId}/leaderboard`)
  },

  getStreakLeaderboard(sessionId) {
    return api.get(`/sessions/${sessionId}/streak-leaderboard`)
  }
}

export const gameService = {
  
    submitAnswer(username, platformUserId, answer, profilePicture = null) {
      try{ 
        return api.post('/game/answer', {
          username,
          platform_user_id: platformUserId,
          answer,
          // N'envoyer profile_picture que si elle existe
          ...(profilePicture && { profile_picture: profilePicture })
        })
      }
      
      catch (error) {
        console.error('Erreur soumission réponse:', error)
        hasAnswered.value = false
      }
  }
}

/**
 * Service pour la synthèse vocale
 */
export const speechService = {
  /**
   * Générer l'audio d'un texte
   */
  async generateAudio(text) {
    const response = await api.post('/speech/generate', 
      { text },
      { responseType: 'blob' } // Important pour recevoir l'audio
    )
    return response.data
  }
}

// Intercepteur pour ajouter le mot de passe
api.interceptors.request.use(config => {
    const password = localStorage.getItem('gamePassword')
    if (password) {
        config.headers['x-game-password'] = password
    }
    return config
})

// Intercepteur pour gérer erreur 401
api.interceptors.response.use(
    response => response,
    error => {
        if (error.response?.status === 401) {
            localStorage.removeItem('gamePassword')
            window.location.href = '/login'
        }
        return Promise.reject(error)
    }
)

export default api