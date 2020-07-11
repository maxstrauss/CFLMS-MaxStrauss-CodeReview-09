-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Jul 2020 um 16:48
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_max_strauss_delivery`
--

-- --------------------------------------------------------

--
-- Stellvertreter-Struktur des Views `bonus club member`
-- (Siehe unten für die tatsächliche Ansicht)
--
CREATE TABLE `bonus club member` (
`member_id` int(11)
,`Bonus_points` varchar(55)
,`member_since` date
,`fk_customer_id` int(11)
);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bonus_club_member`
--

CREATE TABLE `bonus_club_member` (
  `member_id` int(11) NOT NULL,
  `Bonus_points` varchar(55) DEFAULT NULL,
  `member_since` date DEFAULT NULL,
  `fk_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `credit_card_details`
--

CREATE TABLE `credit_card_details` (
  `credit_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `cardnumber` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `address` varchar(55) DEFAULT NULL,
  `City` varchar(55) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `phone number` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `address`, `City`, `first_name`, `last_name`, `email`, `phone number`) VALUES
(1, 'Kettenbrückengasse 23 / 2 / 12, 1050 Wie', 'Vienna', 'Code', 'Factory', 'office@codefactory.wien', '699 12255185'),
(2, 'Templstrasse 91', '3751 MISSINGDORF', 'Markus ', 'Pfaff', 'MarkusPfaff@cuvox.de', '0676 856 68 24'),
(3, 'Pazmaniteng 6', 'Vienna', 'Klaudia', 'Kunze', 'KlaudiaKunze@cuvox.de', '0664 219 87 70'),
(4, 'Ortsstrasse 85', '9544 WIESEN', 'Julia', 'Lehrer', 'JuliaLehrer@cuvox.de', '0680 509 43 56'),
(5, 'Grössgstötten 72', '4873 FISCHIGEN', 'Ralph', 'Furst', 'Bregenz', '0676 613 08 85');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivery`
--

CREATE TABLE `delivery` (
  `DeliveryID` int(11) NOT NULL,
  `Deliverydate` date DEFAULT NULL,
  `Deliverytime` time DEFAULT NULL,
  `fk_process_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `delivery`
--

INSERT INTO `delivery` (`DeliveryID`, `Deliverydate`, `Deliverytime`, `fk_process_id`) VALUES
(1, '2020-06-01', '16:00:00', 1),
(2, '2020-07-02', '13:00:00', 2),
(3, '2020-07-03', '14:00:00', 3),
(4, '2020-07-10', '17:00:00', 4),
(5, '2020-07-11', '14:30:00', 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`EmployeeID`, `first_name`, `last_name`, `email`, `phone_number`) VALUES
(1, 'Jan ', 'Koertig', 'JanKoertig@cuvox.de', '0680 592 65 49'),
(2, 'Claudia', 'Freeh', 'ClaudiaFreeh@cuvox.de', '0699 679 82 87'),
(3, 'Niklas ', 'Ehrlichmann', 'NiklasEhrlichmann@cuvox.de', '0660 920 28 97'),
(4, 'Jennifer ', 'Pfeifer', 'JenniferPfeifer@einrot.com', '0681 391 81 56'),
(5, 'Leon ', 'Weiss', 'LeonWeiss@einrot.com', '0676 295 55 74'),
(6, 'Lea ', 'Frei', 'LeaFrei@einrot.com', '0650 592 15 44');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee salary`
--

CREATE TABLE `employee salary` (
  `salary_id:` int(11) NOT NULL,
  `fk_EmployeeID` int(11) NOT NULL,
  `salary` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employee salary`
--

INSERT INTO `employee salary` (`salary_id:`, `fk_EmployeeID`, `salary`) VALUES
(1, 0, '1500€'),
(2, 0, '2300€'),
(3, 0, '1490€'),
(4, 0, '1455€'),
(5, 0, '1230€'),
(6, 0, '2650€');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_DeliveryID` int(11) DEFAULT NULL,
  `price` varchar(11) DEFAULT NULL,
  `message` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_DeliveryID`, `price`, `message`) VALUES
(1, 1, '250€', 'Thank you for your purchase!'),
(2, 2, '25€', 'Thanks for ordering!'),
(3, 3, '57€', 'Thank you!'),
(4, 4, '129€', 'For any questions call me back'),
(6, 6, '330', 'Thanks for buying our product!');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `LocationID` int(11) NOT NULL,
  `Name` varchar(55) DEFAULT NULL,
  `address` varchar(55) DEFAULT NULL,
  `fk_PackageID` int(11) DEFAULT NULL,
  `depositet_date` date NOT NULL,
  `depositet_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`LocationID`, `Name`, `address`, `fk_PackageID`, `depositet_date`, `depositet_time`) VALUES
(1, 'UPS Annahmestelle', 'Dornbacher Str. 37, 1170 Wien', 1, '2020-05-08', '12:00:00'),
(2, 'DHL Paketshop', 'Fuchsröhrenstraße 11, 1110 Wien', 2, '2020-06-19', '13:30:00'),
(3, 'Hermes Paketshop', 'Salzburger Str. 146, 4600 Wels', 3, '2020-06-09', '17:00:00'),
(4, 'Postfiliale Wien', 'Würthgasse 7-9, 1190 Wien', 4, '2020-06-23', '10:30:00'),
(6, 'GLS Paketshop', 'Lichtensterngasse 3-21, 1120 Wien', 6, '2020-04-29', '08:45:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `PackageID` int(11) NOT NULL,
  `weight` varchar(55) DEFAULT NULL,
  `fk_RecipientID` int(11) DEFAULT NULL,
  `postage` varchar(55) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`PackageID`, `weight`, `fk_RecipientID`, `postage`, `fk_customer_id`) VALUES
(1, '0,5kg', 2, '2,75€', 5),
(2, '1kg', 1, '5,75€', 1),
(3, '2,5kg', 4, '7,90€', 4),
(4, '5kg', 3, '15€', 3),
(6, '3,35kg', 5, '2,37€', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `processingsystem`
--

CREATE TABLE `processingsystem` (
  `process_id` int(11) NOT NULL,
  `fk_LocationID` int(11) DEFAULT NULL,
  `fk_EmployeeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `processingsystem`
