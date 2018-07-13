-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: exam
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `code` varchar(45) NOT NULL,
  `stuCode` varchar(45) DEFAULT NULL,
  `quesCode` varchar(45) DEFAULT NULL,
  `answer` varchar(1023) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `code` varchar(45) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `content` varchar(1023) DEFAULT NULL,
  `answer` varchar(1023) DEFAULT NULL,
  `difficulty` varchar(45) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('001','选择题','1+1=( )?\r\nA.1\r\nB.2\r\nC.3\r\nD.4','B','★',5),('002','选择题','中国有（ ）个省级行政区？\r\nA.32\r\nB.33\r\nC.34\r\nD.35','C','★★★',5),('003','选择题','中国共有（ ）人口？\r\nA.10亿\r\nB.13亿\r\nC.14亿\r\nD.15亿','C','★★',5),('004','填空题','中国的经济总量排名世界第（ ）','2','★★',5),('005','填空题','中国的首都是（ ）','北京','★★',5),('006','填空题','世界上领土面积最大的国家是（ ）','俄罗斯','★★★',5),('007','简答题','请简述计算机的含义。','计算机又称电脑，是一种用于高速计算的电子计算机器，可以进行数值计算，又可以进行逻辑计算，还具有存储记忆功能。','★★★',10),('008','简答题','请简述Wi-Fi的含义。','Wi-Fi是一种允许电子设备连接到一个无线局域网的技术。','★★★★',10),('009','论述题','中国的民族政策有什么优势？','略','★★★★',15),('010','论述题','面对国际上的机遇和挑战，中国应该如何做？','略','★★★★★',15);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `code` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `realname` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `identity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('M001','administrator','-9h9ldks6o4fhcjim9td0k0vrm7tensgd','管理员','女','管理员'),('S001','zhangsan','-9u2e8n0a487oeted9gqlkl3boeesuk4m','张三','男','学生'),('S002','lisi','-987h6qublnbr98br42di2r00f3pv870p','李四','女','学生'),('S003','wangwu','179rnrdgrks7dhrmqensnno2k5vvt4sd','王五','男','学生'),('T002','gaolaoshi','-d0j3teuj5bbievgdj0gbh61ja987k6oi','高老师','男','教师');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-13 11:24:38
