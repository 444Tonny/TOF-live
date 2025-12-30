import { ref } from 'vue'
import { questionService } from '../services/api'

/**
 * Composable qui gère la logique du jeu
 * Séparé pour être facilement testable et réutilisable
 */
export function useGameLogic() {
    // État du jeu
    const score = ref(0) // Compteur de score
    const currentQuestion = ref(null) // Question affichée actuellement
    const usedQuestionIds = ref([]) // IDs des questions déjà posées
    const isLoading = ref(false)
    const error = ref(null)

    /**
    * Charge une question aléatoire depuis l'API
    */
    const loadRandomQuestion = async () => {
        isLoading.value = true
        error.value = null

        try {
            // Appel API avec exclusion des questions déjà utilisées
            const response = await questionService.getRandomQuestion(usedQuestionIds.value)

            currentQuestion.value = response.data
            usedQuestionIds.value.push(response.data.id)

        } catch (err) {
            console.error('Erreur chargement question:', err)
            error.value = 'Impossible de charger la question'
            currentQuestion.value = null
        } finally {
            isLoading.value = false
        }
    }

    /**
   * Traite la réponse du joueur
   * @param {boolean} userAnswer - true ou false
   */
    const submitAnswer = async (userAnswer) => {
        if (!currentQuestion.value || isLoading.value) return

        isLoading.value = true

        try {
            // Vérifier la réponse via l'API
            const response = await questionService.checkAnswer(
                currentQuestion.value.id,
                userAnswer
            )

            // Incrémenter le score si correct
            if (response.data.isCorrect) {
                score.value++
            }

            // Charger la question suivante
            await loadRandomQuestion()

        } catch (err) {
            console.error('Erreur soumission réponse:', err)
            error.value = 'Erreur lors de la vérification'
        } finally {
            isLoading.value = false
        }
    }

    /**
     * Réinitialise le jeu
     */
    const resetGame = () => {
        score.value = 0
        usedQuestionIds.value = []
        error.value = null
        loadRandomQuestion()
    }

    return {
        score,
        currentQuestion,
        isLoading,
        error,
        loadRandomQuestion,
        submitAnswer,
        resetGame
    }
}