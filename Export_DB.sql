-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 25, 2026 at 11:41 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `livegamedb_trueorfalse`
--

-- --------------------------------------------------------

--
-- Table structure for table `game_sessions`
--

CREATE TABLE `game_sessions` (
  `id` int NOT NULL,
  `status` enum('waiting','active','finished') DEFAULT 'waiting',
  `current_question_id` int DEFAULT NULL,
  `question_started_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `game_sessions`
--

INSERT INTO `game_sessions` (`id`, `status`, `current_question_id`, `question_started_at`, `created_at`) VALUES
(1, 'active', null, null, null);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `session_id` int NOT NULL,
  `platform_user_id` varchar(100) NOT NULL,
  `profile_picture` varchar(500) DEFAULT NULL,
  `score` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `current_streak` int DEFAULT '0',
  `best_streak` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `players`
--

-- --------------------------------------------------------

--
-- Table structure for table `player_answers`
--

CREATE TABLE `player_answers` (
  `id` int NOT NULL,
  `player_id` int NOT NULL,
  `question_id` int NOT NULL,
  `user_answer` tinyint(1) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `answered_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `question` text NOT NULL,
  `answer` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `answer_detail` text,
  `category` varchar(50) DEFAULT 'general',
  `is_video_only` tinyint(1) DEFAULT '0',
  `image_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `questions`
--

-- Categories
-- General
-- Soccer
-- Technology
-- Geography
-- Fun Fact
-- Manga
--

INSERT INTO `questions` (`id`, `question`, `answer`, `created_at`, `answer_detail`, `category`, `is_video_only`, `image_file`) VALUES
(16, 'The Eiffel Tower is over 300 meters tall', 1, '2026-01-09 23:22:52', 'The Eiffel Tower is exactly 330 meters tall including its antennas.', 'general', 1, 'eiffel_tower.jpg'),
(17, 'The Sun revolves around the Earth', 0, '2026-01-09 23:22:52', 'The Earth revolves around the Sun, not the other way around.', 'general', 1, NULL),
(18, 'France won the 2018 Football World Cup', 1, '2026-01-09 23:22:52', 'France won the 2018 World Cup by defeating Croatia 4-2.', 'soccer', 1, NULL),
(19, 'A triangle has 4 sides', 0, '2026-01-09 23:22:52', 'A triangle has 3 sides by definition.', 'general', 1, NULL),
(20, 'Vue.js is a JavaScript framework', 1, '2026-01-09 23:22:52', 'Vue.js is indeed a JavaScript framework created by Evan You.', 'technology', 1, NULL),
(21, 'Node.js uses the Python language', 0, '2026-01-09 23:22:52', 'Node.js is based on JavaScript, not Python.', 'technology', 1, NULL),
(22, 'Canada is the largest country in the world', 0, '2026-01-09 23:22:52', 'Russia is the largest country in the world by land area.', 'geography', 1, NULL),
(23, 'Water boils at 100 degrees Celsius', 1, '2026-01-09 23:22:52', 'Water boils at 100 degrees Celsius at sea level.', 'general', 1, NULL),
(24, 'Mars is the planet closest to the Sun', 0, '2026-01-09 23:22:52', 'Mercury is the closest planet to the Sun, not Mars.', 'general', 0, NULL),
(25, 'JavaScript and Java are the same language', 0, '2026-01-09 23:22:52', 'JavaScript and Java are completely different programming languages.', 'technology', 1, NULL),
(26, 'Canada is the second largest country in the world', 1, '2026-01-09 23:22:52', 'Canada is the second largest country in the world after Russia.', 'geography', 1, NULL),
(27, 'The human body contains enough iron to make a small nail', 1, '2026-01-11 02:37:55', 'It has about four grams of iron, enough for a small nail', 'fun fact', 1, 'nail.jpg'),
(28, 'A volcano can erupt underwater', 1, '2026-01-11 02:37:55', '', 'fun fact', 1, 'volcano.jpg'),
(29, 'Honey can be stored forever without spoiling', 1, '2026-01-11 02:37:55', 'It can last indefinitely if stored properly.', 'general', 0, 'honey.jpg'),
(30, 'The human body produces enough heat to boil water', 0, '2026-01-11 02:37:55', '', 'general', 1, 'body.jpg'),
(31, 'The Great Wall of China is visible to the naked eye from space', 0, '2026-01-11 02:37:55', '', 'fun fact', 1, 'great_wall.jpg'),
(32, 'A dog has won “Man of the Match” in a football game.', 1, '2026-01-12 04:02:27', 'A dog called Pickes won a fun, unofficial Man of the Match award.', 'soccer', 1, 'dog.jpg'),
(33, 'A soccer player can be offside from a corner kick.', 0, '2026-01-12 04:02:27', '', 'soccer', 1, 'corner_kick.jpg'),
(34, 'Cristiano Ronaldo has scored in five different FIFA World Cups.', 1, '2026-01-12 04:02:27', NULL, 'soccer', 1, 'ronaldo.jpg'),
(35, 'Soccer clubs must always play in their home stadium for home matches.', 0, '2026-01-12 04:02:27', '', 'soccer', 1, 'foot_stadium.jpg'),
(36, 'Sevilla holds the record for the most Europa League titles.', 1, '2026-01-12 04:02:27', '', 'soccer', 1, 'sevilla.jpg'),
(37, 'A soccer referee once gave a red card to himself.', 1, '2026-01-12 04:02:27', '', 'fun fact', 1, 'referee_red_card.jpg'),
(38, 'A soccer club once played a match with 7 players.', 1, '2026-01-12 04:02:27', 'A match can continue with 7 players, but is abandoned below that.', 'soccer', 1, 'seven_players.jpg'),
(39, 'A goalkeeper has been subbed off for being too tall.', 0, '2026-01-12 04:02:27', '', 'soccer', 1, 'goalkeeper.jpg'),
(40, 'A soccer match ended 149–0 in an official competition.', 1, '2026-01-12 04:02:27', 'AS Adema beat the team of SO l’Emyrne 149–0 in Madagascar in 2002.', 'soccer', 1, 'football_match.jpg'),
(41, 'A soccer club can change its logo during a season.', 1, '2026-01-12 04:02:27', '', 'general', 1, 'foot_logo.jpg'),
(42, 'Naruto never killed any enemy directly.', 0, '2026-01-12 04:02:27', '', 'manga', 1, 'naruto.jpg'),
(43, 'A tailed beast can die permanently in the Naruto manga.', 0, '2026-01-12 04:02:27', 'Tailed beasts reform after being destroyed.', 'manga', 1, 'tailed_beast.jpg'),
(44, 'The Akatsuki originally aimed to bring peace to the ninja world.', 1, '2026-01-12 04:02:27', '', 'manga', 1, 'akatsuki.jpg'),
(45, 'Naruto became Hokage immediately after the war.', 0, '2026-01-12 04:02:27', 'Naruto became Hokage years after the Fourth Great Ninja War.', 'manga', 1, 'hokage.jpg'),
(46, 'Naruto learned the Rasengan faster than Minato.', 1, '2026-01-12 04:02:27', '', 'manga', 1, 'rasengan.jpg'),
(47, 'Europe has more countries than Africa.', 0, '2026-01-12 04:02:27', '', 'geography', 1, 'africa_europe.jpg'),
(48, 'Japan is made up of over 1,000 islands.', 1, '2026-01-12 04:02:27', 'Japan consists of more than 6,800 islands.', 'geography', 1, 'japan_islands.jpg'),
(49, 'The Dead Sea is the lowest point on Earth’s surface.', 1, '2026-01-12 04:02:27', 'It lies over 400 meters below sea level.', 'geography', 1, 'dead_sea.jpg'),
(50, 'The capital of Canada is Toronto.', 0, '2026-01-12 04:02:27', 'The capital of Canada is Ottawa.', 'geography', 1, 'canada_capital.jpg'),
(51, 'France shares a land border with Brazil.', 1, '2026-01-12 04:02:27', '', 'geography', 1, 'france_brazil.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game_sessions`
--
ALTER TABLE `game_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `current_question_id` (`current_question_id`),
  ADD KEY `idx_session_status` (`status`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_player_session` (`session_id`,`platform_user_id`),
  ADD KEY `idx_player_session` (`session_id`),
  ADD KEY `idx_player_score` (`session_id`,`score` DESC);

--
-- Indexes for table `player_answers`
--
ALTER TABLE `player_answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_player_question` (`player_id`,`question_id`),
  ADD KEY `fk_player_answers_question` (`question_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game_sessions`
--
ALTER TABLE `game_sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `player_answers`
--
ALTER TABLE `player_answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `game_sessions`
--
ALTER TABLE `game_sessions`
  ADD CONSTRAINT `game_sessions_ibfk_1` FOREIGN KEY (`current_question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `game_sessions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_answers`
--
ALTER TABLE `player_answers`
  ADD CONSTRAINT `fk_player_answers_question` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_answers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
