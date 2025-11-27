-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 27. lis 2025, 21:11
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
-- Databáze: `formule`
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
  `popis_kariery` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `jezdec`
--

INSERT INTO `jezdec` (`id_jezdce`, `jmeno`, `prijmeni`, `cislo`, `datum_narozeni`, `vaha`, `vyska`, `pohlavi`, `popis_kariery`) VALUES
(1, 'Max', 'Verstappen', 1, '1997-09-30', NULL, 181, 'Muž', 'Holandska superstar'),
(2, 'Fernando', 'Alonso', 14, NULL, NULL, NULL, 'Muž', 'El Nano'),
(3, 'Oscar', 'Piastri', 81, NULL, NULL, NULL, 'Muž', 'Australan '),
(4, 'Felipe', 'Massa', 6, NULL, NULL, NULL, 'Muž', 'Byvaly jezdec F1'),
(5, 'Doriane', 'Pin', 28, NULL, NULL, NULL, 'Žena', 'F1 Academy jezdkyně ');

-- --------------------------------------------------------

--
-- Struktura tabulky `jezdec_v_tymu`
--

CREATE TABLE `jezdec_v_tymu` (
  `id_assignment` int(11) NOT NULL,
  `id_jezdce` int(11) DEFAULT NULL,
  `id_tymu` int(11) DEFAULT NULL,
  `id_monopostu` int(11) DEFAULT NULL,
  `id_sezony` int(11) DEFAULT NULL,
  `od_zavodu` int(11) DEFAULT NULL,
  `do_zavodu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `jezdec_v_tymu`
--

INSERT INTO `jezdec_v_tymu` (`id_assignment`, `id_jezdce`, `id_tymu`, `id_monopostu`, `id_sezony`, `od_zavodu`, `do_zavodu`) VALUES
(1, 2, 2, 1, 1, 2, 3),
(2, 1, 1, 2, 1, 2, 3),
(3, 3, 3, 3, 1, 2, 3),
(4, 2, 4, 4, 2, 2, 1),
(5, 4, 4, 4, 2, 2, 1);

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
(4, 'F2012', 'Ferrari PU', 4);

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
(1, 1, 1, '2025'),
(2, 2, 1, '2025'),
(3, 3, 1, '2025'),
(4, 4, 2, '2012');

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
(2, 2, 1, 2012);

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
(4, 'Ferrari F1 Team', 'Frederic Vaseur');

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
(2, 2, 1, 132000000, 'Cognizant '),
(3, 3, 1, 132000000, 'OKX, MasterCard, Google'),
(4, 4, 2, 240000000, 'Shell');

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
(1, 1, 1, 1, 25, 85.600),
(2, 2, 2, 10, 1, 86.340),
(3, 3, 2, 6, 8, 86.000);

-- --------------------------------------------------------

--
-- Struktura tabulky `zavod`
--

CREATE TABLE `zavod` (
  `id_zavodu` int(11) NOT NULL,
  `id_sezony` int(11) DEFAULT NULL,
  `vitez` int(11) DEFAULT NULL,
  `stat` varchar(255) DEFAULT NULL,
  `nazev` varchar(255) DEFAULT NULL,
  `delka_trate` int(11) DEFAULT NULL,
  `pocet_zatacek` int(11) DEFAULT NULL,
  `typ_trate` enum('technicka','balanced','rychla') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `zavod`
--

INSERT INTO `zavod` (`id_zavodu`, `id_sezony`, `vitez`, `stat`, `nazev`, `delka_trate`, `pocet_zatacek`, `typ_trate`) VALUES
(1, 1, 1, 'Brazilie', 'Sao Paulo GP', NULL, NULL, 'balanced'),
(2, 1, 3, 'Australie', 'Melbourne GP', NULL, NULL, 'technicka'),
(3, 1, 1, 'Abu Dhabi', 'Yas Marina GP', NULL, NULL, 'balanced'),
(4, 1, 3, 'Rakousko', 'Spielberg / RedBullring GP', NULL, 10, 'rychla');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `jezdec`
--
ALTER TABLE `jezdec`
  ADD PRIMARY KEY (`id_jezdce`);

--
-- Indexy pro tabulku `jezdec_v_tymu`
--
ALTER TABLE `jezdec_v_tymu`
  ADD PRIMARY KEY (`id_assignment`),
  ADD KEY `id_jezdce` (`id_jezdce`),
  ADD KEY `id_tymu` (`id_tymu`),
  ADD KEY `id_monopostu` (`id_monopostu`),
  ADD KEY `id_sezony` (`id_sezony`),
  ADD KEY `od_zavodu` (`od_zavodu`),
  ADD KEY `do_zavodu` (`do_zavodu`);

--
-- Indexy pro tabulku `monopost`
--
ALTER TABLE `monopost`
  ADD PRIMARY KEY (`id_monopostu`),
  ADD KEY `id_tymu` (`id_tymu`);

--
-- Indexy pro tabulku `monopost_sezona`
--
ALTER TABLE `monopost_sezona`
  ADD PRIMARY KEY (`id_ms`),
  ADD KEY `id_monopostu` (`id_monopostu`),
  ADD KEY `id_sezony` (`id_sezony`);

--
-- Indexy pro tabulku `sezona`
--
ALTER TABLE `sezona`
  ADD PRIMARY KEY (`id_sezony`),
  ADD KEY `id_sampiona` (`id_sampiona`),
  ADD KEY `id_vitez_tymu` (`id_vitez_tymu`);

--
-- Indexy pro tabulku `tym`
--
ALTER TABLE `tym`
  ADD PRIMARY KEY (`id_tymu`);

--
-- Indexy pro tabulku `tym_sezona`
--
ALTER TABLE `tym_sezona`
  ADD PRIMARY KEY (`id_ts`),
  ADD KEY `id_tymu` (`id_tymu`),
  ADD KEY `id_sezony` (`id_sezony`);

--
-- Indexy pro tabulku `vysledky`
--
ALTER TABLE `vysledky`
  ADD PRIMARY KEY (`id_vysledku`),
  ADD KEY `id_jezdce` (`id_jezdce`),
  ADD KEY `id_zavodu` (`id_zavodu`);

--
-- Indexy pro tabulku `zavod`
--
ALTER TABLE `zavod`
  ADD PRIMARY KEY (`id_zavodu`),
  ADD KEY `id_sezony` (`id_sezony`),
  ADD KEY `vitez` (`vitez`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `jezdec`
--
ALTER TABLE `jezdec`
  MODIFY `id_jezdce` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `jezdec_v_tymu`
--
ALTER TABLE `jezdec_v_tymu`
  MODIFY `id_assignment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `monopost`
--
ALTER TABLE `monopost`
  MODIFY `id_monopostu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `monopost_sezona`
--
ALTER TABLE `monopost_sezona`
  MODIFY `id_ms` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `sezona`
--
ALTER TABLE `sezona`
  MODIFY `id_sezony` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `tym`
--
ALTER TABLE `tym`
  MODIFY `id_tymu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `tym_sezona`
--
ALTER TABLE `tym_sezona`
  MODIFY `id_ts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `vysledky`
--
ALTER TABLE `vysledky`
  MODIFY `id_vysledku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pro tabulku `zavod`
--
ALTER TABLE `zavod`
  MODIFY `id_zavodu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `jezdec_v_tymu`
--
ALTER TABLE `jezdec_v_tymu`
  ADD CONSTRAINT `jezdec_v_tymu_ibfk_1` FOREIGN KEY (`id_jezdce`) REFERENCES `jezdec` (`id_jezdce`),
  ADD CONSTRAINT `jezdec_v_tymu_ibfk_2` FOREIGN KEY (`id_tymu`) REFERENCES `tym` (`id_tymu`),
  ADD CONSTRAINT `jezdec_v_tymu_ibfk_3` FOREIGN KEY (`id_monopostu`) REFERENCES `monopost` (`id_monopostu`),
  ADD CONSTRAINT `jezdec_v_tymu_ibfk_4` FOREIGN KEY (`id_sezony`) REFERENCES `sezona` (`id_sezony`),
  ADD CONSTRAINT `jezdec_v_tymu_ibfk_5` FOREIGN KEY (`od_zavodu`) REFERENCES `zavod` (`id_zavodu`),
  ADD CONSTRAINT `jezdec_v_tymu_ibfk_6` FOREIGN KEY (`do_zavodu`) REFERENCES `zavod` (`id_zavodu`);

--
-- Omezení pro tabulku `monopost`
--
ALTER TABLE `monopost`
  ADD CONSTRAINT `monopost_ibfk_1` FOREIGN KEY (`id_tymu`) REFERENCES `tym` (`id_tymu`);

--
-- Omezení pro tabulku `monopost_sezona`
--
ALTER TABLE `monopost_sezona`
  ADD CONSTRAINT `monopost_sezona_ibfk_1` FOREIGN KEY (`id_monopostu`) REFERENCES `monopost` (`id_monopostu`),
  ADD CONSTRAINT `monopost_sezona_ibfk_2` FOREIGN KEY (`id_sezony`) REFERENCES `sezona` (`id_sezony`);

--
-- Omezení pro tabulku `sezona`
--
ALTER TABLE `sezona`
  ADD CONSTRAINT `sezona_ibfk_1` FOREIGN KEY (`id_sampiona`) REFERENCES `jezdec` (`id_jezdce`),
  ADD CONSTRAINT `sezona_ibfk_2` FOREIGN KEY (`id_vitez_tymu`) REFERENCES `tym` (`id_tymu`);

--
-- Omezení pro tabulku `tym_sezona`
--
ALTER TABLE `tym_sezona`
  ADD CONSTRAINT `tym_sezona_ibfk_1` FOREIGN KEY (`id_tymu`) REFERENCES `tym` (`id_tymu`),
  ADD CONSTRAINT `tym_sezona_ibfk_2` FOREIGN KEY (`id_sezony`) REFERENCES `sezona` (`id_sezony`);

--
-- Omezení pro tabulku `vysledky`
--
ALTER TABLE `vysledky`
  ADD CONSTRAINT `vysledky_ibfk_1` FOREIGN KEY (`id_jezdce`) REFERENCES `jezdec` (`id_jezdce`),
  ADD CONSTRAINT `vysledky_ibfk_2` FOREIGN KEY (`id_zavodu`) REFERENCES `zavod` (`id_zavodu`);

--
-- Omezení pro tabulku `zavod`
--
ALTER TABLE `zavod`
  ADD CONSTRAINT `zavod_ibfk_1` FOREIGN KEY (`id_sezony`) REFERENCES `sezona` (`id_sezony`),
  ADD CONSTRAINT `zavod_ibfk_2` FOREIGN KEY (`vitez`) REFERENCES `jezdec` (`id_jezdce`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
