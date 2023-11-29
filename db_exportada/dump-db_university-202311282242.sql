-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_university
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `enrolled_subjects`
--

DROP TABLE IF EXISTS `enrolled_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolled_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `enrolled_subjects_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `enrolled_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolled_subjects`
--

LOCK TABLES `enrolled_subjects` WRITE;
/*!40000 ALTER TABLE `enrolled_subjects` DISABLE KEYS */;
INSERT INTO `enrolled_subjects` VALUES (5,9,2),(6,9,1),(7,17,2),(34,18,1),(40,18,4),(41,18,11),(42,18,12),(43,18,7),(47,17,7),(48,17,17),(49,17,11),(50,17,5),(51,5,4),(52,5,11),(53,5,16),(54,18,16);
/*!40000 ALTER TABLE `enrolled_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `student_id` (`student_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,9,1,90),(2,9,2,90),(5,17,2,72),(32,18,1,NULL),(38,18,4,90),(39,18,11,NULL),(40,18,12,NULL),(41,18,7,85),(45,17,7,96),(46,17,17,NULL),(47,17,11,NULL),(48,17,5,NULL),(49,5,4,NULL),(50,5,11,NULL),(51,5,16,NULL),(52,18,16,NULL);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Math'),(2,'Physics'),(4,'Biology'),(5,'English'),(7,'Web Development'),(11,'Graphic Design'),(12,'Computing'),(16,'Business'),(17,'Education'),(18,'Portuguese');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `registration` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `rol` enum('ADMIN','PROFESSOR','STUDENT') DEFAULT NULL,
  `assigned_subject` varchar(100) DEFAULT '0',
  `enrolled_subjects` text DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'Laura','Gómez','laura@example.com','$2y$10$U.Wf7anxI6i4zK1Vtrgd1O8x5KRTrZR/YQgoO5TWOwLaEfXzXxdRK','Avenida Administración 123','1985-05-15','ADMIN',NULL,'2'),(2,NULL,'Daniel','Pérez','daniel@example.com','$2y$10$.itxhgwKt9sf1TFcaQswqu88ktTXuQoHfwX3AMM5QGEBeHk3EKWBy','Calle Principal 456','1980-12-01','ADMIN',NULL,NULL),(4,NULL,'Carlos','Hernández','carlos@example.com','$2y$10$tMlVB44W8fMZj5ZSP5xzs.ZnF7pirIWAhMjqXiCNPwGEmYgM9L8am','Rua 7 setembro 223','1983-04-17','PROFESSOR','2',NULL),(5,789014,'Ana Maria','López','ana@example.com','$2y$10$to8J//elqz.qtJujmJ/9feOLW0uWe2oItKlfMT77RoPicuJfAxO6u','Calle del Saber 987','1998-07-19','STUDENT',NULL,',4,11,16'),(6,345678,'Juan','Martínez','juan@example.com','$2y$10$mn5B7.9aDQTUu2Dz1fkoDuaz7xLNTvwnCGebEIEt2BBZeKMRQlppy','Avenida del Conocimiento 654','1998-07-03','STUDENT',NULL,NULL),(7,901234,'Laura','González','laura2@example.com','$2y$10$ES2MaFOL/eUKtI46GblJ3uEhTDYynLY/VynzeWFhIUqfv3cr0Tdeq','Paseo de la Investigación 321','1997-02-18','STUDENT',NULL,NULL),(8,567890,'Andrés','Sánchez','andres@example.com','$2y$10$j5UhHmZ.M1KXGH.xUDGck.ijiqUwkWHMWXBKeodHThaCy8LCDiv3W','Camino de la Curiosidad 789','1996-09-25','STUDENT','0',NULL),(9,210987,'Valentina','Ramírez','valentina@example.com','$2y$10$zIlbOeklQekdzLKZmZw8Yee62mLoUxukRyhArA7meDDxcHJfTeAg6','Calle del Aprendizaje 456','1999-01-11','STUDENT',NULL,NULL),(10,654321,'Alejandro','Díaz','alejandro@example.com','$2y$10$fkp5/gypNNrhSylv960mOONge2sHtIPjj5W01IOhyXAtC0uSa4tsO','Plaza del Saber 123','2000-06-27','STUDENT',NULL,NULL),(14,NULL,'Josef','Martinez','josef@gmail.com','$2y$10$gFLkSj4gTjOUcRfvghrCu.s5UdKqK66/mSLDG7llbIzpbvuS5fUGq','Miami 567','1996-07-25','PROFESSOR','4',NULL),(15,NULL,'Carlos','Medina','carlos2@example.com','$2y$10$lMXWo/WQSw25aTLr8w7p.ekaceWe1T2j5o9kqNix1iLc/UaMlgEpu','Stanford 554','1970-07-08','PROFESSOR','11',NULL),(17,466560,'Angel','Alvarez','angel@gmail.com','$2y$10$6lf2ok4o9cDDpcm2Xxw7S.TFNX1uHIaAVFCJlcuA5.xDxiO5HXuvm','Rua São João 468','2001-07-24','STUDENT',NULL,'2,7,17,11,5'),(18,664321,'Nicole','Luz','nicole@gmail.com','$2y$10$h7F69xLHqaVxq0taR1BOW.F/sFSco86CTyNuTx0emH8adZV2pT9Yy','Rua Rio 334','2002-11-20','STUDENT',NULL,'1,4,11,12,7,16'),(19,NULL,'Rodolfo','Ramirez','rodolfo@gmail.com','$2y$10$u2FDTM.UPxOcCpBLbL5.vOHRmtkhQVjffGA/GOhBtIM9hKl.BmezS','Calle Esperanza 235','1986-06-08','PROFESSOR','17',NULL),(20,NULL,'Erica','Diaz','erica@gmail.com','y$10$4Hzk0sPQvVXegPf6dBx.P.1ADb7T7kMwBLghYAlVqlhQQLMGxGmIi','Calle Principal 688','1980-10-21','PROFESSOR','0',NULL),(21,NULL,'João','Da Silva','joao@gmail.com','$2y$10$X3rmWgWrjV43RnojfCFtu.pEnjermIW8mqEmhxwwt.wZ9z9703wo2','Rua São Paulo 709','1982-06-30','PROFESSOR','18',NULL),(22,NULL,'Tania','Correia','tania@gmail.com','$2y$10$JtqAoue.v/GQx4Av2/Za/eDVzoommbGIFqCFk/jAqXQRvhMeCb2i.','Rua Colorado 555','1968-11-19','PROFESSOR','0',NULL),(23,NULL,'Ivan','Carreño','ivan@gmail.com','$2y$10$c7juI3M7X1EZJJsoBhgLVehym7SNkknWom7oZPonBoe.zdIeBbBc.','Robles 634','1988-06-21','PROFESSOR','7',NULL),(24,645800,'Aroldo','Padilla','aroldo@gmail.com','$2y$10$U07Gtv8G7N43gLUDIljSheczI1FvahaBoS7Yt2yP/2egfNWQIUyz6','Calle Charallave 452','2002-08-08','STUDENT','0',NULL),(25,325635,'Luis','Garcia','luis@gmail.com','$2y$10$BFGikLFyD00CzbBEz69lTudV5y4s4xLlZwUKUAsnS45ARBMQlGaLK','Calle Aguila 457','2005-07-28','STUDENT','0',NULL),(27,435778,'Juan','Carlos','juan@gmail.com','$2y$10$3VzvOOPsSFQn5WqUrctmh.kYCfC7x7wiN8cSf56WAelwxyG3tO4h6','Plaza 345','2000-07-03','STUDENT','0',NULL),(29,978654,'Jon','Torres','jon@gmail.com','$2y$10$UKrQYXDJdFiR.vJ1gmBgQO1AW5mEC9rBsuVMdrwTdhJmmUh2gSBXO','Calle 9 4545','2001-08-10','PROFESSOR','0',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_university'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-28 22:42:13
