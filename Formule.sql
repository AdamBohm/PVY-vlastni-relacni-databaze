CREATE TABLE `jezdec` (
  `id_jezdce` integer PRIMARY KEY,
  `jmeno` varchar(255),
  `prijmeni` varchar(255),
  `cislo` integer,
  `datum_narozeni` date,
  `vaha` integer,
  `vyska` integer,
  `pohlavi` enum('Muž','Žena'),
  `popis_kariery` text
);

CREATE TABLE `tym` (
  `id_tymu` integer PRIMARY KEY,
  `jmeno` varchar(255),
  `teamPrincipal` varchar(255)
);

CREATE TABLE `tym_sezona` (
  `id_ts` integer PRIMARY KEY,
  `id_tymu` integer,
  `id_sezony` integer,
  `rozpocet` integer,
  `hlavni_sponzor` varchar(255)
);

CREATE TABLE `monopost` (
  `id_monopostu` integer PRIMARY KEY,
  `nazev` varchar(255) NOT NULL,
  `motor` enum('Ferrari PU','RedBull PT PU','Renault PU','Mercedes PU'),
  `id_tymu` integer
);

CREATE TABLE `monopost_sezona` (
  `id_ms` integer PRIMARY KEY,
  `id_monopostu` integer,
  `id_sezony` integer,
  `nazev_pro_sezonu` varchar(255)
);

CREATE TABLE `sezona` (
  `id_sezony` integer PRIMARY KEY,
  `id_sampiona` integer,
  `id_vitez_tymu` integer,
  `rok` integer NOT NULL
);

CREATE TABLE `zavod` (
  `id_zavodu` integer PRIMARY KEY,
  `id_sezony` integer,
  `vitez` integer,
  `stat` varchar(255),
  `nazev` varchar(255),
  `delka_trate` integer,
  `pocet_zatacek` integer,
  `typ_trate` enum('technicka','balanced','rychla')
);

CREATE TABLE `jezdec_v_tymu` (
  `id_assignment` integer PRIMARY KEY,
  `id_jezdce` integer,
  `id_tymu` integer,
  `id_monopostu` integer,
  `id_sezony` integer,
  `od_zavodu` integer,
  `do_zavodu` integer
);

CREATE TABLE `vysledky` (
  `id_vysledku` integer PRIMARY KEY,
  `id_jezdce` integer,
  `id_zavodu` integer,
  `pozice` integer,
  `body` integer,
  `nejrychlejsi_kolo` decimal(6,3)
);

ALTER TABLE `tym_sezona` ADD FOREIGN KEY (`id_tymu`) REFERENCES `tym` (`id_tymu`);

ALTER TABLE `tym_sezona` ADD FOREIGN KEY (`id_sezony`) REFERENCES `sezona` (`id_sezony`);

ALTER TABLE `monopost` ADD FOREIGN KEY (`id_tymu`) REFERENCES `tym` (`id_tymu`);

ALTER TABLE `monopost_sezona` ADD FOREIGN KEY (`id_monopostu`) REFERENCES `monopost` (`id_monopostu`);

ALTER TABLE `monopost_sezona` ADD FOREIGN KEY (`id_sezony`) REFERENCES `sezona` (`id_sezony`);

ALTER TABLE `sezona` ADD FOREIGN KEY (`id_sampiona`) REFERENCES `jezdec` (`id_jezdce`);

ALTER TABLE `sezona` ADD FOREIGN KEY (`id_vitez_tymu`) REFERENCES `tym` (`id_tymu`);

ALTER TABLE `zavod` ADD FOREIGN KEY (`id_sezony`) REFERENCES `sezona` (`id_sezony`);

ALTER TABLE `zavod` ADD FOREIGN KEY (`vitez`) REFERENCES `jezdec` (`id_jezdce`);

ALTER TABLE `jezdec_v_tymu` ADD FOREIGN KEY (`id_jezdce`) REFERENCES `jezdec` (`id_jezdce`);

ALTER TABLE `jezdec_v_tymu` ADD FOREIGN KEY (`id_tymu`) REFERENCES `tym` (`id_tymu`);

ALTER TABLE `jezdec_v_tymu` ADD FOREIGN KEY (`id_monopostu`) REFERENCES `monopost` (`id_monopostu`);

ALTER TABLE `jezdec_v_tymu` ADD FOREIGN KEY (`id_sezony`) REFERENCES `sezona` (`id_sezony`);

ALTER TABLE `jezdec_v_tymu` ADD FOREIGN KEY (`od_zavodu`) REFERENCES `zavod` (`id_zavodu`);

ALTER TABLE `jezdec_v_tymu` ADD FOREIGN KEY (`do_zavodu`) REFERENCES `zavod` (`id_zavodu`);

ALTER TABLE `vysledky` ADD FOREIGN KEY (`id_jezdce`) REFERENCES `jezdec` (`id_jezdce`);

ALTER TABLE `vysledky` ADD FOREIGN KEY (`id_zavodu`) REFERENCES `zavod` (`id_zavodu`);
