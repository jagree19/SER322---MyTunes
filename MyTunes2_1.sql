-- MySQL dump 10.13  Distrib 8.0.11, for macos10.13 (x86_64)
--
-- Host: localhost    Database: MyTunes2.0
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ALBUM`
--

DROP TABLE IF EXISTS `ALBUM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ALBUM` (
  `AlbumID` int(11) NOT NULL AUTO_INCREMENT,
  `albumName` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `price` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`AlbumID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALBUM`
--

LOCK TABLES `ALBUM` WRITE;
/*!40000 ALTER TABLE `ALBUM` DISABLE KEYS */;
INSERT INTO `ALBUM` VALUES (1,'Dirt','grunge',12.99),(2,'PRC','indie rock',9.99);
/*!40000 ALTER TABLE `ALBUM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BAND`
--

DROP TABLE IF EXISTS `BAND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `BAND` (
  `BandID` int(11) NOT NULL AUTO_INCREMENT,
  `bandName` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`BandID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BAND`
--

LOCK TABLES `BAND` WRITE;
/*!40000 ALTER TABLE `BAND` DISABLE KEYS */;
INSERT INTO `BAND` VALUES (1,'Alice In Chains','grunge','1987-08-01',NULL),(2,'Yellow Sunshine Taxi Company','indie rock','1984-09-15','1999-01-31'),(3,'Elastic Afternoon','indie rock','1984-09-15','1970-01-01');
/*!40000 ALTER TABLE `BAND` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HAS_TRACK`
--

DROP TABLE IF EXISTS `HAS_TRACK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `HAS_TRACK` (
  `TracklistID` int(11) NOT NULL AUTO_INCREMENT,
  `AlbumID` int(11) NOT NULL,
  `TrackID` int(11) NOT NULL,
  PRIMARY KEY (`TracklistID`),
  KEY `fk_albumID_idx` (`AlbumID`),
  KEY `fk_trackID_idx` (`TrackID`),
  CONSTRAINT `fk_albumID` FOREIGN KEY (`AlbumID`) REFERENCES `album` (`albumid`),
  CONSTRAINT `fk_trackID` FOREIGN KEY (`TrackID`) REFERENCES `track` (`trackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HAS_TRACK`
--

LOCK TABLES `HAS_TRACK` WRITE;
/*!40000 ALTER TABLE `HAS_TRACK` DISABLE KEYS */;
/*!40000 ALTER TABLE `HAS_TRACK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MEMBER_OF`
--

DROP TABLE IF EXISTS `MEMBER_OF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MEMBER_OF` (
  `MembershipID` int(11) NOT NULL AUTO_INCREMENT,
  `MusicianID` int(11) DEFAULT NULL,
  `BandID` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  PRIMARY KEY (`MembershipID`),
  KEY `fk_mmusicianid_idx` (`MusicianID`),
  KEY `fk_mbandid_idx` (`BandID`),
  CONSTRAINT `fk_mbandid` FOREIGN KEY (`BandID`) REFERENCES `band` (`bandid`),
  CONSTRAINT `fk_mmusicianid` FOREIGN KEY (`MusicianID`) REFERENCES `musician` (`musicianid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBER_OF`
--

LOCK TABLES `MEMBER_OF` WRITE;
/*!40000 ALTER TABLE `MEMBER_OF` DISABLE KEYS */;
/*!40000 ALTER TABLE `MEMBER_OF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MUSICIAN`
--

DROP TABLE IF EXISTS `MUSICIAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MUSICIAN` (
  `MusicianID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MusicianID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MUSICIAN`
--

LOCK TABLES `MUSICIAN` WRITE;
/*!40000 ALTER TABLE `MUSICIAN` DISABLE KEYS */;
INSERT INTO `MUSICIAN` VALUES (1,'Layne','Staley','layne@ms.com','(555)555-5555'),(2,'Johnny','2Shoes','J2S@gmail.com','(555)555-9874'),(3,'Michaelolopologie','Smith','ms@gmail.com','(555)879-9874');
/*!40000 ALTER TABLE `MUSICIAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCER`
--

DROP TABLE IF EXISTS `PRODUCER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PRODUCER` (
  `ProducerID` int(11) NOT NULL AUTO_INCREMENT,
  `producerName` varchar(255) DEFAULT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProducerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCER`
--

LOCK TABLES `PRODUCER` WRITE;
/*!40000 ALTER TABLE `PRODUCER` DISABLE KEYS */;
INSERT INTO `PRODUCER` VALUES (1,'Rick Reuben','rr@American.com','(555)555-5555'),(2,'Justoferson Jones','jj@jj.com','(555)987-9874');
/*!40000 ALTER TABLE `PRODUCER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCES`
--

DROP TABLE IF EXISTS `PRODUCES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `PRODUCES` (
  `ProductionID` int(11) NOT NULL AUTO_INCREMENT,
  `ProducerID` int(11) DEFAULT NULL,
  `AlbumID` int(11) DEFAULT NULL,
  `budget` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`ProductionID`),
  KEY `fk_producerid_idx` (`ProducerID`),
  KEY `fk_palbumid_idx` (`AlbumID`),
  CONSTRAINT `fk_palbumid` FOREIGN KEY (`AlbumID`) REFERENCES `album` (`albumid`),
  CONSTRAINT `fk_producerid` FOREIGN KEY (`ProducerID`) REFERENCES `producer` (`producerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCES`
--

LOCK TABLES `PRODUCES` WRITE;
/*!40000 ALTER TABLE `PRODUCES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRODUCES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RELEASES`
--

DROP TABLE IF EXISTS `RELEASES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `RELEASES` (
  `ReleaseID` int(11) NOT NULL AUTO_INCREMENT,
  `BandID` int(11) DEFAULT NULL,
  `AlbumID` int(11) DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  PRIMARY KEY (`ReleaseID`),
  KEY `fk_rbandid_idx` (`BandID`),
  KEY `fk_ralbumid_idx` (`AlbumID`),
  CONSTRAINT `fk_ralbumid` FOREIGN KEY (`AlbumID`) REFERENCES `album` (`albumid`),
  CONSTRAINT `fk_rbandid` FOREIGN KEY (`BandID`) REFERENCES `band` (`bandid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RELEASES`
--

LOCK TABLES `RELEASES` WRITE;
/*!40000 ALTER TABLE `RELEASES` DISABLE KEYS */;
/*!40000 ALTER TABLE `RELEASES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRACK`
--

DROP TABLE IF EXISTS `TRACK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TRACK` (
  `TrackID` int(11) NOT NULL AUTO_INCREMENT,
  `trackName` varchar(255) DEFAULT NULL,
  `length` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TrackID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRACK`
--

LOCK TABLES `TRACK` WRITE;
/*!40000 ALTER TABLE `TRACK` DISABLE KEYS */;
INSERT INTO `TRACK` VALUES (1,'Down In A Hole','3:27'),(2,'Marmalade','3:45');
/*!40000 ALTER TABLE `TRACK` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-21  9:02:42
