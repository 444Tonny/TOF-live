/*
const GAME_CONFIG = { 
  ANSWER_TIMER_VIDEO: 15,
  NUMBER_OF_QUESTION_IN_SESSION: 25
};

class AutoGameService {
  constructor() {
    this.isRunning = false;
    this.currentQuestionIndex = 1;
    this.recentQuestionIds = [];
    this.timer = null;
    this.sessionId = null;
    this.io = null;
  }

  start(io, sessionId, availableQuestions) {
    if (this.isRunning) return;
    
    this.io = io;
    this.sessionId = sessionId;
    this.availableQuestions = availableQuestions;
    this.isRunning = true;
    this.currentQuestionIndex = 1;
    
    console.log('🎮 Auto-mode démarré');
    this.broadcastNextQuestion();
  }

  stop() {
    this.isRunning = false;
    if (this.timer) clearTimeout(this.timer);
    this.currentQuestionIndex = 1;
    console.log('⏹️ Auto-mode arrêté');
  }

  broadcastNextQuestion() {
    if (!this.isRunning) return;

    const question = this.getRandomQuestion();
    
    // Broadcast question
    const payload = {
      ...question,
      currentPosition: this.currentQuestionIndex,
      totalQuestions: GAME_CONFIG.NUMBER_OF_QUESTION_IN_SESSION
    };

    this.io.to(`session:${this.sessionId}`).emit('question:new', payload);

    // Attendre ANSWER_TIMER + transitions (20s total)
    this.timer = setTimeout(() => {
      if (this.currentQuestionIndex >= GAME_CONFIG.NUMBER_OF_QUESTION_IN_SESSION) {
        this.handleEndGame();
      } else if (this.currentQuestionIndex % 25 === 0) {
        this.handleMidGamePause();
      } else {
        this.currentQuestionIndex++;
        this.broadcastNextQuestion();
      }
    }, 20000); // 20 secondes
  }

  handleMidGamePause() {
    this.io.to(`session:${this.sessionId}`).emit('midgame-pause:start', {
      currentPosition: this.currentQuestionIndex,
      totalQuestions: GAME_CONFIG.NUMBER_OF_QUESTION_IN_SESSION
    });

    setTimeout(() => {
      this.currentQuestionIndex++;
      this.broadcastNextQuestion();
    }, 25000); // 25s pause
  }

  handleEndGame() {
    this.io.to(`session:${this.sessionId}`).emit('endgame-pause:start', {
      currentPosition: this.currentQuestionIndex,
      totalQuestions: GAME_CONFIG.NUMBER_OF_QUESTION_IN_SESSION
    });

    setTimeout(() => {
      this.currentQuestionIndex = 1;
      this.broadcastNextQuestion();
    }, 25000);
  }

  getRandomQuestion() {
    const eligibleQuestions = this.availableQuestions.filter(
      q => !this.recentQuestionIds.includes(q.id)
    );

    if (eligibleQuestions.length === 0) {
      this.recentQuestionIds = [];
      return this.availableQuestions[Math.floor(Math.random() * this.availableQuestions.length)];
    }

    const randomIndex = Math.floor(Math.random() * eligibleQuestions.length);
    const selectedQuestion = eligibleQuestions[randomIndex];

    this.recentQuestionIds.push(selectedQuestion.id);
    if (this.recentQuestionIds.length > 3) {
      this.recentQuestionIds.shift();
    }

    return selectedQuestion;
  }
}

module.exports = new AutoGameService();
*/