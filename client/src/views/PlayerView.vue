<template>
  <div class="player-view">
     <!-- AJOUTER : Classement mid-game (overlay) -->
    <MidGameLeaderboard
     v-if="showMidGameLeaderboard"
      :scoreLeaderboard="scoreLeaderboard"
      :streakLeaderboard="streakLeaderboard"
    />

    <!-- Contenu existant (caché quand showMidGameLeaderboard = true) -->
    <div v-show="!showMidGameLeaderboard">

      <!--
      <header>
        <h1> Mode Joueur</h1>
        <div class="header-actions">
          <!-- AJOUTER : Bouton speech toggle (seulement si joueur connecté) 
          <SpeechToggle v-if="player" />
          <router-link to="/" class="back-btn">← Retour</router-link>
        </div>
      </header>
    -->

      <!-- Formulaire de connexion -->
      <div v-if="!player" class="join-form">
        <h2>Enter your username</h2>
        <input
          v-model="username"
          @keyup.enter="handleJoin"
          type="text"
          placeholder="Your username"
          class="username-input"
        />
        <button @click="handleJoin" :disabled="!username" class="join-btn">
          Join Game
        </button>
      </div>

      <!-- Interface de jeu -->
      <div v-else class="game-interface">

        <!-- Info joueur 
        <div class="player-info">
          <span class="player-name">{{ player.username }}</span>
          <!-- <span class="player-score">Score : {{ player.score }}</span> 
        </div>-->

        <!-- En attente de question -->
        <WaitingRoom v-if="!currentQuestion" />

        <!-- Question active -->
        <div v-else class="question-section">  
          <div class="questions-infos">
            <QuestionCounter :current="currentQuestionPosition" :total="totalQuestionsInSession" />
            <QuestionCategory :category="currentQuestion.category" />
          </div>  

          <QuestionCard
            :question="currentQuestion"
            :disabled="hasAnswered || isLoading"
            :isPlayerMode="true"
            :selectedAnswer="selectedAnswer"
            :revealAnswer="revealAnswer"
            @answer="submitAnswer"
          />
        </div>

        <!-- AJOUTER : Timer -->
        <GameTimer 
          v-if="currentQuestion"
          :timeQuestionLeft="timeQuestionLeft"
          :progress="progress"
          :isQuestionTimerPaused="isQuestionTimerPaused"
        />

        <!-- Image -->
        <ImageIllustration 
          v-if="currentQuestion" :question="currentQuestion"
        />

        <ScrollingBanner 
          :scoreLeaderboard="scoreLeaderboard"
          :streakLeaderboard="streakLeaderboard"
        />
        
        <!-- Classements -->
        <div class="leaderboards-container">
          <Transition name="slide-fade">
            <TopStreakLeaderboard 
              v-if="showTopStreakLeaderboard" 
              :players="streakLeaderboard" 
            />
          </Transition>
          
          <Transition name="slide-fade">
            <TopScoreLeaderboard 
              v-if="!showTopStreakLeaderboard" 
              :players="scoreLeaderboard" 
            />
          </Transition>
        </div>

        <button @click="toggleFullscreen" class="fullscreen-btn">
          {{ isFullscreen ? '🗗' : '⛶' }} Full Screen
        </button>

        <button @click="startMusic" class="music-btn">
          🔊 Music
        </button>

      </div>
    </div>
  </div>

  <audio ref="bgMusic" loop autoplay>
    <source src="/music/lofi1.mp3" type="audio/mpeg">
  </audio>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { usePlayerGame } from '../composables/usePlayerGame'
import WaitingRoom from '../components/player/WaitingRoom.vue'
//import SpeechToggle from '../components/SpeechToggle.vue' // AJOUTER
import QuestionCard from '../components/QuestionCard.vue' // AJOUTER
import QuestionCounter from '../components/QuestionCounter.vue'
import GameTimer from '../components/GameTimer.vue' // AJOUTER
import TopStreakLeaderboard from '../components/host/TopStreakLeaderboard.vue'
import TopScoreLeaderboard from '../components/host/TopScoreLeaderboard.vue'
import ImageIllustration from '@/components/ImageIllustration.vue'
import MidGameLeaderboard from '../components/player/MidGameLeaderboard.vue' // AJOUTER
import ScrollingBanner from '@/components/player/ScrollingBanner.vue'
import { GAME_CONFIG } from '../constants/gameConfig' // AJOUTER
import QuestionCategory from '../components/QuestionCategory.vue'
import TopStreakAnnouncement from '@/components/player/TopStreakAnnouncement.vue'

/**
 * Interface joueur
 */
const username = ref('')
const bgMusic = ref(null)
const showTopStreakLeaderboard = ref(true)
let topLeaderboardInterval = null
const isFullscreen = ref(false)
const musicStarted = ref(false)

const {
  player,
  currentQuestion,
  currentQuestionPosition,
  totalQuestionsInSession,
  hasAnswered,
  selectedAnswer,
  answerResult,
  revealAnswer,
  isLoading,
  isPiperSpeaking, 
  timeQuestionLeft,        // AJOUTER
  progress,        // AJOUTER
  isQuestionTimerPaused,
  scoreLeaderboard,
  streakLeaderboard,
  showMidGameLeaderboard,
  showTopStreakAnnouncement,
  announcedPlayer,
  announcedPosition,

  joinSession,
  submitAnswer
} = usePlayerGame()

