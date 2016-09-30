-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.1.58

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
-- Table structure for table `articals`
--
use test;
DROP TABLE IF EXISTS `articals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `author_id` int(11) NOT NULL,
  `html_file` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articals`
--

LOCK TABLES `articals` WRITE;
/*!40000 ALTER TABLE `articals` DISABLE KEYS */;
INSERT INTO `articals` VALUES (1,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'Data sources','The data to be indexed can generally come from very different sources: SQL databases, plain text files, HTML files, mailboxes, and so on. From Sphinx point of view, the data it indexes is a set of structured documents, each of which has the same set of fields and attributes. This is similar to SQL, where each row would correspond to a document, and each column to either a field or an attribute.',1,'/var/www/articals/1.html'),(2,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'Full-text fields','Full-text fields (or just fields for brevity) are the textual document contents that get indexed by Sphinx, and can be (quickly) searched for keywords.',1,'/var/www/articals/2.html'),(3,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'Attributes','Attributes are additional values associated with each document that can be used to perform additional filtering and sorting during search.\nIt is often desired to additionally process full-text search results based not only on matching document ID and its rank, but on a number of other per-document values as well. For instance, one might need to sort news search results by date and then relevance, or search through products within specified price range, or limit blog search to posts made by selected users, or group results by month. To do that efficiently, Sphinx allows to attach a number of additional attributes to each document, and store their values in the full-text index. Its then possible to use stored values to filter, sort, or group full-text matches.',1,'/var/www/articals/3.html'),(4,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,' MVA (multi-valued attributes)','MVAs, or multi-valued attributes, are an important special type of per-document attributes in Sphinx. MVAs let you attach sets of numeric values to every document. That is useful to implement article tags, product categories, etc. Filtering and group-by (but not sorting) on MVA attributes is supported.',2,'/var/www/articals/4.html'),(5,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'Indexes','\nTo be able to answer full-text search queries fast, Sphinx needs to build a special data structure optimized for such queries from your text data. This structure is called index; and the process of building index from text is calledindexing.Different index types are well suited for different tasks. For example, a disk-based tree-based index would be easy to update (ie. insert new documents to existing index), but rather slow to search. Sphinx architecture allows internally for different index types, or backends, to be implemented comparatively easily.',2,'/var/www/articals/5.html'),(6,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'Restrictions on the source data','There are a few different restrictions imposed on the source data which is going to be indexed by Sphinx, of which the single most important one is:\nALL DOCUMENT IDS MUST BE UNIQUE UNSIGNED NON-ZERO INTEGER NUMBERS (32-BIT OR 64-BIT, DEPENDING ON BUILD TIME SETTINGS).If this requirement is not met, different bad things can happen. For instance, Sphinx can crash with an internal assertion while indexing; or produce strange results when searching due to conflicting IDs. Also, a 1000-pound gorilla might eventually come out of your display and start throwing barrels at you. Youve been warned.',3,'/var/www/articals/6.html'),(7,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'Charsets, case folding, translation tables, and replacement rules','When indexing some index, Sphinx fetches documents from the specified sources, splits the text into words,',3,'/var/www/articals/7.html'),(8,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'SQL data sources (MySQL, PostgreSQL)','Main query, which needs to fetch all the documents, can impose a read lock on the whole table and stall the concurrent queries (eg. INSERTs to MyISAM table), waste a lot of memory for result set, etc. To avoid this, Sphinx supports so-called ranged queries. With ranged queries, Sphinx first fetches min and max document IDs from the table, and then substitutes different ID intervals into main query text and runs the modified query to fetch another chunk of documents. Heres an example.',3,'/var/www/articals/8.html'),(9,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'Live index updates','There are two major approaches to maintaining the full-text index contents up to date. Note, however, that both these approaches deal with the task of full-text data updates, and not attribute updates. Instant attribute updates are supported since version 0.9.8. Refer to UpdateAttributes() API call description for details.',3,'/var/www/articals/9.html');
/*!40000 ALTER TABLE `articals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--



DROP TABLE IF EXISTS `inc_index_counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inc_index_counters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `table_name` varchar(16) NOT NULL,
  `max_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inc_index_counters`
--

LOCK TABLES `inc_index_counters` WRITE;
/*!40000 ALTER TABLE `inc_index_counters` DISABLE KEYS */;
INSERT INTO `inc_index_counters` VALUES (1,'2016-09-28 19:13:06','2016-09-29 01:55:51',NULL,'users',3),(2,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'articals',0);
/*!40000 ALTER TABLE `inc_index_counters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_artical_tag`
--

DROP TABLE IF EXISTS `r_artical_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_artical_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
	  
  `artical_id` int(11) NOT NULL,
`tag_id` int(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_artical_tag`
--

LOCK TABLES `r_artical_tag` WRITE;
/*!40000 ALTER TABLE `r_artical_tag` DISABLE KEYS */;
INSERT INTO `r_artical_tag` VALUES (1,1,1,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(2,2,2,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(3,3,3,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(4,3,2,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(5,4,1,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(6,5,2,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(7,6,3,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(8,6,1,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(9,6,2,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(10,7,1,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(11,7,3,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(12,8,1,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(13,8,2,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(14,8,3,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00',''),(15,9,2,NULL,'2016-09-28 19:13:06','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `r_artical_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'yule'),(2,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'tiyu'),(3,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'dianshiju');
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
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `name` varchar(16) NOT NULL,
  `ext` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'王名杰','{"is_star": true,"interest": ["game","football","basketball","badminton","swimming"]}'),(2,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'李世林','{"is_star": true,"interest": ["basketball","swimming"]}'),(3,'2016-09-28 19:13:06','0000-00-00 00:00:00',NULL,'林警官','{"is_star": false,"interest": ["game","football","swimming"]}');
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

-- Dump completed on 2016-09-29 10:01:52
