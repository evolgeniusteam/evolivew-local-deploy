-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: eviewer_ver1
-- ------------------------------------------------------
-- Server version	5.7.9

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `SharedCatPanels`
--

DROP TABLE IF EXISTS `SharedCatPanels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SharedCatPanels` (
  `ID` int(11) NOT NULL,
  `TreeID` int(11) NOT NULL,
  `DatasetType` varchar(100) DEFAULT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  `DateCreated` int(11) NOT NULL,
  `LastModified` int(11) NOT NULL,
  `SharingName` varchar(255) NOT NULL,
  KEY `SharingName` (`SharingName`),
  KEY `datasettreeid` (`TreeID`),
  KEY `datasetdatasettype` (`DatasetType`(1)),
  KEY `uniqid` (`TreeID`,`DatasetType`(1))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SharedDatasets`
--

DROP TABLE IF EXISTS `SharedDatasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SharedDatasets` (
  `ID` int(11) NOT NULL,
  `TreeID` int(11) NOT NULL,
  `DatasetName` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `DateCreated` int(11) NOT NULL,
  `LastModified` int(11) NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  `Order` int(4) NOT NULL,
  `DatasetContent` mediumtext NOT NULL,
  `DatasetType` varchar(100) DEFAULT NULL,
  `SharingName` varchar(255) NOT NULL,
  KEY `SharingName` (`SharingName`),
  KEY `datasetname` (`DatasetName`),
  KEY `TreeID` (`TreeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SharedTreeCanvasInfo`
--

DROP TABLE IF EXISTS `SharedTreeCanvasInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SharedTreeCanvasInfo` (
  `ID` int(11) NOT NULL,
  `TreeID` int(11) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` float NOT NULL,
  `SharingName` varchar(255) NOT NULL,
  KEY `SharingName` (`SharingName`),
  KEY `treepanlinforUniqueid` (`TreeID`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SharedTrees`
--

DROP TABLE IF EXISTS `SharedTrees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SharedTrees` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `TreeName` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `DateCreated` int(11) NOT NULL,
  `LastModified` int(11) NOT NULL,
  `Color` varchar(20) NOT NULL DEFAULT 'red',
  `Active` tinyint(1) NOT NULL DEFAULT '0',
  `Favorite` tinyint(1) NOT NULL DEFAULT '0',
  `Order` int(4) NOT NULL,
  `TreeContent` mediumtext NOT NULL,
  `TreeFormat` varchar(20) NOT NULL,
  `SharingName` varchar(255) NOT NULL,
  KEY `SharingName` (`SharingName`),
  KEY `treename` (`TreeName`),
  KEY `UserID` (`UserID`),
  KEY `userIDprojecttree` (`UserID`,`ProjectID`,`TreeName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TreeSharing`
--

DROP TABLE IF EXISTS `TreeSharing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TreeSharing` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TreeID` int(11) NOT NULL,
  `TreeName` varchar(255) NOT NULL,
  `ProjectName` varchar(255) NOT NULL,
  `SharingType` varchar(25) NOT NULL,
  `SharingName` varchar(255) NOT NULL,
  `DateCreated` int(11) NOT NULL,
  `DateModified` int(11) NOT NULL,
  `Version` int(11) NOT NULL DEFAULT '1',
  `LastAccessed` int(11) NOT NULL,
  `Visits` int(11) NOT NULL DEFAULT '0',
  `Annotation` text,
  PRIMARY KEY (`ID`),
  KEY `SharingName` (`SharingName`),
  KEY `TreeID` (`TreeID`),
  KEY `SharingType` (`SharingType`),
  KEY `TreeName` (`TreeName`),
  KEY `ProjectName` (`ProjectName`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `catpanels`
--

DROP TABLE IF EXISTS `catpanels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catpanels` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TreeID` int(11) NOT NULL,
  `DatasetType` varchar(100) DEFAULT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  `DateCreated` int(11) NOT NULL,
  `LastModified` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `datasettreeid` (`TreeID`),
  KEY `datasetdatasettype` (`DatasetType`(1)),
  KEY `uniqid` (`TreeID`,`DatasetType`(1))
) ENGINE=MyISAM AUTO_INCREMENT=45634 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datasets`
--

DROP TABLE IF EXISTS `datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datasets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TreeID` int(11) NOT NULL,
  `DatasetName` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `DateCreated` int(11) NOT NULL,
  `LastModified` int(11) NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  `Order` int(4) NOT NULL,
  `DatasetContent` mediumtext NOT NULL,
  `DatasetType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `datasetname` (`DatasetName`)
) ENGINE=MyISAM AUTO_INCREMENT=5375 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventDate` date NOT NULL DEFAULT '0000-00-00',
  `eventTitle` varchar(100) NOT NULL DEFAULT '',
  `eventDescription` text,
  KEY `idx_events_eventDate` (`eventDate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `ProjectName` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `DateCreated` int(11) NOT NULL,
  `LastModified` int(11) NOT NULL,
  `Color` varchar(20) NOT NULL DEFAULT 'red',
  `Active` tinyint(1) NOT NULL DEFAULT '0',
  `Favorite` tinyint(1) NOT NULL DEFAULT '0',
  `Order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `userproject` (`UserID`,`ProjectName`)
) ENGINE=InnoDB AUTO_INCREMENT=5061 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `SessionID` varchar(200) NOT NULL,
  `LastAccessed` int(11) NOT NULL COMMENT 'unix timestamp',
  `DateCreated` int(11) NOT NULL COMMENT 'unix timestamp',
  PRIMARY KEY (`ID`),
  KEY `SessionID` (`SessionID`)
) ENGINE=MyISAM AUTO_INCREMENT=5405 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `UserID` int(11) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  KEY `idx_userid_settings` (`UserID`),
  KEY `idx_key_settings` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `treecanvasinfo`
--

DROP TABLE IF EXISTS `treecanvasinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treecanvasinfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TreeID` int(11) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `treepanlinforUniqueid` (`TreeID`,`key`)
) ENGINE=MyISAM AUTO_INCREMENT=45961 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trees`
--

DROP TABLE IF EXISTS `trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trees` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `TreeName` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `DateCreated` int(11) NOT NULL,
  `LastModified` int(11) NOT NULL,
  `Color` varchar(20) NOT NULL DEFAULT 'red',
  `Active` tinyint(1) NOT NULL DEFAULT '0',
  `Favorite` tinyint(1) NOT NULL DEFAULT '0',
  `Order` int(4) NOT NULL,
  `TreeContent` mediumtext NOT NULL,
  `TreeFormat` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `treename` (`TreeName`),
  KEY `userIDprojecttree` (`UserID`,`ProjectID`,`TreeName`)
) ENGINE=MyISAM AUTO_INCREMENT=7189 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(200) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Institue` varchar(200) DEFAULT NULL,
  `socialType` varchar(255) DEFAULT 'EvolGenius',
  `Password_Hash` varchar(255) NOT NULL,
  `DateCreated` int(11) NOT NULL,
  `LastUpdated` int(11) DEFAULT '0',
  `Activated` tinyint(1) DEFAULT '0',
  `ActivationCode` varchar(10) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`UserID`),
  KEY `email` (`Email`),
  KEY `password` (`Password_Hash`),
  KEY `emailpass` (`Email`,`Password_Hash`),
  KEY `idx_user_socialtype` (`socialType`)
) ENGINE=MyISAM AUTO_INCREMENT=1349 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `visitorIP` varchar(100) NOT NULL DEFAULT '',
  `visitingDate` date NOT NULL DEFAULT '0000-00-00',
  UNIQUE KEY `idx_ip_date` (`visitorIP`,`visitingDate`),
  KEY `idx_visitorIP_visits` (`visitorIP`),
  KEY `idx_visitingDate_visits` (`visitingDate`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-10 11:52:29
