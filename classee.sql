-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: classee_development
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'American Colonial Society',262,'01',1,NULL,NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_professors`
--

DROP TABLE IF EXISTS `courses_professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_professors` (
  `course_id` int(11) DEFAULT NULL,
  `professor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_professors`
--

LOCK TABLES `courses_professors` WRITE;
/*!40000 ALTER TABLE `courses_professors` DISABLE KEYS */;
INSERT INTO `courses_professors` VALUES (1,1);
/*!40000 ALTER TABLE `courses_professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'History','HIS',1,NULL,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_ratings`
--

DROP TABLE IF EXISTS `professor_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `professor_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `upvotes` int(11) DEFAULT '0',
  `downvotes` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_ratings`
--

LOCK TABLES `professor_ratings` WRITE;
/*!40000 ALTER TABLE `professor_ratings` DISABLE KEYS */;
INSERT INTO `professor_ratings` VALUES (15,'She is a cool professor or something.',1,1,'2010-12-17 21:28:39','2010-12-17 21:28:39',0,0),(16,'blah blah blah',1,1,'2010-12-17 21:44:21','2010-12-17 21:44:21',0,0),(17,'Meheheheheh',1,1,'2010-12-17 21:49:11','2010-12-17 21:49:11',0,0),(18,'Meheheheheh',1,1,'2010-12-17 21:50:49','2010-12-17 21:50:49',0,0),(19,'Meheheheheh',1,1,'2010-12-17 21:51:03','2010-12-17 21:51:03',0,0),(20,'Meheheheheh',1,1,'2010-12-17 21:53:15','2010-12-17 21:53:15',0,0),(21,'Meheheheheh',1,1,'2010-12-17 21:54:17','2010-12-17 21:54:17',0,0),(22,'Meheheheheh',1,1,'2010-12-17 21:55:01','2010-12-17 21:55:01',0,0),(23,'Meheheheheh',1,1,'2010-12-17 21:58:30','2010-12-17 21:58:30',0,0),(24,'Meheheheheh',1,1,'2010-12-17 21:59:09','2010-12-17 21:59:09',0,0),(25,'Meheheheheh',1,1,'2010-12-17 21:59:23','2010-12-17 21:59:23',0,0),(26,'Meheheheheh',1,1,'2010-12-17 21:59:36','2010-12-17 21:59:36',0,0),(27,'FHfdhsfhdshfdshf',1,1,'2010-12-17 22:00:43','2010-12-17 22:00:43',0,0),(28,'FHfdhsfhdshfdshf',1,1,'2010-12-17 22:02:05','2010-12-17 22:02:05',0,0),(29,'FHfdhsfhdshfdshf',1,1,'2010-12-17 22:02:14','2010-12-17 22:02:14',0,0),(30,'FHfdhsfhdshfdshf',1,1,'2010-12-17 22:03:11','2010-12-17 22:03:11',0,0),(31,'FHfdhsfhdshfdshf',1,1,'2010-12-17 22:03:15','2010-12-17 22:03:15',0,0),(32,'hfdsihfjdshjf',1,1,'2010-12-17 22:09:39','2010-12-17 22:09:39',0,0),(33,'fdsafdsafds',1,1,'2010-12-17 22:10:39','2010-12-17 22:10:39',0,0),(34,'sadsadsadsad',1,1,'2010-12-17 22:12:56','2010-12-17 22:12:56',0,0),(35,'dadsadsad',1,1,'2010-12-17 22:13:33','2010-12-17 22:13:33',0,0),(36,'Comment on your professor...',1,1,'2010-12-17 22:15:11','2010-12-17 22:15:11',0,0),(37,'fdfdsf',1,1,'2010-12-17 22:16:42','2010-12-17 22:16:42',0,0),(38,'dsadsadsad',1,1,'2010-12-17 22:19:52','2010-12-18 21:50:27',14,12),(39,'fdsfdsfdsf',1,1,'2010-12-17 22:31:30','2010-12-18 21:34:54',1,0),(40,'ewewqe',1,1,'2010-12-17 23:02:20','2010-12-18 21:50:55',25,3),(41,'Blah blah blah good professor',1,1,'2010-12-18 21:40:30','2010-12-18 21:40:30',0,0),(42,'Blah blah blah',1,1,'2010-12-18 21:50:39','2010-12-18 21:51:07',0,6);
/*!40000 ALTER TABLE `professor_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `office_building` varchar(255) DEFAULT NULL,
  `office_room` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
INSERT INTO `professors` VALUES (1,1,'SBS','123','Jennifer','Anderson','Dr.',NULL,NULL);
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20101212035603'),('20101212035618'),('20101212035707'),('20101212035744'),('20101212035803'),('20101212035815'),('20101212040124'),('20101212180238'),('20101212181533'),('20101212211447'),('20101213202027'),('20101215200106'),('20101218204127');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,'Stony Brook University',1,NULL,NULL);
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'New York','NY',NULL,NULL);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (21,15,1,'Professor',15,'ProfessorRating','tags','2010-12-17 21:28:39'),(22,16,1,'Professor',15,'ProfessorRating','tags','2010-12-17 21:28:39'),(23,17,1,'Professor',15,'ProfessorRating','tags','2010-12-17 21:28:39'),(24,15,1,'Professor',16,'ProfessorRating','tags','2010-12-17 21:44:21'),(25,18,1,'Professor',16,'ProfessorRating','tags','2010-12-17 21:44:21'),(26,19,1,'Professor',16,'ProfessorRating','tags','2010-12-17 21:44:21'),(27,15,1,'Professor',17,'ProfessorRating','tags','2010-12-17 21:49:11'),(28,20,1,'Professor',17,'ProfessorRating','tags','2010-12-17 21:49:11'),(29,15,1,'Professor',18,'ProfessorRating','tags','2010-12-17 21:50:49'),(30,20,1,'Professor',18,'ProfessorRating','tags','2010-12-17 21:50:49'),(31,15,1,'Professor',19,'ProfessorRating','tags','2010-12-17 21:51:03'),(32,20,1,'Professor',19,'ProfessorRating','tags','2010-12-17 21:51:03'),(33,15,1,'Professor',20,'ProfessorRating','tags','2010-12-17 21:53:15'),(34,20,1,'Professor',20,'ProfessorRating','tags','2010-12-17 21:53:15'),(35,15,1,'Professor',21,'ProfessorRating','tags','2010-12-17 21:54:17'),(36,20,1,'Professor',21,'ProfessorRating','tags','2010-12-17 21:54:17'),(37,15,1,'Professor',22,'ProfessorRating','tags','2010-12-17 21:55:01'),(38,20,1,'Professor',22,'ProfessorRating','tags','2010-12-17 21:55:01'),(39,15,1,'Professor',23,'ProfessorRating','tags','2010-12-17 21:58:30'),(40,20,1,'Professor',23,'ProfessorRating','tags','2010-12-17 21:58:30'),(41,15,1,'Professor',24,'ProfessorRating','tags','2010-12-17 21:59:09'),(42,20,1,'Professor',24,'ProfessorRating','tags','2010-12-17 21:59:09'),(43,15,1,'Professor',25,'ProfessorRating','tags','2010-12-17 21:59:23'),(44,20,1,'Professor',25,'ProfessorRating','tags','2010-12-17 21:59:23'),(45,15,1,'Professor',26,'ProfessorRating','tags','2010-12-17 21:59:36'),(46,20,1,'Professor',26,'ProfessorRating','tags','2010-12-17 21:59:36'),(47,15,1,'Professor',27,'ProfessorRating','tags','2010-12-17 22:00:43'),(48,17,1,'Professor',27,'ProfessorRating','tags','2010-12-17 22:00:43'),(49,18,1,'Professor',27,'ProfessorRating','tags','2010-12-17 22:00:43'),(50,21,1,'Professor',27,'ProfessorRating','tags','2010-12-17 22:00:44'),(51,15,1,'Professor',28,'ProfessorRating','tags','2010-12-17 22:02:05'),(52,17,1,'Professor',28,'ProfessorRating','tags','2010-12-17 22:02:05'),(53,18,1,'Professor',28,'ProfessorRating','tags','2010-12-17 22:02:05'),(54,21,1,'Professor',28,'ProfessorRating','tags','2010-12-17 22:02:05'),(55,15,1,'Professor',29,'ProfessorRating','tags','2010-12-17 22:02:14'),(56,17,1,'Professor',29,'ProfessorRating','tags','2010-12-17 22:02:14'),(57,18,1,'Professor',29,'ProfessorRating','tags','2010-12-17 22:02:14'),(58,21,1,'Professor',29,'ProfessorRating','tags','2010-12-17 22:02:14'),(59,15,1,'Professor',30,'ProfessorRating','tags','2010-12-17 22:03:11'),(60,17,1,'Professor',30,'ProfessorRating','tags','2010-12-17 22:03:11'),(61,18,1,'Professor',30,'ProfessorRating','tags','2010-12-17 22:03:11'),(62,21,1,'Professor',30,'ProfessorRating','tags','2010-12-17 22:03:11'),(63,15,1,'Professor',31,'ProfessorRating','tags','2010-12-17 22:03:15'),(64,17,1,'Professor',31,'ProfessorRating','tags','2010-12-17 22:03:15'),(65,18,1,'Professor',31,'ProfessorRating','tags','2010-12-17 22:03:15'),(66,21,1,'Professor',31,'ProfessorRating','tags','2010-12-17 22:03:15'),(67,15,1,'Professor',32,'ProfessorRating','tags','2010-12-17 22:09:39'),(68,16,1,'Professor',32,'ProfessorRating','tags','2010-12-17 22:09:39'),(69,17,1,'Professor',32,'ProfessorRating','tags','2010-12-17 22:09:39'),(70,15,1,'Professor',33,'ProfessorRating','tags','2010-12-17 22:10:39'),(71,17,1,'Professor',33,'ProfessorRating','tags','2010-12-17 22:10:39'),(72,18,1,'Professor',33,'ProfessorRating','tags','2010-12-17 22:10:39'),(73,15,1,'Professor',34,'ProfessorRating','tags','2010-12-17 22:12:56'),(74,22,1,'Professor',34,'ProfessorRating','tags','2010-12-17 22:12:56'),(75,17,1,'Professor',35,'ProfessorRating','tags','2010-12-17 22:13:33'),(76,20,1,'Professor',35,'ProfessorRating','tags','2010-12-17 22:13:33'),(77,15,1,'Professor',37,'ProfessorRating','tags','2010-12-17 22:16:42'),(78,16,1,'Professor',37,'ProfessorRating','tags','2010-12-17 22:16:42'),(79,15,1,'Professor',38,'ProfessorRating','tags','2010-12-17 22:19:52'),(80,18,1,'Professor',38,'ProfessorRating','tags','2010-12-17 22:19:52'),(81,15,1,'Professor',39,'ProfessorRating','tags','2010-12-17 22:31:30'),(82,17,1,'Professor',39,'ProfessorRating','tags','2010-12-17 22:31:30'),(83,19,1,'Professor',39,'ProfessorRating','tags','2010-12-17 22:31:30'),(84,15,1,'Professor',40,'ProfessorRating','tags','2010-12-17 23:02:20'),(85,22,1,'Professor',40,'ProfessorRating','tags','2010-12-17 23:02:20'),(86,15,1,'Professor',41,'ProfessorRating','tags','2010-12-18 21:40:30'),(87,19,1,'Professor',41,'ProfessorRating','tags','2010-12-18 21:40:30'),(88,23,1,'Professor',41,'ProfessorRating','tags','2010-12-18 21:40:30'),(89,16,1,'Professor',42,'ProfessorRating','tags','2010-12-18 21:50:39'),(90,18,1,'Professor',42,'ProfessorRating','tags','2010-12-18 21:50:39'),(91,22,1,'Professor',42,'ProfessorRating','tags','2010-12-18 21:50:39');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (15,'easy'),(16,'fun'),(17,'smart'),(18,'cool'),(19,'hard tests'),(20,'smelly'),(21,'moo'),(22,'meh'),(23,'lol');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `encrypted_password` varchar(128) NOT NULL DEFAULT '',
  `password_salt` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `oauth2_uid` bigint(20) DEFAULT NULL,
  `oauth2_token` varchar(149) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_oauth2_uid` (`oauth2_uid`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-12-18 13:55:33
