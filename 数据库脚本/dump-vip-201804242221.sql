-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: vip
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

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
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` char(32) NOT NULL,
  `account` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` varchar(16) NOT NULL,
  UNIQUE KEY `sys_user_UN` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('1','0001','张三','123456');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vip_consumer`
--

DROP TABLE IF EXISTS `vip_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vip_consumer` (
  `id` char(32) NOT NULL,
  `vip_id` char(32) DEFAULT NULL,
  `whens` datetime DEFAULT NULL,
  `orderno` varchar(32) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `operator_id` char(32) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  KEY `vip_consumer_vip_detail_FK` (`vip_id`),
  KEY `vip_consumer_vip_user_FK` (`operator_id`),
  CONSTRAINT `vip_consumer_vip_detail_FK` FOREIGN KEY (`vip_id`) REFERENCES `vip_detail` (`id`),
  CONSTRAINT `vip_consumer_vip_user_FK` FOREIGN KEY (`operator_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vip_consumer`
--

LOCK TABLES `vip_consumer` WRITE;
/*!40000 ALTER TABLE `vip_consumer` DISABLE KEYS */;
INSERT INTO `vip_consumer` VALUES ('1','1','2018-04-23 20:42:36','20180423000002',5000,'1','客人很友好',0);
/*!40000 ALTER TABLE `vip_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vip_detail`
--

DROP TABLE IF EXISTS `vip_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vip_detail` (
  `id` char(32) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `qq` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `zip` varchar(16) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `rank` tinyint(1) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  UNIQUE KEY `vip_detail_UN` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vip_detail`
--

LOCK TABLES `vip_detail` WRITE;
/*!40000 ALTER TABLE `vip_detail` DISABLE KEYS */;
INSERT INTO `vip_detail` VALUES ('1','13888888888','王老五',1,40,'10000','10000@qq.com','北京中关村xxx路xx号','2000000',NULL,1,15000);
/*!40000 ALTER TABLE `vip_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vip_rank`
--

DROP TABLE IF EXISTS `vip_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vip_rank` (
  `no` tinyint(1) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `neenAmount` int(11) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `discount` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vip_rank`
--

LOCK TABLES `vip_rank` WRITE;
/*!40000 ALTER TABLE `vip_rank` DISABLE KEYS */;
INSERT INTO `vip_rank` VALUES (1,'普通VIP',100,'消费满100',98),(2,'黄金VIP',1000,'消费满1000',95),(3,'白金VIP',5000,'消费满5000',90),(4,'钻石VIP',10000,'消费满10000',85),(5,'终身VIP',20000,'消费满20000',80);
/*!40000 ALTER TABLE `vip_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'vip'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-24 22:21:26
