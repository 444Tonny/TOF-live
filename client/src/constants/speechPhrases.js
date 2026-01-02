/**
 * Phrases de transition pour l'animateur vocal
 */

/**
 * Connecteurs pour annoncer la réponse
 * Utilisés après que le joueur ait répondu
 */
export const ANSWER_CONNECTORS = [
  "La réponse était",
  "Et c'était",
  "La bonne réponse est",
  "C'était",
  "Il fallait répondre",
  "Eh bien, c'était",
  "Alors c'était",
  "Réponse, c'était"
]

/**
 * Transitions pour passer à la question suivante
 */
export const NEXT_QUESTION_TRANSITIONS = [
  "Prochaine question",
  "Question suivante",
  "Passons à la prochaine",
  "Continuons",
  "Allons-y pour la suivante",
  "On enchaîne",
  "Place à la question suivante",
  "Voici la prochaine",
  "Nouvelle question",
  "C'est parti pour la suivante",
  "On continue"
]

/**
 * Sélectionner une phrase aléatoire depuis un tableau
 */
export function getRandomPhrase(phrases) {
  const index = Math.floor(Math.random() * phrases.length)
  return phrases[index]
}