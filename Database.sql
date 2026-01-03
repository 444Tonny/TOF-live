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

-- Insérer des questions de test
INSERT INTO questions (question, answer) VALUES
('La Tour Eiffel mesure plus de 300 mètres de hauteur', true),
('Le soleil tourne autour de la Terre', false),
('La France a remporté la Coupe du Monde de football en 2018', true),
('Un triangle a 4 côtés', false),
('Vue.js est un framework JavaScript', true),
('Node.js utilise le langage Python', false),
('Le Canada est le plus grand pays du monde', false),
('L''eau bout à 100 degrés Celsius', true),
('Mars est la planète la plus proche du soleil', false),
('JavaScript et Java sont le même langage', false);


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
UPDATE questions SET answer_detail = 'La Tour Eiffel mesure exactement 330 mètres avec ses antennes.' WHERE id = 1;
UPDATE questions SET answer_detail = 'C''est la Terre qui tourne autour du Soleil, pas l''inverse.' WHERE id = 2;
UPDATE questions SET answer_detail = 'La France a remporté la Coupe du Monde en battant la Croatie 4-2.' WHERE id = 3;
UPDATE questions SET answer_detail = 'Un triangle a 3 côtés par définition.' WHERE id = 4;
UPDATE questions SET answer_detail = 'Vue.js est bien un framework JavaScript créé par Evan You.' WHERE id = 5;

-- Insérer de nouvelles questions avec answer_detail
INSERT INTO questions (question, answer, answer_detail) VALUES
('Le soleil tourne autour de la Terre', false, 'C''est la Terre qui tourne autour du Soleil.'),
('JavaScript et Java sont le même langage', false, 'JavaScript et Java sont deux langages complètement différents.'),
('Le Canada est le deuxième plus grand pays du monde', true, 'Le Canada est le deuxième plus grand pays après la Russie.'),
('L''eau bout à 100 degrés Celsius', true, 'L''eau bout à 100 degrés Celsius au niveau de la mer.'),
('Mars est la planète la plus proche du Soleil', false, 'Mercure est la planète la plus proche du Soleil, pas Mars.');


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