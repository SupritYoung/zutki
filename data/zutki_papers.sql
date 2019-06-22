-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: zutki
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `papers`
--

DROP TABLE IF EXISTS `papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `papers` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(500) DEFAULT 'unknown' COMMENT '作者',
  `place` varchar(500) DEFAULT 'unknown' COMMENT '发表机构',
  `title` varchar(500) DEFAULT 'unknown' COMMENT '论文题目',
  `digest` varchar(1000) DEFAULT 'unknown' COMMENT '摘要',
  `source` varchar(100) DEFAULT 'unknown' COMMENT '来源',
  `likeCnt` int(11) DEFAULT '0' COMMENT '喜欢该论文人数',
  `downCnt` int(11) DEFAULT '0' COMMENT '该论文下载人数',
  `date` date DEFAULT NULL COMMENT '发表日期',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='论文表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papers`
--

LOCK TABLES `papers` WRITE;
/*!40000 ALTER TABLE `papers` DISABLE KEYS */;
INSERT INTO `papers` VALUES (1,'Truong Khang Nguyen;','unknown','Investigation of a computer CPU','Abstract(#br)In the present study, the thermal performance of an air-cooled, flat-plate heat sink in forced convection was performed using a three-dimension','Elsevierjournal',61,153,'2019-05-04'),(2,'络首发	陈林林; 韩可; 李伟; 吴嘉树; 辛嘉英','unknown','铬天青S法结合高效液相色谱法测定甲烷氧化菌素含量 网络首发','unknown','食品工业科技',29,12,'2019-03-07'),(3,'薛硕;董曼;张璐璐;尹凯静;王琳','unknown','β-环糊精与香芹酮形成常数的测定及其包合物的制备及表征 网络首发','unknown','食品与发酵工业',0,0,'2019-02-11'),(4,'	Investigation of a computer CPU heat sink under laminar forced convection using a structural ','unknown','	Investigation of a computer CPU heat sink under laminar forced convection using a structural ','unknown','International Journal of Heat and Mass ',3,0,'2019-05-04'),(5,'何玲， 黎加厚','unknown','促进学生深度学习','正深度学习的提出早在20 世纪50 年代中期, 在瑞典工作的两位美国学者FerenceMarton ','计算机教与学. 现代教学',25,41,'2019-05-04'),(6,'	马湧; 王晓鹏; 马莎莎','unknown','	基于Keras深度学习框架下BP神经网络的热轧带钢力学性能预测','unknown','	冶金自动化',12,31,'2019-05-04'),(7,'	齐孟雷','unknown','基于云班课的《数控加工技术》混合式学习研究','unknown','	山东工业技术',0,0,'2019-03-08'),(8,'滕爱杰','unknown','	基于微信的混合式学习模式在独立院校英语教学中的应','unknown','	黑龙江教育学院学报	',23,13,'2019-03-08');
/*!40000 ALTER TABLE `papers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-21 13:43:59
