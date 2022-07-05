-- MySQL dump 10.13  Distrib 5.7.34, for osx10.12 (x86_64)
--
-- Host: localhost    Database: societe-espion
-- ------------------------------------------------------
-- Server version	5.7.34

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(360) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_880E0D76E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (5,'boidemarine@hotmail.fr','[\"ROLE_USER\"]','$2y$13$5s7cczd.l91IWFUVy8/GueQNUfGo4QGD1vuR9zkqfzc6Xrku56Xv6','boidé','marine','2022-04-13'),(7,'vrandbryan@gmail.com','[]','$2y$13$DICV/w54LQSopivf/0wO4ecBmkqWiJb2/ThX.FsbjXeyUxikSwEeS','vrand','bryan','2022-07-03');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `identification_code` int(11) NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_268B9C9DBE6CAE90` (`mission_id`),
  CONSTRAINT `FK_268B9C9DBE6CAE90` FOREIGN KEY (`mission_id`) REFERENCES `mission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (19,'boide','marine','2017-01-01',5,'Française',NULL),(20,'CFSDFSDF','chouette','2017-01-01',13,'Française',NULL);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_specialite`
--

DROP TABLE IF EXISTS `agent_specialite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_specialite` (
  `agent_id` int(11) NOT NULL,
  `specialite_id` int(11) NOT NULL,
  PRIMARY KEY (`agent_id`,`specialite_id`),
  KEY `IDX_96902DCE3414710B` (`agent_id`),
  KEY `IDX_96902DCE2195E0F0` (`specialite_id`),
  CONSTRAINT `FK_96902DCE2195E0F0` FOREIGN KEY (`specialite_id`) REFERENCES `specialite` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_96902DCE3414710B` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_specialite`
--

LOCK TABLES `agent_specialite` WRITE;
/*!40000 ALTER TABLE `agent_specialite` DISABLE KEYS */;
INSERT INTO `agent_specialite` VALUES (19,3),(20,3),(20,4);
/*!40000 ALTER TABLE `agent_specialite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cible`
--

DROP TABLE IF EXISTS `cible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cible` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E15DEC3BBE6CAE90` (`mission_id`),
  CONSTRAINT `FK_E15DEC3BBE6CAE90` FOREIGN KEY (`mission_id`) REFERENCES `mission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cible`
--

LOCK TABLES `cible` WRITE;
/*!40000 ALTER TABLE `cible` DISABLE KEYS */;
INSERT INTO `cible` VALUES (3,'hector','pears','2017-01-01','Française','430hj',NULL),(4,'test','test','2022-05-08','Anglaise','230',NULL);
/*!40000 ALTER TABLE `cible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4C62E638BE6CAE90` (`mission_id`),
  CONSTRAINT `FK_4C62E638BE6CAE90` FOREIGN KEY (`mission_id`) REFERENCES `mission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (3,'dak','robert','2017-01-01','française','8940)gd',NULL);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20220401092009','2022-04-01 09:20:16',61),('DoctrineMigrations\\Version20220401094600','2022-04-01 09:46:07',189),('DoctrineMigrations\\Version20220406080805','2022-04-06 08:08:13',82),('DoctrineMigrations\\Version20220406083539','2022-04-06 08:35:46',67),('DoctrineMigrations\\Version20220406084041','2022-04-06 08:40:57',67),('DoctrineMigrations\\Version20220406084345','2022-04-06 08:43:50',63),('DoctrineMigrations\\Version20220406084458','2022-04-06 08:45:04',69),('DoctrineMigrations\\Version20220406084916','2022-04-06 08:49:23',63),('DoctrineMigrations\\Version20220406085815','2022-04-06 08:58:21',153),('DoctrineMigrations\\Version20220406085920','2022-04-06 08:59:27',123),('DoctrineMigrations\\Version20220406090313','2022-04-06 09:03:20',161),('DoctrineMigrations\\Version20220406152439','2022-04-06 15:24:45',156),('DoctrineMigrations\\Version20220408083608','2022-04-08 08:36:16',202),('DoctrineMigrations\\Version20220408084316','2022-04-08 08:43:24',155),('DoctrineMigrations\\Version20220408085026','2022-04-08 08:50:32',288),('DoctrineMigrations\\Version20220412091032','2022-04-12 09:10:40',271),('DoctrineMigrations\\Version20220412185404','2022-04-12 18:54:12',91),('DoctrineMigrations\\Version20220412205851','2022-04-12 20:58:59',109),('DoctrineMigrations\\Version20220413121619','2022-04-13 12:16:27',79);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission`
--

DROP TABLE IF EXISTS `mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `speciality_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9067F23C6BF700BD` (`status_id`),
  KEY `IDX_9067F23CC54C8C93` (`type_id`),
  KEY `IDX_9067F23C3B5A08D7` (`speciality_id`),
  CONSTRAINT `FK_9067F23C3B5A08D7` FOREIGN KEY (`speciality_id`) REFERENCES `specialite` (`id`),
  CONSTRAINT `FK_9067F23C6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `FK_9067F23CC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `type_mission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission`
--

LOCK TABLES `mission` WRITE;
/*!40000 ALTER TABLE `mission` DISABLE KEYS */;
INSERT INTO `mission` VALUES (11,'test1','...','test1','Suisse','2022-06-01','2022-06-30',7,2,3),(12,'dert','...','dzde','Suisse','2022-06-07','2022-06-22',7,2,4);
/*!40000 ALTER TABLE `mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planque`
--

DROP TABLE IF EXISTS `planque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4B3A04BABE6CAE90` (`mission_id`),
  CONSTRAINT `FK_4B3A04BABE6CAE90` FOREIGN KEY (`mission_id`) REFERENCES `mission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planque`
--

LOCK TABLES `planque` WRITE;
/*!40000 ALTER TABLE `planque` DISABLE KEYS */;
INSERT INTO `planque` VALUES (3,5,'test','France','maison',NULL),(4,7,'lsdfdsf','France','maison',NULL);
/*!40000 ALTER TABLE `planque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialite`
--

LOCK TABLES `specialite` WRITE;
/*!40000 ALTER TABLE `specialite` DISABLE KEYS */;
INSERT INTO `specialite` VALUES (3,'espionnage'),(4,'tireur');
/*!40000 ALTER TABLE `specialite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (7,'En Cours');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_mission`
--

DROP TABLE IF EXISTS `type_mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_mission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_mission`
--

LOCK TABLES `type_mission` WRITE;
/*!40000 ALTER TABLE `type_mission` DISABLE KEYS */;
INSERT INTO `type_mission` VALUES (2,'Assassinat');
/*!40000 ALTER TABLE `type_mission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-05 14:16:34
