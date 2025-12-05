-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pát 05. pro 2025, 09:48
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `formule2`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `jezdec`
--

CREATE TABLE `jezdec` (
  `id_jezdce` int(11) NOT NULL,
  `jmeno` varchar(255) NOT NULL,
  `prijmeni` varchar(255) NOT NULL,
  `cislo` int(11) NOT NULL,
  `datum_narozeni` date DEFAULT NULL,
  `vaha` int(11) DEFAULT NULL,
  `vyska` int(11) DEFAULT NULL,
  `pohlavi` enum('Muž','Žena') DEFAULT NULL,
  `popis_kariery` text DEFAULT NULL,
  `id_statu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `jezdec`
--

INSERT INTO `jezdec` (`id_jezdce`, `jmeno`, `prijmeni`, `cislo`, `datum_narozeni`, `vaha`, `vyska`, `pohlavi`, `popis_kariery`, `id_statu`) VALUES
(1, 'Max', 'Verstappen', 1, '1997-09-30', 72, 181, 'Muž', '4x mistr světa, RedBull', 1),
(2, 'Fernando', 'Alonso', 14, '1981-07-29', 70, 171, 'Muž', 'Dvojnásobný mistr světa', 2),
(3, 'Oscar', 'Piastri', 81, '2001-04-06', 68, 178, 'Muž', 'Stoupající hvězda McLarenu', 3),
(4, 'Felipe', 'Massa', 6, '1981-04-25', 65, 166, 'Muž', 'Ex-pilot Ferrari', 4),
(5, 'Doriane', 'Pin', 28, '2004-08-05', 54, 168, 'Žena', 'Pilotka F1 Academy', 7),
(6, 'Lando', 'Norris', 4, '1999-11-13', 68, 180, 'Muž', 'Britská hvězda McLarenu', 7),
(7, 'Lewis', 'Hamilton', 44, '1985-01-07', 73, 174, 'Muž', '7x mistr světa', 7),
(8, 'Charles', 'Leclerc', 16, '1997-10-16', 69, 180, 'Muž', 'Talent z Monaka – Ferrari', 9),
(9, 'Carlos', 'Sainz', 55, '1994-09-01', 72, 178, 'Muž', 'Španělská jednička – Ferrari', 2),
(10, 'Yuki', 'Tsunoda', 22, '2000-05-11', 54, 159, 'Muž', 'AlphaTauri jezdec', 10),
(11, 'Logan', 'Sargeant', 2, '2000-12-31', 73, 181, 'Muž', 'Americký jezdec Williamsu', 8),
(12, 'Jáchym', 'Novák', 99, '2003-02-14', 74, 187, 'Muž', 'Fiktivní český nováček', 11);

-- --------------------------------------------------------

--
-- Struktura tabulky `monopost`
--

CREATE TABLE `monopost` (
  `id_monopostu` int(11) NOT NULL,
  `nazev` varchar(255) NOT NULL,
  `motor` enum('Ferrari PU','RedBull PT PU','Renault PU','Mercedes PU') DEFAULT NULL,
  `id_tymu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `monopost`
--

INSERT INTO `monopost` (`id_monopostu`, `nazev`, `motor`, `id_tymu`) VALUES
(1, 'AMR25', 'Mercedes PU', 2),
(2, 'RB21', 'RedBull PT PU', 1),
(3, 'MCL39', 'Mercedes PU', 3),
(4, 'F2012', 'Ferrari PU', 4),
(5, 'W15', 'Mercedes PU', 5),
(6, 'RB-AT04', 'RedBull PT PU', 6),
(7, 'FW47', 'Mercedes PU', 7),
(8, 'SF-75', 'Ferrari PU', 4);

-- --------------------------------------------------------

--
-- Struktura tabulky `monopost_sezona`
--

CREATE TABLE `monopost_sezona` (
  `id_ms` int(11) NOT NULL,
  `id_monopostu` int(11) DEFAULT NULL,
  `id_sezony` int(11) DEFAULT NULL,
  `nazev_pro_sezonu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `monopost_sezona`
--

INSERT INTO `monopost_sezona` (`id_ms`, `id_monopostu`, `id_sezony`, `nazev_pro_sezonu`) VALUES
(1, 1, 1, 'AMR25 (2025)'),
(2, 2, 1, 'RB21 (2025)'),
(3, 3, 1, 'MCL39 (2025)'),
(4, 4, 2, 'F2012 (2012)'),
(5, 5, 3, 'W15 (2020)');

-- --------------------------------------------------------

--
-- Struktura tabulky `sezona`
--

CREATE TABLE `sezona` (
  `id_sezony` int(11) NOT NULL,
  `id_sampiona` int(11) DEFAULT NULL,
  `id_vitez_tymu` int(11) DEFAULT NULL,
  `rok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `sezona`
--

INSERT INTO `sezona` (`id_sezony`, `id_sampiona`, `id_vitez_tymu`, `rok`) VALUES
(1, 1, 1, 2025),
(2, 2, 4, 2012),
(3, 7, 5, 2020),
(4, 1, 1, 2023);

-- --------------------------------------------------------

--
-- Struktura tabulky `stat`
--

CREATE TABLE `stat` (
  `id_statu` int(11) NOT NULL,
  `nazev` varchar(255) DEFAULT NULL,
  `kod` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `stat`
--

INSERT INTO `stat` (`id_statu`, `nazev`, `kod`) VALUES
(1, 'Nizozemsko', 'NLD'),
(2, 'Španělsko', 'ESP'),
(3, 'Austrálie', 'AUS'),
(4, 'Brazílie', 'BRA'),
(5, 'Rakousko', 'AUT'),
(6, 'Abu Dhabi', 'UAE'),
(7, 'Velká Británie', 'GBR'),
(8, 'USA', 'USA'),
(9, 'Monako', 'MCO'),
(10, 'Japonsko', 'JPN'),
(11, 'Česko', 'CZE');

-- --------------------------------------------------------

--
-- Struktura tabulky `tym`
--

CREATE TABLE `tym` (
  `id_tymu` int(11) NOT NULL,
  `jmeno` varchar(255) DEFAULT NULL,
  `teamPrincipal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `tym`
--

INSERT INTO `tym` (`id_tymu`, `jmeno`, `teamPrincipal`) VALUES
(1, 'RedBull Racing', 'Laurent Mekies'),
(2, 'Aston Martin F1 Team', 'Andy Cowell'),
(3, 'McLaren F1 Team', 'Andrea Stela'),
(4, 'Ferrari F1 Team', 'Frederic Vasseur'),
(5, 'Mercedes AMG F1', 'Toto Wolff'),
(6, 'RB (AlphaTauri)', 'Jody Egginton'),
(7, 'Williams Racing', 'James Vowles');

-- --------------------------------------------------------

--
-- Struktura tabulky `tym_sezona`
--

CREATE TABLE `tym_sezona` (
  `id_ts` int(11) NOT NULL,
  `id_tymu` int(11) DEFAULT NULL,
  `id_sezony` int(11) DEFAULT NULL,
  `rozpocet` int(11) DEFAULT NULL,
  `hlavni_sponzor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `tym_sezona`
--

INSERT INTO `tym_sezona` (`id_ts`, `id_tymu`, `id_sezony`, `rozpocet`, `hlavni_sponzor`) VALUES
(1, 1, 1, 132000000, 'Oracle'),
(2, 2, 1, 132000000, 'Cognizant'),
(3, 3, 1, 132000000, 'OKX, MasterCard, Google'),
(4, 4, 2, 240000000, 'Shell'),
(5, 5, 3, 200000000, 'Petronas');

-- --------------------------------------------------------

--
-- Struktura tabulky `vysledky`
--

CREATE TABLE `vysledky` (
  `id_vysledku` int(11) NOT NULL,
  `id_jezdce` int(11) DEFAULT NULL,
  `id_zavodu` int(11) DEFAULT NULL,
  `pozice` int(11) DEFAULT NULL,
  `body` int(11) DEFAULT NULL,
  `nejrychlejsi_kolo` decimal(6,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `vysledky`
--

INSERT INTO `vysledky` (`id_vysledku`, `id_jezdce`, `id_zavodu`, `pozice`, `body`, `nejrychlejsi_kolo`) VALUES
(1, 1, 2, 10, 1, 85.600);

-- --------------------------------------------------------

--
-- Struktura tabulky `zavod`
--

CREATE TABLE `zavod` (
  `id_zavodu` int(11) NOT NULL,
  `id_sezony` int(11) DEFAULT NULL,
  `vitez` int(11) DEFAULT NULL,
  `id_statu` int(11) DEFAULT NULL,
  `nazev` varchar(255) DEFAULT NULL,
  `delka_trate` int(11) DEFAULT NULL,
  `pocet_zatacek` int(11) DEFAULT NULL,
  `typ_trate` enum('technicka','balanced','rychla') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `zavod`
--

INSERT INTO `zavod` (`id_zavodu`, `id_sezony`, `vitez`, `id_statu`, `nazev`, `delka_trate`, `pocet_zatacek`, `typ_trate`) VALUES
(1, 1, 1, 4, 'Sao Paulo GP', 4300, 15, 'balanced'),
(2, 1, 3, 3, 'Melbourne GP', 5203, 14, 'technicka'),
(3, 1, 1, 6, 'Abu Dhabi GP', 5300, 21, 'balanced'),
(4, 1, 3, 5, 'Spielberg GP', 4318, 10, 'rychla'),
(5, 1, 6, 7, 'Silverstone GP', 5891, 18, 'rychla'),
(6, 1, 7, 7, 'British GP', 5891, 18, 'balanced'),
(7, 1, 8, 9, 'Monaco GP', 3337, 19, 'technicka'),
(8, 1, 10, 10, 'Suzuka GP', 5800, 18, 'balanced'),
(9, 1, 11, 8, 'Austin GP', 5516, 20, 'balanced'),
(10, 1, 12, 11, 'Prague Street GP', 4800, 14, 'technicka');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `jezdec`
--
ALTER TABLE `jezdec`
  ADD PRIMARY KEY (`id_jezdce`);

--
-- Indexy pro tabulku `monopost`
--
ALTER TABLE `monopost`
  ADD PRIMARY KEY (`id_monopostu`);

--
-- Indexy pro tabulku `monopost_sezona`
--
ALTER TABLE `monopost_sezona`
  ADD PRIMARY KEY (`id_ms`);

--
-- Indexy pro tabulku `sezona`
--
ALTER TABLE `sezona`
  ADD PRIMARY KEY (`id_sezony`);

--
-- Indexy pro tabulku `stat`
--
ALTER TABLE `stat`
  ADD PRIMARY KEY (`id_statu`);

--
-- Indexy pro tabulku `tym`
--
ALTER TABLE `tym`
  ADD PRIMARY KEY (`id_tymu`);

--
-- Indexy pro tabulku `tym_sezona`
--
ALTER TABLE `tym_sezona`
  ADD PRIMARY KEY (`id_ts`);

--
-- Indexy pro tabulku `vysledky`
--
ALTER TABLE `vysledky`
  ADD PRIMARY KEY (`id_vysledku`);

--
-- Indexy pro tabulku `zavod`
--
ALTER TABLE `zavod`
  ADD PRIMARY KEY (`id_zavodu`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `jezdec`
--
ALTER TABLE `jezdec`
  MODIFY `id_jezdce` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pro tabulku `monopost`
--
ALTER TABLE `monopost`
  MODIFY `id_monopostu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pro tabulku `monopost_sezona`
--
ALTER TABLE `monopost_sezona`
  MODIFY `id_ms` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `sezona`
--
ALTER TABLE `sezona`
  MODIFY `id_sezony` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `stat`
--
ALTER TABLE `stat`
  MODIFY `id_statu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pro tabulku `tym`
--
ALTER TABLE `tym`
  MODIFY `id_tymu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pro tabulku `tym_sezona`
--
ALTER TABLE `tym_sezona`
  MODIFY `id_ts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `vysledky`
--
ALTER TABLE `vysledky`
  MODIFY `id_vysledku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pro tabulku `zavod`
--
ALTER TABLE `zavod`
  MODIFY `id_zavodu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
