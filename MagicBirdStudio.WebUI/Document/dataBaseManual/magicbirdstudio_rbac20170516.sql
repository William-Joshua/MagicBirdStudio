-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: magicbirdstudio_rbac
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `accountinfo`
--

DROP TABLE IF EXISTS `accountinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountinfo` (
  `UserID` varchar(16) NOT NULL COMMENT '鐢ㄦ埛锛╋激(宸ュ彿)',
  `UserName` varchar(45) NOT NULL COMMENT '鍛樺伐濮撳悕',
  `Birthday` datetime DEFAULT NULL,
  `Telephone` varchar(20) NOT NULL,
  `E-Mail` varchar(45) DEFAULT NULL,
  `JobLevel` varchar(45) NOT NULL COMMENT '璁板綍鍛樺伐鑱屽姟\n濡傦細 \nXXX 閮ㄩ棬  XXX 鐝?粍 XX(鑱屽姟)\nXXX 閮ㄩ棬 XX(鑱屽姟)',
  `EntryTime` datetime NOT NULL COMMENT '鍏ヨ亴鏃堕棿',
  `isService` tinyint(1) NOT NULL COMMENT '鏄?惁鍦ㄨ亴',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='鍛樺伐鍩烘湰淇℃伅鐧昏?琛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountinfo`
--

LOCK TABLES `accountinfo` WRITE;
/*!40000 ALTER TABLE `accountinfo` DISABLE KEYS */;
INSERT INTO `accountinfo` VALUES ('mbs_01_01_001','william.d.joshua','1991-10-15 00:00:00','18761801058','njl.yxsky@gmail.com','开发部项目经理','2016-10-01 00:00:00',1);
/*!40000 ALTER TABLE `accountinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupmanager`
--

DROP TABLE IF EXISTS `groupmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupmanager` (
  `GroupID` int(11) NOT NULL COMMENT '鐢ㄦ埛缁勶缉锛',
  `GroupName` varchar(45) NOT NULL,
  `GroupDescription` text COMMENT '鐢ㄦ埛缁勫姛鑳芥弿杩',
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='鐢ㄦ埛缁勭?鐞';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupmanager`
--

LOCK TABLES `groupmanager` WRITE;
/*!40000 ALTER TABLE `groupmanager` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grouprolemapping`
--

DROP TABLE IF EXISTS `grouprolemapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grouprolemapping` (
  `GroupID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`GroupID`),
  KEY `fk_GroupRoleMapping_1_idx` (`RoleID`),
  CONSTRAINT `fk_GroupRoleMapping_Group` FOREIGN KEY (`GroupID`) REFERENCES `groupmanager` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_GroupRoleMapping_Role` FOREIGN KEY (`RoleID`) REFERENCES `roleinfo` (`RoleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='鐢ㄦ埛瑙掕壊鏄犲皠';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grouprolemapping`
--

LOCK TABLES `grouprolemapping` WRITE;
/*!40000 ALTER TABLE `grouprolemapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `grouprolemapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuinfo`
--

DROP TABLE IF EXISTS `menuinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menuinfo` (
  `MenuID` int(11) NOT NULL,
  `MenuName` varchar(45) NOT NULL,
  `WebPath` varchar(200) DEFAULT NULL,
  `MenuICON` varchar(200) NOT NULL,
  `Description` text,
  `ParentMenu` int(11) DEFAULT NULL,
  `MenuSort` int(11) NOT NULL,
  `isEffective` tinyint(1) NOT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='鍔熻兘鑿滃崟淇℃伅';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuinfo`
--

LOCK TABLES `menuinfo` WRITE;
/*!40000 ALTER TABLE `menuinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissioninfo`
--

DROP TABLE IF EXISTS `permissioninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissioninfo` (
  `PermissionID` int(11) NOT NULL,
  `PermissionName` varchar(45) NOT NULL COMMENT '鏉冮檺鍚嶇О',
  `Description` text COMMENT '鏉冮檺鎻忚堪',
  PRIMARY KEY (`PermissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='鏉冮檺淇℃伅';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissioninfo`
--

LOCK TABLES `permissioninfo` WRITE;
/*!40000 ALTER TABLE `permissioninfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissioninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissionmenumapping`
--

DROP TABLE IF EXISTS `permissionmenumapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissionmenumapping` (
  `MenuID` int(11) NOT NULL,
  `PermissionID` int(11) NOT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `fk_PermissionMenuMapping_1_idx` (`PermissionID`),
  CONSTRAINT `fk_PermissionMenuMapping_Menu` FOREIGN KEY (`MenuID`) REFERENCES `menuinfo` (`MenuID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PermissionMenuMapping_Permission` FOREIGN KEY (`PermissionID`) REFERENCES `permissioninfo` (`PermissionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='鏉冮檺鑿滃崟鏄犲皠';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissionmenumapping`
--

LOCK TABLES `permissionmenumapping` WRITE;
/*!40000 ALTER TABLE `permissionmenumapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissionmenumapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleinfo`
--

DROP TABLE IF EXISTS `roleinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleinfo` (
  `RoleID` int(11) NOT NULL COMMENT '瑙掕壊ID',
  `RoleName` varchar(45) NOT NULL COMMENT '瑙掕壊鍚嶇О',
  `RoleDescription` text COMMENT 'RoleDescription',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='瑙掕壊淇℃伅';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleinfo`
--

LOCK TABLES `roleinfo` WRITE;
/*!40000 ALTER TABLE `roleinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `roleinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolepermissionmapping`
--

DROP TABLE IF EXISTS `rolepermissionmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolepermissionmapping` (
  `RoleID` int(11) NOT NULL,
  `PermissionID` int(11) NOT NULL,
  PRIMARY KEY (`RoleID`),
  KEY `fk_RolePermissionMapping_1_idx` (`PermissionID`),
  CONSTRAINT `fk_RolePermissionMapping_Permission` FOREIGN KEY (`PermissionID`) REFERENCES `permissioninfo` (`PermissionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RolePermissionMapping_Role` FOREIGN KEY (`RoleID`) REFERENCES `roleinfo` (`RoleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='瑙掕壊鏉冮檺鏄犲皠';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolepermissionmapping`
--

LOCK TABLES `rolepermissionmapping` WRITE;
/*!40000 ALTER TABLE `rolepermissionmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `rolepermissionmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userauth`
--

DROP TABLE IF EXISTS `userauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userauth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(45) NOT NULL COMMENT '用户ID,外键，指向AccountInfo',
  `IdentityType` varchar(45) NOT NULL COMMENT ' 登录类型（手机号 邮箱 用户名）或第三方应用名称（微信 微博等）',
  `Identifier` varchar(45) DEFAULT NULL COMMENT '标识（手机号 邮箱 用户名或第三方应用的唯一标识）',
  `Credential` varchar(45) DEFAULT NULL COMMENT '密码凭证（站内的保存密码，站外的不保存或保存token）',
  PRIMARY KEY (`ID`),
  KEY `FK_AuthAccont_idx` (`UserID`),
  CONSTRAINT `fk_UserAuth_Account` FOREIGN KEY (`UserID`) REFERENCES `accountinfo` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支持第三方登陆的用户验证方式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userauth`
--

LOCK TABLES `userauth` WRITE;
/*!40000 ALTER TABLE `userauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `userauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroupmapping`
--

DROP TABLE IF EXISTS `usergroupmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroupmapping` (
  `UserID` varchar(16) NOT NULL,
  `GroupID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `fk_UserGroupMapping_1_idx` (`GroupID`),
  CONSTRAINT `fk_UserGroupMapping_Account` FOREIGN KEY (`UserID`) REFERENCES `accountinfo` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserGroupMapping_Group` FOREIGN KEY (`GroupID`) REFERENCES `groupmanager` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='鐢ㄦ埛涓庣敤鎴风粍鏄犲皠';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroupmapping`
--

LOCK TABLES `usergroupmapping` WRITE;
/*!40000 ALTER TABLE `usergroupmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroupmapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-16 17:04:26
