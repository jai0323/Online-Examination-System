-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: quizsystem
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminlogin` (
  `aid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlogin`
--

LOCK TABLES `adminlogin` WRITE;
/*!40000 ALTER TABLE `adminlogin` DISABLE KEYS */;
INSERT INTO `adminlogin` VALUES (2,'admin@gmail.com','india','Admin');
/*!40000 ALTER TABLE `adminlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `college` (
  `email` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `code` int DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES ('abc@gmail.com','ABC CLG','Bareilly','Uttar Pradesh',163,'india');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `qid` int NOT NULL AUTO_INCREMENT,
  `question` varchar(500) DEFAULT NULL,
  `op1` varchar(100) DEFAULT NULL,
  `op2` varchar(100) DEFAULT NULL,
  `op3` varchar(100) DEFAULT NULL,
  `op4` varchar(100) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL,
  `testId` int DEFAULT NULL,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'C programming language is ','OOP\'s','POP','SQL','HTML','POP',1),(27,'Number of primitive data types in Java are?\r\n\r\n\r\n\r\n\r\n\r\n','6','7','8','9','8',19),(28,'What is the size of float and double in java?\r\n\r\n\r\n\r\n\r\n\r\n','32 and 64','32 and 32','64 and 64','64 and 32','32 and 64',19),(29,'Find the output of the following program.\r\npublic class Solution{\r\n       public static void main(String[] args){\r\n                     short x = 10;\r\n                     x =  x * 5;\r\n                     System.out.print(x);\r\n       }\r\n}','50','10','compile error','exception','compile error',19);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `testId` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  `marks` int DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `testId` (`testId`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`testId`) REFERENCES `test` (`testId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,'student1@gmail.com',19,2,3,'Java programming'),(2,'student1@gmail.com',19,3,3,'Java programming'),(3,'student3@gmail.com',19,3,3,'Java programming'),(4,'student1@gmail.com',19,2,3,'Java programming');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `rid` int NOT NULL AUTO_INCREMENT,
  `testId` int DEFAULT NULL,
  `code` int DEFAULT NULL,
  `review` varchar(200) DEFAULT NULL,
  `resp` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,11,121,'hard',NULL,'student2@gmail.com',4,NULL),(2,19,163,'question should be more',' ','student1@gmail.com',3,'Java programming'),(3,19,163,'question should be more',' ','student3@gmail.com',3,'Java programming');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentlogin`
--

DROP TABLE IF EXISTS `studentlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentlogin` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `pno` varchar(50) DEFAULT NULL,
  `semester` int DEFAULT NULL,
  `code` int DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `ques` varchar(200) DEFAULT NULL,
  `ans` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentlogin`
--

LOCK TABLES `studentlogin` WRITE;
/*!40000 ALTER TABLE `studentlogin` DISABLE KEYS */;
INSERT INTO `studentlogin` VALUES ('manisha@gmail.com','india1','Manisha','Female','8797687780',8,163,'B.tech','my best day?','bday'),('raghav@gmail.com','123','Raghav','on','9389837223',5,NULL,NULL,NULL,NULL),('Saksham@gmai.com','123','Saksham','on','9827732368',7,NULL,NULL,NULL,NULL),('student1@gmail.com','india','Student 1','Male','1234567890',1,163,'B.tech',NULL,NULL),('student3@gmail.com','india','Student 3','Female','7897897890',1,163,'B.tech',NULL,NULL),('xyz@gmail.com','123','xyz','male','843839829',3,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `studentlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `testId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `code` int DEFAULT NULL,
  PRIMARY KEY (`testId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (19,'B.tech 1st semester','Java programming',163);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-27 18:11:08
