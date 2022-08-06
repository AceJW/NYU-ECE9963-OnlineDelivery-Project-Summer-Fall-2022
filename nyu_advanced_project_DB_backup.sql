-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: fooddeliverydatabase.cvrhwyerahpp.us-east-1.rds.amazonaws.com    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `ConversationsWithRepresentative`
--

DROP TABLE IF EXISTS `ConversationsWithRepresentative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ConversationsWithRepresentative` (
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sendFrom` varchar(30) NOT NULL,
  `sendTo` varchar(30) NOT NULL,
  `message` varchar(445) NOT NULL,
  PRIMARY KEY (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConversationsWithRepresentative`
--

LOCK TABLES `ConversationsWithRepresentative` WRITE;
/*!40000 ALTER TABLE `ConversationsWithRepresentative` DISABLE KEYS */;
INSERT INTO `ConversationsWithRepresentative` VALUES ('2022-04-25 00:29:05','cr','marry','11111'),('2022-04-25 00:44:10','marry','cr','Hi, I am encoutering a problem'),('2022-04-25 00:44:20','cr','marry','I\'d like to hear that'),('2022-04-25 00:46:20','lucy','cr','Hi, how the hell can I fix this'),('2022-04-25 00:47:20','cr','lucy','Go to hell'),('2022-04-25 00:48:20','tom','cr','hi'),('2022-04-26 04:41:36','cr','marry','hi'),('2022-04-26 04:41:48','cr','marry','I know what is the problem now');
/*!40000 ALTER TABLE `ConversationsWithRepresentative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurantName` varchar(100) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `categories` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`restaurantName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES ('AAA','tom','Chinese','1 st','Brooklyn','United States',7.21875,'2022-01-24 13:45:30'),('Ace Home','Sally','Chinese','666 Love House','Heart','United States',0,'2022-04-25 22:09:49'),('Alliance','tom','Burgers','7 st','Ontario','United States',4,'2022-04-01 13:45:30'),('Auto Pizza','tom','Italian','6 st','Montgomery	','United States',5,'2022-03-29 13:45:30'),('Best Burgers','tom','Burgers','3 st','Los Angeles','United States',8,'2022-03-26 13:45:30'),('Da Alfredo','tom','Italiann','2 st','New Jersey','United States',9,'2022-03-25 13:45:30'),('Gold Bread','tom','Bakery','8 st','	Steuben','United States',3,'2022-04-02 13:45:30'),('seller1RS','seller1','Chinese','seller1st','sellercity','United States',0,'2022-04-25 20:52:02'),('seller2','seller2','Chinese','seller2 st','seller2 city','United States',0,'2022-04-25 20:56:27'),('Sushi Temple','tom','Japanese','5 st','Albany','United States',6,'2022-03-28 13:45:30'),('TomSAsdf','tom','Japanese','1231 St','uewgui','United States',0,'2022-04-25 16:48:29'),('TomTest','tom>','Chinese','12345 st','New York','United States',0,'2022-04-25 16:45:22'),('TomTest03','tom','Italian','3333 st','3333333 city','United States',0,'2022-04-25 16:52:43'),('Vego Life','tom','Vegetarian','4 st','San Francisco','United States',7,'2022-03-27 13:45:30'),('Young Taco','tom','Mexican','9 st','Chautauqua','United States',2,'2022-02-03 13:45:30');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurantRate`
--

DROP TABLE IF EXISTS `restaurantRate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurantRate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `restaurantName` char(100) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurantRate`
--

LOCK TABLES `restaurantRate` WRITE;
/*!40000 ALTER TABLE `restaurantRate` DISABLE KEYS */;
INSERT INTO `restaurantRate` VALUES (4,'BBB',100,'tom',NULL,NULL,NULL),(6,'PPizzeria Da Alfredo',9,'testPleaseDelete','11122','11122','2022-04-24 23:05:45'),(7,'AAA',9,'testPleaseDelete','12345','123124','2022-04-24 23:18:12'),(8,'AAA',9,'testPleaseDelete','afeaewf','e23AEF','2022-04-24 23:32:20'),(9,'AAA',6.25,'testPleaseDelete','12312','43513','2022-04-25 15:45:56'),(10,'AAA',5.5,'testPleaseDelete','12312211','43513wqed','2022-04-25 15:47:16'),(11,'AAA',7,'testPleaseDelete','adq','1341','2022-04-25 15:48:04'),(15,'AAA',6.75,'seller1','seller1test1','seller1test1','2022-04-25 20:50:12'),(16,'AAA',5.5,'amy','amyAAA','amyAAA','2022-04-25 21:05:45'),(17,'AAA',8.75,'Sally','Great day!','I had a great day with a great man eating a great meal!','2022-04-25 22:06:01');
/*!40000 ALTER TABLE `restaurantRate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `community` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`username`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','123','admin','lucy@gmail.com',NULL),(2,'marry','123','user','mary@gmail.com',NULL),(12,'tom','123','seller','tom@gmail.com',NULL),(14,'abc','123','user','abc@gmail.com',NULL),(17,'amy','123','user','amy@gmail.com',NULL),(23,'jack','123','cr','jack@gmail.com',NULL),(24,'seller1','123','seller','seller1@gmail.com',NULL),(25,'seller2','123','seller','seller2@gmail.com',NULL),(27,'Sally','123456','seller','sally@gmail.com',NULL),(29,'user1','123','user','user1@user1.com',NULL),(36,'cr1','123','cr','cr1@gmail.com',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26  1:59:57
