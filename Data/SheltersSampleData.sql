CREATE DATABASE  IF NOT EXISTS `verify_SHELTERS` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `verify_SHELTERS`;
-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: verify_SHELTERS
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.04.1

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
-- Table structure for table `ProviderLocations`
--

DROP TABLE IF EXISTS `ProviderLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProviderLocations` (
  `LocationID` int(11) NOT NULL,
  `ProviderID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `ContactName` varchar(120) NOT NULL DEFAULT 'Unknown',
  `ContactPhone` int(9) NOT NULL,
  `UnitsTotal` tinyint(4) NOT NULL,
  `UnitsAvailable` tinyint(4) NOT NULL,
  `UnitsOccupied` tinyint(4) NOT NULL,
  PRIMARY KEY (`LocationID`,`ProviderID`),
  KEY `fk_ProviderLocations_Provider` (`ProviderID`),
  KEY `fk_ProviderLocations_Address` (`AddressID`),
  CONSTRAINT `fk_ProviderLocations_Provider` FOREIGN KEY (`ProviderID`) REFERENCES `Providers` (`ProviderID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProviderLocations_Address` FOREIGN KEY (`AddressID`) REFERENCES `Addresses` (`AddressID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Provider Locations Information. Includes Services details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProviderLocations`
--

LOCK TABLES `ProviderLocations` WRITE;
/*!40000 ALTER TABLE `ProviderLocations` DISABLE KEYS */;
INSERT INTO `ProviderLocations` VALUES (77229,2,1,'Belmont Homes ES Burlington','Ella Brown-Hughes',2147483647,46,3,43),(77254,3,17,'OLD - CCDOM Ozanam Inn Middlesex','Unknown',2147483647,40,40,0),(77273,4,8,'ECHH - Operation Warm Heart - Union','Unknown',2147483647,14,2,0),(77282,5,18,'FHS Emergency Shelter Essex','James Cherry',2147483647,46,16,30),(77284,6,9,'Family Promise Shelter -Monmouth','Tracy Boyer',2147483647,14,4,10),(77292,7,14,'GSBS - Emergency Shelter - Essex','Laila Lowery',2147483647,74,50,24),(77293,8,20,'HABcore -Coffey Residence Respite - Monmouth','Steve Heisman',2147483647,1,0,1),(77306,9,15,'HF-FreshStart/Emergency Placement A -Mercer','Brenda Whitaker',2147483647,4,0,4),(77318,10,19,'IHN - Emergency Shelter - Gloucester','Unknown',2147483647,14,10,4),(77319,10,6,'IHN-Homeless Shelter-Hunterdon','Geleen Donovan',2147483647,4,0,4),(77338,11,7,'NDI - 1114 Broad Street - Essex','Dwight Jenkins',2147483647,48,33,15),(77347,12,5,'PERC - Shelter - Hudson','Thomas Harrigan',2013488150,40,2,38),(77361,13,12,'SA Cornerstone Shelter Single Male - Essex','Michele Kroeze',2147483647,6,0,6),(77362,13,12,'SA Cornerstone Shelter Family - Essex','Michele Kroeze',2147483647,3,1,2),(77363,13,12,'SA Cornerstone Shelter Female - Essex','Michele Kroeze',2147483647,4,1,3),(77364,14,3,'Salvation Army Shelter Union','Elizabeth Jones',2147483647,48,7,41),(77371,15,16,'SCIHN-Interfaith Hospitality Network-Sussex','Ashley Bellis',2147483647,14,3,11),(77373,1,13,'The Apostles\' House Emergency Shelter Essex','Vonnice Brown',2147483647,42,14,28),(77376,16,4,'EA THSI Transitional Housing Burlington','Diane Baird',2147483647,82,34,48),(77381,17,2,'TPCS - Servant\'s House - Essex','Christine McCloud',2147483647,23,1,22),(77400,18,10,'VOADV - Agape House - Somerset','Stephanie Williams',2147483647,60,14,46),(77402,19,11,'Eastern Union YMCA - Madison House - Union','Earnestine Brookins',2147483647,36,8,28),(77404,19,11,'Eastern Union YMCA - Project Sustain-Union','Earnestine Brookins',2147483647,10,9,1),(77405,19,11,'Eastern Union YMCA - Men\'s Dormitory - Union','Earnestine Brookins',2147483647,74,40,34);
/*!40000 ALTER TABLE `ProviderLocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Addresses`
--

DROP TABLE IF EXISTS `Addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Addresses` (
  `AddressID` int(11) NOT NULL AUTO_INCREMENT,
  `Street` varchar(2000) CHARACTER SET latin1 DEFAULT NULL,
  `City` varchar(200) CHARACTER SET latin1 NOT NULL,
  `State` varchar(2) CHARACTER SET latin1 NOT NULL,
  `ZIP` varchar(5) CHARACTER SET latin1 NOT NULL,
  `Lat` decimal(11,8) NOT NULL,
  `Lng` decimal(11,8) NOT NULL,
  PRIMARY KEY (`AddressID`),
  KEY `Zip_idx` (`ZIP`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Location Addresses with Geo Location information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Addresses`
--

LOCK TABLES `Addresses` WRITE;
/*!40000 ALTER TABLE `Addresses` DISABLE KEYS */;
INSERT INTO `Addresses` VALUES (1,'229 Madison Ave','Lumberton','NJ','08048',39.98384500,-74.79644500),(2,'1011 Grove Street','Irvington','NJ','07111',40.72436300,-74.22300900),(3,'1018 East Grand Street','Elizabeth','NJ','07201',40.66561800,-74.20618500),(4,'1060 Monmouth Road','Mount Holly','NJ','08060',40.00280000,-74.77050000),(5,'108 36th Street','Union City','NJ','07087',40.77197800,-74.02274100),(6,'10 East Main Street','Flemington','NJ','08822',40.51441600,-74.85874000),(7,'1114 Broad Street','Newark','NJ','07114',40.72353400,-74.17882100),(8,'118 Division Street','Elizabeth','NJ','07201',40.66117500,-74.19971400),(9,'121 Kings Highway','Middletown','NJ','07748',40.39504900,-74.12074100),(10,'121-128 East Main Street','Somerville','NJ','08876',40.56654600,-74.60712700),(11,'135 Madison Avenue','Elizabeth','NJ','07201',40.66539800,-74.21057000),(12,'13 Trinity Place','Montclair','NJ','07042',40.81370100,-74.22136800),(13,'16-18 Grant Street','Newark','NJ','07104',40.74827300,-74.16968500),(14,'175 Munn Avenue','Irvington','NJ','07111',40.73919300,-74.22024700),(15,'1880 Princeton Avenue','Lawrenceville','NJ','08648',40.24759300,-74.74417900),(16,'19 Church Street','Newton','NJ','07860',41.05719200,-74.75452000),(17,'20-22 Abeel Street','New Brunswick','NJ','08901',40.48874800,-74.43997300),(18,'202 Fairmount Avenue','Newark','NJ','07103',40.74035300,-74.19451600),(19,'206 Ellis Street','Glassboro','NJ','08028',39.70199200,-75.11646600),(20,'212 South Pearl Street','Red Bank','NJ','07701',40.34297100,-74.07048800);
/*!40000 ALTER TABLE `Addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Providers`
--

DROP TABLE IF EXISTS `Providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Providers` (
  `ProviderID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) CHARACTER SET latin1 NOT NULL,
  `Description` mediumtext,
  `URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProviderID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='Service Providers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Providers`
--

LOCK TABLES `Providers` WRITE;
/*!40000 ALTER TABLE `Providers` DISABLE KEYS */;
INSERT INTO `Providers` VALUES (1,'The Apostle\'s House',NULL,NULL),(2,'Belmont Homes Housing Program',NULL,NULL),(3,'Catholic Charities',NULL,NULL),(4,'Elizabeth Coalition to House the Homeless',NULL,NULL),(5,'Fairmont Health Services',NULL,NULL),(6,'Family Promise of Monmouth County',NULL,NULL),(7,'Gospel Services Benevolent Society',NULL,NULL),(8,'HABcore',NULL,NULL),(9,'Home Front',NULL,NULL),(10,'Interfaith Hospitality',NULL,NULL),(11,'Newly Destined Inc',NULL,NULL),(12,'Palisades Emergency Corporation',NULL,NULL),(13,'Salvation Army Montclair Corp.',NULL,NULL),(14,'Salvation Army Union',NULL,NULL),(15,'Sussex Interfaith Hospitality Network',NULL,NULL),(16,'Transitional Housing Services Inc',NULL,NULL),(17,'Turning Point Community Services Inc.',NULL,NULL),(18,'VOADV',NULL,NULL),(19,'YMCA of Eastern Union County',NULL,NULL);
/*!40000 ALTER TABLE `Providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'verify_SHELTERS'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-14  6:26:00
