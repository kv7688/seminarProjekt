-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 12. feb 2024 ob 10.44
-- Različica strežnika: 10.4.32-MariaDB
-- Različica PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `iturizem`
--

DELIMITER $$
--
-- Procedure
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `dodajRezervacijo` (IN `idApartma` INT, IN `datumPrihodaP` DATE, IN `datumOdhodaP` DATE, IN `idUporabnik` INT)   BEGIN
    INSERT INTO rezervacija (idApartma, datumPrihoda, datumOdhoda, idUporabnik)
    VALUES (idApartma, datumPrihodaP, datumOdhodaP, idUporabnik);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `dodajUporabnika` (IN `Ime` VARCHAR(20), IN `Priimek` VARCHAR(20), IN `Geslo` VARCHAR(100), IN `Telefon` VARCHAR(20), IN `Email` VARCHAR(50))   BEGIN
    INSERT INTO uporabniki (ime, priimek, geslo, telefon, email)
    VALUES (Ime, Priimek, Geslo, Telefon, Email);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `izbrisiRezervacijo` (IN `idRezervacija` INT)   BEGIN
    DELETE FROM rezervacija
    WHERE ID = idRezervacija;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `posodobiUporabnika` (IN `idUporabnik` INT, IN `novoIme` VARCHAR(255), IN `noviPriimek` VARCHAR(255), IN `novoGeslo` VARCHAR(255), IN `novTelefon` VARCHAR(20), IN `novEmail` VARCHAR(255))   BEGIN
    UPDATE uporabniki
    SET 
        ime = novoIme,
        priimek = noviPriimek,
        geslo = novoGeslo,
        telefon = novTelefon,
        email = novEmail
    WHERE
        id = idUporabnik;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prikaziApartma` ()   BEGIN
    SELECT * FROM apartma; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prikaziMojeRezervacije` (IN `vidUporabnik` INT)   BEGIN
    SELECT *
    FROM rezervacija
    WHERE idUporabnik = vidUporabnik;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prikaziUporabnika` (IN `vidUporabnik` VARCHAR(50))   BEGIN
    SELECT * FROM uporabniki WHERE ID = vidUporabnik;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prikaziVseRezervacije` ()   BEGIN
    SELECT *
    FROM rezervacija;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spremeniCeno` (IN `idApartma` INT, IN `novaCena` INT)   BEGIN
    UPDATE apartma SET cena = novaCena WHERE id = idApartma;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spremeniRezervacijo` (IN `idRezervacija` INT, IN `idApartma` INT, IN `datumPrihodaP` DATE, IN `datumOdhodaP` DATE, IN `idUporabnik` INT)   BEGIN
    UPDATE rezervacija
    SET 
        idApartma = idApartma,
        datumPrihoda = datumPrihodaP,
        datumOdhoda = datumOdhodaP,
        idUporabnik = idUporabnik
    WHERE
        ID = idRezervacija;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabele `apartma`
--

CREATE TABLE `apartma` (
  `ID` int(11) NOT NULL,
  `imeApartma` varchar(50) NOT NULL,
  `Velikost` int(11) NOT NULL,
  `Naslov` varchar(50) NOT NULL,
  `Cena` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Odloži podatke za tabelo `apartma`
--

INSERT INTO `apartma` (`ID`, `imeApartma`, `Velikost`, `Naslov`, `Cena`) VALUES
(1, 'oljka', 40, 'Koper123', 60),
(2, 'Soncek', 60, 'Lucija123', 40),
(3, 'Morje', 40, 'Portoroz123', 70),
(4, 'Barka', 50, 'Izola123', 50);

-- --------------------------------------------------------

--
-- Struktura tabele `rezervacija`
--

CREATE TABLE `rezervacija` (
  `ID` int(11) NOT NULL,
  `idApartma` int(11) NOT NULL,
  `datumPrihoda` date NOT NULL,
  `datumOdhoda` date NOT NULL,
  `idUporabnik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Odloži podatke za tabelo `rezervacija`
--

INSERT INTO `rezervacija` (`ID`, `idApartma`, `datumPrihoda`, `datumOdhoda`, `idUporabnik`) VALUES
(2, 2, '2024-02-11', '2024-02-12', 1),
(3, 4, '2024-02-19', '2024-02-20', 2),
(4, 3, '2024-03-05', '2024-03-07', 2),
(20, 1, '2024-02-20', '2024-02-21', 1),
(21, 1, '2024-03-03', '2024-03-04', 1),
(22, 1, '2024-02-23', '2024-02-24', 2),
(23, 1, '2024-02-05', '2024-02-06', 4),
(25, 4, '2024-02-09', '2024-02-10', 5);

-- --------------------------------------------------------

--
-- Struktura tabele `uporabniki`
--

CREATE TABLE `uporabniki` (
  `ID` int(11) NOT NULL,
  `Ime` varchar(20) NOT NULL,
  `Priimek` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Geslo` varchar(100) NOT NULL,
  `Telefon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Odloži podatke za tabelo `uporabniki`
--

INSERT INTO `uporabniki` (`ID`, `Ime`, `Priimek`, `Email`, `Geslo`, `Telefon`) VALUES
(1, 'Jan', 'kik', 'aaa@aaa', '$2y$10$/T0aTNWaqnybPkM6sHIZOOamaI87.h1GfsbHZ6tEVZQu8cGmgMe0i', '111'),
(2, 'Ana', 'Novak', 'ana@novak.com', 'Ana123', '031555663'),
(3, 'Jana', 'Novak', 'jana@novak.com', '$2y$10$b96tniN/wRL4MdxDcWXYqO8RreUXv0HZAMW/BpREGBuavCJgR6lQC', '010111222'),
(4, 'Jan', 'Novak', 'jan@novak.com', '$2y$10$lYqybAumEK8mQ/dqBfUBUuYEZCDuwtR4ADKOJoKwyChkQ/7bHDbK2', '000111222'),
(5, 'Zana', 'Zana', 'zana@zana.com', '$2y$10$pUwkeBMbbIZangh3HbwwW.7DOaY676e6dSwgT11Pmm.SxvFw6vCJq', '000222444');

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `apartma`
--
ALTER TABLE `apartma`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `imeApartma` (`imeApartma`);

--
-- Indeksi tabele `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idApartma_2` (`idApartma`),
  ADD KEY `idUporabnik` (`idUporabnik`),
  ADD KEY `idApartma_3` (`idApartma`);

--
-- Indeksi tabele `uporabniki`
--
ALTER TABLE `uporabniki`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `apartma`
--
ALTER TABLE `apartma`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabele `rezervacija`
--
ALTER TABLE `rezervacija`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT tabele `uporabniki`
--
ALTER TABLE `uporabniki`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Omejitve tabel za povzetek stanja
--

--
-- Omejitve za tabelo `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD CONSTRAINT `rezervacija_ibfk_1` FOREIGN KEY (`idApartma`) REFERENCES `apartma` (`ID`),
  ADD CONSTRAINT `rezervacija_ibfk_2` FOREIGN KEY (`idUporabnik`) REFERENCES `uporabniki` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
