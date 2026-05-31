-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: ai_chat_project
-- ------------------------------------------------------
-- Server version	8.0.44

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

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (1,'First Conversation','2026-05-25 02:47:07'),(2,NULL,'2026-05-27 14:31:11'),(3,NULL,'2026-05-27 15:27:49'),(4,NULL,'2026-05-27 15:59:42'),(5,NULL,'2026-05-27 16:19:58'),(6,NULL,'2026-05-27 16:31:16'),(7,NULL,'2026-05-27 16:35:10'),(8,NULL,'2026-05-27 16:38:35'),(9,NULL,'2026-05-27 16:39:35'),(10,NULL,'2026-05-27 16:51:51'),(11,NULL,'2026-05-27 17:03:29'),(12,NULL,'2026-05-27 17:08:42'),(13,NULL,'2026-05-27 17:10:02'),(14,NULL,'2026-05-27 17:10:23'),(15,NULL,'2026-05-27 21:15:37'),(16,NULL,'2026-05-28 09:29:14'),(17,NULL,'2026-05-30 17:06:20'),(18,NULL,'2026-05-30 17:06:24'),(19,NULL,'2026-05-30 17:22:07'),(20,NULL,'2026-05-30 17:30:02'),(21,NULL,'2026-05-30 17:30:14'),(22,NULL,'2026-05-30 17:33:15'),(23,NULL,'2026-05-30 17:45:59'),(24,NULL,'2026-05-30 17:47:04'),(25,NULL,'2026-05-30 17:48:03'),(26,NULL,'2026-05-30 17:50:12'),(27,NULL,'2026-05-30 17:50:59'),(28,NULL,'2026-05-30 17:58:03'),(29,NULL,'2026-05-30 17:58:53'),(30,NULL,'2026-05-30 18:12:37'),(31,NULL,'2026-05-30 18:13:03'),(32,NULL,'2026-05-30 19:55:08'),(33,NULL,'2026-05-30 19:56:12'),(34,NULL,'2026-05-30 20:22:29'),(35,NULL,'2026-05-30 20:28:34'),(36,NULL,'2026-05-30 20:29:02');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `conversation_id` int NOT NULL,
  `role` enum('user','assistant') NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `conversation_id` (`conversation_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,1,'user','Hello','2026-05-25 02:47:07'),(2,1,'assistant','Hi! How can I help you today?','2026-05-25 02:47:07'),(3,1,'user','Hello Jarvis','2026-05-27 15:30:58'),(4,1,'user','Hello Jarvis','2026-05-27 15:31:22'),(5,1,'user','Hello Jarvis','2026-05-27 15:31:28'),(6,1,'user','Hello Jarvis','2026-05-27 12:42:35'),(7,1,'user','Hello Jarvis','2026-05-27 12:42:44'),(8,1,'user','Hello Jarvis','2026-05-27 12:44:59'),(9,1,'user','Hello Jarvis','2026-05-27 12:45:56'),(10,1,'user','Hello Jarvis','2026-05-27 12:48:17'),(11,1,'user','Hello Jarvis','2026-05-27 12:49:53'),(12,1,'user','Hello Jarvis','2026-05-27 12:53:41'),(13,1,'user','Hello Jarvis','2026-05-27 12:54:01'),(14,4,'user','Hello','2026-05-27 12:59:56'),(15,4,'user','Test from debug','2026-05-27 13:01:17'),(16,1,'user','Hello Jarvis','2026-05-27 13:07:24'),(17,4,'user','Hello from test','2026-05-27 13:11:57'),(18,4,'user','Hello non-stream','2026-05-27 13:12:56'),(19,4,'user','Hello non-stream','2026-05-27 13:12:59'),(20,4,'user','Hello non-stream test','2026-05-27 13:13:18'),(21,4,'user','Hello non-stream','2026-05-27 13:14:49'),(22,4,'assistant','Hello! How can I assist you today?','2026-05-27 13:14:51'),(23,4,'user','Hello non-stream','2026-05-27 13:14:52'),(24,4,'assistant','Hello! How can I assist you today?','2026-05-27 13:14:53'),(25,5,'user','Hello Jarvis','2026-05-27 13:20:09'),(26,5,'assistant','Understood! How can I assist you today?','2026-05-27 13:20:10'),(27,5,'user','what day it is?','2026-05-27 13:20:34'),(28,5,'assistant','Hello! How can I assist you today?','2026-05-27 13:20:34'),(29,5,'user','what day it is?','2026-05-27 13:20:51'),(30,5,'assistant','Understood. I am here to assist you with any questions or tasks you have. How may I help you today?','2026-05-27 13:20:52'),(31,5,'user','what day it is?','2026-05-27 13:21:03'),(32,5,'assistant','Understood. How may I assist you today?','2026-05-27 13:21:04'),(33,5,'user','tell me a joke?','2026-05-27 13:23:46'),(34,5,'assistant','Understood! I am here to assist you with any questions or tasks you have. How can I help you today?','2026-05-27 13:23:47'),(35,5,'user','tell me a joke?','2026-05-27 13:31:21'),(36,5,'assistant','Hello! How can I assist you today?','2026-05-27 13:31:25'),(37,5,'user','tell me a joke?','2026-05-27 13:31:30'),(38,5,'assistant','Hello! How can I assist you today?','2026-05-27 13:31:31'),(39,7,'user','Hello Jarvis, how are you?','2026-05-27 13:35:32'),(40,7,'assistant','Hello! I\'m here and ready to assist you. How can I help you today?','2026-05-27 13:35:34'),(41,8,'user','Please explain what causes rain in one paragraph.','2026-05-27 13:38:36'),(42,8,'assistant','Rain is caused by the condensation of water vapor in the atmosphere. When warm air rises, it cools and the water vapor it contains condenses into tiny droplets, forming clouds. As these droplets collide and coalesce, they grow larger. Once they become heavy enough, they fall to the ground as precipitation, which is experienced as rain. Factors such as temperature, humidity, and air pressure influence this process.','2026-05-27 13:38:39'),(43,5,'user','tell me a joke?','2026-05-27 13:39:58'),(44,5,'assistant','Why don\'t scientists trust atoms? Because they make up everything!','2026-05-27 13:40:01'),(45,5,'user','what day of the week it is?','2026-05-27 13:40:20'),(46,5,'assistant','Today is Saturday.','2026-05-27 13:40:20'),(47,5,'user','what day of the week it is?','2026-05-27 13:51:58'),(48,5,'assistant','It\'s Saturday.','2026-05-27 13:52:00'),(49,11,'user','what day of the week it is?','2026-05-27 14:03:33'),(50,11,'assistant','Today is a Saturday.','2026-05-27 14:03:35'),(51,12,'user','דשדשסשד','2026-05-27 14:08:42'),(52,12,'assistant','נראה שההקלדה לא ברורה. האם תוכל לנסות לנסח את השאלה או הבקשה שלך שוב?','2026-05-27 14:08:44'),(53,12,'user','what day it is?','2026-05-27 14:08:55'),(54,12,'assistant','Today is October 19, 2023.','2026-05-27 14:08:56'),(55,12,'user','well me a joke','2026-05-27 14:09:06'),(56,12,'assistant','Why don’t skeletons fight each other? They don’t have the guts!','2026-05-27 14:09:55'),(57,13,'user','tell me a joke','2026-05-27 14:10:03'),(58,13,'assistant','Why don\'t scientists trust atoms? Because they make up everything!','2026-05-27 14:10:04'),(59,14,'user','how are you?','2026-05-27 14:10:24'),(60,14,'assistant','I\'m here and ready to assist you! What do you need help with?','2026-05-27 14:10:24'),(61,15,'user','what day it is?','2026-05-27 18:15:37'),(62,15,'assistant','Today\'s date is October 6, 2023.','2026-05-27 18:15:40'),(63,16,'user','what is the weather in tel aviv?','2026-05-28 06:29:15'),(64,16,'assistant','I can\'t provide real-time weather updates. Please check a weather website or app for the current conditions in Tel Aviv.','2026-05-28 06:29:19'),(65,17,'user','what is the production year of toyota?','2026-05-30 14:06:25'),(66,18,'user','what is the production year of toyota?','2026-05-30 14:06:25'),(67,18,'assistant','Toyota was founded in 1937. The company\'s first production vehicle, the Toyota AA, was manufactured in 1936.','2026-05-30 14:06:41'),(68,17,'assistant','Toyota Motor Corporation was founded in 1937. The production of vehicles began shortly thereafter, with the first model, the Toyota AA, being produced in 1936.','2026-05-30 14:06:42'),(69,19,'user','what day is it?','2026-05-30 14:22:07'),(70,19,'assistant','Today is October 4, 2023.','2026-05-30 14:22:10'),(71,20,'user','what day it is?','2026-05-30 14:30:02'),(72,20,'assistant','Today\'s date is April 27, 2024.','2026-05-30 14:30:03'),(73,21,'user','what day it is?','2026-05-30 14:30:14'),(74,21,'assistant','Today\'s date is December 6, 2023.','2026-05-30 14:30:15'),(75,22,'user','hey jarvis','2026-05-30 14:33:16'),(76,22,'assistant','How can I assist you today?','2026-05-30 14:33:17'),(77,22,'user','what day it is?','2026-05-30 14:33:26'),(78,22,'assistant','Today is September 27, 2023.','2026-05-30 14:33:27'),(79,23,'user','hey jarvis','2026-05-30 14:46:00'),(80,23,'assistant','How can I assist you today?','2026-05-30 14:46:01'),(81,23,'user','what day it is?','2026-05-30 14:46:11'),(82,23,'assistant','Today is October 15, 2023.','2026-05-30 14:46:12'),(83,24,'user','hey jarvis','2026-05-30 14:47:05'),(84,24,'assistant','How can I assist you today?','2026-05-30 14:47:06'),(85,25,'user','hey jarvis','2026-05-30 14:48:04'),(86,25,'assistant','How can I assist you today?','2026-05-30 14:48:04'),(87,26,'user','hey jarvis','2026-05-30 14:50:13'),(88,26,'assistant','How can I assist you today?','2026-05-30 14:50:13'),(89,26,'user','what day it is?','2026-05-30 14:50:19'),(90,26,'assistant','Today is October 4, 2023.','2026-05-30 14:50:20'),(91,26,'user','tell me fun jact','2026-05-30 14:50:28'),(92,26,'assistant','Octopuses have three hearts: two pump blood to the gills, while the third pumps it to the rest of the body.','2026-05-30 14:50:29'),(93,26,'user','ty','2026-05-30 14:50:37'),(94,26,'assistant','You\'re welcome!','2026-05-30 14:50:37'),(95,27,'user','what day it is?','2026-05-30 14:50:59'),(96,27,'assistant','Today is October 5, 2023.','2026-05-30 14:51:00'),(97,27,'user','what day of the week','2026-05-30 14:51:18'),(98,27,'assistant','October 5, 2023, is a Thursday.','2026-05-30 14:51:18'),(99,28,'user','hey jarvis','2026-05-30 14:58:04'),(100,28,'assistant','How can I assist you today?','2026-05-30 14:58:05'),(101,28,'user','how are you?','2026-05-30 14:58:13'),(102,28,'assistant','I\'m here and ready to help you. What do you need?','2026-05-30 14:58:14'),(103,29,'user','hey jarvis','2026-05-30 14:58:54'),(104,29,'assistant','How can I assist you today?','2026-05-30 14:58:54'),(105,30,'user','hey jarvis','2026-05-30 15:12:38'),(106,30,'assistant','How can I assist you today?','2026-05-30 15:12:38'),(107,30,'user','tell about japan','2026-05-30 15:12:46'),(108,30,'assistant','Japan is an island nation in East Asia, located in the Pacific Ocean. It comprises four main islands—Honshu, Hokkaido, Kyushu, and Shikoku—along with numerous smaller islands. The capital is Tokyo, a major global city.\n\nKey features of Japan include:\n\n- **Culture**: A blend of traditional and modern influences, including art, cuisine, and festivals. Notable traditions include tea ceremonies, calligraphy, and seasonal festivals.\n- **Economy**: One of the largest economies in the world, known for technology, automotive industries, and electronics (companies like Toyota, Sony, and Honda).\n- **Geography**: Characterized by mountains and a varied climate; Mount Fuji is a prominent landmark.\n- **History**: Rich history marked by periods of isolation and openness, leading to unique cultural developments. Major historical events include the Meiji Restoration and post-WWII economic growth.\n- **Society**: Japan has a high standard of living, low crime rates, and is known for politeness and respect in social interactions.\n\nIf you need specific information about a particular aspect, let me know!','2026-05-30 15:12:49'),(109,31,'user','ferferfer','2026-05-30 15:13:03'),(110,31,'assistant','It seems like your input might be a typo or unclear. Can you please clarify or provide more details?','2026-05-30 15:13:04'),(111,32,'user','hey jarvis','2026-05-30 16:55:09'),(112,32,'assistant','How can I assist you today?','2026-05-30 16:55:12'),(113,33,'user','what day of the week it is?','2026-05-30 16:56:22'),(114,33,'assistant','Today is Wednesday.','2026-05-30 16:56:25'),(115,34,'user','בדגבדגבגד','2026-05-30 17:22:30'),(116,34,'assistant','נראה שההודעה שלך לא ברורה. האם תוכל לנסח מחדש או לספק יותר פרטים?','2026-05-30 17:22:35'),(117,34,'user','hey','2026-05-30 17:22:42'),(118,34,'assistant','How can I assist you today?','2026-05-30 17:22:43'),(119,35,'user','hey jarvis','2026-05-30 17:28:34'),(120,35,'assistant','How can I assist you today?','2026-05-30 17:28:38'),(121,35,'user','tell me somthing about 3 rotors','2026-05-30 17:28:50'),(122,35,'assistant','Three rotors typically refer to a configuration seen in various types of machinery, including:\n\n1. **Rotorcraft:** Used in helicopters, where multiple rotors can stabilize flight and improve lift.\n2. **Engines:** Some engines, like rotary engines, have three rotors for better efficiency and power output.\n3. **Drones:** Tri-rotor drones have three rotor blades, offering unique flight characteristics compared to quad or single rotor drones.\n\nIf you have a specific context in mind, please let me know!','2026-05-30 17:28:52'),(123,33,'user','what day of the week it is?','2026-05-30 17:29:06'),(124,33,'assistant','Today is Wednesday.','2026-05-30 17:29:06');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ai_chat_project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-30 20:31:40
