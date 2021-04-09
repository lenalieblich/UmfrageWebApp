-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2020 at 07:59 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u32872`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `ANSWER_ID` int(11) NOT NULL,
  `QUESTION_ID` int(11) NOT NULL,
  `ANSWER_TEXT` varchar(255) NOT NULL,
  `ANSWER_TYPE_ID` int(11) NOT NULL,
  `REF_ANSWER` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`ANSWER_ID`, `QUESTION_ID`, `ANSWER_TEXT`, `ANSWER_TYPE_ID`, `REF_ANSWER`) VALUES
(1, 1, 'Nie', 1, NULL),
(2, 1, 'ein Mal', 1, NULL),
(3, 1, 'Wöchentlich', 1, NULL),
(4, 1, 'Täglich', 1, NULL),
(11, 2, 'Ich spiele gerne Multiplayer Games', 3, NULL),
(12, 2, 'Ich spiele gerne Singleplayer Games', 3, NULL),
(13, 2, 'Ich schaue gerne Filme', 3, NULL),
(14, 2, 'Ich schaue gerne Serien', 3, NULL),
(15, 2, 'Ich ziehe Interaktionen mit Menschen dem Fernsehen und Computerspielen vor', 3, NULL),
(16, 3, 'Ja', 1, NULL),
(17, 3, 'Nein', 1, NULL),
(18, 3, 'Pornografie', 3, 16),
(19, 3, 'Streamingdienste', 3, 16),
(20, 3, 'Sonstige', 2, 16),
(21, 4, 'Eher regelmäßig', 1, NULL),
(23, 4, 'Eher selten', 1, NULL),
(24, 4, 'Eher nie', 1, NULL),
(25, 6, 'Ja', 1, NULL),
(26, 6, 'Nein', 1, NULL),
(27, 6, 'Der Höchstwert meiner Verschuldung belief sich auf unter 100 Euro', 1, 25),
(28, 6, 'Der Höchstwert meiner Verschuldung belief sich auf unter 500 Euro', 1, 25),
(29, 6, 'Der Höchstwert meiner Verschuldung belief sich auf über 500 Euro', 1, 25),
(30, 7, 'Eher regelmäßig', 1, NULL),
(31, 7, 'Eher selten', 1, NULL),
(32, 7, 'Eher nie', 1, NULL),
(35, 9, 'Ja', 1, NULL),
(36, 9, 'Nein', 1, NULL),
(37, 9, 'Auf Grund von Falschparken', 3, 35),
(38, 9, 'Auf Grund von Überschreitung der Geschwindigkeitsbegrenzung ', 3, 35),
(39, 9, 'Auf Grund von nicht zulässigem Alkoholkonsum', 3, 35),
(40, 9, 'Sonstiges', 2, 35),
(41, 10, 'Gute Kursauswahl', 3, NULL),
(42, 10, 'Freundliche Professoren', 3, NULL),
(43, 10, 'Gute Mensa', 3, NULL),
(44, 10, 'Gutes Arbeitsklima', 3, NULL),
(45, 10, 'Vielfältiges Freizeitangebot', 3, NULL),
(46, 10, 'Ansehnlicher Campus', 3, NULL),
(50, 13, 'Sehr zufrieden', 1, NULL),
(51, 13, 'Eher zufrieden', 1, NULL),
(52, 13, 'Nicht zufrieden ', 1, NULL),
(53, 14, 'Sehr zufrieden', 1, NULL),
(54, 14, 'Eher zufrieden', 1, NULL),
(55, 14, 'Nicht zufrieden', 1, NULL),
(56, 15, 'Ja', 1, NULL),
(57, 15, 'Nein', 1, NULL),
(58, 15, 'Ich bin in einer Initiative tätig', 3, 56),
(59, 15, 'Ich engagiere mich im Stura ', 3, 56),
(60, 15, 'Sonstige', 2, 56),
(61, 17, 'Ja', 1, NULL),
(62, 17, 'Nein', 1, NULL),
(63, 17, 'Ich nehme an Hochschulparties teil ', 3, 61),
(64, 17, 'Ich nehme Fortbildungsmöglichkeiten der Hochschule wahr', 3, 61),
(65, 17, 'Sonstige', 2, 61),
(66, 19, '< 2.0', 1, NULL),
(67, 19, '< 3.0', 1, NULL),
(68, 19, '< 4.0', 1, NULL),
(69, 22, 'Ja', 1, NULL),
(70, 22, 'Nein', 1, NULL),
(71, 22, 'Im Rahmen von Hochschulpolitischen Themen', 3, 69),
(72, 22, 'Im Rahmen von Initiativenarbeit ', 3, 69),
(73, 22, 'Sonstige', 2, 69);

-- --------------------------------------------------------

--
-- Table structure for table `answer_type`
--

CREATE TABLE `answer_type` (
  `ANSWER_TYPE_ID` int(11) NOT NULL,
  `ANSWER_TYPE_NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answer_type`
--

INSERT INTO `answer_type` (`ANSWER_TYPE_ID`, `ANSWER_TYPE_NAME`) VALUES
(1, 'radio'),
(2, 'text'),
(3, 'checkbox');

-- --------------------------------------------------------

--
-- Table structure for table `evaulation`
--

CREATE TABLE `evaulation` (
  `EVALUATION_ID` int(11) NOT NULL,
  `USER_ID` varchar(40) NOT NULL,
  `ANSWER_ID` int(11) NOT NULL,
  `USER_INPUT` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `evaulation`
--

INSERT INTO `evaulation` (`EVALUATION_ID`, `USER_ID`, `ANSWER_ID`, `USER_INPUT`) VALUES
(237, 'ff810d85-65c4-4158-826c-4f5337499b7e', 13, NULL),
(238, 'ff810d85-65c4-4158-826c-4f5337499b7e', 14, NULL),
(239, 'ff810d85-65c4-4158-826c-4f5337499b7e', 12, NULL),
(240, 'ff810d85-65c4-4158-826c-4f5337499b7e', 11, NULL),
(241, 'ff810d85-65c4-4158-826c-4f5337499b7e', 1, NULL),
(242, 'ff810d85-65c4-4158-826c-4f5337499b7e', 16, NULL),
(243, 'ff810d85-65c4-4158-826c-4f5337499b7e', 24, NULL),
(244, 'ff810d85-65c4-4158-826c-4f5337499b7e', 35, NULL),
(245, 'ff810d85-65c4-4158-826c-4f5337499b7e', 44, NULL),
(246, 'ff810d85-65c4-4158-826c-4f5337499b7e', 52, NULL),
(247, 'ff810d85-65c4-4158-826c-4f5337499b7e', 54, NULL),
(248, 'ff810d85-65c4-4158-826c-4f5337499b7e', 56, NULL),
(249, 'ff810d85-65c4-4158-826c-4f5337499b7e', 62, NULL),
(250, 'ff810d85-65c4-4158-826c-4f5337499b7e', 66, NULL),
(251, 'ff810d85-65c4-4158-826c-4f5337499b7e', 70, NULL),
(252, 'ff810d85-65c4-4158-826c-4f5337499b7e', 25, NULL),
(253, 'ff810d85-65c4-4158-826c-4f5337499b7e', 32, NULL),
(254, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 1, NULL),
(255, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 12, NULL),
(256, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 17, NULL),
(257, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 23, NULL),
(258, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 26, NULL),
(259, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 31, NULL),
(260, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 35, NULL),
(261, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 38, NULL),
(262, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 43, NULL),
(263, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 52, NULL),
(264, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 54, NULL),
(265, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 57, NULL),
(266, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 61, NULL),
(267, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 64, NULL),
(268, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 67, NULL),
(269, '2d2a9a84-e55e-403c-87bc-e93f6c504441', 69, NULL),
(272, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 4, NULL),
(273, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 11, NULL),
(274, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 12, NULL),
(275, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 16, NULL),
(276, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 18, NULL),
(277, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 19, NULL),
(278, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 20, 'was geht denn da '),
(279, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 21, NULL),
(281, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 25, NULL),
(283, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 28, NULL),
(284, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 32, NULL),
(285, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 35, NULL),
(286, '036e8985-8cc3-47a6-bfac-02b90b5dae9f', 40, 'Kinder'),
(287, 'e399eb4c-34ed-465d-83f8-de53ea7e3bf8', 16, NULL),
(288, 'e399eb4c-34ed-465d-83f8-de53ea7e3bf8', 20, 'chinchillas'),
(289, 'e399eb4c-34ed-465d-83f8-de53ea7e3bf8', 25, NULL),
(290, 'e399eb4c-34ed-465d-83f8-de53ea7e3bf8', 28, NULL),
(291, 'e399eb4c-34ed-465d-83f8-de53ea7e3bf8', 35, NULL),
(292, 'e399eb4c-34ed-465d-83f8-de53ea7e3bf8', 40, 'so sehe ich das nicht'),
(293, 'e399eb4c-34ed-465d-83f8-de53ea7e3bf8', 56, NULL),
(294, 'e399eb4c-34ed-465d-83f8-de53ea7e3bf8', 60, 'zuhause'),
(295, 'c042434c-5ca9-47a2-8d8c-723d2003a613', 16, NULL),
(296, 'c042434c-5ca9-47a2-8d8c-723d2003a613', 20, 'deshalb'),
(297, 'c042434c-5ca9-47a2-8d8c-723d2003a613', 25, NULL),
(298, 'c042434c-5ca9-47a2-8d8c-723d2003a613', 35, NULL),
(299, 'c042434c-5ca9-47a2-8d8c-723d2003a613', 40, 'für Fahrrad fahren'),
(320, 'c042434c-5ca9-47a2-8d8c-723d2003a613', 13, NULL),
(321, 'c042434c-5ca9-47a2-8d8c-723d2003a613', 15, NULL),
(324, 'c042434c-5ca9-47a2-8d8c-723d2003a613', 3, NULL),
(325, '088d2591-2da3-45d8-8151-76372b997de0', 1, NULL),
(326, '088d2591-2da3-45d8-8151-76372b997de0', 14, NULL),
(327, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 1, NULL),
(328, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 12, NULL),
(329, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 17, NULL),
(330, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 24, NULL),
(331, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 26, NULL),
(332, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 32, NULL),
(333, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 35, NULL),
(334, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 45, NULL),
(335, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 52, NULL),
(336, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 54, NULL),
(337, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 57, NULL),
(338, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 61, NULL),
(339, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 67, NULL),
(340, '3a5d3ba8-1589-46d9-9286-f4132e55c4e8', 69, NULL),
(341, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 2, NULL),
(342, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 13, NULL),
(343, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 16, NULL),
(344, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 20, 'dddd'),
(345, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 24, NULL),
(346, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 25, NULL),
(347, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 32, NULL),
(348, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 36, NULL),
(349, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 42, NULL),
(350, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 52, NULL),
(351, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 54, NULL),
(352, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 57, NULL),
(353, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 62, NULL),
(354, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 68, NULL),
(355, '4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d', 70, NULL),
(356, '8dff4a00-e356-4e02-b35c-0b303509eec6', 2, NULL),
(357, '8dff4a00-e356-4e02-b35c-0b303509eec6', 11, NULL),
(358, '8dff4a00-e356-4e02-b35c-0b303509eec6', 12, NULL),
(359, '8dff4a00-e356-4e02-b35c-0b303509eec6', 13, NULL),
(360, '8dff4a00-e356-4e02-b35c-0b303509eec6', 14, NULL),
(361, '8dff4a00-e356-4e02-b35c-0b303509eec6', 16, NULL),
(363, '8dff4a00-e356-4e02-b35c-0b303509eec6', 24, NULL),
(365, '8dff4a00-e356-4e02-b35c-0b303509eec6', 25, NULL),
(366, '8dff4a00-e356-4e02-b35c-0b303509eec6', 27, NULL),
(368, '8dff4a00-e356-4e02-b35c-0b303509eec6', 31, NULL),
(369, '8dff4a00-e356-4e02-b35c-0b303509eec6', 35, NULL),
(370, '8dff4a00-e356-4e02-b35c-0b303509eec6', 39, NULL),
(371, '8dff4a00-e356-4e02-b35c-0b303509eec6', 38, NULL),
(372, '8dff4a00-e356-4e02-b35c-0b303509eec6', 37, NULL),
(373, '8dff4a00-e356-4e02-b35c-0b303509eec6', 52, NULL),
(374, '8dff4a00-e356-4e02-b35c-0b303509eec6', 55, NULL),
(375, '8dff4a00-e356-4e02-b35c-0b303509eec6', 57, NULL),
(376, '8dff4a00-e356-4e02-b35c-0b303509eec6', 62, NULL),
(377, '8dff4a00-e356-4e02-b35c-0b303509eec6', 66, NULL),
(378, '8dff4a00-e356-4e02-b35c-0b303509eec6', 70, NULL),
(379, '8dff4a00-e356-4e02-b35c-0b303509eec6', 46, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `QUESTION_ID` int(11) NOT NULL,
  `QUESTION_TEXT` varchar(250) NOT NULL,
  `question_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`QUESTION_ID`, `QUESTION_TEXT`, `question_type_id`) VALUES
