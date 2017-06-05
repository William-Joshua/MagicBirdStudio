-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: MagicBirdStudio_RBAC
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `AccountInfo`
--

DROP TABLE IF EXISTS `AccountInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccountInfo` (
  `UserID` varchar(16) NOT NULL COMMENT '用户ＩＤ(工号)',
  `UserName` varchar(45) NOT NULL COMMENT '员工姓名',
  `Birthday` datetime DEFAULT NULL,
  `Telephone` varchar(20) NOT NULL,
  `E-Mail` varchar(45) DEFAULT NULL,
  `JobLevel` varchar(45) NOT NULL COMMENT '记录员工职务\n如： \nXXX 部门  XXX 班组 XX(职务)\nXXX 部门 XX(职务)',
  `EntryTime` datetime NOT NULL COMMENT '入职时间',
  `isService` tinyint(1) NOT NULL COMMENT '是否在职',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工基本信息登记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccountInfo`
--

LOCK TABLES `AccountInfo` WRITE;
/*!40000 ALTER TABLE `AccountInfo` DISABLE KEYS */;
INSERT INTO `AccountInfo` VALUES ('mbs_01_01_001','william.d.joshua','1991-10-15 00:00:00','18761801058','njl.yxsky@gmail.com','开发部项目经理','2016-10-01 00:00:00',1);
/*!40000 ALTER TABLE `AccountInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupManager`
--

DROP TABLE IF EXISTS `GroupManager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupManager` (
  `GroupID` int(11) NOT NULL COMMENT '用户组ＩＤ',
  `GroupName` varchar(45) NOT NULL,
  `GroupDescription` text COMMENT '用户组功能描述',
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户组管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupManager`
--

LOCK TABLES `GroupManager` WRITE;
/*!40000 ALTER TABLE `GroupManager` DISABLE KEYS */;
/*!40000 ALTER TABLE `GroupManager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupRoleMapping`
--

DROP TABLE IF EXISTS `GroupRoleMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupRoleMapping` (
  `GroupID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  PRIMARY KEY (`GroupID`),
  KEY `fk_GroupRoleMapping_1_idx` (`RoleID`),
  CONSTRAINT `fk_GroupRoleMapping_Group` FOREIGN KEY (`GroupID`) REFERENCES `GroupManager` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_GroupRoleMapping_Role` FOREIGN KEY (`RoleID`) REFERENCES `RoleInfo` (`RoleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupRoleMapping`
--

LOCK TABLES `GroupRoleMapping` WRITE;
/*!40000 ALTER TABLE `GroupRoleMapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `GroupRoleMapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuInfo`
--

DROP TABLE IF EXISTS `MenuInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MenuInfo` (
  `MenuID` int(11) NOT NULL,
  `MenuName` varchar(45) NOT NULL,
  `WebPath` varchar(200) DEFAULT NULL,
  `MenuICON` varchar(200) NOT NULL,
  `Description` text,
  `ParentMenu` int(11) DEFAULT NULL,
  `MenuSort` int(11) NOT NULL,
  `isEffective` tinyint(1) NOT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能菜单信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuInfo`
--

LOCK TABLES `MenuInfo` WRITE;
/*!40000 ALTER TABLE `MenuInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `MenuInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PermissionInfo`
--

DROP TABLE IF EXISTS `PermissionInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PermissionInfo` (
  `PermissionID` int(11) NOT NULL,
  `PermissionName` varchar(45) NOT NULL COMMENT '权限名称',
  `Description` text COMMENT '权限描述',
  PRIMARY KEY (`PermissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PermissionInfo`
--

LOCK TABLES `PermissionInfo` WRITE;
/*!40000 ALTER TABLE `PermissionInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `PermissionInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PermissionMenuMapping`
--

DROP TABLE IF EXISTS `PermissionMenuMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PermissionMenuMapping` (
  `MenuID` int(11) NOT NULL,
  `PermissionID` int(11) NOT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `fk_PermissionMenuMapping_1_idx` (`PermissionID`),
  CONSTRAINT `fk_PermissionMenuMapping_Menu` FOREIGN KEY (`MenuID`) REFERENCES `MenuInfo` (`MenuID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PermissionMenuMapping_Permission` FOREIGN KEY (`PermissionID`) REFERENCES `PermissionInfo` (`PermissionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限菜单映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PermissionMenuMapping`
--

LOCK TABLES `PermissionMenuMapping` WRITE;
/*!40000 ALTER TABLE `PermissionMenuMapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `PermissionMenuMapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoleInfo`
--

DROP TABLE IF EXISTS `RoleInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleInfo` (
  `RoleID` int(11) NOT NULL COMMENT '角色ID',
  `RoleName` varchar(45) NOT NULL COMMENT '角色名称',
  `RoleDescription` text COMMENT 'RoleDescription',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoleInfo`
--

LOCK TABLES `RoleInfo` WRITE;
/*!40000 ALTER TABLE `RoleInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `RoleInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RolePermissionMapping`
--

DROP TABLE IF EXISTS `RolePermissionMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RolePermissionMapping` (
  `RoleID` int(11) NOT NULL,
  `PermissionID` int(11) NOT NULL,
  PRIMARY KEY (`RoleID`),
  KEY `fk_RolePermissionMapping_1_idx` (`PermissionID`),
  CONSTRAINT `fk_RolePermissionMapping_Permission` FOREIGN KEY (`PermissionID`) REFERENCES `PermissionInfo` (`PermissionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RolePermissionMapping_Role` FOREIGN KEY (`RoleID`) REFERENCES `RoleInfo` (`RoleID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RolePermissionMapping`
--

LOCK TABLES `RolePermissionMapping` WRITE;
/*!40000 ALTER TABLE `RolePermissionMapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `RolePermissionMapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserGroupMapping`
--

DROP TABLE IF EXISTS `UserGroupMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserGroupMapping` (
  `UserID` varchar(16) NOT NULL,
  `GroupID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `fk_UserGroupMapping_1_idx` (`GroupID`),
  CONSTRAINT `fk_UserGroupMapping_Account` FOREIGN KEY (`UserID`) REFERENCES `AccountInfo` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserGroupMapping_Group` FOREIGN KEY (`GroupID`) REFERENCES `GroupManager` (`GroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与用户组映射';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserGroupMapping`
--

LOCK TABLES `UserGroupMapping` WRITE;
/*!40000 ALTER TABLE `UserGroupMapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserGroupMapping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-16 21:59:00