--

INSERT INTO `processingsystem` (`process_id`, `fk_LocationID`, `fk_EmployeeID`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(6, 6, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipient`
--

CREATE TABLE `recipient` (
  `RecipientID` int(11) NOT NULL,
  `address` varchar(55) DEFAULT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `fk_DeliveryID` int(11) NOT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `phone_number` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `recipient`
--

INSERT INTO `recipient` (`RecipientID`, `address`, `first_name`, `fk_DeliveryID`, `last_name`, `email`, `phone_number`) VALUES
(1, 'Pertholzer Strasse 78, 4720 ODLBODING', 'Philipp ', 1, 'Koertig', ' PhilippKoertig@einrot.com', '0664 197 91 09'),
(2, 'Gartenweg 19, 4312 AISTBERGTHAL', 'Ines', 2, 'Herzog', 'InesHerzog@einrot.com', '0688 466 01 87'),
(3, 'Schachterlweg 45, 3650 PÖGGSTALL', 'Vanessa', 3, 'Kohler', 'VanessaKohler@cuvox.de', '0676 575 64 24'),
(4, 'Pottendorfer Strasse 10, 3340 RIEN', 'Mandy ', 4, 'Schmid', 'MandySchmid@einrot.com', '0664 622 74 16'),
(5, ' Schützengartenstrasse 94, 8263 MAIERHOFBERGEN', 'Susanne ', 5, 'Faerber', 'SusanneFaerber@einrot.com', '0650 166 10 55');

-- --------------------------------------------------------

--
-- Struktur des Views `bonus club member`
--
DROP TABLE IF EXISTS `bonus club member`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `bonus club member`  AS  select `bonus_club_member`.`member_id` AS `member_id`,`bonus_club_member`.`Bonus_points` AS `Bonus_points`,`bonus_club_member`.`member_since` AS `member_since`,`bonus_club_member`.`fk_customer_id` AS `fk_customer_id` from `bonus_club_member` ;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bonus_club_member`
--
ALTER TABLE `bonus_club_member`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `credit_card_details`
--
ALTER TABLE `credit_card_details`
  ADD PRIMARY KEY (`credit_id`),
  ADD UNIQUE KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`DeliveryID`),
  ADD KEY `process_id` (`fk_process_id`) USING BTREE;

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indizes für die Tabelle `employee salary`
--
ALTER TABLE `employee salary`
  ADD PRIMARY KEY (`salary_id:`),
  ADD KEY `fk_EmployeeID` (`fk_EmployeeID`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD UNIQUE KEY `fk_DeliveryID` (`fk_DeliveryID`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LocationID`),
  ADD KEY `fk_PackageID` (`fk_PackageID`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`PackageID`),
  ADD KEY `fk_RecipientID` (`fk_RecipientID`),
  ADD KEY `fk_customer_id` (`fk_customer_id`) USING BTREE;

--
-- Indizes für die Tabelle `processingsystem`
--
ALTER TABLE `processingsystem`
  ADD PRIMARY KEY (`process_id`),
  ADD KEY `fk_LocationID` (`fk_LocationID`),
  ADD KEY `fk_EmployeeID` (`fk_EmployeeID`);

--
-- Indizes für die Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`RecipientID`),
  ADD KEY `fk_DeliveryID` (`fk_DeliveryID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `bonus_club_member`
--
ALTER TABLE `bonus_club_member`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `credit_card_details`
--
ALTER TABLE `credit_card_details`
  MODIFY `credit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `delivery`
--
ALTER TABLE `delivery`
  MODIFY `DeliveryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `employee salary`
--
ALTER TABLE `employee salary`
  MODIFY `salary_id:` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `package`
--
ALTER TABLE `package`
  MODIFY `PackageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `processingsystem`
--
ALTER TABLE `processingsystem`
  MODIFY `process_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `recipient`
--
ALTER TABLE `recipient`
  MODIFY `RecipientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bonus_club_member`
--
ALTER TABLE `bonus_club_member`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `credit_card_details`
--
ALTER TABLE `credit_card_details`
  ADD CONSTRAINT `credit_card_details_fk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`fk_process_id`) REFERENCES `processingsystem` (`process_id`);

--
-- Constraints der Tabelle `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`fk_PackageID`) REFERENCES `package` (`PackageID`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_RecipientID`) REFERENCES `recipient` (`RecipientID`);

--
-- Constraints der Tabelle `processingsystem`
--
ALTER TABLE `processingsystem`
  ADD CONSTRAINT `processingsystem_ibfk_1` FOREIGN KEY (`fk_LocationID`) REFERENCES `location` (`LocationID`),
  ADD CONSTRAINT `processingsystem_ibfk_2` FOREIGN KEY (`fk_EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Constraints der Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_DeliveryID`) REFERENCES `delivery` (`DeliveryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
