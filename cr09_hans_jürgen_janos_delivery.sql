-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Jul 2020 um 14:30
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_hans_jürgen_janos_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_hans_jürgen_janos_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr09_hans_jürgen_janos_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adress`
--

CREATE TABLE `adress` (
  `adress_id` int(11) NOT NULL,
  `street_name` varchar(55) DEFAULT NULL,
  `house_number` int(11) DEFAULT NULL,
  `section_number` tinyint(4) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `department_number` int(11) DEFAULT NULL,
  `city_name` varchar(222) DEFAULT NULL,
  `country_name` varchar(111) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `fk_adress_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `employee` varchar(55) DEFAULT NULL,
  `delivery` time DEFAULT NULL,
  `fk_package_status_id` int(11) DEFAULT NULL,
  `fk_processed_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `departments`
--

CREATE TABLE `departments` (
  `departments_id` int(11) NOT NULL,
  `departments_name` varchar(111) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `deposit`
--

CREATE TABLE `deposit` (
  `deposit_id` int(11) NOT NULL,
  `employee` varchar(55) DEFAULT NULL,
  `deposit_location` varchar(55) DEFAULT NULL,
  `deposit_time` time DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `destination`
--

CREATE TABLE `destination` (
  `destination_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `destination_time` time DEFAULT NULL,
  `fk_adress_id` int(11) DEFAULT NULL,
  `fk_package_status_id` int(11) DEFAULT NULL,
  `fk_delivery_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees`
--

CREATE TABLE `employees` (
  `employees_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_departments_id` int(11) DEFAULT NULL,
  `fk_adress_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mail_s_adress`
--

CREATE TABLE `mail_s_adress` (
  `mail_s_adress_id` int(11) NOT NULL,
  `street_name` varchar(222) DEFAULT NULL,
  `house_number` int(11) DEFAULT NULL,
  `section_number` tinyint(4) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `appartment_number` int(11) DEFAULT NULL,
  `city_name` varchar(222) DEFAULT NULL,
  `country_name` varchar(111) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package_status`
--

CREATE TABLE `package_status` (
  `package_status_id` int(11) NOT NULL,
  `processing_start` time DEFAULT NULL,
  `processing_end` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pick_up_area`
--

CREATE TABLE `pick_up_area` (
  `pick_up_id` int(11) NOT NULL,
  `employee` varchar(55) DEFAULT NULL,
  `pick_up_location` varchar(111) DEFAULT NULL,
  `pick_up_date` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processed`
--

CREATE TABLE `processed` (
  `processed_id` int(11) NOT NULL,
  `employee` varchar(55) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `processed_time` time DEFAULT NULL,
  `fk_package_status_id` int(11) DEFAULT NULL,
  `fk_mail_s_adress_id` int(11) DEFAULT NULL,
  `fk_deposit_id` int(11) DEFAULT NULL,
  `fk_pick_up_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processing_system`
--

CREATE TABLE `processing_system` (
  `processing_system_id` int(11) NOT NULL,
  `employee` varchar(55) DEFAULT NULL,
  `processing_system` time DEFAULT NULL,
  `fk_package_status_id` int(11) DEFAULT NULL,
  `fk_mail_s_adress_id` int(11) DEFAULT NULL,
  `fk_processed_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`adress_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_adress_id` (`fk_adress_id`);

--
-- Indizes für die Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `fk_package_status_id` (`fk_package_status_id`);

--
-- Indizes für die Tabelle `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`departments_id`);

--
-- Indizes für die Tabelle `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`deposit_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`destination_id`),
  ADD KEY `fk_adress_id` (`fk_adress_id`),
  ADD KEY `destination_ibfk_2` (`fk_delivery_id`),
  ADD KEY `destination_ibfk_3` (`fk_package_status_id`);

--
-- Indizes für die Tabelle `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employees_id`),
  ADD KEY `fk_departments_id` (`fk_departments_id`),
  ADD KEY `employees_ibfk_2` (`fk_adress_id`);

--
-- Indizes für die Tabelle `mail_s_adress`
--
ALTER TABLE `mail_s_adress`
  ADD PRIMARY KEY (`mail_s_adress_id`);

--
-- Indizes für die Tabelle `package_status`
--
ALTER TABLE `package_status`
  ADD PRIMARY KEY (`package_status_id`);

--
-- Indizes für die Tabelle `pick_up_area`
--
ALTER TABLE `pick_up_area`
  ADD PRIMARY KEY (`pick_up_id`);

--
-- Indizes für die Tabelle `processed`
--
ALTER TABLE `processed`
  ADD PRIMARY KEY (`processed_id`),
  ADD KEY `fk_package_status_id` (`fk_package_status_id`),
  ADD KEY `processed_ibfk_2` (`fk_pick_up_id`),
  ADD KEY `processed_ibfk_3` (`fk_mail_s_adress_id`),
  ADD KEY `processed_ibfk_4` (`fk_deposit_id`);

--
-- Indizes für die Tabelle `processing_system`
--
ALTER TABLE `processing_system`
  ADD PRIMARY KEY (`processing_system_id`),
  ADD KEY `fk_package_status_id` (`fk_package_status_id`),
  ADD KEY `processing_system_ibfk_2` (`fk_mail_s_adress_id`),
  ADD KEY `processing_system_ibfk_3` (`fk_processed_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_adress_id` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`);

--
-- Constraints der Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`fk_package_status_id`) REFERENCES `package_status` (`package_status_id`);

--
-- Constraints der Tabelle `deposit`
--
ALTER TABLE `deposit`
  ADD CONSTRAINT `deposit_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `destination`
--
ALTER TABLE `destination`
  ADD CONSTRAINT `destination_ibfk_1` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`),
  ADD CONSTRAINT `destination_ibfk_2` FOREIGN KEY (`fk_delivery_id`) REFERENCES `delivery` (`delivery_id`),
  ADD CONSTRAINT `destination_ibfk_3` FOREIGN KEY (`fk_package_status_id`) REFERENCES `package_status` (`package_status_id`);

--
-- Constraints der Tabelle `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`fk_departments_id`) REFERENCES `departments` (`departments_id`),
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`);

--
-- Constraints der Tabelle `processed`
--
ALTER TABLE `processed`
  ADD CONSTRAINT `processed_ibfk_1` FOREIGN KEY (`fk_package_status_id`) REFERENCES `package_status` (`package_status_id`),
  ADD CONSTRAINT `processed_ibfk_2` FOREIGN KEY (`fk_pick_up_id`) REFERENCES `pick_up_area` (`pick_up_id`),
  ADD CONSTRAINT `processed_ibfk_3` FOREIGN KEY (`fk_mail_s_adress_id`) REFERENCES `mail_s_adress` (`mail_s_adress_id`),
  ADD CONSTRAINT `processed_ibfk_4` FOREIGN KEY (`fk_deposit_id`) REFERENCES `deposit` (`deposit_id`);

--
-- Constraints der Tabelle `processing_system`
--
ALTER TABLE `processing_system`
  ADD CONSTRAINT `processing_system_ibfk_1` FOREIGN KEY (`fk_package_status_id`) REFERENCES `package_status` (`package_status_id`),
  ADD CONSTRAINT `processing_system_ibfk_2` FOREIGN KEY (`fk_mail_s_adress_id`) REFERENCES `mail_s_adress` (`mail_s_adress_id`),
  ADD CONSTRAINT `processing_system_ibfk_3` FOREIGN KEY (`fk_processed_id`) REFERENCES `processed` (`processed_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
