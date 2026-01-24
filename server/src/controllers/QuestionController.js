const db = require('../config/database');

/**
 * Controller pour gérer les questions
 */
class QuestionController {
  
  /**
   * Récupérer une question aléatoire
   * Optionnel : exclure les IDs déjà utilisés
   */
  static async getRandomQuestion(req, res) {
  try {
    // Récupérer les IDs des questions déjà utilisées (envoyés depuis le frontend)
    const usedIds = req.query.exclude ? req.query.exclude.split(',').map(Number) : [];
    
    let query = 'SELECT * FROM questions WHERE is_video_only = FALSE';
    let params = [];
    
    // Si des questions sont déjà utilisées, les exclure
    if (usedIds.length > 0) {
      // Créer des placeholders dynamiques pour chaque ID
      const placeholders = usedIds.map(() => '?').join(',');
      query += ` WHERE id NOT IN (${placeholders})`;
      params = usedIds; // Passer directement le tableau
    }
    
    query += ' ORDER BY RAND() LIMIT 1';
    
    console.log('Requête SQL:', query);
    console.log('IDs exclus:', usedIds);
    
    const [rows] = await db.execute(query, params);
    
    console.log('Questions trouvées:', rows.length);
    
    // Si aucune question disponible
    if (rows.length === 0) {
      return res.status(404).json({ 
        message: 'Aucune question disponible' 
      });
    }
    
    console.log('Question retournée:', rows[0].id);
    res.json(rows[0]);
    
  } catch (error) {
    console.error('Erreur:', error);
    res.status(500).json({ 
      message: 'Erreur serveur' 
    });
  }
}
  
  /**
   * Vérifier une réponse
   */
  static async checkAnswer(req, res) {
    try {
      const { questionId, userAnswer } = req.body;
      
      // Validation
      if (!questionId || userAnswer === undefined) {
        return res.status(400).json({ 
          message: 'Question ID et réponse requis' 
        });
      }
      
      // Récupérer la question
      const [rows] = await db.execute(
        'SELECT answer FROM questions WHERE id = ? AND is_video_only = FALSE',
        [questionId]
      );
      
      if (rows.length === 0) {
        return res.status(404).json({ 
          message: 'Question non trouvée' 
        });
      }
      
      const correctAnswer = rows[0].answer;
      const isCorrect = Boolean(userAnswer) === Boolean(correctAnswer);
      
      res.json({
        isCorrect,
        correctAnswer
      });
      
    } catch (error) {
      console.error('Erreur:', error);
      res.status(500).json({ 
        message: 'Erreur serveur' 
      });
    }
  }
  
  /**
   * Récupérer toutes les questions (pour admin)
   */
  static async getAllQuestions(req, res) {
    try {
      const [rows] = await db.execute('SELECT * FROM questions WHERE is_video_only = FALSE');
      res.json(rows);
    } catch (error) {
      console.error('Erreur:', error);
      res.status(500).json({ 
        message: 'Erreur serveur' 
      });
    }
  }
}

module.exports = QuestionController;