(1, 'Wie oft besuchst du monatlich deine Eltern? ', 1),
(2, 'Wie würdest du dein Fernseh- und Video-Konsumverhalten beschreiben? ', 1),
(3, 'Enthält dein Suchverlauf kritische Inhalte, beispielsweise illegale Streamingdienste oder Pornografie? ', 1),
(4, 'Hinterlässt du regelmäßig Bewertungen auf z.B. Airbnb oder Amazon? ', 1),
(6, 'Hast du aktuell oder hattest du schon einmal Schulden bei Privatpersonen?', 1),
(7, 'Gehst du bei Rot über die Ampel? ', 1),
(9, 'Hast du schon einmal einen Strafzettel für ein Verkehrsdelikt erhalten?', 1),
(10, 'Welche Eigenschaften treffen auf deine Hochschule zu? ', 2),
(13, 'Wie zufrieden bist du mit den Professoren der Hochschule Harz?', 2),
(14, 'Wie zufrieden bist du mit der Mensa der Hochschule Harz?', 2),
(15, 'Verübst du Freiwilligenarbeit in der Hochschule? z.B. Initiativenarbeit', 2),
(17, 'Nimmst du regelmäßig an Hochschulveranstaltungen teil?', 2),
(19, 'Wie wurden deine Prüfungsleistungen durchschnittlich bewertet?', 2),
(22, 'Beteiligst du dich an hochschulrelevanten Diskussionen im Internet? z.B. in der Facebook Gruppe oder auf StudIP ', 2);

