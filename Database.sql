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