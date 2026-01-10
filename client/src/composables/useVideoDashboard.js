import { ref, computed, onMounted, onUnmounted } from 'vue'
import { sessionService, questionService } from '../services/api'
import socket from '../services/socket'
import { useGameTimer } from './useGameTimer'

/**
 * Composable pour le dashboard vidéo
 */
export function useVideoDashboard() {
  const session = ref(null)
  const currentQuestion = ref(null)
  const currentQuestionIndex = ref(0)
  const availableQuestions = ref([])
  const selectedQuestions = ref([])
  const isPlaying = ref(false)
  const isLoading = ref(false)

  const { timeLeft, progress, isPaused, start: startTimer, pause: pauseTimer, reset: resetTimer } = useGameTimer()

  /**
   * Nombre total de questions sélectionnées
   */
  const totalQuestions = computed(() => selectedQuestions.value.length)

  /**
   * Position actuelle (1-based)
   */
  const currentPosition = computed(() => currentQuestionIndex.value + 1)

  /**
   * Créer ou récupérer la session active
   */
  const initSession = async () => {
    isLoading.value = true
    try {
      const response = await sessionService.getActiveSession()
      session.value = response.data
    } catch (error) {
      if (error.response?.status === 404) {
        const response = await sessionService.createSession()
        session.value = response.data.session
      }
    } finally {
      isLoading.value = false
    }

    if (session.value) {
      socket.connect()
      socket.emit('host:join', session.value.id)

      socket.on('transition:complete', () => {
        // Passer à la question suivante après la transition
        nextQuestion()
      })
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
   * Ajouter une question à la playlist
   */
  const addQuestion = (question) => {
    if (!selectedQuestions.value.find(q => q.id === question.id)) {
      selectedQuestions.value.push(question)
    }
  }

  /**
   * Retirer une question de la playlist
   */
  const removeQuestion = (questionId) => {
    selectedQuestions.value = selectedQuestions.value.filter(q => q.id !== questionId)
  }

  /**
   * Réorganiser les questions (déplacer)
   */
  const moveQuestion = (fromIndex, toIndex) => {
    const item = selectedQuestions.value[fromIndex]
    selectedQuestions.value.splice(fromIndex, 1)
    selectedQuestions.value.splice(toIndex, 0, item)
  }

  /**
   * Lancer la question actuelle
   */
  const broadcastCurrentQuestion = () => {
    if (!session.value || selectedQuestions.value.length === 0) return

    const question = selectedQuestions.value[currentQuestionIndex.value]
    if (!question) return

    //resetTimer()
    currentQuestion.value = question

    socket.emit('host:broadcast-question', {
      sessionId: session.value.id,
      questionId: question.id,
      currentPosition: currentQuestionIndex.value + 1,
      totalQuestions: selectedQuestions.value.length
    })

    //startTimer(() => {
      //()
      // La suite se fait via socket 'transition:complete'
    //})
  }

  /**
   * Démarrer la playlist
   */
  const startPlaylist = () => {
    if (selectedQuestions.value.length === 0) {
      console.error('Aucune question sélectionnée')
      return
    }

    isPlaying.value = true
    currentQuestionIndex.value = 0
    broadcastCurrentQuestion()
  }

  /**
   * Arrêter la playlist
   */
  const stopPlaylist = () => {
    isPlaying.value = false
    resetTimer()
    currentQuestion.value = null
  }

  /**
   * Question suivante
   */
  const nextQuestion = () => {
    if (currentQuestionIndex.value < selectedQuestions.value.length - 1) {
      currentQuestionIndex.value++
      broadcastCurrentQuestion()
    } else {
      // Fin de la playlist
      stopPlaylist()
    }
  }

  /**
   * Question précédente
   */
  const previousQuestion = () => {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--
      broadcastCurrentQuestion()
    }
  }

  onMounted(() => {
    initSession()
    loadQuestions()
  })

  onUnmounted(() => {
    stopPlaylist()
    socket.disconnect()
  })

  return {
    session,
    currentQuestion,
    currentQuestionIndex,
    currentPosition,
    totalQuestions,
    availableQuestions,
    selectedQuestions,
    isPlaying,
    isLoading,
    timeLeft,
    progress,
    isPaused,
    addQuestion,
    removeQuestion,
    moveQuestion,
    startPlaylist,
    stopPlaylist,
    nextQuestion,
    previousQuestion
  }
}