-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 19. Nov 2018 um 20:26
-- Server-Version: 10.1.28-MariaDB
-- PHP-Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
  `EventID` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `LocLat` decimal(9,6) NOT NULL,
  `LocLong` decimal(9,6) NOT NULL,
  `Date` date NOT NULL,
  `PriceIndex` int(1) NULL NOT NULL,
  `Age` int(2) NOT NULL,
  `EntryFee` float(100,2) NOT NULL,
  `LongDescription` varchar(500) NOT NULL,
  `ShortDescription` varchar(250) NOT NULL,
  `AddressCity` varchar(100) NOT NULL,
  `AddressPLZ` varchar(10) NOT NULL,
  `AddressStreet` varchar(100) NOT NULL,
  `AddressNr` varchar(1000) NOT NULL,
  PRIMARY KEY (EventID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Venue`
--

CREATE TABLE `Venue` (
  `VenueID` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `LocLat` decimal(9,6) NOT NULL,
  `LocLong` decimal(9,6) NOT NULL,
  `PriceIndex` int(1) NOT NULL,
  `EntryFee` float(100,2) NOT NULL,
  `Age` int(2) NOT NULL,
  `LongDescription` varchar(500) NOT NULL,
  `ShortDescription` varchar(250) NOT NULL,
  `AddressCity` varchar(100) NOT NULL,
  `AddressPLZ` varchar(10) NOT NULL,
  `AddressStreet` varchar(100) NOT NULL,
  `AddressNr` varchar(1000) NOT NULL,
  PRIMARY KEY (VenueID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle `OpeningHours`
--

CREATE TABLE `OpeningHours` (
  `OpenID` bigint(20) NOT NULL,
  `VenueID` bigint(20) NOT NULL,
  `WeekDay` int(7) NOT NULL,
  `DOpen` time NOT NULL,
  `DClose` time NOT NULL,
  PRIMARY KEY (OpenID),
  FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
--
-- Tabellenstruktur für Tabelle `Week`
--

CREATE TABLE `Week` (
  `WeekID` bigint(20) NOT NULL,
  `VenueID` bigint(20) NOT NULL,
  `WeekDay` int(7) NOT NULL,
  `LongDescription` varchar(500) NOT NULL,
  `ShortDescription` varchar(250) NOT NULL,
  PRIMARY KEY (WeekID),
  FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
