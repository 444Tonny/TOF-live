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

export const INTRO_PHRASES = [
  "Bienvenue dans ce quiz ! Préparez-vous à tester vos connaissances.",
  "C'est parti pour un nouveau quiz ! Êtes-vous prêt ?",
  "Attention, le quiz commence ! Concentrez-vous bien.",
  "Bonjour à tous ! Un nouveau quiz vous attend.",
  "Prêts pour le défi ? Le quiz démarre maintenant !"
]

/**
 * Phrases de conclusion (fin du quiz)
 */
export const OUTRO_PHRASES = [
  "C'est terminé ! Merci d'avoir participé à ce quiz.",
  "Voilà, le quiz est fini ! J'espère que vous vous êtes bien amusé.",
  "Et c'est la fin ! N'oubliez pas de liker et vous abonner.",
  "Le quiz se termine ici ! À très bientôt pour un nouveau défi.",
  "Bravo d'avoir terminé ! On se retrouve dans la prochaine vidéo."
]

/**
 * Sélectionner une phrase aléatoire depuis un tableau
 */
export function getRandomPhrase(phrases) {
  const index = Math.floor(Math.random() * phrases.length)
  return phrases[index]
}