-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-ubu2204-log

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES
('356a192b7913b04c54574d18c28d46e6395428ab','i:3;',1737045011),
('356a192b7913b04c54574d18c28d46e6395428ab:timer','i:1737045011;',1737045011),
('asazdazd@gmail.com|172.19.0.5','i:1;',1736955245),
('asazdazd@gmail.com|172.19.0.5:timer','i:1736955245;',1736955245),
('freddie@gmail.com|172.19.0.5','i:1;',1736955209),
('freddie@gmail.com|172.19.0.5:timer','i:1736955209;',1736955209),
('livewire-rate-limiter:9b7a16bbfad47d7a73f48ae3fa8a2d919933fddb','i:1;',1737044965),
('livewire-rate-limiter:9b7a16bbfad47d7a73f48ae3fa8a2d919933fddb:timer','i:1737044965;',1737044965);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `portfolio_id` bigint(20) unsigned NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_portfolio_id_foreign` (`portfolio_id`),
  CONSTRAINT `comments_portfolio_id_foreign` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES
(9,4,17,'prachtig','2025-01-15 15:10:43','2025-01-15 15:10:43'),
(10,8,17,'heel mooi','2025-01-15 18:11:12','2025-01-15 18:11:12'),
(12,2,28,'hey freddie','2025-01-15 18:59:20','2025-01-15 18:59:20'),
(14,1,34,'proper','2025-01-16 10:35:50','2025-01-16 10:35:50'),
(15,19,17,'mooi design!','2025-01-18 14:00:32','2025-01-18 14:00:32'),
(16,20,17,'mooi design','2025-01-18 14:04:03','2025-01-18 14:04:03');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `portfolio_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `likes_user_id_portfolio_id_unique` (`user_id`,`portfolio_id`),
  KEY `likes_portfolio_id_foreign` (`portfolio_id`),
  CONSTRAINT `likes_portfolio_id_foreign` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES
