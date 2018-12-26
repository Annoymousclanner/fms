-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2017 at 11:45 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ois`
--

-- --------------------------------------------------------

--
-- Table structure for table `applicationaccess`
--

CREATE TABLE `applicationaccess` (
  `ID` int(11) NOT NULL,
  `User` int(11) NOT NULL,
  `Application` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `applicationquestionanswers`
--

CREATE TABLE `applicationquestionanswers` (
  `ID` int(11) NOT NULL,
  `Submission` int(11) NOT NULL,
  `Question` int(11) NOT NULL,
  `Answer` varchar(10000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `applicationquestions`
--

CREATE TABLE `applicationquestions` (
  `ID` int(11) NOT NULL,
  `Question` varchar(500) NOT NULL,
  `Type` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `ID` int(11) NOT NULL,
  `Name` varchar(500) NOT NULL,
  `Description` varchar(8000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `applicationsubmissions`
--

CREATE TABLE `applicationsubmissions` (
  `ID` int(11) NOT NULL,
  `User` int(11) NOT NULL,
  `Application` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE `authority` (
  `AuthorityID` int(11) NOT NULL,
  `Incident` int(11) NOT NULL DEFAULT '0',
  `Type` varchar(200) NOT NULL,
  `User` varchar(100) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Status` varchar(100) NOT NULL DEFAULT 'Active',
  `RemoveTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `RemoveUser` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



--
-- Table structure for table `courseaccess`
--

CREATE TABLE `courseaccess` (
  `ID` int(11) NOT NULL,
  `User` int(11) NOT NULL,
  `Course` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `ID` int(11) NOT NULL,
  `Name` varchar(500) NOT NULL,
  `Link` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



--
-- Table structure for table `duties`
--

CREATE TABLE `duties` (
  `DutyID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Day` int(11) NOT NULL,
  `Callsign` varchar(100) NOT NULL,
  `Role` varchar(100) NOT NULL,
  `Vehicle` varchar(100) NOT NULL,
  `Division` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `incidentlogs`
--

CREATE TABLE `incidentlogs` (
  `LogID` int(11) NOT NULL,
  `Source` varchar(50) NOT NULL,
  `User` varchar(50) NOT NULL,
  `Log` varchar(2000) NOT NULL,
  `Incident` int(11) NOT NULL,
  `Time` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `incidents`
--

CREATE TABLE `incidents` (
  `IncidentID` int(11) NOT NULL,
  `Type` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Borough` varchar(50) NOT NULL,
  `Details` varchar(7000) NOT NULL,
  `Status` varchar(100) NOT NULL DEFAULT 'Open',
  `Channel` varchar(25) NOT NULL,
  `Grade` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `memberapplications`
--

CREATE TABLE `memberapplications` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_of_birth` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `division` varchar(255) NOT NULL,
  `why_join` text NOT NULL,
  `rp_experience` text NOT NULL,
  `life_experience` text NOT NULL,
  `ts3` text NOT NULL,
  `unreleased_content` text NOT NULL,
  `be_patient` text NOT NULL,
  `community_guidelines` text NOT NULL,
  `find` text NOT NULL,
  `status` varchar(50) DEFAULT 'Open'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Table structure for table `patrols`
--

CREATE TABLE `patrols` (
  `PatrolID` int(11) NOT NULL,
  `Day` int(11) NOT NULL,
  `Enabled` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `SettingID` int(11) NOT NULL,
  `Setting` varchar(100) NOT NULL,
  `Value` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `UnitID` int(11) NOT NULL,
  `Member` varchar(100) NOT NULL,
  `X` varchar(100) NOT NULL,
  `Y` varchar(100) NOT NULL,
  `Z` varchar(100) NOT NULL,
  `Division` varchar(50) NOT NULL,
  `Callsign` varchar(100) NOT NULL DEFAULT 'UNASSIGNED',
  `Role` varchar(50) NOT NULL DEFAULT 'UNASSIGNED',
  `Vehicle` varchar(100) NOT NULL DEFAULT 'UNASSIGNED',
  `Status` varchar(100) NOT NULL DEFAULT 'Unavailable',
  `QueueTime` time NOT NULL,
  `Incident` int(11) NOT NULL DEFAULT '0',
  `DeployTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ArriveTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Machine` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



--
-- Table structure for table `userrequests`
--

CREATE TABLE `userrequests` (
  `RequestID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `CollarNumber` varchar(100) NOT NULL,
  `Division` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `ShortRank` varchar(50) NOT NULL,
  `CollarNumber` varchar(20) NOT NULL,
  `Division` varchar(30) NOT NULL,
  `JoinDate` date NOT NULL,
  `Status` enum('Active','Semi-Active','Inactive','LOA') NOT NULL,
  `SteamID` varchar(60) NOT NULL,
  `Controller` int(11) NOT NULL,
  `HR` int(11) NOT NULL,
  `Note` varchar(9000) NOT NULL,
  `LastLogin` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



--
-- Indexes for dumped tables
--

--
-- Indexes for table `applicationaccess`
--
ALTER TABLE `applicationaccess`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `applicationquestionanswers`
--
ALTER TABLE `applicationquestionanswers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `applicationquestions`
--
ALTER TABLE `applicationquestions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `applicationsubmissions`
--
ALTER TABLE `applicationsubmissions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`AuthorityID`);

--
-- Indexes for table `courseaccess`
--
ALTER TABLE `courseaccess`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `duties`
--
ALTER TABLE `duties`
  ADD PRIMARY KEY (`DutyID`);

--
-- Indexes for table `incidentlogs`
--
ALTER TABLE `incidentlogs`
  ADD PRIMARY KEY (`LogID`);

--
-- Indexes for table `incidents`
--
ALTER TABLE `incidents`
  ADD PRIMARY KEY (`IncidentID`);

--
-- Indexes for table `memberapplications`
--
ALTER TABLE `memberapplications`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `patrols`
--
ALTER TABLE `patrols`
  ADD PRIMARY KEY (`PatrolID`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`SettingID`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`UnitID`);

--
-- Indexes for table `userrequests`
--
ALTER TABLE `userrequests`
  ADD PRIMARY KEY (`RequestID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applicationaccess`
--
ALTER TABLE `applicationaccess`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applicationquestionanswers`
--
ALTER TABLE `applicationquestionanswers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applicationquestions`
--
ALTER TABLE `applicationquestions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applicationsubmissions`
--
ALTER TABLE `applicationsubmissions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authority`
--
ALTER TABLE `authority`
  MODIFY `AuthorityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `courseaccess`
--
ALTER TABLE `courseaccess`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `duties`
--
ALTER TABLE `duties`
  MODIFY `DutyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `incidentlogs`
--
ALTER TABLE `incidentlogs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `incidents`
--
ALTER TABLE `incidents`
  MODIFY `IncidentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `memberapplications`
--
ALTER TABLE `memberapplications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `patrols`
--
ALTER TABLE `patrols`
  MODIFY `PatrolID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `SettingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `UnitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=421;

--
-- AUTO_INCREMENT for table `userrequests`
--
ALTER TABLE `userrequests`
  MODIFY `RequestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
