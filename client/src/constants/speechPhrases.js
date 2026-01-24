/**
 * Phrases de transition pour l'animateur vocal
 */

/**
 * Connecteurs pour annoncer la réponse
 * Utilisés après que le joueur ait répondu
 */
export const ANSWER_CONNECTORS = [
  "It's",
  "That's",
  "It was",
  /*
  "The answer was",
  "And it was",
  "The correct answer is",
  "It was",
  "You had to answer",
  "Well, it was",
  "So it was",
  "Answer: it was",
  "The answer is",
  "Correct answer",
  "And the answer is",
  "The right answer is",
  "Here it comes",
  "Answer was",
  "And it is"
  */
]

/**
 * Transitions to move to the next question
 */
export const NEXT_QUESTION_TRANSITIONS = [
  "Next",
  "Next!",
  "Next?",
  /*
  "Following question",
  "Let's move on to the next one",
  "Let's continue",
  "Here comes the next one",
  "Let's keep going",
  "Now onto the next question",
  "Here is the next one",
  "New question",
  "Let's go for the next one",
  "Let's continue",
  "Let's move on",
  "Keep going",
  "Up next",
  "Ready for the next one"
  */
]

export const INTRO_PHRASES = [
  "Do you think you know geography? Let’s find out!"/*
  "Do you really know Naruto? Let’s find out!"/*
  "General knowledge test! Can you get 5 right answers in a row?" 
  "Welcome to this quiz! Get ready to test your knowledge.",
  "Here we go with a new quiz! Are you ready?",
  "Attention, the quiz is starting! Stay focused.",
  "Hello everyone! A new quiz is waiting for you.",
  "Ready for the challenge? The quiz starts now!"*/
]

/**
 * Outro phrases (end of the quiz)
 */
export const OUTRO_PHRASES = [
  "Think you did well? Like the video and comment your score!" /*
  "Like the video if you scored more than 3 and write your score in the comments!",
  /*
  "And that's the end of the quiz! I hope you had fun.",
  "And it's over! Don't forget to like and subscribe.",
  "The quiz ends here! See you soon for a new challenge.",
  "Well done for finishing! See you in the next video."
  */
]

export const MID_GAME_LEADERBOARD_INTRO = [
  "Here is the current leaderboard",
  "Let's take a look at the leaderboard",
  "Let's see where the players stand",
  "Here are the current scores",
  "Current rankings"
]

export const MID_GAME_LEADERBOARD_OUTRO = [
  "Alright, next question",
  "Let's keep going",
  "Let's resume the game",
  "Here we go again",
  "Let's move on"
]

export const TOP_STREAK_ENTRY_MESSAGES = {
  1: [
    "Congrats {username}! You're leading the streak leaderboard! Keep it up! ... Next?",
    "Amazing {username}! You've taken first place! Don't stop now! ... Next?",
    "Wow {username}! Number one streak! Keep that momentum going! ... Ready for the next one?"
  ],
  2: [
    "Nice {username}! Second place — you're on fire! ... Next?",
    "Great job {username}! You're climbing to second! Keep pushing! ... Next?",
    "Well done {username}! Second in the streak! Almost at the top! ... Next question?"
  ],
  3: [
    "Well played {username}! You've made it into the top 3! ... Next?",
    "Congrats {username}! You just entered the top 3 streak! ... Next?",
    "Nice work {username}! Top 3! Keep those correct answers coming! ... Next?"
  ]
}
/**
 * Sélectionner une phrase aléatoire depuis un tableau
 */
export function getRandomPhrase(phrases) {
  const index = Math.floor(Math.random() * phrases.length)
  return phrases[index]
}