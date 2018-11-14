-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 14. Nov 2018 um 17:48
-- Server-Version: 10.1.19-MariaDB
-- PHP-Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `nightlife`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Event`
--

CREATE TABLE `Event` (
  `ID` bigint(20) NOT NULL,
  `LocLat` decimal(9,6) DEFAULT NULL,
  `LocLong` decimal(9,6) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `PriceIndex` int(1) DEFAULT NULL,
  `Age` int(2) NOT NULL,
  `EntryFee` float(100,2) NOT NULL,
  `Comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `OpeningHours`
--

CREATE TABLE `OpeningHours` (
  `VenueID` bigint(20) NOT NULL,
  `MON_OP` time DEFAULT NULL,
  `MON_CL` time DEFAULT NULL,
  `TUE_OP` time DEFAULT NULL,
  `TUE_CL` time DEFAULT NULL,
  `WED_OP` time DEFAULT NULL,
  `WED_CL` time DEFAULT NULL,
  `THU_OP` time DEFAULT NULL,
  `THU_CL` time DEFAULT NULL,
  `FRI_OP` time DEFAULT NULL,
  `FRI_CL` time DEFAULT NULL,
  `SAT_OP` time DEFAULT NULL,
  `SAT_CL` time DEFAULT NULL,
  `SUN_OP` time DEFAULT NULL,
  `SUN_CL` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Venue`
--

CREATE TABLE `Venue` (
  `ID` bigint(20) NOT NULL,
  `LocLat` decimal(9,6) DEFAULT NULL,
  `LocLong` decimal(9,6) DEFAULT NULL,
  `PriceIndex` int(1) DEFAULT NULL,
  `EntryFee` float(100,2) NOT NULL,
  `Age` int(2) NOT NULL,
  `Comment` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Week`
--

CREATE TABLE `Week` (
  `VenueID` bigint(20) NOT NULL,
  `MON` varchar(500) NOT NULL,
  `TUE` varchar(500) NOT NULL,
  `WED` varchar(500) NOT NULL,
  `THU` varchar(500) NOT NULL,
  `FRI` varchar(500) NOT NULL,
  `SAT` varchar(500) NOT NULL,
  `SUN` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Event`
--
ALTER TABLE `Event`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `OpeningHours`
--
ALTER TABLE `OpeningHours`
  ADD KEY `VenueID` (`VenueID`) USING BTREE;

--
-- Indizes für die Tabelle `Venue`
--
ALTER TABLE `Venue`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `Week`
--
ALTER TABLE `Week`
  ADD UNIQUE KEY `VenueID` (`VenueID`) USING BTREE;

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Event`
--
ALTER TABLE `Event`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `Venue`
--
ALTER TABLE `Venue`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Week`
--
ALTER TABLE `Week`
  ADD CONSTRAINT `VenueFK` FOREIGN KEY (`VenueID`) REFERENCES `Venue` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
