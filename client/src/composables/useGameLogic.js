import { ref } from 'vue'
import { questionService } from '../services/api'
import { useSpeech } from './useSpeech'
import { ANSWER_CONNECTORS, NEXT_QUESTION_TRANSITIONS, getRandomPhrase } from '../constants/speechPhrases'


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
    const lastAnswerWasCorrect = ref(null)

    // Ajouter le composable speech
    const { speak, speakSequence, stop, isSpeaking, isSpeechEnabled } = useSpeech()

    /**
    * Charge une question aléatoire depuis l'API
    */
    const loadRandomQuestion = async (skipSpeech = false) => {
        isLoading.value = true
        error.value = null
        lastAnswerWasCorrect.value = null

        // Arrêter toute lecture en cours
        stop()

        try {
            // Appel API avec exclusion des questions déjà utilisées
            const response = await questionService.getRandomQuestion(usedQuestionIds.value)

            currentQuestion.value = response.data
            usedQuestionIds.value.push(response.data.id)

            // Lire la question après un court délai (sauf si skipSpeech)
            if (!skipSpeech) {
                setTimeout(() => {
                speak(response.data.question)
                }, 500)
            }

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

        // Arrêter la lecture
        stop()

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

            // Construire la séquence de phrases à lire
            const answerText = currentQuestion.value.answer ? 'true' : 'false'
            const connector = getRandomPhrase(ANSWER_CONNECTORS)
            const answerDetail = currentQuestion.value.answer_detail || ''
            const transition = getRandomPhrase(NEXT_QUESTION_TRANSITIONS)

            // Séquence : Connecteur + Réponse + Détails + Transition
            const speechSequence = [
                `${connector}, ${answerText}.`,
                answerDetail,
                transition
            ]

            // Lire la séquence puis charger la prochaine question
            speakSequence(speechSequence).then(() => {
                // Charger la question suivante après la séquence
                loadRandomQuestion()
            })

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
        stop()
        score.value = 0
        usedQuestionIds.value = []
        error.value = null
        lastAnswerWasCorrect.value = null
        loadRandomQuestion()
    }

    return {
         score,
        currentQuestion,
        isLoading,
        error,
        isSpeaking,
        isSpeechEnabled,
        lastAnswerWasCorrect,
        loadRandomQuestion,
        submitAnswer,
        resetGame,
        stop
    }
}