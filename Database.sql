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

INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('The human body contains enough iron to make a small nail', true, 'The human body contains about around 4 grams of iron, which is enough to make a small nail.', 'nails.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('A volcano can erupt underwater', true, '', 'volcano.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('Honey can be stored forever without spoiling', true, 'Honey can last indefinitely if stored properly.', 'honey.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('The human body produces enough heat to boil water', false, '', 'body.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('The Great Wall of China is visible to the naked eye from space', false, '', 'great_wall.jpg');



INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('A dog has won “Man of the Match” in a football game.', true, 'A dog called Pickes won a fun, unofficial Man of the Match award.', 'dog.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('A player can be offside from a corner kick.', false, '', 'corner_kick.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('Cristiano Ronaldo has scored in five different FIFA World Cups.', true, 'He scored in the 2006, 2010, 2014, 2018 and 2022 World Cups.', 'ronaldo.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('Clubs must always play in their home stadium for home matches.', false, '', 'foot_stadium.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('Sevilla holds the record for the most Europa League titles.', true, '', 'sevilla.jpg');

INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('A referee once gave a red card to himself.', true, '', 'referee_red_card.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('A football club once played a match with 7 players.', true, 'A match can continue with 7 players, but is abandoned below that.', 'seven_players.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('A goalkeeper has been subbed off for being too tall.', false, '', 'goalkeeper.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('A soccer match ended 149–0 in an official competition.', true, 'AS Adema beat the team of SO l’Emyrne 149–0 in Madagascar in 2002.', 'football_match.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('A football club can change its logo during a season.', true, '', 'foot_logo.jpg');

INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('Naruto never killed any enemy directly.', false, '', 'naruto.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('A tailed beast can die permanently.', false, 'Tailed beasts reform after being destroyed.', 'tailed_beast.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('The Akatsuki originally aimed to bring peace to the ninja world.', true, '', 'akatsuki.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('Naruto became Hokage immediately after the war.', false, 'Naruto became Hokage years after the Fourth Great Ninja War.', 'hokage.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('Naruto learned the Rasengan faster than Minato.', true, '', 'rasengan.jpg');

INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('Europe has more countries than Africa.', false, '', 'africa_europe.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('Japan is made up of over 1,000 islands.', true, 'Japan consists of more than 6,800 islands.', 'japan_islands.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('The Dead Sea is the lowest point on Earth’s surface.', true, 'It lies over 400 meters below sea level.', 'dead_sea.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('The capital of Canada is Toronto.', false, 'The capital of Canada is Ottawa.', 'canada_capital.jpg');
INSERT INTO questions (question, answer, answer_detail, image_file) VALUES ('France shares a land border with Brazil.', true, '', 'france_brazil.jpg');

-- TikTOk Intregration

ALTER TABLE players 
ADD COLUMN profile_picture VARCHAR(500) NULL AFTER platform_user_id;

-- Ajouter la colonne category
ALTER TABLE questions 
ADD COLUMN category VARCHAR(50) DEFAULT 'general' AFTER answer_detail;

-- Mettre à jour les questions existantes sans catégorie
UPDATE questions 
SET category = 'general' 
WHERE category IS NULL OR category = '';

ALTER TABLE questions 
ADD COLUMN is_video_only BOOLEAN DEFAULT FALSE AFTER category;

-- S'assurer que toutes les questions existantes sont FALSE
UPDATE questions 
SET is_video_only = FALSE 
WHERE is_video_only IS NULL;

-- Ajouter le timestamp
ALTER TABLE game_sessions 
ADD COLUMN question_started_at TIMESTAMP NULL AFTER current_question_id;