-- --------------------------------------------------------

--
-- Table structure for table `question_type`
--

CREATE TABLE `question_type` (
  `question_type_id` int(11) NOT NULL,
  `question_type_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question_type`
--

INSERT INTO `question_type` (`question_type_id`, `question_type_text`) VALUES
(1, 'Allgemein\r\n'),
(2, 'Hochschule');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `USER_ID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`USER_ID`) VALUES
('036e8985-8cc3-47a6-bfac-02b90b5dae9f'),
('088d2591-2da3-45d8-8151-76372b997de0'),
('248639c0-319a-4103-85b0-80cade6028f5'),
('2d2a9a84-e55e-403c-87bc-e93f6c504441'),
('3a5d3ba8-1589-46d9-9286-f4132e55c4e8'),
('4cfcc649-ab15-4b6a-b50b-43d9a3d9c92d'),
('8dff4a00-e356-4e02-b35c-0b303509eec6'),
('a950ae1e-985a-450c-a8eb-24ca5b8efe37'),
('c042434c-5ca9-47a2-8d8c-723d2003a613'),
('e399eb4c-34ed-465d-83f8-de53ea7e3bf8'),
('e9399ca2-ce6f-422f-b98d-8cee79296554'),
('ff810d85-65c4-4158-826c-4f5337499b7e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`ANSWER_ID`),
  ADD KEY `QUESTION_ID` (`QUESTION_ID`),
  ADD KEY `ANSWER_TYPE_ID` (`ANSWER_TYPE_ID`),
  ADD KEY `REF_ANSWER` (`REF_ANSWER`);

--
-- Indexes for table `answer_type`
--
ALTER TABLE `answer_type`
  ADD PRIMARY KEY (`ANSWER_TYPE_ID`);

--
-- Indexes for table `evaulation`
--
ALTER TABLE `evaulation`
  ADD PRIMARY KEY (`EVALUATION_ID`),
  ADD KEY `ANSWER_ID` (`ANSWER_ID`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`QUESTION_ID`),
  ADD KEY `question_type_id` (`question_type_id`);

--
-- Indexes for table `question_type`
--
ALTER TABLE `question_type`
  ADD PRIMARY KEY (`question_type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `ANSWER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `answer_type`
--
ALTER TABLE `answer_type`
  MODIFY `ANSWER_TYPE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `evaulation`
--
ALTER TABLE `evaulation`
  MODIFY `EVALUATION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=380;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `QUESTION_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `question_type`
--
ALTER TABLE `question_type`
  MODIFY `question_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`QUESTION_ID`) REFERENCES `questions` (`QUESTION_ID`),
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`ANSWER_TYPE_ID`) REFERENCES `answer_type` (`ANSWER_TYPE_ID`),
  ADD CONSTRAINT `answers_ibfk_3` FOREIGN KEY (`REF_ANSWER`) REFERENCES `answers` (`ANSWER_ID`);

--
-- Constraints for table `evaulation`
--
ALTER TABLE `evaulation`
  ADD CONSTRAINT `evaulation_ibfk_1` FOREIGN KEY (`ANSWER_ID`) REFERENCES `answers` (`ANSWER_ID`),
  ADD CONSTRAINT `evaulation_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `question_type_id` FOREIGN KEY (`question_type_id`) REFERENCES `question_type` (`question_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
