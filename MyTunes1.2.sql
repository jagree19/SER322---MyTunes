-- MySQL dump 10.13  Distrib 8.0.11, for macos10.13 (x86_64)
--
-- Host: localhost    Database: MyTunes1.0
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
-- Table structure for table `Albums`
--

DROP TABLE IF EXISTS `Albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Albums` (
  `AlbumID` int(11) NOT NULL AUTO_INCREMENT,
  `AlbumName` varchar(255) DEFAULT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `Publishers_PublisherID` int(11) NOT NULL,
  `Bands_BandID` int(11) NOT NULL,
  PRIMARY KEY (`AlbumID`,`Publishers_PublisherID`,`Bands_BandID`),
  UNIQUE KEY `AlbumID_UNIQUE` (`AlbumID`),
  KEY `fk_Albums_Publishers_idx` (`Publishers_PublisherID`),
  KEY `fk_Albums_Bands1_idx` (`Bands_BandID`),
  CONSTRAINT `fk_Albums_Bands1` FOREIGN KEY (`Bands_BandID`) REFERENCES `bands` (`bandid`),
  CONSTRAINT `fk_Albums_Publishers` FOREIGN KEY (`Publishers_PublisherID`) REFERENCES `publishers` (`publisherid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albums`
--

LOCK TABLES `Albums` WRITE;
/*!40000 ALTER TABLE `Albums` DISABLE KEYS */;
INSERT INTO `Albums` VALUES (1,'Above','1995-03-14',13,1,2),(2,'Dirt','1992-09-29',13,2,1),(3,'Quebec','2003-08-05',13,3,3);
/*!40000 ALTER TABLE `Albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Albums_has_Songs`
--

DROP TABLE IF EXISTS `Albums_has_Songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Albums_has_Songs` (
  `Albums_AlbumID` int(11) NOT NULL,
  `Albums_Publishers_PublisherID` int(11) NOT NULL,
  `Albums_Bands_BandID` int(11) NOT NULL,
  `Songs_SongID` int(11) NOT NULL,
  PRIMARY KEY (`Albums_AlbumID`,`Albums_Publishers_PublisherID`,`Albums_Bands_BandID`,`Songs_SongID`),
  KEY `fk_Albums_has_Songs_Songs1_idx` (`Songs_SongID`),
  KEY `fk_Albums_has_Songs_Albums1_idx` (`Albums_AlbumID`,`Albums_Publishers_PublisherID`,`Albums_Bands_BandID`),
  CONSTRAINT `fk_Albums_has_Songs_Albums1` FOREIGN KEY (`Albums_AlbumID`, `Albums_Publishers_PublisherID`, `Albums_Bands_BandID`) REFERENCES `albums` (`albumid`, `publishers_publisherid`, `bands_bandid`),
  CONSTRAINT `fk_Albums_has_Songs_Songs1` FOREIGN KEY (`Songs_SongID`) REFERENCES `songs` (`songid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albums_has_Songs`
--

LOCK TABLES `Albums_has_Songs` WRITE;
/*!40000 ALTER TABLE `Albums_has_Songs` DISABLE KEYS */;
INSERT INTO `Albums_has_Songs` VALUES (1,1,2,1),(1,1,2,2),(1,1,2,3),(1,1,2,4),(1,1,2,5),(1,1,2,6),(1,1,2,7),(1,1,2,8),(1,1,2,9),(1,1,2,10),(2,2,1,11),(2,2,1,12),(2,2,1,13),(2,2,1,14),(2,2,1,15),(2,2,1,16),(2,2,1,17),(2,2,1,18),(2,2,1,19),(2,2,1,20),(2,2,1,21),(2,2,1,22),(2,2,1,23),(3,3,3,24),(3,3,3,25),(3,3,3,26),(3,3,3,27),(3,3,3,28),(3,3,3,29),(3,3,3,30),(3,3,3,31),(3,3,3,32),(3,3,3,33),(3,3,3,34),(3,3,3,35),(3,3,3,36),(3,3,3,37),(3,3,3,38);
/*!40000 ALTER TABLE `Albums_has_Songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bands`
--

DROP TABLE IF EXISTS `Bands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Bands` (
  `BandID` int(11) NOT NULL AUTO_INCREMENT,
  `BandName` varchar(255) NOT NULL,
  `Founded` date DEFAULT NULL,
  `Disbanded` date DEFAULT NULL,
  PRIMARY KEY (`BandID`),
  UNIQUE KEY `BandID_UNIQUE` (`BandID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bands`
--

LOCK TABLES `Bands` WRITE;
/*!40000 ALTER TABLE `Bands` DISABLE KEYS */;
INSERT INTO `Bands` VALUES (1,'Alice In Chains','1987-08-01',NULL),(2,'Mad Season','1994-10-12','1999-01-31'),(3,'Ween','1984-09-15',NULL);
/*!40000 ALTER TABLE `Bands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Musicians`
--

DROP TABLE IF EXISTS `Musicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Musicians` (
  `MusicianID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Instrument` varchar(255) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  PRIMARY KEY (`MusicianID`),
  UNIQUE KEY `MusicianID_UNIQUE` (`MusicianID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Musicians`
--

LOCK TABLES `Musicians` WRITE;
/*!40000 ALTER TABLE `Musicians` DISABLE KEYS */;
INSERT INTO `Musicians` VALUES (1,'Layne Staley','vocals',NULL),(2,'Barrett Martin','drums',NULL),(3,'Mike McCready','guitar',NULL),(4,'John Baker Saunders','bass',NULL),(5,'Mark Lanegan','vocals',NULL),(6,'Skerik','saxophone',NULL),(7,'Chris Cornell','vocals',NULL),(8,'Duff McKagen','bass',NULL),(9,'Jerry Cantrell','guitar',NULL),(10,'Mike Starr','bass',NULL),(11,'Sean Kinney','drums',NULL),(12,'Tom Araya','vocals',NULL),(13,'Mike Inez','bass',NULL),(14,'William DuVall','vocals',NULL),(15,'Mickey Melchiondo (Dean Ween)','guitar/vocals',NULL),(16,'Aaron Freeman (Gene Ween)','vocals/guitar',NULL),(17,'Dave Dreiwitz','bass',NULL),(18,'Claude Coleman Jr.','drums',NULL),(19,'Glenn McClelland','keyboards',NULL),(20,'Andrew Weiss','bass',NULL);
/*!40000 ALTER TABLE `Musicians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Musicians_has_Bands`
--

DROP TABLE IF EXISTS `Musicians_has_Bands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Musicians_has_Bands` (
  `Musicians_MusicianID` int(11) NOT NULL,
  `Bands_BandID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`Musicians_MusicianID`,`Bands_BandID`,`StartDate`),
  KEY `fk_Musicians_has_Bands_Bands1_idx` (`Bands_BandID`),
  KEY `fk_Musicians_has_Bands_Musicians1_idx` (`Musicians_MusicianID`),
  CONSTRAINT `fk_Musicians_has_Bands_Bands1` FOREIGN KEY (`Bands_BandID`) REFERENCES `bands` (`bandid`),
  CONSTRAINT `fk_Musicians_has_Bands_Musicians1` FOREIGN KEY (`Musicians_MusicianID`) REFERENCES `musicians` (`musicianid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Musicians_has_Bands`
--

LOCK TABLES `Musicians_has_Bands` WRITE;
/*!40000 ALTER TABLE `Musicians_has_Bands` DISABLE KEYS */;
INSERT INTO `Musicians_has_Bands` VALUES (1,1,'1987-01-01','2002-01-01'),(1,2,'1994-01-01','1997-01-01'),(2,2,'1994-01-01','2015-01-01'),(3,2,'1994-01-01','2015-01-01'),(4,2,'1994-01-01','1999-01-01'),(5,2,'1994-01-01','1997-01-01'),(6,2,'1994-01-01','1995-01-01'),(7,2,'2014-01-01','2015-01-01'),(8,2,'2014-01-01','2015-01-01'),(9,1,'1987-01-01',NULL),(10,1,'1987-01-01','1993-01-01'),(11,1,'1987-01-01',NULL),(12,1,'1994-01-01','1994-02-01'),(13,1,'1993-01-01',NULL),(14,1,'2006-01-01',NULL),(15,3,'1984-09-15',NULL),(16,3,'1984-09-15',NULL),(17,3,'1997-01-01',NULL),(18,3,'1994-01-01',NULL),(19,3,'1994-01-01',NULL),(20,3,'1989-01-01','1995-01-01');
/*!40000 ALTER TABLE `Musicians_has_Bands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publishers`
--

DROP TABLE IF EXISTS `Publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Publishers` (
  `PublisherID` int(11) NOT NULL AUTO_INCREMENT,
  `PublisherName` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `ZipCode` int(5) DEFAULT NULL,
  `Phone` int(10) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PublisherID`),
  UNIQUE KEY `PublisherID_UNIQUE` (`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publishers`
--

LOCK TABLES `Publishers` WRITE;
/*!40000 ALTER TABLE `Publishers` DISABLE KEYS */;
INSERT INTO `Publishers` VALUES (1,'Sony','1 record way','los angeles','ca',12345,1245,'sony@sony.com'),(2,'Electra','23 disc lane','paolo alto','ca',12457,6547,'e@electra.com'),(3,'Sanctuary','158 Tunes Road','Los Angeles','ca',12345,1234567891,NULL);
/*!40000 ALTER TABLE `Publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Songs`
--

DROP TABLE IF EXISTS `Songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Songs` (
  `SongID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `ReleaseDate` date DEFAULT NULL,
  PRIMARY KEY (`SongID`),
  UNIQUE KEY `SongID_UNIQUE` (`SongID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Songs`
--

LOCK TABLES `Songs` WRITE;
/*!40000 ALTER TABLE `Songs` DISABLE KEYS */;
INSERT INTO `Songs` VALUES (1,'Wake Up','1995-03-14'),(2,'X-Ray Mind','1995-03-14'),(3,'River of Deceit','1995-03-14'),(4,'I\'m Above','1995-03-14'),(5,'Artificial Red','1995-03-14'),(6,'Lifeless Dead','1995-03-14'),(7,'I Don\'t Know Anything','1995-03-14'),(8,'Long Gone Day','1995-03-14'),(9,'November Hotel','1995-03-14'),(10,'All Alone','1995-03-14'),(11,'Them Bones','1992-09-29'),(12,'Dam That River','1992-09-29'),(13,'Rain When I Die','1992-09-29'),(14,'Down In a Hole','1992-09-29'),(15,'Sickman','1992-09-29'),(16,'Rooster','1992-09-29'),(17,'Junkhead','1992-09-29'),(18,'Dirt','1992-09-29'),(19,'God Smack','1992-09-29'),(20,'Iron Gland','1992-09-29'),(21,'Hate To Feel','1992-09-29'),(22,'Angry Chair','1992-09-29'),(23,'Would','1992-09-29'),(24,'It\'s Gonna Be a Long Night','2003-08-05'),(25,'Zoloft','2003-08-05'),(26,'Transdermal Celebration','2003-08-05'),(27,'Among The Tribe','2003-08-05'),(28,'So Many People In The Neighborhood','2003-08-05'),(29,'Tried And True','2003-08-05'),(30,'Happy Colored Marbles','2003-08-05'),(31,'Hey There Fancypants','2003-08-05'),(32,'Captain','2003-08-05'),(33,'Chocolate Town','2003-08-05'),(34,'I Don\'t Want It','2003-08-05'),(35,'The F**ked Jam','2003-08-05'),(36,'Alcon Road','2003-08-05'),(37,'The Argus','2003-08-05'),(38,'If You Could Save Yourself( You\'d Save Us All)','2003-08-05');
/*!40000 ALTER TABLE `Songs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-12 12:06:55