(10,4,17,'2025-01-15 15:10:38','2025-01-15 15:10:38'),
(13,2,28,'2025-01-15 18:59:14','2025-01-15 18:59:14'),
(14,2,17,'2025-01-15 18:59:25','2025-01-15 18:59:25'),
(24,1,34,'2025-01-16 10:30:06','2025-01-16 10:30:06'),
(27,1,35,'2025-01-16 10:38:52','2025-01-16 10:38:52'),
(30,1,36,'2025-01-16 10:39:37','2025-01-16 10:39:37'),
(35,19,17,'2025-01-18 14:00:17','2025-01-18 14:00:17'),
(36,20,17,'2025-01-18 14:04:08','2025-01-18 14:04:08');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES
(5,NULL,'2025-01-13 18:51:20','2025-01-13 18:51:20','scsdc'),
(7,NULL,'2025-01-13 18:54:03','2025-01-13 18:54:03','fdzyue'),
(9,NULL,'2025-01-14 13:20:08','2025-01-14 13:20:08','fezfzef');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2025_01_13_154408_create_messages_table',2),
(5,'2025_01_13_171603_add_content_to_messages_table',3),
(6,'2025_01_13_172731_add_default_value_to_message_column',4),
(7,'2025_01_13_173019_make_message_column_nullable',5),
(8,'2025_01_14_192819_create_portfolios_table',6),
(9,'2025_01_15_083814_create_likes_table',7),
(10,'2025_01_15_083842_create_comments_table',7),
(11,'2025_01_15_105814_add_image_to_portfolios_table',8),
(12,'2025_01_16_163148_create_tags_table',9),
(13,'2025_01_16_163909_create_portfolio_tag_table',9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_tag`
--

DROP TABLE IF EXISTS `portfolio_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `portfolio_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_tag_portfolio_id_foreign` (`portfolio_id`),
  KEY `portfolio_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `portfolio_tag_portfolio_id_foreign` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `portfolio_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_tag`
--

LOCK TABLES `portfolio_tag` WRITE;
/*!40000 ALTER TABLE `portfolio_tag` DISABLE KEYS */;
INSERT INTO `portfolio_tag` VALUES
(1,38,1),
(2,38,2),
(3,39,3),
(4,39,4),
(5,39,5),
(6,39,6),
(7,39,7),
(8,39,8),
(9,40,9),
(10,40,10),
(11,41,11),
(12,72,12),
(13,72,13);
/*!40000 ALTER TABLE `portfolio_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolios`
--

DROP TABLE IF EXISTS `portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolios_user_id_foreign` (`user_id`),
  CONSTRAINT `portfolios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolios`
--

LOCK TABLES `portfolios` WRITE;
/*!40000 ALTER TABLE `portfolios` DISABLE KEYS */;
INSERT INTO `portfolios` VALUES
(17,6,'Gentse Luht','opdracht voor web6 waar we live data tonen via een animatie','https://gentse-luht.onrender.com','2025-01-15 13:58:16','2025-01-15 13:58:16','portfolios/iau0MP7Pc6cjWtgVbOBubXJ83eX9aYC7UkAN2irM.png'),
(28,2,'freddies','coole website','https://gentse-luht.onrender.com','2025-01-15 18:54:00','2025-01-15 18:54:00','portfolios/1rmvbkrRGDaVi8bSBuSIZvqp2xDe1gBpVrIEXgB0.png'),
(33,1,'test','test',NULL,'2025-01-16 09:13:57','2025-01-16 09:13:57',NULL),
(34,1,'ytest1212121','ettey',NULL,'2025-01-16 10:02:21','2025-01-18 12:29:06',NULL),
(35,1,'dzdzd','updrate',NULL,'2025-01-16 10:02:27','2025-01-18 12:28:44',NULL),
(36,1,'dzez','dzdze',NULL,'2025-01-16 10:02:32','2025-01-16 10:02:32',NULL),
(37,1,'gcgv','yvg',NULL,'2025-01-16 10:02:39','2025-01-16 10:02:39',NULL),
(38,1,'test tags','tags',NULL,'2025-01-16 17:03:15','2025-01-16 17:03:15',NULL),
(39,1,'tagsss','tagsgsgsgsgsg',NULL,'2025-01-16 17:08:55','2025-01-16 17:08:55',NULL),
(40,1,'web design project','ciool design dit',NULL,'2025-01-16 17:09:45','2025-01-16 17:09:45',NULL),
(41,1,'xs','dazdazdazd','https://gentse-luht.onrender.com','2025-01-17 12:19:44','2025-01-17 12:19:44','portfolios/66nzBKY7ys1cEARDoxaJnFF6A9lNTtS6GZu2ZTnI.png'),
(42,9,'Ipsum pariatur omnis assumenda quis ex vitae facilis doloribus.','Maxime tempora commodi quidem dolore debitis vel rerum. Culpa ab aliquid hic. Eveniet ducimus dicta numquam consequatur. Assumenda dolores vero beatae ullam.','http://www.predovic.net/','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(43,9,'Totam officiis maiores non est.','Dolor aut non aliquid facere. Enim vel quasi minus corrupti at corporis voluptatibus tempore. Laboriosam fuga nulla adipisci sapiente ea alias est.','http://www.klein.com/similique-quia-facilis-et','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(44,9,'Hic beatae voluptatem sunt ea ad veniam.','Quia voluptatum qui debitis est temporibus in aut. Ut et possimus animi quis explicabo. Rem commodi qui expedita distinctio non earum et. Doloremque natus dicta aperiam qui.','https://gerlach.org/et-ab-facere-nulla-sunt-reprehenderit-itaque.html','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(45,10,'Possimus et voluptas dignissimos.','Neque eaque illo aliquid rem. Ducimus tempora quis culpa voluptate ratione doloribus. Et rem qui doloribus at molestiae. Est ut blanditiis consequuntur assumenda blanditiis nihil aut similique.','http://www.kutch.com/consequatur-perferendis-inventore-maxime-sint','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(46,10,'Reiciendis dolor illum distinctio dolorum eos sunt.','Asperiores vero asperiores dolore ut itaque. Totam accusantium enim voluptatibus est quibusdam magni. Vitae eveniet dolores eos in dolorum fugiat sed blanditiis. Saepe voluptates magnam non libero.','http://www.brekke.com/omnis-illum-aperiam-amet-voluptate-recusandae','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(47,10,'Reprehenderit soluta neque et et.','Est et quod aperiam commodi natus id modi. Accusamus repudiandae dolorem debitis sint dignissimos velit. Ab quasi sed sit delectus molestiae. Consequatur officia culpa commodi est.','http://www.kris.biz/voluptatem-voluptas-nihil-quo-amet-sapiente.html','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(48,11,'Similique eos sed sed aut.','Ut quia et at nemo corrupti est. Molestiae nihil voluptas totam aut excepturi ad voluptas. Reiciendis inventore est magnam quo expedita porro praesentium. Reprehenderit possimus earum asperiores nam totam.','http://www.wilkinson.com/voluptates-praesentium-quis-sapiente-sed-itaque','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(49,11,'Autem iusto architecto pariatur praesentium dolores ut nihil libero.','Recusandae quibusdam pariatur provident non. Quia quia molestiae error aut sunt vitae eum. Non nihil enim porro deleniti quas fugiat. Atque dignissimos voluptatem maxime animi vel.','http://thompson.biz/','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(50,11,'Culpa commodi quidem qui et omnis qui.','Et quas aut eaque reprehenderit aliquid enim labore. Commodi tenetur eum temporibus porro quo quia qui minus. Occaecati ipsum dolorem quia nihil culpa et non.','http://goldner.com/repudiandae-voluptatem-ex-aspernatur-dicta-quia-dolorem','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(51,12,'Esse quis neque aut voluptas commodi omnis.','Consequatur ut ut delectus accusantium iste alias velit. Aliquam magni voluptas et dicta minima corporis. Delectus beatae ab mollitia soluta aspernatur voluptatem sint. Nisi velit quibusdam aut nulla.','http://zieme.com/possimus-voluptatem-magni-dolore-a-id-deserunt-ad','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(52,12,'Excepturi aperiam dicta veniam neque cupiditate.','Quos repellendus nam itaque est suscipit id. Occaecati facere vero vitae rerum id et explicabo aut. Ut sed aut laborum facere maxime temporibus accusantium. Eos est temporibus adipisci aliquam voluptatem. Qui harum aut cumque iure.','http://nicolas.com/quod-consequatur-eos-repudiandae-et-quisquam-quas','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(53,12,'Ut nam vel hic optio quibusdam quis accusantium ut.','Architecto aliquid eveniet corporis repellendus qui. Labore perferendis eius vitae iusto id. Nobis rerum at quos tenetur inventore modi praesentium dolores.','http://gleason.com/','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(54,13,'Asperiores aut omnis numquam voluptates.','Non quas fuga quia molestias. Ipsum quidem est temporibus temporibus perferendis necessitatibus. Possimus id ut voluptatum deserunt quas. Animi ea doloremque et eligendi.','http://www.wisozk.info/quasi-quidem-quos-labore-et-animi-est.html','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(55,13,'Est et inventore repellat modi repudiandae harum architecto qui.','Ut nemo quasi dolores dolorem saepe hic aliquam. Optio inventore quam porro beatae. Odio veritatis inventore error distinctio. Ipsa quis nesciunt quo mollitia quidem qui facere.','http://www.haag.com/','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(56,13,'Deleniti non facilis possimus ut ipsum.','Mollitia veniam ipsum error assumenda veritatis dolor hic. Repellendus quibusdam officiis deserunt enim rerum commodi. Debitis recusandae quos voluptas enim dolorem quisquam ut. Est exercitationem at error illo quas inventore.','http://www.goodwin.com/vel-voluptas-quae-quo-molestiae-dicta-et.html','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(57,14,'Nobis dicta voluptatem repellendus molestiae temporibus.','Aut error consequatur maxime et consequatur ut. Eum perspiciatis reiciendis sit dolore porro. Aliquam dolorem aut est omnis est necessitatibus dolorum.','http://ondricka.com/temporibus-necessitatibus-maiores-et-rerum-reprehenderit.html','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(58,14,'Sed est odio quam et deserunt et.','In quibusdam architecto rerum id tempora doloribus. Nemo consequatur ratione voluptatem quia est. Nulla ducimus rerum sed modi voluptatem. Dolor porro odio dolores quia laborum placeat deserunt et.','http://kovacek.com/iusto-sapiente-enim-mollitia-provident-ipsa-itaque','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(59,14,'Possimus sit molestiae voluptatem reprehenderit.','Dicta a consequatur sapiente et quam. Consequuntur expedita consequatur ipsam consequuntur. Nisi facere tenetur dolorem magnam repellat totam similique quidem. Ipsam provident nobis voluptatum cum cumque delectus.','http://www.smith.biz/','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(60,15,'Maxime dolore quam quod alias dignissimos aperiam numquam.','Excepturi vitae mollitia aut voluptatem ab explicabo molestiae. Occaecati illo asperiores explicabo qui maxime. Adipisci eum sed officia amet quia facilis excepturi aut. Et praesentium deserunt fugit sed placeat in.','http://feeney.net/ut-commodi-quo-nulla-et-ut-iure','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(61,15,'Voluptatibus nihil exercitationem ea voluptates nesciunt et et suscipit.','Et possimus architecto natus tempore. Eos a quia omnis qui. Veniam vitae sapiente debitis eligendi.','https://www.schiller.com/rerum-aperiam-exercitationem-quibusdam-sit-repudiandae-velit-veniam','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(62,15,'At omnis quasi dolores libero laudantium perspiciatis.','Dolores et tempora reiciendis ut doloremque voluptatum recusandae nobis. Eum sed voluptates est ipsa quia eius voluptate.','http://bayer.com/et-qui-at-eveniet-odit','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(63,16,'Consequuntur quam debitis illo doloremque libero occaecati earum.','Deserunt veritatis ab nesciunt dignissimos voluptatem corporis quam. Ullam nulla qui qui nihil blanditiis iure vel. Dolorem doloribus velit nulla ea.','http://halvorson.com/qui-et-autem-ut-ut-officia-quasi.html','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(64,16,'Voluptas autem aspernatur sequi quas voluptatem quos repellat quia.','Quaerat quis tenetur commodi illo quisquam ducimus. Recusandae maxime necessitatibus dolores omnis. Nihil accusamus cumque sit ut est ducimus. Architecto minima earum laudantium voluptatem at.','http://www.wolff.info/odio-consequatur-ut-quisquam-esse-et-qui','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(65,16,'Porro non sed dicta id qui perferendis consequuntur.','Voluptates distinctio est sunt eligendi. Soluta temporibus inventore enim tempore et qui tempora. Velit est sunt aut unde.','http://cummerata.com/','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(66,17,'Quam ratione eos reprehenderit exercitationem itaque aut.','Cumque tempore minus est hic. Voluptatem ab sit rerum voluptas facilis. Mollitia ipsam expedita sunt nobis nulla cumque qui magni.','http://www.sipes.biz/','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(67,17,'Nihil dolorem quae et aut eligendi.','Voluptatem sed totam repellendus eligendi. Ut sint accusantium atque quidem impedit eligendi iure maxime. Sint omnis officiis molestiae.','http://www.stehr.com/','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(68,17,'Veniam itaque ex temporibus est.','Consequatur exercitationem officia ipsa et dolores numquam quidem. Error dolorem quo iure delectus odio. Et exercitationem vel sed iure consequatur neque enim. Ipsa sed aut quia.','http://hane.com/quasi-quod-quo-totam-odit-doloremque','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(69,18,'Consequatur dolore ut quo autem tempore temporibus.','Sed reiciendis molestias dolores. Fugit non nihil et deleniti et libero.','http://littel.net/','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(70,18,'A et nesciunt ut id.','Cupiditate dicta amet et id reiciendis eius eum. Ut sunt sed accusantium vel expedita vel ut. Accusamus excepturi facilis et fuga expedita earum. Ut nihil cumque id et. Dolorem corporis et in.','https://www.mcclure.info/aut-delectus-autem-sit-reprehenderit-possimus-commodi-ducimus-architecto','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(71,18,'Aspernatur facilis similique in at eum dolorum recusandae accusamus.','Laudantium iste et quae. Qui qui eveniet alias. Quibusdam voluptates aut maxime dolorem nulla qui aut. Praesentium omnis est accusamus.','http://jacobs.biz/','2025-01-18 13:22:47','2025-01-18 13:22:47',NULL),
(72,19,'nieuw project','dit is een project dat ik gemaakt heb','https://pomofocus.io/','2025-01-18 14:01:18','2025-01-18 14:01:18',NULL);
/*!40000 ALTER TABLE `portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('jCF1PKF79vVF49GejhPy5lzGWTNq8bGGqDBzQCIG',20,'172.19.0.5','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZ2dzZUZJY0RXMnJmZWZvMEdKbmR6TWFmeXpiNTFyb1FPOUhrRmZmTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHBzOi8vbmljaGUtY29tbXVuaXR5LmRkZXYuc2l0ZS9hZG1pbi9wb3J0Zm9saW9zIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjA7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRWUC5PQ0hLZmFvZVE2dC9SSDRqbzJlQlFId29jY0xFZjFLT3B4eTlLRXNackpiUnlRR0NIaSI7czo4OiJmaWxhbWVudCI7YTowOnt9fQ==',1737209126);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES
(1,'lol','2025-01-16 17:03:15','2025-01-16 17:03:15'),
(2,'xd','2025-01-16 17:03:15','2025-01-16 17:03:15'),
(3,'tag','2025-01-16 17:08:55','2025-01-16 17:08:55'),
(4,'hey','2025-01-16 17:08:55','2025-01-16 17:08:55'),
(5,'dit','2025-01-16 17:08:55','2025-01-16 17:08:55'),
(6,'is','2025-01-16 17:08:55','2025-01-16 17:08:55'),
(7,'een','2025-01-16 17:08:55','2025-01-16 17:08:55'),
(8,'','2025-01-16 17:08:55','2025-01-16 17:08:55'),
(9,'design','2025-01-16 17:09:45','2025-01-16 17:09:45'),
(10,'web','2025-01-16 17:09:45','2025-01-16 17:09:45'),
(11,'nieuw','2025-01-17 12:19:44','2025-01-17 12:19:44'),
(12,'webdev','2025-01-18 14:01:18','2025-01-18 14:01:18'),
(13,'react','2025-01-18 14:01:18','2025-01-18 14:01:18'),
(14,'test','2025-01-18 14:04:25','2025-01-18 14:04:25');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Witze','witzevds@gmail.com',NULL,'$2y$12$QuB/d2YkGpdJ9F3BMbztFOIfyu7pMCLz/MwABLWfW30RCe6evD7Lm',NULL,'2025-01-13 16:56:11','2025-01-13 16:56:11'),
(2,'freddie','witzevdss@gmail.com',NULL,'$2y$12$5yL8/dEj5OLRG0mkrBvZXOFyB0cBYmWCJ5YCC97ax1PGjP5SeABDe',NULL,'2025-01-14 20:41:10','2025-01-14 20:41:10'),
(3,'darry','darry@freddie.be',NULL,'$2y$12$oelPLQqdkrjtnzodpBmDPOH/1UBdMDn67q2fCpSt87cxVN2nAgJZS',NULL,'2025-01-15 08:18:29','2025-01-15 08:18:29'),
(4,'addada','asazdazd@gmail.com',NULL,'$2y$12$U2VfVJn4BVqQ2WnBUqvsJul9dRaxGAu.YjP3R7cpb/P.wxujcKQ.W',NULL,'2025-01-15 08:20:09','2025-01-15 08:20:09'),
(5,'witze','witzevdsss@gmail.com',NULL,'$2y$12$bWDyAvymzLBlKAexW8hkzubvX/M.ye5qs8TgBpQE68w6woBMnm2Hi',NULL,'2025-01-15 08:26:14','2025-01-15 08:26:14'),
(6,'dirk','dirk@gmail.com',NULL,'$2y$12$dTMY1ZaRcTpgTWpnnkn8TuWf.a1x7U4A1UhKCZzEMHyDMmxzViRAe',NULL,'2025-01-15 10:54:28','2025-01-15 10:54:28'),
(7,'dirk','dirkie@gmail.com',NULL,'$2y$12$nFHHolqnqz1TC9oPiJbVX.vovt0JdIRARi2bKtLmNbifyZOUyO7f2',NULL,'2025-01-15 15:36:26','2025-01-15 15:36:26'),
(8,'testing','testing@gmail.com',NULL,'$2y$12$w8H0Vj1N613eFsNlvbUWle0nZyxYdKFVc9o0haNQ9jkpcnThScatW',NULL,'2025-01-15 15:41:22','2025-01-15 15:41:22'),
(9,'Bell Lemke','asanford@example.org','2025-01-18 13:22:42','$2y$12$SIWwFr690/VPiU7XQLhOuuAVkNFl80VfeCweijA4oCCqaLGnACjZW','iJ8DRRbYPX','2025-01-18 13:22:47','2025-01-18 13:22:47'),
(10,'Prof. Izaiah Volkman','joanne77@example.com','2025-01-18 13:22:42','$2y$12$nOa5g6FdDWkbW5Z70df1r.3Ooc2yviNRKlV2LmloDkj9.JG3RbrrK','LHHnLJvnKa','2025-01-18 13:22:47','2025-01-18 13:22:47'),
(11,'Kaylie Schuster','verner.heathcote@example.com','2025-01-18 13:22:43','$2y$12$CH0SloTn2GfhvyCT605ekuseJ7WxtpBAyR3eAsDBOnmXrirPYrv1y','D3tRMFGxLd','2025-01-18 13:22:47','2025-01-18 13:22:47'),
(12,'Mustafa McCullough','omccullough@example.org','2025-01-18 13:22:43','$2y$12$P8gRDRAAj6KAuldl.5w.oeU3Qa1Slz3Qg7aU0ci4GGu3gU3M1flNC','63X3GsVXlZ','2025-01-18 13:22:47','2025-01-18 13:22:47'),
(13,'Constantin Frami','wiza.jairo@example.net','2025-01-18 13:22:44','$2y$12$vz4.EH5IxDTPTdc7sjz2leQGVrivKy.0oNqJW0tvAZIwg6Yq/em9.','Prm1WtEtXT','2025-01-18 13:22:47','2025-01-18 13:22:47'),
(14,'Ora Hand','emilia.schiller@example.net','2025-01-18 13:22:44','$2y$12$L.syLEBwnzFH3xWfxBZc.u6XkpGu5MTWPaHL0CGDkCv0G8ZBU.Tnm','yerHfiiMhS','2025-01-18 13:22:47','2025-01-18 13:22:47'),
(15,'Ms. Mona Wehner IV','eziemann@example.com','2025-01-18 13:22:45','$2y$12$ZUv331RE4ulrgp8mP5PxI.PrKWoQ8anJhU/bhVkMWl3C/I4J1ln.6','i0MAROPBJj','2025-01-18 13:22:47','2025-01-18 13:22:47'),
(16,'Selmer Vandervort','simonis.rigoberto@example.org','2025-01-18 13:22:46','$2y$12$m1zNXeJW6PtpGvw4nholLuVpubAtcbYwlk5gG5CsQAxIZ.lM7MKhO','u1K2lplIx3','2025-01-18 13:22:47','2025-01-18 13:22:47'),
(17,'Dejah Conn','katelin.mccullough@example.net','2025-01-18 13:22:46','$2y$12$X3c2lEI7lhWFTMOVYY/sluisBFEzIHIWNfLyd.jsFCN2GfJvjZgYy','jEICsAM5wN','2025-01-18 13:22:47','2025-01-18 13:22:47'),
(18,'Dillon Kihn DDS','florida74@example.net','2025-01-18 13:22:47','$2y$12$g.nf4Fowo/K6SIToA1mWMenSz64KnCdDof0wXZhOzwpLUWx/ZMOhy','mUPjt99pTb','2025-01-18 13:22:47','2025-01-18 13:22:47'),
(19,'test1234','test1234@gmail.com',NULL,'$2y$12$/qzE/RCfbgH9f7V.TecLKeabyVrNdE4DYzPcR8bGjwFIuBFfuaU7C',NULL,'2025-01-18 14:00:08','2025-01-18 14:00:08'),
(20,'test12345','test12345@gmail.com',NULL,'$2y$12$VP.OCHKfaoeQ6t/RH4jo2eBQHwoccLEf1KOpxy9KEsZrJbRyQGCHi',NULL,'2025-01-18 14:03:37','2025-01-18 14:03:37');
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

-- Dump completed on 2025-01-18 14:09:15
