-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: faryadventures
-- ------------------------------------------------------
-- Server version	10.11.4-MariaDB-1~deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `id_character` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `health` int(11) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `origin` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_character`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES
(1,'EL Fary',86,'N',200,70,1.2,47,'GY'),
(2,'El Cigala',640,'M',200,80,2.4,150,'RU'),
(3,'El Churumbel',33,'M',33,33,3.3,333,'AS'),
(4,'El Kiko',-1,'F',69,100,1.1,420,'RE'),
(5,'El Escalona',45,'N',10,1,1.8,80,'SN');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters_items`
--

DROP TABLE IF EXISTS `characters_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters_items` (
  `id_character_item` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_character` int(10) unsigned NOT NULL,
  `id_item` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_character_item`),
  KEY `id_character` (`id_character`),
  CONSTRAINT `characters_items_ibfk_1` FOREIGN KEY (`id_character`) REFERENCES `characters` (`id_character`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters_items`
--

LOCK TABLES `characters_items` WRITE;
/*!40000 ALTER TABLE `characters_items` DISABLE KEYS */;
INSERT INTO `characters_items` VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4);
/*!40000 ALTER TABLE `characters_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters_weapons`
--

DROP TABLE IF EXISTS `characters_weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters_weapons` (
  `id_character_weapon` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_character` int(10) unsigned NOT NULL,
  `id_weapon` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_character_weapon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters_weapons`
--

LOCK TABLES `characters_weapons` WRITE;
/*!40000 ALTER TABLE `characters_weapons` DISABLE KEYS */;
INSERT INTO `characters_weapons` VALUES
(1,2,3),
(2,3,1),
(3,1,3);
/*!40000 ALTER TABLE `characters_weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id_item` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` char(24) NOT NULL,
  `type` char(24) NOT NULL,
  `equipable` tinyint(1) NOT NULL,
  `consumible` tinyint(1) NOT NULL,
  `rarity` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `shape` int(11) NOT NULL,
  `uses` int(11) NOT NULL,
  `id_character` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES
(1,'Bollo','Comida',0,3,0,5,1,20,1),
(2,'guitarra flamenca','instrumento',1,0,30,67,1,3,4),
(3,'piti','Droga',1,1,80,5,2,1,3),
(4,'portatil','tecnologia',2,5,30,50,9,213,1),
(5,'panderete','instrumento',0,1,1,40,100,98,1),
(6,'piano','instrumento',7,1,1,75,200,30,1),
(7,'escobilla de vater','limpieza',1,0,324,3456,1,1,3);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id_stat` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reputation` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `morality` int(11) DEFAULT NULL,
  `hungrer` int(11) DEFAULT NULL,
  `stamina` int(11) DEFAULT NULL,
  `defense` int(11) DEFAULT NULL,
  `reflex` int(11) DEFAULT NULL,
  `id_character` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_stat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES
(1,100,40,80,0,-1,0,0,1),
(2,69,50,40,0,5,1,10,2),
(3,70,30,75,0,50,7,333,3),
(4,90,60,80,4,0,1,420,4);
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons` (
  `id_weapon` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weapon` char(24) NOT NULL,
  `level` int(24) NOT NULL,
  `price` float NOT NULL,
  `damage` int(24) NOT NULL,
  `critical` int(24) NOT NULL,
  `weigth` float NOT NULL,
  `id_weapon_type` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_weapon`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
INSERT INTO `weapons` VALUES
(1,'puños',5,0,10,5,0.25,1),
(2,'spas-12',42,400,370,23,1.23,2),
(3,'extensible',40,540,680,89,2,1),
(4,'espada',20,400,234,453,2.5,1),
(5,'libros',30,234,876,876,6,2);
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons_types`
--

DROP TABLE IF EXISTS `weapons_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons_types` (
  `id_weapon_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(24) DEFAULT NULL,
  PRIMARY KEY (`id_weapon_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons_types`
--

LOCK TABLES `weapons_types` WRITE;
/*!40000 ALTER TABLE `weapons_types` DISABLE KEYS */;
INSERT INTO `weapons_types` VALUES
(1,'Meele'),
(2,'Proyectil');
/*!40000 ALTER TABLE `weapons_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-11 13:18:52
