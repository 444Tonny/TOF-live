import { ref, onMounted, onUnmounted, computed } from 'vue'
import { sessionService, questionService } from '../services/api'
import socket from '../services/socket'
import { useGameTimer } from './useGameTimer'
import { useLeaderboard } from './useLeaderboard' // AJOUTER
import { GAME_CONFIG } from '@/constants/gameConfig'


/**
 * Composable pour le Host (vous qui contrôlez le jeu)
 */
export function useHostGame() {
  const session = ref(null)
  const currentQuestion = ref(null) 
  let currentQuestionIndex = 0 // AJOUTER : Index de la question actuelle
  
  const availableQuestions = ref([])
  const isLoading = ref(false)
  const isAutoMode = ref(false)
  const recentQuestionIds = ref([]) // Garder les 3 dernières questions
  const { timeQuestionLeft, progress, isQuestionTimerRunning, isQuestionTimerPaused, startQuestionTimer, pauseQuestionTimer, resetQuestionTimer } = useGameTimer()

  //const leaderboard = ref([])
  const sessionId = computed(() => session.value?.id)
  const { scoreLeaderboard, streakLeaderboard, loadLeaderboards, updateLeaderboards } = useLeaderboard(sessionId)

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

      /* Écouter les mises à jour du classement
      socket.on('leaderboard:update', (newLeaderboard) => {
        leaderboard.value = newLeaderboard
      }) */

      // MODIFIER : Utiliser updateLeaderboard
      socket.on('leaderboard:update', (newLeaderboard) => {
        updateLeaderboards(newLeaderboard)
      })

      // AJOUTER : Écouter la fin des transitions
      socket.on('transition:complete', () => {
        // Relancer la prochaine question si en mode auto
        if (isAutoMode.value) {
          if (currentQuestionIndex.value >= GAME_CONFIG.NUMBER_OF_QUESTION_IN_SESSION) {
            console.log('Session terminée : 50 questions atteintes')
            stopAutoMode()
          } else {
            broadcastRandomQuestion()
          }
        }
      })

      // Charger le classement initial
      await loadLeaderboards()
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
   * Sélectionner une question aléatoire (exclure les 3 dernières)
   */
  const getRandomQuestion = () => {
    // Filtrer les questions non utilisées récemment
    const eligibleQuestions = availableQuestions.value.filter(
      q => !recentQuestionIds.value.includes(q.id)
    )

    // Si moins de 3 questions éligibles, réinitialiser l'historique
    if (eligibleQuestions.length === 0) {
      recentQuestionIds.value = []
      return availableQuestions.value[
        Math.floor(Math.random() * availableQuestions.value.length)
      ]
    }

    // Sélectionner aléatoirement parmi les questions éligibles
    const randomIndex = Math.floor(Math.random() * eligibleQuestions.length)
    const selectedQuestion = eligibleQuestions[randomIndex]

    // Ajouter à l'historique et garder seulement les 3 dernières
    recentQuestionIds.value.push(selectedQuestion.id)
    if (recentQuestionIds.value.length > 3) {
      recentQuestionIds.value.shift() // Enlever la plus ancienne
    }

    return selectedQuestion
  }


  /**
   * Lancer une question spécifique (mode manuel)
   */
  const broadcastQuestion = (questionId) => {
    
    const question = availableQuestions.value.find(q => q.id === questionId)
    if (!question) return

    currentQuestion.value = question
    socket.emit('host:broadcast-question', {
      sessionId: session.value.id,
      questionId
    })
  }

  /**
   * Lancer une question aléatoire (mode auto)
   */
  const broadcastRandomQuestion = () => {
    resetQuestionTimer()
    
    // Increase by 1 the index
    nextQuestionGame()

    const question = getRandomQuestion()
    currentQuestion.value = question

    socket.emit('host:broadcast-question', {
      sessionId: session.value.id,
      questionId: question.id,
      currentPosition: currentQuestionIndex,
      totalQuestions: GAME_CONFIG.NUMBER_OF_QUESTION_IN_SESSION
    })

    // Démarrer le timer (quand il atteint 0, pause puis nouvelle question)
    startQuestionTimer(() => {
      pauseQuestionTimer()
    })
  }

  const nextQuestionGame = () => {
    currentQuestionIndex++;
  }

  /**
   * Démarrer le mode automatique (boucle infinie)
   */
  const startAutoMode = () => {
    if (availableQuestions.value.length === 0) {
      console.error('Aucune question disponible')
      return
    }

    isAutoMode.value = true
    currentQuestionIndex = 0
    
    // Lancer la première question immédiatement
    broadcastRandomQuestion()
  }

  /**
   * Arrêter le mode automatique
   */
  const stopAutoMode = () => {
    isAutoMode.value = false
    currentQuestionIndex = 0 // Reset
    resetQuestionTimer()
  }

  // Initialiser au montage
  onMounted(() => {
    initSession()
    loadQuestions()
  })

  // Nettoyer à la destruction
  onUnmounted(() => {
    stopAutoMode()
    socket.disconnect()
  })

  return {
    session,
    currentQuestion,
    scoreLeaderboard,
    streakLeaderboard,
    availableQuestions,
    isLoading,
    isAutoMode,
    timeQuestionLeft,
    progress,
    isQuestionTimerPaused,
    startAutoMode,
    stopAutoMode,
    loadLeaderboards
  }
}