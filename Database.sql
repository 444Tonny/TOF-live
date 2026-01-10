-- Créer la base de données
CREATE DATABASE livegamedb_trueorfalse;
USE livegamedb_trueorfalse;

-- Table des questions
CREATE TABLE questions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    question TEXT NOT NULL,
    answer BOOLEAN NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- STEP 2: multijoueurs
-- Table des sessions de jeu (une session active à la fois)
CREATE TABLE game_sessions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    status ENUM('waiting', 'active', 'finished') DEFAULT 'waiting',
    current_question_id INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (current_question_id) REFERENCES questions(id)
);

-- Table des joueurs (identifiés par leur username de plateforme)
CREATE TABLE players (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    session_id INT NOT NULL,
    platform_user_id VARCHAR(100) NOT NULL,
    score INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id) REFERENCES game_sessions(id) ON DELETE CASCADE,
    UNIQUE KEY unique_player_session (session_id, platform_user_id)
);

-- Table des réponses (pour éviter qu'un joueur réponde 2 fois)
CREATE TABLE player_answers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    player_id INT NOT NULL,
    question_id INT NOT NULL,
    user_answer BOOLEAN NOT NULL,
    is_correct BOOLEAN NOT NULL,
    answered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (player_id) REFERENCES players(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    UNIQUE KEY unique_player_question (player_id, question_id)
);

-- Index pour performances
CREATE INDEX idx_session_status ON game_sessions(status);
CREATE INDEX idx_player_session ON players(session_id);
CREATE INDEX idx_player_score ON players(session_id, score DESC);

--- 01-01-2026 Add speech control functions

-- Ajouter la colonne answer_detail
ALTER TABLE questions 
ADD COLUMN answer_detail TEXT NULL;

-- Mettre à jour les questions existantes


-- Alter on cascade 
ALTER TABLE player_answers
DROP FOREIGN KEY player_answers_ibfk_2;

ALTER TABLE player_answers
ADD CONSTRAINT fk_player_answers_question
FOREIGN KEY (question_id)
REFERENCES questions(id)
ON DELETE CASCADE;

-- Ajouter la colonne streak
ALTER TABLE players 
ADD COLUMN current_streak INT DEFAULT 0,
ADD COLUMN best_streak INT DEFAULT 0;

--- IMAGE
ALTER TABLE questions 
ADD COLUMN image_file VARCHAR(255) NULL;

-- Exemple d'ajout d'images
UPDATE questions SET image_file = 'eiffel_tower.jpg' WHERE id = 1;
UPDATE questions SET image_file = 'solar_system.jpg' WHERE id = 2;

INSERT INTO questions (question, answer, answer_detail, image_file) VALUES
(
  'The Eiffel Tower is over 300 meters tall',
  true,
  'The Eiffel Tower is exactly 330 meters tall including its antennas.',
  'eiffel_tower.jpg'
),
(
  'The Sun revolves around the Earth',
  false,
  'The Earth revolves around the Sun, not the other way around.',
  'eiffel_tower.jpg'
),
(
  'France won the 2018 Football World Cup',
  true,
  'France won the 2018 World Cup by defeating Croatia 4-2.',
  'eiffel_tower.jpg'
),
(
  'A triangle has 4 sides',
  false,
  'A triangle has 3 sides by definition.',
  'eiffel_tower.jpg'
),
(
  'Vue.js is a JavaScript framework',
  true,
  'Vue.js is indeed a JavaScript framework created by Evan You.',
  'eiffel_tower.jpg'
),
(
  'Node.js uses the Python language',
  false,
  'Node.js is based on JavaScript, not Python.',
  'eiffel_tower.jpg'
),
(
  'Canada is the largest country in the world',
  false,
  'Russia is the largest country in the world by land area.',
  'eiffel_tower.jpg'
),
(
  'Water boils at 100 degrees Celsius',
  true,
  'Water boils at 100 degrees Celsius at sea level.',
  'eiffel_tower.jpg'
),
(
  'Mars is the planet closest to the Sun',
  false,
  'Mercury is the closest planet to the Sun, not Mars.',
  'eiffel_tower.jpg'
),
(
  'JavaScript and Java are the same language',
  false,
  'JavaScript and Java are completely different programming languages.',
  'eiffel_tower.jpg'
),
(
  'Canada is the second largest country in the world',
  true,
  'Canada is the second largest country in the world after Russia.',
  'eiffel_tower.jpg'
);