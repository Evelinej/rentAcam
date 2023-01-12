-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 12. Jan 2023 um 16:23
-- Server-Version: 10.3.31-MariaDB-0+deb10u1
-- PHP-Version: 7.0.33-57+0~20211119.61+debian10~1.gbp5d8ba5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `796765_3_1`
--
CREATE DATABASE IF NOT EXISTS `796765_3_1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `796765_3_1`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `city` varchar(42) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`id`, `city`) VALUES
(1, 'Zürich'),
(2, 'Luzern');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `material`
--

CREATE TABLE `material` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `location_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `material`
--

INSERT INTO `material` (`id`, `title`, `picture`, `location_id`, `description`, `status`, `timestamp`, `user_id`) VALUES
(1, 'Canon EOS 6D Mark II ', 'https://i1.adis.ws/s/canon/0001_1_set/01?$low_quality$', 1, 'Das ist eine Kamera. Ich vermiete die Kamera in Zürich.', 0, '2023-01-10 23:00:00', 3),
(4, 'Sony', 'https://www.digifuchs.ch/images/products/alpha_1_kit_mit_70-200mm_f2.8_gm_oss_ii.jpg', 2, ' Das ist eine Sony Cam.', 0, '2023-01-11 13:14:26', 2),
(5, 'Nikon Z6', 'https://www.digitec.ch/im/Files/3/8/9/0/9/2/4/5/Z6II_24-70_4_front.jpg?impolicy=ProductTileImage&res', 1, 'Auch bekannt als die Kamera vom griechischen Gott Zeus. Wer in den Blitz dieser Kamera,schaut dessen Leben wird sich schlagartig verändern. Deshalb nur von Griechen bedienbar', 0, '2023-01-12 08:11:11', 4),
(7, 'Leica beste Cam', 'https://store.leica-camera.com/ch/media/image/be/b5/66/10854_SL2_Body_FRONT.jpg', 2, 'Beste Cam für beste Preis', 1, '0000-00-00 00:00:00', 3),
(8, 'Solide Hasselblad', 'https://4.img-dpreview.com/files/p/articles/0076555045/01_P1003704_copy_3.jpeg', 1, 'Hasselblad in krassem Zustand. Nur für gute Fotografen wirklich', 1, '0000-00-00 00:00:00', 3),
(9, 'Heftige Cam', 'https://i1.adis.ws/i/canon/eos-r3-lifestyle-vladimir-rys_hero_2a6badbad75a4f66889cddf4479e97c6?$70-3', 2, ' Wasserfeste Kamera. Bis zu 150 m Dicht und geeignet für Tauchen mit Delfinen da Geräusch leise.', 1, '2023-01-12 08:29:26', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `session`
--

CREATE TABLE `session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(42) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `session`
--

INSERT INTO `session` (`id`, `user_id`, `token`, `timestamp`) VALUES
(59, 2, 'pfXeOgtYkzvPYsFF4UKiHePaJs8i6INWxefGoUJrke', '2023-01-12 13:40:54'),
(60, 3, 'sSvoC1kGwonohseOiyMPklVaBxOGfdefELo0lJ54N8', '2023-01-12 13:46:06'),
(61, 6, 'uLJHYv4GuJXvRzXjOqt4ikJ665WEDOznLsedDg2zHq', '2023-01-12 14:27:47'),
(62, 7, 'Iv3afno37ATScs4UPME69nTchZZvrWquL2cZp7SHbW', '2023-01-12 14:31:33'),
(63, 7, 'K2eZzq2gdBkmG8TpYV4nJLVsjpxyr9YzZnzYdmlSN7', '2023-01-12 14:33:31'),
(64, 8, 'X7batwANi8oZACaMR8Hhwhph2HqTOunZxrpL6oqcbA', '2023-01-12 14:35:06'),
(65, 9, 'FZwc0oZ2KxL55GffKkpWrSBzbdgpUhhqa9VuGwkx76', '2023-01-12 15:07:10');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`) VALUES
(1, 'Test', 'test@test.ch', '$2y$10$uO/93T96T2C8a.ev1ORchu3qBTLhgtaZYbwMcr8rkS5Gvl.oF7j/6'),
(2, 'Test2', 'test', '$2y$10$f2kyM1YGCxe0ppuGQ7/T.eju9ccZGOMXGFAK6u5ue7PlLO635pdeq'),
(3, 'Marco', 'marco', '$2y$10$KfQGEHGtXUhAaBOp98HDGuIsRsuLrFBfpk.stfdCC1q5AoD2iwDh.'),
(4, 'Gucci Boyyyy', 'gucci@gmx.ch', '$2y$10$P68.J6fOI2xe2dLn/VcVoO4622h10D1JBN7lenUDOXy3hp.Y3iRBe'),
(5, 'yoloboy', 'yoloboy', '$2y$10$Y76i3BIwb3Ip6xl8I.kbIeBhTJkkxbP8AL/hp8.y4ohmKXh.ICctW'),
(6, '1', '1', '$2y$10$aejzg2oKbn3QqOE9qN4IBO0VcwseaHmbBdiniSC.IClG7/u1kH1l6'),
(7, '2', '2', '$2y$10$GZgQsyfEP0dqngjvnGP0CeuSXrTZHJOcAPKc6d3zhGihch5SnKyua'),
(8, '3', '3', '$2y$10$b/P7ULAbqHJjqiBzy7zQHeusYWVsvRncGobFRaLeWnQhSX0X05s/a'),
(9, '4', '4', '$2y$10$zDLCa1K58aLM.9AUAjXgwOjLSOyewnga1ZFjQb4jxCOcSqpRt5wcq');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`user_id`),
  ADD KEY `fk_location` (`location_id`);

--
-- Indizes für die Tabelle `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT für Tabelle `material`
--
ALTER TABLE `material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `session`
--
ALTER TABLE `session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `material`
--
ALTER TABLE `material`
  ADD CONSTRAINT `fk_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