/**
 * Rejoindre la session
 */
const handleJoin = async () => {
  if (!username.value.trim()) return
  
  try {
    await joinSession(username.value.trim())
  } catch (error) {
    alert('Erreur : Aucune session active')
  }
}

onMounted(() => {
  /* Switch entre les top leaderboards toutes les 30s
  topLeaderboardInterval = setInterval(() => {
    showTopStreakLeaderboard.value = !showTopStreakLeaderboard.value
  }, GAME_CONFIG.DELAY_SLIDE_LEADERBOARD)
  */
})

// MODIFIER onUnmounted pour cleanup
onUnmounted(() => {
  socket.disconnect()
  stopSpeakPiper()
  if (topLeaderboardInterval) clearInterval(topLeaderboardInterval) // AJOUTER
})

const toggleFullscreen = () => {
  if (!document.fullscreenElement) {
    document.documentElement.requestFullscreen()
    isFullscreen.value = true
  } else {
    document.exitFullscreen()
    isFullscreen.value = false
  }
}

const startMusic = () => {
  if (bgMusic.value) {
    bgMusic.value.volume = 0.4

    bgMusic.value.play()
      .then(() => {
        musicStarted.value = true
        console.log('🎵 Music started')
      })
      .catch(err => {
        console.error('Erreur audio:', err)
      })
  }
}

</script>

<style scoped>
.player-view {
  min-height: 100vh;
  width: 100%;
  border-radius: 3px;
  animation: fadeIn 0.5s ease-out;
  transform: 1;
}

@keyframes pulse {
  0%, 100% { 
    opacity: 1;
  }
  50% { 
    opacity: 0.85;
  }
}
/* */

.questions-infos
{
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  margin-left: 15px;
  margin-right: 15px;
  width: 100%;
  max-width: 490px;
}

h1 {
  color: white;
  font-size: 2rem;
}

.back-btn {
  padding: 10px 20px;
  background: white;
  color: #10b981;
  text-decoration: none;
  border-radius: 8px;
  font-weight: bold;
  transition: transform 0.2s;
}

.back-btn:hover {
  transform: translateY(-2px);
}

/* Formulaire de connexion */
.join-form {
  max-width: 500px;
  margin: 100px auto;
  background: white;
  padding: 40px;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  text-align: center;
}

.join-form h2 {
  margin-bottom: 25px;
  color: #333;
}

.username-input {
  width: 100%;
  padding: 15px;
  font-size: 1.1rem;
  border: 2px solid #e5e7eb;
  border-radius: 8px;
  margin-bottom: 20px;
}

.username-input:focus {
  outline: none;
  border-color: #10b981;
}

.join-btn {
  width: 100%;
  padding: 15px;
  font-size: 1.1rem;
  font-weight: bold;
  background: #10b981;
  color: white;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: background 0.3s;
}

.join-btn:hover:not(:disabled) {
  background: #059669;
}

.join-btn:disabled {
  background: #d1d5db;
  cursor: not-allowed;
}

/* Interface de jeu */
.game-interface {
  width: 100%;
  max-width: 500px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-content: center;
  align-items: center;
  padding-top: 100px;
  padding-bottom: 50px;
}

.player-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: white;
  padding: 20px;
  border-radius: 10px;
  margin-bottom: 20px;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.player-name {
  font-size: 1.2rem;
  font-weight: bold;
  color: #333;
}

.player-score {
  font-size: 1.2rem;
  font-weight: bold;
  color: #10b981;
}

.question-section {
  margin-top: 20px;
  width: 100%;
  display: flex;
  flex-direction: column;
  align-content: center;
  align-items: center;
  justify-content: center;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: scale(0.9);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

/*  Leaderbaord */
.leaderboards-container {
  width: 107%;
  padding: auto 3%;
  max-width: 500px;
  display: flex;
  margin-top: 5px;
  background: rgba(40, 29, 55, 0.9);
  border: 3px solid rgba(255, 255, 255, 0.192);
  border-radius: 10px;
}

@media (max-width: 768px) {
  .leaderboards-container {
    flex-direction: column;
  }
}

/* REMPLACER les classes slide-fade par: */
.slide-fade-enter-active,
.slide-fade-leave-active {
  transition: all 0.6s ease;
}

.slide-fade-enter-from {
  transform: translateX(100%);
  opacity: 0;
}

.slide-fade-leave-to {
  transform: translateX(-100%);
  opacity: 0;
  display: none;
}

.fullscreen-btn,
.music-btn {
  font-size: 18px;
  font-weight: 600;
  background: rgb(65, 37, 102);
  color: white;
  border: none;
  padding: 10px 15px;
  border-radius: 8px;
  cursor: pointer;
  z-index: 999;
}

.fullscreen-btn
{ 
  margin-top: 300px;
}

.music-btn{
  margin-top: 20px;
  margin-bottom: 50px;
}

</style>