-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: cl526311166
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Current Database: `cl526311166`
--

/*!40000 DROP DATABASE IF EXISTS `cl526311166`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl526311166` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl526311166`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `value` longtext COLLATE utf8mb4_unicode_ci COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='轮播图';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'2025-03-12 14:29:56','swiper1','file/swiperPicture1.jpg'),(2,'2025-03-12 14:29:56','swiper2','file/swiperPicture2.jpg'),(3,'2025-03-12 14:29:56','swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kaoqinqiandaofabu`
--

DROP TABLE IF EXISTS `kaoqinqiandaofabu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kaoqinqiandaofabu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程名称',
  `dakashijian` datetime DEFAULT NULL COMMENT '打卡时间',
  `guize` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规则',
  `kechengtupian` longtext COLLATE utf8mb4_unicode_ci COMMENT '课程图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='考勤签到发布';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kaoqinqiandaofabu`
--

LOCK TABLES `kaoqinqiandaofabu` WRITE;
/*!40000 ALTER TABLE `kaoqinqiandaofabu` DISABLE KEYS */;
INSERT INTO `kaoqinqiandaofabu` VALUES (1,'2025-03-12 14:29:56','课程名称1','2025-03-12 22:29:56','规则1','file/kaoqinqiandaofabuKechengtupian1.jpg,file/kaoqinqiandaofabuKechengtupian2.jpg,file/kaoqinqiandaofabuKechengtupian3.jpg'),(2,'2025-03-12 14:29:56','课程名称2','2025-03-12 22:29:56','规则2','file/kaoqinqiandaofabuKechengtupian2.jpg,file/kaoqinqiandaofabuKechengtupian3.jpg,file/kaoqinqiandaofabuKechengtupian4.jpg'),(3,'2025-03-12 14:29:56','课程名称3','2025-03-12 22:29:56','规则3','file/kaoqinqiandaofabuKechengtupian3.jpg,file/kaoqinqiandaofabuKechengtupian4.jpg,file/kaoqinqiandaofabuKechengtupian5.jpg'),(4,'2025-03-12 14:29:56','课程名称4','2025-03-12 22:29:56','规则4','file/kaoqinqiandaofabuKechengtupian4.jpg,file/kaoqinqiandaofabuKechengtupian5.jpg,file/kaoqinqiandaofabuKechengtupian6.jpg'),(5,'2025-03-12 14:29:56','课程名称5','2025-03-12 22:29:56','规则5','file/kaoqinqiandaofabuKechengtupian5.jpg,file/kaoqinqiandaofabuKechengtupian6.jpg,file/kaoqinqiandaofabuKechengtupian7.jpg'),(6,'2025-03-12 14:29:56','课程名称6','2025-03-12 22:29:56','规则6','file/kaoqinqiandaofabuKechengtupian6.jpg,file/kaoqinqiandaofabuKechengtupian7.jpg,file/kaoqinqiandaofabuKechengtupian8.jpg'),(7,'2025-03-12 14:29:56','课程名称7','2025-03-12 22:29:56','规则7','file/kaoqinqiandaofabuKechengtupian7.jpg,file/kaoqinqiandaofabuKechengtupian8.jpg,file/kaoqinqiandaofabuKechengtupian9.jpg'),(8,'2025-03-12 14:29:56','课程名称8','2025-03-12 22:29:56','规则8','file/kaoqinqiandaofabuKechengtupian8.jpg,file/kaoqinqiandaofabuKechengtupian9.jpg,file/kaoqinqiandaofabuKechengtupian10.jpg'),(9,'2025-03-12 14:29:56','课程名称9','2025-03-12 22:29:56','规则9','file/kaoqinqiandaofabuKechengtupian9.jpg,file/kaoqinqiandaofabuKechengtupian10.jpg,file/kaoqinqiandaofabuKechengtupian11.jpg'),(10,'2025-03-12 14:29:56','课程名称10','2025-03-12 22:29:56','规则10','file/kaoqinqiandaofabuKechengtupian10.jpg,file/kaoqinqiandaofabuKechengtupian11.jpg,file/kaoqinqiandaofabuKechengtupian12.jpg');
/*!40000 ALTER TABLE `kaoqinqiandaofabu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechengzuoye`
--

DROP TABLE IF EXISTS `kechengzuoye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechengzuoye` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zuoyemingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作业名称',
  `fengmian` longtext COLLATE utf8mb4_unicode_ci COMMENT '封面',
  `zuoyeneirong` longtext COLLATE utf8mb4_unicode_ci COMMENT '作业内容',
  `reversetime` datetime DEFAULT NULL COMMENT '截止提交时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='课程作业';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechengzuoye`
--

LOCK TABLES `kechengzuoye` WRITE;
/*!40000 ALTER TABLE `kechengzuoye` DISABLE KEYS */;
INSERT INTO `kechengzuoye` VALUES (1,'2025-03-12 14:29:56','作业名称1','file/kechengzuoyeFengmian1.jpg,file/kechengzuoyeFengmian2.jpg,file/kechengzuoyeFengmian3.jpg','作业内容1','2025-03-13 00:00:00'),(2,'2025-03-12 14:29:56','作业名称2','file/kechengzuoyeFengmian2.jpg,file/kechengzuoyeFengmian3.jpg,file/kechengzuoyeFengmian4.jpg','作业内容2','2025-03-13 00:00:00'),(3,'2025-03-12 14:29:56','作业名称3','file/kechengzuoyeFengmian3.jpg,file/kechengzuoyeFengmian4.jpg,file/kechengzuoyeFengmian5.jpg','作业内容3','2025-03-13 00:00:00'),(4,'2025-03-12 14:29:56','作业名称4','file/kechengzuoyeFengmian4.jpg,file/kechengzuoyeFengmian5.jpg,file/kechengzuoyeFengmian6.jpg','作业内容4','2025-03-13 00:00:00'),(5,'2025-03-12 14:29:56','作业名称5','file/kechengzuoyeFengmian5.jpg,file/kechengzuoyeFengmian6.jpg,file/kechengzuoyeFengmian7.jpg','作业内容5','2025-03-13 00:00:00'),(6,'2025-03-12 14:29:56','作业名称6','file/kechengzuoyeFengmian6.jpg,file/kechengzuoyeFengmian7.jpg,file/kechengzuoyeFengmian8.jpg','作业内容6','2025-03-13 00:00:00'),(7,'2025-03-12 14:29:56','作业名称7','file/kechengzuoyeFengmian7.jpg,file/kechengzuoyeFengmian8.jpg,file/kechengzuoyeFengmian9.jpg','作业内容7','2025-03-13 00:00:00'),(8,'2025-03-12 14:29:56','作业名称8','file/kechengzuoyeFengmian8.jpg,file/kechengzuoyeFengmian9.jpg,file/kechengzuoyeFengmian10.jpg','作业内容8','2025-03-13 00:00:00'),(9,'2025-03-12 14:29:56','作业名称9','file/kechengzuoyeFengmian9.jpg,file/kechengzuoyeFengmian10.jpg,file/kechengzuoyeFengmian11.jpg','作业内容9','2025-03-13 00:00:00'),(10,'2025-03-12 14:29:56','作业名称10','file/kechengzuoyeFengmian10.jpg,file/kechengzuoyeFengmian11.jpg,file/kechengzuoyeFengmian12.jpg','作业内容10','2025-03-13 00:00:00');
/*!40000 ALTER TABLE `kechengzuoye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2025-03-12 14:29:56','[{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"作业等级统计\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"首页统计\"],\"classname\":\"zuoyepigai\",\"menu\":\"作业批改\",\"menuJump\":\"列表\",\"tableName\":\"zuoyepigai\"}],\"fontClass\":\"icon-common14\",\"menu\":\"作业批改管理\",\"unicode\":\"&#xedfb;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"作业提交数\",\"首页总数\",\"首页统计\",\"作业批改\"],\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"查看\",\"作业批改\",\"首页统计\",\"首页总数\"],\"classname\":\"tijiaozuoye\",\"menu\":\"提交作业\",\"menuJump\":\"列表\",\"tableName\":\"tijiaozuoye\"}],\"fontClass\":\"icon-common44\",\"menu\":\"提交作业管理\",\"unicode\":\"&#xef28;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"提交作业\"],\"appFrontIcon\":\"cuIcon-present\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"kechengzuoye\",\"menu\":\"课程作业\",\"menuJump\":\"列表\",\"tableName\":\"kechengzuoye\"}],\"fontClass\":\"icon-common7\",\"menu\":\"课程作业管理\",\"unicode\":\"&#xedb4;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\"],\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"查看\",\"审核\"],\"classname\":\"weidakashuoming\",\"menu\":\"未打卡说明\",\"menuJump\":\"列表\",\"tableName\":\"weidakashuoming\"}],\"fontClass\":\"icon-common27\",\"menu\":\"未打卡说明管理\",\"unicode\":\"&#xee2c;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"课程签到人数\",\"导出\",\"首页总数\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"查看\",\"首页统计\",\"首页总数\"],\"classname\":\"qiandao\",\"menu\":\"签到\",\"menuJump\":\"列表\",\"tableName\":\"qiandao\"}],\"fontClass\":\"icon-common17\",\"menu\":\"签到管理\",\"unicode\":\"&#xedfe;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"签到\",\"未打卡说明\"],\"appFrontIcon\":\"cuIcon-goods\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"kaoqinqiandaofabu\",\"menu\":\"考勤签到发布\",\"menuJump\":\"列表\",\"tableName\":\"kaoqinqiandaofabu\"}],\"fontClass\":\"icon-common46\",\"menu\":\"考勤签到发布管理\",\"unicode\":\"&#xef3d;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"xuesheng\",\"menu\":\"学生\",\"menuJump\":\"列表\",\"tableName\":\"xuesheng\"}],\"fontClass\":\"icon-user4\",\"menu\":\"学生管理\",\"unicode\":\"&#xef9a;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"users\",\"menu\":\"管理员\",\"menuJump\":\"列表\",\"tableName\":\"users\"}],\"fontClass\":\"icon-common26\",\"menu\":\"管理员管理\",\"unicode\":\"&#xee2b;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"config\",\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"}],\"fontClass\":\"icon-common4\",\"menu\":\"轮播图管理\",\"unicode\":\"&#xedab;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"签到\",\"未打卡说明\"],\"classname\":\"kaoqinqiandaofabu\",\"menu\":\"考勤签到发布\",\"menuJump\":\"列表\",\"tableName\":\"kaoqinqiandaofabu\"}],\"menu\":\"考勤签到发布管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"提交作业\"],\"classname\":\"kechengzuoye\",\"menu\":\"课程作业\",\"menuJump\":\"列表\",\"tableName\":\"kechengzuoye\"}],\"menu\":\"课程作业管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"pathName\":\"users\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"作业等级统计\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-keyboard\",\"buttons\":[\"查看\"],\"classname\":\"zuoyepigai\",\"menu\":\"作业批改\",\"menuJump\":\"列表\",\"tableName\":\"zuoyepigai\"}],\"fontClass\":\"icon-common14\",\"menu\":\"作业批改管理\",\"unicode\":\"&#xedfb;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"作业提交数\",\"首页总数\",\"首页统计\",\"作业批改\"],\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"查看\"],\"classname\":\"tijiaozuoye\",\"menu\":\"提交作业\",\"menuJump\":\"列表\",\"tableName\":\"tijiaozuoye\"}],\"fontClass\":\"icon-common44\",\"menu\":\"提交作业管理\",\"unicode\":\"&#xef28;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\"],\"appFrontIcon\":\"cuIcon-send\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"classname\":\"weidakashuoming\",\"menu\":\"未打卡说明\",\"menuJump\":\"列表\",\"tableName\":\"weidakashuoming\"}],\"fontClass\":\"icon-common27\",\"menu\":\"未打卡说明管理\",\"unicode\":\"&#xee2c;\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"课程签到人数\",\"导出\",\"首页总数\",\"首页统计\"],\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"查看\"],\"classname\":\"qiandao\",\"menu\":\"签到\",\"menuJump\":\"列表\",\"tableName\":\"qiandao\"}],\"fontClass\":\"icon-common17\",\"menu\":\"签到管理\",\"unicode\":\"&#xedfe;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"签到\",\"未打卡说明\"],\"classname\":\"kaoqinqiandaofabu\",\"menu\":\"考勤签到发布\",\"menuJump\":\"列表\",\"tableName\":\"kaoqinqiandaofabu\"}],\"menu\":\"考勤签到发布管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"提交作业\"],\"classname\":\"kechengzuoye\",\"menu\":\"课程作业\",\"menuJump\":\"列表\",\"tableName\":\"kechengzuoye\"}],\"menu\":\"课程作业管理\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"pathName\":\"xuesheng\",\"roleName\":\"学生\",\"tableName\":\"xuesheng\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qiandao`
--

DROP TABLE IF EXISTS `qiandao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qiandao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程名称',
  `xuehao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生姓名',
  `banji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级',
  `kechengtupian` longtext COLLATE utf8mb4_unicode_ci COMMENT '课程图片',
  `dakashijian` datetime DEFAULT NULL COMMENT '打卡时间',
  `qiandaorenshu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '签到人数',
  `crossuserid` bigint(20) DEFAULT NULL COMMENT '跨表用户id',
  `crossrefid` bigint(20) DEFAULT NULL COMMENT '跨表主键id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='签到';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qiandao`
--

LOCK TABLES `qiandao` WRITE;
/*!40000 ALTER TABLE `qiandao` DISABLE KEYS */;
INSERT INTO `qiandao` VALUES (1,'2025-03-12 14:29:56','课程名称1','学号1','学生姓名1','班级1','file/qiandaoKechengtupian1.jpg,file/qiandaoKechengtupian2.jpg,file/qiandaoKechengtupian3.jpg','2025-03-12 22:29:56','1',1,1),(2,'2025-03-12 14:29:56','课程名称2','学号2','学生姓名2','班级2','file/qiandaoKechengtupian2.jpg,file/qiandaoKechengtupian3.jpg,file/qiandaoKechengtupian4.jpg','2025-03-12 22:29:56','1',2,2),(3,'2025-03-12 14:29:56','课程名称3','学号3','学生姓名3','班级3','file/qiandaoKechengtupian3.jpg,file/qiandaoKechengtupian4.jpg,file/qiandaoKechengtupian5.jpg','2025-03-12 22:29:56','1',3,3),(4,'2025-03-12 14:29:56','课程名称4','学号4','学生姓名4','班级4','file/qiandaoKechengtupian4.jpg,file/qiandaoKechengtupian5.jpg,file/qiandaoKechengtupian6.jpg','2025-03-12 22:29:56','1',4,4),(5,'2025-03-12 14:29:56','课程名称5','学号5','学生姓名5','班级5','file/qiandaoKechengtupian5.jpg,file/qiandaoKechengtupian6.jpg,file/qiandaoKechengtupian7.jpg','2025-03-12 22:29:56','1',5,5),(6,'2025-03-12 14:29:56','课程名称6','学号6','学生姓名6','班级6','file/qiandaoKechengtupian6.jpg,file/qiandaoKechengtupian7.jpg,file/qiandaoKechengtupian8.jpg','2025-03-12 22:29:56','1',6,6),(7,'2025-03-12 14:29:56','课程名称7','学号7','学生姓名7','班级7','file/qiandaoKechengtupian7.jpg,file/qiandaoKechengtupian8.jpg,file/qiandaoKechengtupian9.jpg','2025-03-12 22:29:56','1',7,7),(8,'2025-03-12 14:29:56','课程名称8','学号8','学生姓名8','班级8','file/qiandaoKechengtupian8.jpg,file/qiandaoKechengtupian9.jpg,file/qiandaoKechengtupian10.jpg','2025-03-12 22:29:56','1',8,8),(9,'2025-03-12 14:29:56','课程名称9','学号9','学生姓名9','班级9','file/qiandaoKechengtupian9.jpg,file/qiandaoKechengtupian10.jpg,file/qiandaoKechengtupian11.jpg','2025-03-12 22:29:56','1',9,9),(10,'2025-03-12 14:29:56','课程名称10','学号10','学生姓名10','班级10','file/qiandaoKechengtupian10.jpg,file/qiandaoKechengtupian11.jpg,file/qiandaoKechengtupian12.jpg','2025-03-12 22:29:56','1',10,10);
/*!40000 ALTER TABLE `qiandao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tijiaozuoye`
--

DROP TABLE IF EXISTS `tijiaozuoye`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tijiaozuoye` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zuoyemingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作业名称',
  `fengmian` longtext COLLATE utf8mb4_unicode_ci COMMENT '封面',
  `xuehao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生姓名',
  `banji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级',
  `tijiaozuoyeneirong` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '提交作业内容',
  `tijiaoshijian` datetime DEFAULT NULL COMMENT '提交时间',
  `zhuangtai` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `tijiaozuoye` int(11) DEFAULT NULL COMMENT '提交作业',
  `crossuserid` bigint(20) DEFAULT NULL COMMENT '跨表用户id',
  `crossrefid` bigint(20) DEFAULT NULL COMMENT '跨表主键id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='提交作业';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tijiaozuoye`
--

LOCK TABLES `tijiaozuoye` WRITE;
/*!40000 ALTER TABLE `tijiaozuoye` DISABLE KEYS */;
INSERT INTO `tijiaozuoye` VALUES (1,'2025-03-12 14:29:56','作业名称1','file/tijiaozuoyeFengmian1.jpg,file/tijiaozuoyeFengmian2.jpg,file/tijiaozuoyeFengmian3.jpg','学号1','学生姓名1','班级1','提交作业内容1','2025-03-12 22:29:56','已批改',1,1,1),(2,'2025-03-12 14:29:56','作业名称2','file/tijiaozuoyeFengmian2.jpg,file/tijiaozuoyeFengmian3.jpg,file/tijiaozuoyeFengmian4.jpg','学号2','学生姓名2','班级2','提交作业内容2','2025-03-12 22:29:56','已批改',2,2,2),(3,'2025-03-12 14:29:56','作业名称3','file/tijiaozuoyeFengmian3.jpg,file/tijiaozuoyeFengmian4.jpg,file/tijiaozuoyeFengmian5.jpg','学号3','学生姓名3','班级3','提交作业内容3','2025-03-12 22:29:56','已批改',3,3,3),(4,'2025-03-12 14:29:56','作业名称4','file/tijiaozuoyeFengmian4.jpg,file/tijiaozuoyeFengmian5.jpg,file/tijiaozuoyeFengmian6.jpg','学号4','学生姓名4','班级4','提交作业内容4','2025-03-12 22:29:56','已批改',4,4,4),(5,'2025-03-12 14:29:56','作业名称5','file/tijiaozuoyeFengmian5.jpg,file/tijiaozuoyeFengmian6.jpg,file/tijiaozuoyeFengmian7.jpg','学号5','学生姓名5','班级5','提交作业内容5','2025-03-12 22:29:56','已批改',5,5,5),(6,'2025-03-12 14:29:56','作业名称6','file/tijiaozuoyeFengmian6.jpg,file/tijiaozuoyeFengmian7.jpg,file/tijiaozuoyeFengmian8.jpg','学号6','学生姓名6','班级6','提交作业内容6','2025-03-12 22:29:56','已批改',6,6,6),(7,'2025-03-12 14:29:56','作业名称7','file/tijiaozuoyeFengmian7.jpg,file/tijiaozuoyeFengmian8.jpg,file/tijiaozuoyeFengmian9.jpg','学号7','学生姓名7','班级7','提交作业内容7','2025-03-12 22:29:56','已批改',7,7,7),(8,'2025-03-12 14:29:56','作业名称8','file/tijiaozuoyeFengmian8.jpg,file/tijiaozuoyeFengmian9.jpg,file/tijiaozuoyeFengmian10.jpg','学号8','学生姓名8','班级8','提交作业内容8','2025-03-12 22:29:56','已批改',8,8,8),(9,'2025-03-12 14:29:56','作业名称9','file/tijiaozuoyeFengmian9.jpg,file/tijiaozuoyeFengmian10.jpg,file/tijiaozuoyeFengmian11.jpg','学号9','学生姓名9','班级9','提交作业内容9','2025-03-12 22:29:56','已批改',9,9,9),(10,'2025-03-12 14:29:56','作业名称10','file/tijiaozuoyeFengmian10.jpg,file/tijiaozuoyeFengmian11.jpg,file/tijiaozuoyeFengmian12.jpg','学号10','学生姓名10','班级10','提交作业内容10','2025-03-12 22:29:56','已批改',10,10,10);
/*!40000 ALTER TABLE `tijiaozuoye` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'admin','users','管理员','oge63lnl07tf0crgck082jjqtji4s5vn','2025-03-12 14:33:09','2025-03-12 15:33:10');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `role` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2025-03-12 14:29:56','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weidakashuoming`
--

DROP TABLE IF EXISTS `weidakashuoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weidakashuoming` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程名称',
  `xuehao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生姓名',
  `banji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级',
  `kechengtupian` longtext COLLATE utf8mb4_unicode_ci COMMENT '课程图片',
  `shuoming` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '说明',
  `shenqingshijian` datetime DEFAULT NULL COMMENT '申请时间',
  `sfsh` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COLLATE utf8mb4_unicode_ci COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='未打卡说明';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weidakashuoming`
--

LOCK TABLES `weidakashuoming` WRITE;
/*!40000 ALTER TABLE `weidakashuoming` DISABLE KEYS */;
INSERT INTO `weidakashuoming` VALUES (1,'2025-03-12 14:29:56','课程名称1','学号1','学生姓名1','班级1','file/weidakashuomingKechengtupian1.jpg,file/weidakashuomingKechengtupian2.jpg,file/weidakashuomingKechengtupian3.jpg','说明1','2025-03-12 22:29:56','是',''),(2,'2025-03-12 14:29:56','课程名称2','学号2','学生姓名2','班级2','file/weidakashuomingKechengtupian2.jpg,file/weidakashuomingKechengtupian3.jpg,file/weidakashuomingKechengtupian4.jpg','说明2','2025-03-12 22:29:56','是',''),(3,'2025-03-12 14:29:56','课程名称3','学号3','学生姓名3','班级3','file/weidakashuomingKechengtupian3.jpg,file/weidakashuomingKechengtupian4.jpg,file/weidakashuomingKechengtupian5.jpg','说明3','2025-03-12 22:29:56','是',''),(4,'2025-03-12 14:29:56','课程名称4','学号4','学生姓名4','班级4','file/weidakashuomingKechengtupian4.jpg,file/weidakashuomingKechengtupian5.jpg,file/weidakashuomingKechengtupian6.jpg','说明4','2025-03-12 22:29:56','是',''),(5,'2025-03-12 14:29:56','课程名称5','学号5','学生姓名5','班级5','file/weidakashuomingKechengtupian5.jpg,file/weidakashuomingKechengtupian6.jpg,file/weidakashuomingKechengtupian7.jpg','说明5','2025-03-12 22:29:56','是',''),(6,'2025-03-12 14:29:56','课程名称6','学号6','学生姓名6','班级6','file/weidakashuomingKechengtupian6.jpg,file/weidakashuomingKechengtupian7.jpg,file/weidakashuomingKechengtupian8.jpg','说明6','2025-03-12 22:29:56','是',''),(7,'2025-03-12 14:29:56','课程名称7','学号7','学生姓名7','班级7','file/weidakashuomingKechengtupian7.jpg,file/weidakashuomingKechengtupian8.jpg,file/weidakashuomingKechengtupian9.jpg','说明7','2025-03-12 22:29:56','是',''),(8,'2025-03-12 14:29:56','课程名称8','学号8','学生姓名8','班级8','file/weidakashuomingKechengtupian8.jpg,file/weidakashuomingKechengtupian9.jpg,file/weidakashuomingKechengtupian10.jpg','说明8','2025-03-12 22:29:56','是',''),(9,'2025-03-12 14:29:56','课程名称9','学号9','学生姓名9','班级9','file/weidakashuomingKechengtupian9.jpg,file/weidakashuomingKechengtupian10.jpg,file/weidakashuomingKechengtupian11.jpg','说明9','2025-03-12 22:29:56','是',''),(10,'2025-03-12 14:29:56','课程名称10','学号10','学生姓名10','班级10','file/weidakashuomingKechengtupian10.jpg,file/weidakashuomingKechengtupian11.jpg,file/weidakashuomingKechengtupian12.jpg','说明10','2025-03-12 22:29:56','是','');
/*!40000 ALTER TABLE `weidakashuoming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuesheng`
--

DROP TABLE IF EXISTS `xuesheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学号',
  `mima` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码',
  `xueshengxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生姓名',
  `xueshengshouji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生手机',
  `banji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级',
  `touxiang` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuesheng`
--

LOCK TABLES `xuesheng` WRITE;
/*!40000 ALTER TABLE `xuesheng` DISABLE KEYS */;
INSERT INTO `xuesheng` VALUES (31,'2025-03-12 14:29:56','学号1','123456','学生姓名1','19819881111','班级1','file/xueshengTouxiang1.jpg'),(32,'2025-03-12 14:29:56','学号2','123456','学生姓名2','19819881112','班级2','file/xueshengTouxiang2.jpg'),(33,'2025-03-12 14:29:56','学号3','123456','学生姓名3','19819881113','班级3','file/xueshengTouxiang3.jpg'),(34,'2025-03-12 14:29:56','学号4','123456','学生姓名4','19819881114','班级4','file/xueshengTouxiang4.jpg'),(35,'2025-03-12 14:29:56','学号5','123456','学生姓名5','19819881115','班级5','file/xueshengTouxiang5.jpg'),(36,'2025-03-12 14:29:56','学号6','123456','学生姓名6','19819881116','班级6','file/xueshengTouxiang6.jpg'),(37,'2025-03-12 14:29:56','学号7','123456','学生姓名7','19819881117','班级7','file/xueshengTouxiang7.jpg'),(38,'2025-03-12 14:29:56','学号8','123456','学生姓名8','19819881118','班级8','file/xueshengTouxiang8.jpg'),(39,'2025-03-12 14:29:56','学号9','123456','学生姓名9','19819881119','班级9','file/xueshengTouxiang9.jpg'),(40,'2025-03-12 14:29:56','学号10','123456','学生姓名10','198198811110','班级10','file/xueshengTouxiang10.jpg');
/*!40000 ALTER TABLE `xuesheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zuoyepigai`
--

DROP TABLE IF EXISTS `zuoyepigai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zuoyepigai` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zuoyemingcheng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '作业名称',
  `fengmian` longtext COLLATE utf8mb4_unicode_ci COMMENT '封面',
  `xuehao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '学生姓名',
  `banji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '班级',
  `tijiaozuoyeneirong` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '提交作业内容',
  `tijiaoshijian` datetime DEFAULT NULL COMMENT '提交时间',
  `zuoyefenshu` double NOT NULL COMMENT '作业分数',
  `pingjia` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评价',
  `dengji` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='作业批改';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zuoyepigai`
--

LOCK TABLES `zuoyepigai` WRITE;
/*!40000 ALTER TABLE `zuoyepigai` DISABLE KEYS */;
INSERT INTO `zuoyepigai` VALUES (1,'2025-03-12 14:29:56','作业名称1','file/zuoyepigaiFengmian1.jpg,file/zuoyepigaiFengmian2.jpg,file/zuoyepigaiFengmian3.jpg','学号1','学生姓名1','班级1','提交作业内容1','2025-03-12 22:29:56',1,'评价1','优秀'),(2,'2025-03-12 14:29:56','作业名称2','file/zuoyepigaiFengmian2.jpg,file/zuoyepigaiFengmian3.jpg,file/zuoyepigaiFengmian4.jpg','学号2','学生姓名2','班级2','提交作业内容2','2025-03-12 22:29:56',2,'评价2','优秀'),(3,'2025-03-12 14:29:56','作业名称3','file/zuoyepigaiFengmian3.jpg,file/zuoyepigaiFengmian4.jpg,file/zuoyepigaiFengmian5.jpg','学号3','学生姓名3','班级3','提交作业内容3','2025-03-12 22:29:56',3,'评价3','优秀'),(4,'2025-03-12 14:29:56','作业名称4','file/zuoyepigaiFengmian4.jpg,file/zuoyepigaiFengmian5.jpg,file/zuoyepigaiFengmian6.jpg','学号4','学生姓名4','班级4','提交作业内容4','2025-03-12 22:29:56',4,'评价4','优秀'),(5,'2025-03-12 14:29:56','作业名称5','file/zuoyepigaiFengmian5.jpg,file/zuoyepigaiFengmian6.jpg,file/zuoyepigaiFengmian7.jpg','学号5','学生姓名5','班级5','提交作业内容5','2025-03-12 22:29:56',5,'评价5','优秀'),(6,'2025-03-12 14:29:56','作业名称6','file/zuoyepigaiFengmian6.jpg,file/zuoyepigaiFengmian7.jpg,file/zuoyepigaiFengmian8.jpg','学号6','学生姓名6','班级6','提交作业内容6','2025-03-12 22:29:56',6,'评价6','优秀'),(7,'2025-03-12 14:29:56','作业名称7','file/zuoyepigaiFengmian7.jpg,file/zuoyepigaiFengmian8.jpg,file/zuoyepigaiFengmian9.jpg','学号7','学生姓名7','班级7','提交作业内容7','2025-03-12 22:29:56',7,'评价7','优秀'),(8,'2025-03-12 14:29:56','作业名称8','file/zuoyepigaiFengmian8.jpg,file/zuoyepigaiFengmian9.jpg,file/zuoyepigaiFengmian10.jpg','学号8','学生姓名8','班级8','提交作业内容8','2025-03-12 22:29:56',8,'评价8','优秀'),(9,'2025-03-12 14:29:56','作业名称9','file/zuoyepigaiFengmian9.jpg,file/zuoyepigaiFengmian10.jpg,file/zuoyepigaiFengmian11.jpg','学号9','学生姓名9','班级9','提交作业内容9','2025-03-12 22:29:56',9,'评价9','优秀'),(10,'2025-03-12 14:29:56','作业名称10','file/zuoyepigaiFengmian10.jpg,file/zuoyepigaiFengmian11.jpg,file/zuoyepigaiFengmian12.jpg','学号10','学生姓名10','班级10','提交作业内容10','2025-03-12 22:29:56',10,'评价10','优秀');
/*!40000 ALTER TABLE `zuoyepigai` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-27 18:23:39
