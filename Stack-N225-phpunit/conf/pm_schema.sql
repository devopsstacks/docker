-- MySQL dump 10.13  Distrib 5.5.62, for Linux (x86_64)
--
-- Host: localhost    Database: wf_workflow
-- ------------------------------------------------------
-- Server version	5.5.62

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
-- Table structure for table `ABE_CONFIGURATION`
--

DROP TABLE IF EXISTS `ABE_CONFIGURATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ABE_CONFIGURATION` (
  `ABE_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `ABE_TYPE` varchar(10) NOT NULL DEFAULT '',
  `ABE_TEMPLATE` varchar(100) NOT NULL DEFAULT '',
  `ABE_DYN_TYPE` varchar(10) NOT NULL DEFAULT 'NORMAL',
  `DYN_UID` varchar(32) NOT NULL DEFAULT '',
  `ABE_EMAIL_FIELD` varchar(255) NOT NULL DEFAULT '',
  `ABE_ACTION_FIELD` varchar(255) DEFAULT '',
  `ABE_CASE_NOTE_IN_RESPONSE` int(11) DEFAULT '0',
  `ABE_FORCE_LOGIN` int(11) DEFAULT '0',
  `ABE_CREATE_DATE` datetime NOT NULL,
  `ABE_UPDATE_DATE` datetime DEFAULT NULL,
  `ABE_SUBJECT_FIELD` varchar(100) DEFAULT '',
  `ABE_MAILSERVER_OR_MAILCURRENT` int(11) DEFAULT '0',
  `ABE_CUSTOM_GRID` mediumtext,
  `ABE_EMAIL_SERVER_UID` varchar(32) DEFAULT '',
  PRIMARY KEY (`ABE_UID`),
  KEY `indexAbeProcess` (`PRO_UID`),
  KEY `indexAbeProcessTask` (`PRO_UID`,`TAS_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The plugin table for actionsByEmail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ABE_REQUESTS`
--

DROP TABLE IF EXISTS `ABE_REQUESTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ABE_REQUESTS` (
  `ABE_REQ_UID` varchar(32) NOT NULL DEFAULT '',
  `ABE_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `ABE_REQ_SENT_TO` varchar(100) NOT NULL DEFAULT '',
  `ABE_REQ_SUBJECT` varchar(150) NOT NULL DEFAULT '',
  `ABE_REQ_BODY` mediumtext NOT NULL,
  `ABE_REQ_DATE` datetime NOT NULL,
  `ABE_REQ_STATUS` varchar(10) DEFAULT '',
  `ABE_REQ_ANSWERED` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ABE_REQ_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The plugin table for actionsByEmail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ABE_RESPONSES`
--

DROP TABLE IF EXISTS `ABE_RESPONSES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ABE_RESPONSES` (
  `ABE_RES_UID` varchar(32) NOT NULL DEFAULT '',
  `ABE_REQ_UID` varchar(32) NOT NULL DEFAULT '',
  `ABE_RES_CLIENT_IP` varchar(20) NOT NULL DEFAULT '',
  `ABE_RES_DATA` mediumtext NOT NULL,
  `ABE_RES_DATE` datetime NOT NULL,
  `ABE_RES_STATUS` varchar(10) NOT NULL DEFAULT '',
  `ABE_RES_MESSAGE` varchar(255) DEFAULT '',
  PRIMARY KEY (`ABE_RES_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The plugin table for actionsByEmail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ADDITIONAL_TABLES`
--

DROP TABLE IF EXISTS `ADDITIONAL_TABLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADDITIONAL_TABLES` (
  `ADD_TAB_UID` varchar(32) NOT NULL DEFAULT '',
  `ADD_TAB_NAME` varchar(60) NOT NULL DEFAULT '',
  `ADD_TAB_CLASS_NAME` varchar(100) NOT NULL DEFAULT '',
  `ADD_TAB_DESCRIPTION` mediumtext,
  `ADD_TAB_SDW_LOG_INSERT` tinyint(4) DEFAULT '0',
  `ADD_TAB_SDW_LOG_UPDATE` tinyint(4) DEFAULT '0',
  `ADD_TAB_SDW_LOG_DELETE` tinyint(4) DEFAULT '0',
  `ADD_TAB_SDW_LOG_SELECT` tinyint(4) DEFAULT '0',
  `ADD_TAB_SDW_MAX_LENGTH` int(11) DEFAULT '0',
  `ADD_TAB_SDW_AUTO_DELETE` tinyint(4) DEFAULT '0',
  `ADD_TAB_PLG_UID` varchar(32) DEFAULT '',
  `DBS_UID` varchar(32) DEFAULT '',
  `PRO_UID` varchar(32) DEFAULT '',
  `ADD_TAB_TYPE` varchar(32) DEFAULT '',
  `ADD_TAB_GRID` varchar(256) DEFAULT '',
  `ADD_TAB_TAG` varchar(256) DEFAULT '',
  PRIMARY KEY (`ADD_TAB_UID`),
  KEY `indexAdditionalProcess` (`PRO_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ADDONS_MANAGER`
--

DROP TABLE IF EXISTS `ADDONS_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADDONS_MANAGER` (
  `ADDON_ID` varchar(255) NOT NULL,
  `STORE_ID` varchar(32) NOT NULL,
  `ADDON_NAME` varchar(255) NOT NULL,
  `ADDON_NICK` varchar(255) NOT NULL,
  `ADDON_DOWNLOAD_FILENAME` varchar(1024) DEFAULT NULL,
  `ADDON_DESCRIPTION` varchar(2048) DEFAULT NULL,
  `ADDON_STATE` varchar(255) NOT NULL DEFAULT '',
  `ADDON_STATE_CHANGED` datetime DEFAULT NULL,
  `ADDON_STATUS` varchar(255) NOT NULL,
  `ADDON_VERSION` varchar(255) NOT NULL,
  `ADDON_TYPE` varchar(255) NOT NULL,
  `ADDON_PUBLISHER` varchar(255) DEFAULT NULL,
  `ADDON_RELEASE_DATE` datetime DEFAULT NULL,
  `ADDON_RELEASE_TYPE` varchar(255) DEFAULT NULL,
  `ADDON_RELEASE_NOTES` varchar(255) DEFAULT NULL,
  `ADDON_DOWNLOAD_URL` varchar(2048) DEFAULT NULL,
  `ADDON_DOWNLOAD_PROGRESS` float DEFAULT NULL,
  `ADDON_DOWNLOAD_MD5` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ADDON_ID`,`STORE_ID`),
  KEY `indexAddonsType` (`ADDON_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ADDONS_STORE`
--

DROP TABLE IF EXISTS `ADDONS_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADDONS_STORE` (
  `STORE_ID` varchar(32) NOT NULL,
  `STORE_VERSION` int(11) DEFAULT NULL,
  `STORE_LOCATION` varchar(2048) NOT NULL,
  `STORE_TYPE` varchar(255) NOT NULL,
  `STORE_LAST_UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`STORE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APPLICATION`
--

DROP TABLE IF EXISTS `APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APPLICATION` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_TITLE` mediumtext NOT NULL,
  `APP_DESCRIPTION` mediumtext,
  `APP_NUMBER` int(11) NOT NULL DEFAULT '0',
  `APP_PARENT` varchar(32) NOT NULL DEFAULT '0',
  `APP_STATUS` varchar(100) NOT NULL DEFAULT '',
  `APP_STATUS_ID` tinyint(4) NOT NULL DEFAULT '0',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_PROC_STATUS` varchar(100) NOT NULL DEFAULT '',
  `APP_PROC_CODE` varchar(100) NOT NULL DEFAULT '',
  `APP_PARALLEL` varchar(32) NOT NULL DEFAULT 'NO',
  `APP_INIT_USER` varchar(32) NOT NULL DEFAULT '',
  `APP_CUR_USER` varchar(32) NOT NULL DEFAULT '',
  `APP_CREATE_DATE` datetime NOT NULL,
  `APP_INIT_DATE` datetime NOT NULL,
  `APP_FINISH_DATE` datetime DEFAULT NULL,
  `APP_UPDATE_DATE` datetime NOT NULL,
  `APP_DATA` mediumtext NOT NULL,
  `APP_PIN` varchar(32) NOT NULL DEFAULT '',
  `APP_DURATION` double DEFAULT '0',
  `APP_DELAY_DURATION` double DEFAULT '0',
  `APP_DRIVE_FOLDER_UID` varchar(128) DEFAULT '',
  `APP_ROUTING_DATA` mediumtext,
  PRIMARY KEY (`APP_UID`),
  UNIQUE KEY `INDEX_APP_NUMBER` (`APP_NUMBER`),
  KEY `indexApp` (`PRO_UID`,`APP_STATUS`,`APP_UID`),
  KEY `indexAppNumber` (`APP_NUMBER`),
  KEY `indexAppStatus` (`APP_STATUS`),
  KEY `indexAppCreateDate` (`APP_CREATE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The application';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER APPLICATION_UPDATE BEFORE UPDATE ON APPLICATION

FOR EACH ROW

BEGIN
  DECLARE APP_STATUS VARCHAR(32);
  DECLARE APP_FINISH_DATE DATETIME;

  SELECT APPLICATION.APP_STATUS into @APP_STATUS FROM APPLICATION WHERE APP_UID = NEW.APP_UID LIMIT 1;

  IF(OLD.APP_STATUS<>NEW.APP_STATUS) THEN
    SET @APP_STATUS = NEW.APP_STATUS;
    UPDATE APP_CACHE_VIEW SET APP_STATUS = @APP_STATUS WHERE APP_UID = NEW.APP_UID;
  END IF;

  IF(OLD.APP_DATA<>NEW.APP_DATA) THEN
      UPDATE APP_CACHE_VIEW SET APP_UPDATE_DATE = NEW.APP_UPDATE_DATE WHERE APP_UID = NEW.APP_UID;
  END IF;

  IF (NEW.APP_STATUS = 'COMPLETED') THEN
      UPDATE APP_CACHE_VIEW SET APP_FINISH_DATE = NEW.APP_FINISH_DATE WHERE APP_UID = NEW.APP_UID;
      UPDATE APP_CACHE_VIEW SET APP_UPDATE_DATE = NEW.APP_UPDATE_DATE WHERE APP_UID = NEW.APP_UID;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER APPLICATION_DELETE BEFORE DELETE ON APPLICATION
 FOR EACH ROW BEGIN
  DELETE FROM APP_CACHE_VIEW WHERE APP_UID = OLD.APP_UID; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `APP_ASSIGN_SELF_SERVICE_VALUE`
--

DROP TABLE IF EXISTS `APP_ASSIGN_SELF_SERVICE_VALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_ASSIGN_SELF_SERVICE_VALUE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_UID` varchar(32) NOT NULL,
  `APP_NUMBER` int(11) DEFAULT '0',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `PRO_UID` varchar(32) NOT NULL,
  `TAS_UID` varchar(32) NOT NULL,
  `TAS_ID` int(11) DEFAULT '0',
  `GRP_UID` mediumtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_ASSIGN_SELF_SERVICE_VALUE_GROUP`
--

DROP TABLE IF EXISTS `APP_ASSIGN_SELF_SERVICE_VALUE_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_ASSIGN_SELF_SERVICE_VALUE_GROUP` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `GRP_UID` varchar(32) NOT NULL,
  `ASSIGNEE_ID` int(11) DEFAULT '0',
  `ASSIGNEE_TYPE` int(11) NOT NULL DEFAULT '0',
  KEY `indexId` (`ID`),
  KEY `INDEX_ASSIGNEE_ID` (`ASSIGNEE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_CACHE_VIEW`
--

DROP TABLE IF EXISTS `APP_CACHE_VIEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_CACHE_VIEW` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `DEL_LAST_INDEX` int(11) NOT NULL DEFAULT '0',
  `APP_NUMBER` int(11) NOT NULL DEFAULT '0',
  `APP_STATUS` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `PREVIOUS_USR_UID` varchar(32) DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_DELEGATE_DATE` datetime NOT NULL,
  `DEL_INIT_DATE` datetime DEFAULT NULL,
  `DEL_FINISH_DATE` datetime DEFAULT NULL,
  `DEL_TASK_DUE_DATE` datetime DEFAULT NULL,
  `DEL_RISK_DATE` datetime DEFAULT NULL,
  `DEL_THREAD_STATUS` varchar(32) DEFAULT 'OPEN',
  `APP_THREAD_STATUS` varchar(32) DEFAULT 'OPEN',
  `APP_TITLE` varchar(255) NOT NULL DEFAULT '',
  `APP_PRO_TITLE` varchar(255) NOT NULL DEFAULT '',
  `APP_TAS_TITLE` varchar(255) NOT NULL DEFAULT '',
  `APP_CURRENT_USER` varchar(128) DEFAULT '',
  `APP_DEL_PREVIOUS_USER` varchar(128) DEFAULT '',
  `DEL_PRIORITY` varchar(32) NOT NULL DEFAULT '3',
  `DEL_DURATION` double DEFAULT '0',
  `DEL_QUEUE_DURATION` double DEFAULT '0',
  `DEL_DELAY_DURATION` double DEFAULT '0',
  `DEL_STARTED` tinyint(4) NOT NULL DEFAULT '0',
  `DEL_FINISHED` tinyint(4) NOT NULL DEFAULT '0',
  `DEL_DELAYED` tinyint(4) NOT NULL DEFAULT '0',
  `APP_CREATE_DATE` datetime NOT NULL,
  `APP_FINISH_DATE` datetime DEFAULT NULL,
  `APP_UPDATE_DATE` datetime NOT NULL,
  `APP_OVERDUE_PERCENTAGE` double NOT NULL,
  PRIMARY KEY (`APP_UID`,`DEL_INDEX`),
  KEY `indexUsrUidThreadStatusAppStatus` (`USR_UID`,`DEL_THREAD_STATUS`,`APP_STATUS`),
  KEY `indexAppUid` (`APP_UID`),
  KEY `indexTasUid` (`TAS_UID`),
  KEY `indexUsrUid` (`USR_UID`),
  KEY `indexPrevUsrUid` (`PREVIOUS_USR_UID`),
  KEY `indexProUid` (`PRO_UID`),
  KEY `indexAppNumber` (`APP_NUMBER`),
  KEY `protitle` (`APP_PRO_TITLE`),
  KEY `appupdatedate` (`APP_UPDATE_DATE`),
  KEY `tastitle` (`APP_TAS_TITLE`),
  KEY `taskUid` (`TAS_UID`),
  KEY `indexAppUser` (`USR_UID`,`APP_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Application cache view';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_DATA_CHANGE_LOG`
--

DROP TABLE IF EXISTS `APP_DATA_CHANGE_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_DATA_CHANGE_LOG` (
  `CHANGE_LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE` datetime DEFAULT NULL,
  `APP_NUMBER` int(11) DEFAULT '0',
  `DEL_INDEX` int(11) DEFAULT '0',
  `PRO_ID` int(11) DEFAULT '0',
  `TAS_ID` int(11) DEFAULT '0',
  `USR_ID` int(11) DEFAULT '0',
  `OBJECT_TYPE` int(11) DEFAULT '0',
  `OBJECT_ID` int(11) DEFAULT '0',
  `OBJECT_UID` varchar(32) DEFAULT '',
  `EXECUTED_AT` int(11) DEFAULT '0',
  `SOURCE_ID` int(11) DEFAULT '0',
  `DATA` mediumtext NOT NULL,
  `SKIN` varchar(32) DEFAULT '',
  `LANGUAGE` varchar(32) DEFAULT '',
  `ROW_MIGRATION` int(11) DEFAULT '0',
  PRIMARY KEY (`CHANGE_LOG_ID`),
  KEY `indexAppNumber` (`APP_NUMBER`),
  KEY `indexDelIndex` (`DEL_INDEX`),
  KEY `indexProId` (`PRO_ID`),
  KEY `indexTasId` (`TAS_ID`),
  KEY `indexUsrId` (`USR_ID`),
  KEY `indexObjectType` (`OBJECT_TYPE`),
  KEY `indexObjectId` (`OBJECT_ID`),
  KEY `indexExecutedAt` (`EXECUTED_AT`),
  KEY `indexSourceId` (`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Change log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_DELAY`
--

DROP TABLE IF EXISTS `APP_DELAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_DELAY` (
  `APP_DELAY_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '0',
  `APP_UID` varchar(32) NOT NULL DEFAULT '0',
  `APP_NUMBER` int(11) DEFAULT '0',
  `APP_THREAD_INDEX` int(11) NOT NULL DEFAULT '0',
  `APP_DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `APP_TYPE` varchar(20) NOT NULL DEFAULT '0',
  `APP_STATUS` varchar(20) NOT NULL DEFAULT '0',
  `APP_NEXT_TASK` varchar(32) DEFAULT '0',
  `APP_DELEGATION_USER` varchar(32) DEFAULT '0',
  `APP_ENABLE_ACTION_USER` varchar(32) NOT NULL DEFAULT '0',
  `APP_ENABLE_ACTION_DATE` datetime NOT NULL,
  `APP_DISABLE_ACTION_USER` varchar(32) DEFAULT '0',
  `APP_DISABLE_ACTION_DATE` datetime DEFAULT NULL,
  `APP_AUTOMATIC_DISABLED_DATE` datetime DEFAULT NULL,
  `APP_DELEGATION_USER_ID` int(11) DEFAULT '0',
  `PRO_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`APP_DELAY_UID`),
  KEY `INDEX_APP_NUMBER` (`APP_NUMBER`),
  KEY `INDEX_USR_ID` (`APP_DELEGATION_USER_ID`),
  KEY `INDEX_PRO_ID` (`PRO_ID`),
  KEY `indexAppDelay` (`PRO_UID`,`APP_UID`,`APP_THREAD_INDEX`,`APP_DEL_INDEX`,`APP_NEXT_TASK`,`APP_DELEGATION_USER`,`APP_DISABLE_ACTION_USER`),
  KEY `indexAppUid` (`APP_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP_DELAY';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_DELEGATION`
--

DROP TABLE IF EXISTS `APP_DELEGATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_DELEGATION` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `DELEGATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_NUMBER` int(11) DEFAULT '0',
  `DEL_PREVIOUS` int(11) NOT NULL DEFAULT '0',
  `DEL_LAST_INDEX` int(11) NOT NULL DEFAULT '0',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_TYPE` varchar(32) NOT NULL DEFAULT 'NORMAL',
  `DEL_THREAD` int(11) NOT NULL DEFAULT '0',
  `DEL_THREAD_STATUS` varchar(32) NOT NULL DEFAULT 'OPEN',
  `DEL_PRIORITY` varchar(32) NOT NULL DEFAULT '3',
  `DEL_DELEGATE_DATE` datetime NOT NULL,
  `DEL_INIT_DATE` datetime DEFAULT NULL,
  `DEL_FINISH_DATE` datetime DEFAULT NULL,
  `DEL_TASK_DUE_DATE` datetime DEFAULT NULL,
  `DEL_RISK_DATE` datetime DEFAULT NULL,
  `DEL_DURATION` double DEFAULT '0',
  `DEL_QUEUE_DURATION` double DEFAULT '0',
  `DEL_DELAY_DURATION` double DEFAULT '0',
  `DEL_STARTED` tinyint(4) DEFAULT '0',
  `DEL_FINISHED` tinyint(4) DEFAULT '0',
  `DEL_DELAYED` tinyint(4) DEFAULT '0',
  `DEL_DATA` mediumtext NOT NULL,
  `APP_OVERDUE_PERCENTAGE` double NOT NULL DEFAULT '0',
  `USR_ID` int(11) DEFAULT '0',
  `PRO_ID` int(11) DEFAULT '0',
  `TAS_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`APP_UID`,`DEL_INDEX`),
  UNIQUE KEY `DELEGATION_ID` (`DELEGATION_ID`),
  KEY `INDEX_APP_NUMBER` (`APP_NUMBER`),
  KEY `INDEX_USR_ID` (`USR_ID`),
  KEY `INDEX_PRO_ID` (`PRO_ID`),
  KEY `INDEX_TAS_ID` (`TAS_ID`),
  KEY `INDEX_USR_UID` (`USR_UID`),
  KEY `INDEX_THREAD_STATUS_APP_NUMBER` (`DEL_THREAD_STATUS`,`APP_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Delegation a task to user';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER APP_DELEGATION_INSERT BEFORE INSERT ON APP_DELEGATION
FOR EACH ROW
BEGIN
  DECLARE DEFAULT_LANG VARCHAR(2);
  DECLARE APP_NUMBER INT;
  DECLARE APP_STATUS VARCHAR(32);
  DECLARE APP_CREATE_DATE DATETIME;
  DECLARE APP_UPDATE_DATE DATETIME;
  DECLARE APP_TITLE VARCHAR(255);
  DECLARE APP_PRO_TITLE VARCHAR(255);
  DECLARE APP_TAS_TITLE VARCHAR(255);
  DECLARE APP_CURRENT_USER VARCHAR(255);
  DECLARE PREVIOUS_USR_UID VARCHAR(32);
  DECLARE APP_DEL_PREVIOUS_USER VARCHAR(255);
  DECLARE APP_THREAD_STATUS VARCHAR(32);
  SET @DEFAULT_LANG = '{lang}';
  SET @APP_CURRENT_USER = '';
  SELECT APPLICATION.APP_NUMBER into @APP_NUMBER FROM APPLICATION WHERE APP_UID = NEW.APP_UID LIMIT 1;
  SELECT APPLICATION.APP_STATUS into @APP_STATUS FROM APPLICATION WHERE APP_UID = NEW.APP_UID LIMIT 1;
  SELECT APPLICATION.APP_CREATE_DATE into @APP_CREATE_DATE FROM APPLICATION WHERE APP_UID = NEW.APP_UID LIMIT 1;
  SELECT APPLICATION.APP_UPDATE_DATE into @APP_UPDATE_DATE FROM APPLICATION WHERE APP_UID = NEW.APP_UID LIMIT 1;

  SELECT APPLICATION.APP_TITLE into @APP_TITLE FROM APPLICATION WHERE NEW.APP_UID=APPLICATION.APP_UID LIMIT 1;
  IF ( @APP_TITLE IS NULL ) THEN
    SET @APP_TITLE = '';
  END IF;
  SELECT PROCESS.PRO_TITLE into @APP_PRO_TITLE FROM PROCESS WHERE NEW.PRO_UID=PROCESS.PRO_UID LIMIT 1;
  SELECT TASK.TAS_TITLE into @APP_TAS_TITLE FROM TASK WHERE NEW.TAS_UID=TASK.TAS_UID LIMIT 1;
  SELECT CONCAT(USERS.USR_LASTNAME,  ' ',  USERS.USR_FIRSTNAME) INTO @APP_CURRENT_USER FROM USERS WHERE USR_UID = NEW.USR_UID LIMIT 1;
  IF ( @APP_CURRENT_USER IS NULL ) THEN
    SET @APP_CURRENT_USER = '';
  END IF;
  IF ( NEW.DEL_PREVIOUS > 0 ) THEN
    SELECT USR_UID INTO @PREVIOUS_USR_UID FROM APP_DELEGATION WHERE APP_UID = NEW.APP_UID AND DEL_INDEX = NEW.DEL_PREVIOUS LIMIT 1;
    SELECT CONCAT(USERS.USR_LASTNAME,  ' ',  USERS.USR_FIRSTNAME) INTO @APP_DEL_PREVIOUS_USER FROM USERS WHERE USR_UID = @PREVIOUS_USR_UID LIMIT 1;
    IF ( @APP_DEL_PREVIOUS_USER IS NULL ) THEN
      SET @APP_DEL_PREVIOUS_USER = '';
    END IF;
  ELSE
    SET @APP_DEL_PREVIOUS_USER = '';
    SET @PREVIOUS_USR_UID = '';
  END IF;
  SELECT APP_THREAD_STATUS INTO @APP_THREAD_STATUS FROM APP_THREAD WHERE APP_UID = NEW.APP_UID AND DEL_INDEX = NEW.DEL_PREVIOUS LIMIT 1;
  IF ( @APP_THREAD_STATUS IS NULL ) THEN
    SET @APP_THREAD_STATUS = 'OPEN';
  END IF;
  SET @TAS_TYPE = (SELECT TAS_TYPE FROM TASK WHERE TAS_UID = NEW.TAS_UID LIMIT 1);
  UPDATE APP_CACHE_VIEW SET DEL_LAST_INDEX = 0 WHERE APP_UID = NEW.APP_UID;
    INSERT INTO `APP_CACHE_VIEW`  (
    APP_UID,
    DEL_INDEX,
    APP_NUMBER,
    APP_STATUS,
    USR_UID,
    PREVIOUS_USR_UID,
    TAS_UID,
    PRO_UID,
    DEL_DELEGATE_DATE,
    DEL_INIT_DATE,
    DEL_FINISH_DATE,
    DEL_TASK_DUE_DATE,
    DEL_RISK_DATE,
    DEL_THREAD_STATUS,
    APP_THREAD_STATUS,
    APP_TITLE,
    APP_PRO_TITLE,
    APP_TAS_TITLE,
    APP_CURRENT_USER,
    APP_DEL_PREVIOUS_USER,
    DEL_PRIORITY,
    DEL_DURATION,
    DEL_QUEUE_DURATION,
    DEL_DELAY_DURATION,
    DEL_STARTED,
    DEL_FINISHED,
    DEL_DELAYED,
    APP_CREATE_DATE,
    APP_FINISH_DATE,
    APP_UPDATE_DATE,
    APP_OVERDUE_PERCENTAGE,
    DEL_LAST_INDEX
  )
  VALUES (
    NEW.APP_UID,
    NEW.DEL_INDEX,
    @APP_NUMBER,
    @APP_STATUS,
    NEW.USR_UID,
    @PREVIOUS_USR_UID,
    NEW.TAS_UID,
    NEW.PRO_UID,
    NEW.DEL_DELEGATE_DATE,
    NEW.DEL_INIT_DATE,
    NEW.DEL_FINISH_DATE,
    NEW.DEL_TASK_DUE_DATE,
    NEW.DEL_RISK_DATE,
    NEW.DEL_THREAD_STATUS,
    @APP_THREAD_STATUS,
    @APP_TITLE,
    @APP_PRO_TITLE,
    @APP_TAS_TITLE,
    @APP_CURRENT_USER,
    @APP_DEL_PREVIOUS_USER,
    NEW.DEL_PRIORITY,
    NEW.DEL_DURATION,
    NEW.DEL_QUEUE_DURATION,
    NEW.DEL_DELAY_DURATION,
    NEW.DEL_STARTED,
    NEW.DEL_FINISHED,
    NEW.DEL_DELAYED,
    @APP_CREATE_DATE,
    NULL,
    @APP_UPDATE_DATE,
    NEW.APP_OVERDUE_PERCENTAGE,
    NEW.DEL_LAST_INDEX
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER APP_DELEGATION_UPDATE BEFORE UPDATE ON APP_DELEGATION
FOR EACH ROW
BEGIN
  DECLARE DEFAULT_LANG VARCHAR(2);
  DECLARE APP_NUMBER INT;
  DECLARE APP_STATUS VARCHAR(32);
  DECLARE APP_CREATE_DATE DATETIME;
  DECLARE APP_UPDATE_DATE DATETIME;
  DECLARE APP_TITLE VARCHAR(255);
  DECLARE APP_PRO_TITLE VARCHAR(255);
  DECLARE APP_TAS_TITLE VARCHAR(255);
  DECLARE APP_CURRENT_USER VARCHAR(255);
  DECLARE PREVIOUS_USR_UID VARCHAR(32);
  DECLARE APP_DEL_PREVIOUS_USER VARCHAR(255);
  DECLARE APP_THREAD_STATUS VARCHAR(32);
  SET @DEFAULT_LANG = '{lang}';
  SET @APP_CURRENT_USER = '';
  SELECT APPLICATION.APP_NUMBER into @APP_NUMBER FROM APPLICATION WHERE APP_UID = NEW.APP_UID LIMIT 1;
  SELECT APPLICATION.APP_STATUS into @APP_STATUS FROM APPLICATION WHERE APP_UID = NEW.APP_UID LIMIT 1;
  SELECT APPLICATION.APP_CREATE_DATE into @APP_CREATE_DATE FROM APPLICATION WHERE APP_UID = NEW.APP_UID LIMIT 1;
  SELECT APPLICATION.APP_UPDATE_DATE into @APP_UPDATE_DATE FROM APPLICATION WHERE APP_UID = NEW.APP_UID LIMIT 1;

  SELECT APPLICATION.APP_TITLE into @APP_TITLE FROM APPLICATION WHERE NEW.APP_UID=APPLICATION.APP_UID LIMIT 1;
  IF ( @APP_TITLE IS NULL ) THEN
    SET @APP_TITLE = '';
  END IF;
  SELECT PROCESS.PRO_TITLE into @APP_PRO_TITLE FROM PROCESS WHERE NEW.PRO_UID=PROCESS.PRO_UID LIMIT 1;
  SELECT TASK.TAS_TITLE into @APP_TAS_TITLE FROM TASK WHERE NEW.TAS_UID=TASK.TAS_UID LIMIT 1;
  SELECT CONCAT(USERS.USR_LASTNAME,  ' ',  USERS.USR_FIRSTNAME) INTO @APP_CURRENT_USER FROM USERS WHERE USR_UID = NEW.USR_UID LIMIT 1;
  IF ( @APP_CURRENT_USER IS NULL ) THEN
    SET @APP_CURRENT_USER = '';
  END IF;
  IF ( NEW.DEL_PREVIOUS > 0 ) THEN
    SELECT USR_UID INTO @PREVIOUS_USR_UID FROM APP_DELEGATION WHERE APP_UID = NEW.APP_UID AND DEL_INDEX = NEW.DEL_PREVIOUS LIMIT 1;
    SELECT CONCAT(USERS.USR_LASTNAME,  ' ',  USERS.USR_FIRSTNAME) INTO @APP_DEL_PREVIOUS_USER FROM USERS WHERE USR_UID = @PREVIOUS_USR_UID LIMIT 1;
    IF ( @APP_DEL_PREVIOUS_USER IS NULL ) THEN
      SET @APP_DEL_PREVIOUS_USER = '';
    END IF;
  ELSE
    SET @APP_DEL_PREVIOUS_USER = '';
    SET @PREVIOUS_USR_UID = '';
  END IF;
  SELECT APP_THREAD_STATUS INTO @APP_THREAD_STATUS FROM APP_THREAD WHERE APP_UID = NEW.APP_UID AND DEL_INDEX = NEW.DEL_PREVIOUS LIMIT 1;
  IF ( @APP_THREAD_STATUS IS NULL ) THEN
    SET @APP_THREAD_STATUS = 'OPEN';
  END IF;
  SET @TAS_TYPE = (SELECT TAS_TYPE FROM TASK WHERE TAS_UID = NEW.TAS_UID LIMIT 1);
    UPDATE `APP_CACHE_VIEW`
    SET
    APP_NUMBER            =   @APP_NUMBER,
    APP_STATUS            =   @APP_STATUS,
    USR_UID               =   NEW.USR_UID,
    PREVIOUS_USR_UID      =   @PREVIOUS_USR_UID,
    TAS_UID               =   NEW.TAS_UID,
    PRO_UID               =   NEW.PRO_UID,
    DEL_DELEGATE_DATE     =   NEW.DEL_DELEGATE_DATE,
    DEL_INIT_DATE         =   NEW.DEL_INIT_DATE,
    DEL_FINISH_DATE       =   NEW.DEL_FINISH_DATE,
    DEL_TASK_DUE_DATE     =   NEW.DEL_TASK_DUE_DATE,
    DEL_RISK_DATE         =   NEW.DEL_RISK_DATE,
    DEL_THREAD_STATUS     =   NEW.DEL_THREAD_STATUS,
    APP_THREAD_STATUS     =   @APP_THREAD_STATUS,
    APP_TITLE             =   @APP_TITLE,
    APP_PRO_TITLE         =   @APP_PRO_TITLE,
    APP_TAS_TITLE         =   @APP_TAS_TITLE,
    APP_CURRENT_USER      =   @APP_CURRENT_USER,
    APP_DEL_PREVIOUS_USER =   @APP_DEL_PREVIOUS_USER,
    DEL_PRIORITY          =   NEW.DEL_PRIORITY,
    DEL_DURATION          =   NEW.DEL_DURATION,
    DEL_QUEUE_DURATION    =   NEW.DEL_QUEUE_DURATION,
    DEL_DELAY_DURATION    =   NEW.DEL_DELAY_DURATION,
    DEL_STARTED           =   NEW.DEL_STARTED,
    DEL_FINISHED          =   NEW.DEL_FINISHED,
    DEL_DELAYED           =   NEW.DEL_DELAYED,
    APP_FINISH_DATE       =   NULL,
    APP_UPDATE_DATE        =  @APP_UPDATE_DATE,
    APP_OVERDUE_PERCENTAGE =  NEW.APP_OVERDUE_PERCENTAGE,
    DEL_LAST_INDEX        =   NEW.DEL_LAST_INDEX
  WHERE
    APP_UID = NEW.APP_UID
    AND DEL_INDEX =   NEW.DEL_INDEX;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `APP_DOCUMENT`
--

DROP TABLE IF EXISTS `APP_DOCUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_DOCUMENT` (
  `APP_DOC_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_DOC_FILENAME` mediumtext NOT NULL,
  `APP_DOC_TITLE` mediumtext,
  `APP_DOC_COMMENT` mediumtext,
  `DOC_VERSION` int(11) NOT NULL DEFAULT '1',
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `DOC_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_DOC_TYPE` varchar(32) NOT NULL DEFAULT '',
  `APP_DOC_CREATE_DATE` datetime NOT NULL,
  `APP_DOC_INDEX` int(11) NOT NULL,
  `FOLDER_UID` varchar(32) DEFAULT '',
  `APP_DOC_PLUGIN` varchar(150) DEFAULT '',
  `APP_DOC_TAGS` mediumtext,
  `APP_DOC_STATUS` varchar(32) NOT NULL DEFAULT 'ACTIVE',
  `APP_DOC_STATUS_DATE` datetime DEFAULT NULL,
  `APP_DOC_FIELDNAME` varchar(150) DEFAULT NULL,
  `APP_DOC_DRIVE_DOWNLOAD` mediumtext,
  `SYNC_WITH_DRIVE` varchar(32) NOT NULL DEFAULT 'UNSYNCHRONIZED',
  `SYNC_PERMISSIONS` mediumtext,
  PRIMARY KEY (`APP_DOC_UID`,`DOC_VERSION`),
  KEY `indexAppDocument` (`FOLDER_UID`,`APP_DOC_UID`),
  KEY `indexAppUid` (`APP_UID`),
  KEY `indexAppUidDocUidDocVersionDocType` (`APP_UID`,`DOC_UID`,`DOC_VERSION`,`APP_DOC_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Documents in an Application';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_EVENT`
--

DROP TABLE IF EXISTS `APP_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_EVENT` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `EVN_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_EVN_ACTION_DATE` datetime NOT NULL,
  `APP_EVN_ATTEMPTS` tinyint(4) NOT NULL DEFAULT '0',
  `APP_EVN_LAST_EXECUTION_DATE` datetime DEFAULT NULL,
  `APP_EVN_STATUS` varchar(32) NOT NULL DEFAULT 'OPEN',
  PRIMARY KEY (`APP_UID`,`DEL_INDEX`,`EVN_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_FOLDER`
--

DROP TABLE IF EXISTS `APP_FOLDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_FOLDER` (
  `FOLDER_UID` varchar(32) NOT NULL DEFAULT '',
  `FOLDER_PARENT_UID` varchar(32) NOT NULL DEFAULT '',
  `FOLDER_NAME` mediumtext NOT NULL,
  `FOLDER_CREATE_DATE` datetime NOT NULL,
  `FOLDER_UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY (`FOLDER_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Folder System PM Documents';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_HISTORY`
--

DROP TABLE IF EXISTS `APP_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_HISTORY` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `DYN_UID` varchar(32) NOT NULL DEFAULT '',
  `OBJ_TYPE` varchar(20) NOT NULL DEFAULT 'DYNAFORM',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_STATUS` varchar(100) NOT NULL DEFAULT '',
  `HISTORY_DATE` datetime DEFAULT NULL,
  `HISTORY_DATA` mediumtext NOT NULL,
  KEY `indexAppHistory` (`APP_UID`,`TAS_UID`,`USR_UID`),
  KEY `indexDynUid` (`DYN_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table for Dynaforms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_MESSAGE`
--

DROP TABLE IF EXISTS `APP_MESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_MESSAGE` (
  `APP_MSG_UID` varchar(32) NOT NULL,
  `MSG_UID` varchar(32) DEFAULT NULL,
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `APP_MSG_TYPE` varchar(100) NOT NULL DEFAULT '',
  `APP_MSG_TYPE_ID` tinyint(4) DEFAULT '0',
  `APP_MSG_SUBJECT` varchar(150) NOT NULL DEFAULT '',
  `APP_MSG_FROM` varchar(100) NOT NULL DEFAULT '',
  `APP_MSG_TO` mediumtext NOT NULL,
  `APP_MSG_BODY` mediumtext NOT NULL,
  `APP_MSG_DATE` datetime NOT NULL,
  `APP_MSG_CC` mediumtext,
  `APP_MSG_BCC` mediumtext,
  `APP_MSG_TEMPLATE` mediumtext,
  `APP_MSG_STATUS` varchar(20) DEFAULT NULL,
  `APP_MSG_STATUS_ID` tinyint(4) DEFAULT '0',
  `APP_MSG_ATTACH` mediumtext,
  `APP_MSG_SEND_DATE` datetime NOT NULL,
  `APP_MSG_SHOW_MESSAGE` tinyint(4) NOT NULL DEFAULT '1',
  `APP_MSG_ERROR` mediumtext,
  `PRO_ID` int(11) DEFAULT '0',
  `TAS_ID` int(11) DEFAULT '0',
  `APP_NUMBER` int(11) DEFAULT '0',
  PRIMARY KEY (`APP_MSG_UID`),
  KEY `indexForAppUid` (`APP_UID`),
  KEY `indexForMsgStatus` (`APP_MSG_STATUS`),
  KEY `INDEX_PRO_ID` (`PRO_ID`),
  KEY `INDEX_TAS_ID` (`TAS_ID`),
  KEY `INDEX_APP_NUMBER` (`APP_NUMBER`),
  KEY `INDEX_APP_MSG_TYPE_ID` (`APP_MSG_STATUS_ID`),
  KEY `INDEX_APP_MSG_STATUS_ID` (`APP_MSG_STATUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Messages in an Application';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_NOTES`
--

DROP TABLE IF EXISTS `APP_NOTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_NOTES` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `NOTE_DATE` datetime NOT NULL,
  `NOTE_CONTENT` mediumtext NOT NULL,
  `NOTE_TYPE` varchar(32) NOT NULL DEFAULT 'USER',
  `NOTE_AVAILABILITY` varchar(32) NOT NULL DEFAULT 'PUBLIC',
  `NOTE_ORIGIN_OBJ` varchar(32) DEFAULT '',
  `NOTE_AFFECTED_OBJ1` varchar(32) DEFAULT '',
  `NOTE_AFFECTED_OBJ2` varchar(32) NOT NULL DEFAULT '',
  `NOTE_RECIPIENTS` mediumtext,
  KEY `indexAppNotesDate` (`APP_UID`,`NOTE_DATE`),
  KEY `indexAppNotesUser` (`APP_UID`,`USR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Application Notes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_OWNER`
--

DROP TABLE IF EXISTS `APP_OWNER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_OWNER` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `OWN_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`APP_UID`,`OWN_UID`,`USR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_SEQUENCE`
--

DROP TABLE IF EXISTS `APP_SEQUENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_SEQUENCE` (
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_SOLR_QUEUE`
--

DROP TABLE IF EXISTS `APP_SOLR_QUEUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_SOLR_QUEUE` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_CHANGE_DATE` datetime NOT NULL,
  `APP_CHANGE_TRACE` varchar(500) NOT NULL,
  `APP_UPDATED` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`APP_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP_SOLR_QUEUE';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_THREAD`
--

DROP TABLE IF EXISTS `APP_THREAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_THREAD` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_THREAD_INDEX` int(11) NOT NULL DEFAULT '0',
  `APP_THREAD_PARENT` int(11) NOT NULL DEFAULT '0',
  `APP_THREAD_STATUS` varchar(32) NOT NULL DEFAULT 'OPEN',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`APP_UID`,`APP_THREAD_INDEX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP_THREAD';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APP_TIMEOUT_ACTION_EXECUTED`
--

DROP TABLE IF EXISTS `APP_TIMEOUT_ACTION_EXECUTED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APP_TIMEOUT_ACTION_EXECUTED` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `EXECUTION_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`APP_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_ACTIVITY`
--

DROP TABLE IF EXISTS `BPMN_ACTIVITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_ACTIVITY` (
  `ACT_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) DEFAULT '',
  `ACT_NAME` varchar(255) NOT NULL,
  `ACT_TYPE` varchar(30) NOT NULL DEFAULT 'TASK',
  `ACT_IS_FOR_COMPENSATION` tinyint(4) DEFAULT '0',
  `ACT_START_QUANTITY` int(11) DEFAULT '1',
  `ACT_COMPLETION_QUANTITY` int(11) DEFAULT '1',
  `ACT_TASK_TYPE` varchar(20) NOT NULL DEFAULT 'EMPTY',
  `ACT_IMPLEMENTATION` mediumtext,
  `ACT_INSTANTIATE` tinyint(4) DEFAULT '0',
  `ACT_SCRIPT_TYPE` varchar(255) DEFAULT NULL,
  `ACT_SCRIPT` mediumtext,
  `ACT_LOOP_TYPE` varchar(20) NOT NULL DEFAULT 'NONE',
  `ACT_TEST_BEFORE` tinyint(4) DEFAULT '0',
  `ACT_LOOP_MAXIMUM` int(11) DEFAULT '0',
  `ACT_LOOP_CONDITION` varchar(100) DEFAULT NULL,
  `ACT_LOOP_CARDINALITY` int(11) DEFAULT '0',
  `ACT_LOOP_BEHAVIOR` varchar(20) DEFAULT 'NONE',
  `ACT_IS_ADHOC` tinyint(4) DEFAULT '0',
  `ACT_IS_COLLAPSED` tinyint(4) DEFAULT '1',
  `ACT_COMPLETION_CONDITION` varchar(255) DEFAULT NULL,
  `ACT_ORDERING` varchar(20) DEFAULT 'PARALLEL',
  `ACT_CANCEL_REMAINING_INSTANCES` tinyint(4) DEFAULT '1',
  `ACT_PROTOCOL` varchar(255) DEFAULT NULL,
  `ACT_METHOD` varchar(255) DEFAULT NULL,
  `ACT_IS_GLOBAL` tinyint(4) DEFAULT '0',
  `ACT_REFERER` varchar(32) DEFAULT '',
  `ACT_DEFAULT_FLOW` varchar(32) DEFAULT '',
  `ACT_MASTER_DIAGRAM` varchar(32) DEFAULT '',
  PRIMARY KEY (`ACT_UID`),
  KEY `BPMN_ACTIVITY_I_1` (`ACT_UID`),
  KEY `BPMN_ACTIVITY_I_2` (`PRJ_UID`),
  KEY `BPMN_ACTIVITY_I_3` (`PRO_UID`),
  CONSTRAINT `fk_bpmn_activity_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`),
  CONSTRAINT `fk_bpmn_activity_process` FOREIGN KEY (`PRO_UID`) REFERENCES `BPMN_PROCESS` (`PRO_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_ARTIFACT`
--

DROP TABLE IF EXISTS `BPMN_ARTIFACT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_ARTIFACT` (
  `ART_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL,
  `PRO_UID` varchar(32) DEFAULT '',
  `ART_TYPE` varchar(15) NOT NULL,
  `ART_NAME` mediumtext,
  `ART_CATEGORY_REF` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ART_UID`),
  KEY `BPMN_ARTIFACT_I_1` (`ART_UID`),
  KEY `BPMN_ARTIFACT_I_2` (`PRJ_UID`),
  KEY `BPMN_ARTIFACT_I_3` (`PRO_UID`),
  CONSTRAINT `fk_bpmn_artifact_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`),
  CONSTRAINT `fk_bpmn_artifact_process` FOREIGN KEY (`PRO_UID`) REFERENCES `BPMN_PROCESS` (`PRO_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_BOUND`
--

DROP TABLE IF EXISTS `BPMN_BOUND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_BOUND` (
  `BOU_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL DEFAULT '',
  `DIA_UID` varchar(32) NOT NULL DEFAULT '',
  `ELEMENT_UID` varchar(32) DEFAULT '',
  `BOU_ELEMENT` varchar(32) NOT NULL DEFAULT '',
  `BOU_ELEMENT_TYPE` varchar(32) NOT NULL DEFAULT '',
  `BOU_X` int(11) NOT NULL DEFAULT '0',
  `BOU_Y` int(11) NOT NULL DEFAULT '0',
  `BOU_WIDTH` int(11) NOT NULL DEFAULT '0',
  `BOU_HEIGHT` int(11) NOT NULL DEFAULT '0',
  `BOU_REL_POSITION` int(11) DEFAULT '0',
  `BOU_SIZE_IDENTICAL` int(11) DEFAULT '0',
  `BOU_CONTAINER` varchar(30) DEFAULT '',
  PRIMARY KEY (`BOU_UID`),
  KEY `BPMN_BOUND_I_1` (`BOU_UID`),
  KEY `BPMN_BOUND_I_2` (`PRJ_UID`),
  KEY `BPMN_BOUND_I_3` (`DIA_UID`),
  CONSTRAINT `fk_bpmn_bound_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`),
  CONSTRAINT `fk_bpmn_bound_diagram` FOREIGN KEY (`DIA_UID`) REFERENCES `BPMN_DIAGRAM` (`DIA_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_DATA`
--

DROP TABLE IF EXISTS `BPMN_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_DATA` (
  `DAT_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL,
  `PRO_UID` varchar(32) DEFAULT '',
  `DAT_NAME` varchar(255) DEFAULT NULL,
  `DAT_TYPE` varchar(20) NOT NULL,
  `DAT_IS_COLLECTION` tinyint(4) DEFAULT '0',
  `DAT_ITEM_KIND` varchar(20) NOT NULL DEFAULT 'INFORMATION',
  `DAT_CAPACITY` int(11) DEFAULT '0',
  `DAT_IS_UNLIMITED` tinyint(4) DEFAULT '0',
  `DAT_STATE` varchar(255) DEFAULT '',
  `DAT_IS_GLOBAL` tinyint(4) DEFAULT '0',
  `DAT_OBJECT_REF` varchar(32) DEFAULT '',
  PRIMARY KEY (`DAT_UID`),
  KEY `BPMN_DATA_I_1` (`DAT_UID`),
  KEY `BPMN_DATA_I_2` (`PRJ_UID`),
  KEY `BPMN_DATA_I_3` (`PRO_UID`),
  CONSTRAINT `fk_bpmn_data_process` FOREIGN KEY (`PRO_UID`) REFERENCES `BPMN_PROCESS` (`PRO_UID`),
  CONSTRAINT `fk_bpmn_data_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_DIAGRAM`
--

DROP TABLE IF EXISTS `BPMN_DIAGRAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_DIAGRAM` (
  `DIA_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL,
  `DIA_NAME` varchar(255) DEFAULT NULL,
  `DIA_IS_CLOSABLE` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`DIA_UID`),
  KEY `BPMN_DIAGRAM_I_1` (`DIA_UID`),
  KEY `BPMN_DIAGRAM_I_2` (`PRJ_UID`),
  CONSTRAINT `fk_bpmn_diagram_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_DOCUMENTATION`
--

DROP TABLE IF EXISTS `BPMN_DOCUMENTATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_DOCUMENTATION` (
  `DOC_UID` varchar(32) NOT NULL,
  `PRJ_UID` varchar(32) NOT NULL,
  `DOC_ELEMENT` varchar(32) NOT NULL,
  `DOC_ELEMENT_TYPE` varchar(45) NOT NULL,
  `DOC_DOCUMENTATION` mediumtext,
  PRIMARY KEY (`DOC_UID`),
  KEY `BPMN_DOCUMENTATION_I_1` (`DOC_UID`),
  KEY `BPMN_DOCUMENTATION_I_2` (`PRJ_UID`),
  CONSTRAINT `fk_bpmn_documentation_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_EVENT`
--

DROP TABLE IF EXISTS `BPMN_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_EVENT` (
  `EVN_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) DEFAULT '',
  `EVN_NAME` varchar(255) DEFAULT NULL,
  `EVN_TYPE` varchar(30) NOT NULL DEFAULT '',
  `EVN_MARKER` varchar(30) NOT NULL DEFAULT 'EMPTY',
  `EVN_IS_INTERRUPTING` tinyint(4) DEFAULT '1',
  `EVN_ATTACHED_TO` varchar(32) DEFAULT '',
  `EVN_CANCEL_ACTIVITY` tinyint(4) DEFAULT '0',
  `EVN_ACTIVITY_REF` varchar(32) DEFAULT '',
  `EVN_WAIT_FOR_COMPLETION` tinyint(4) DEFAULT '1',
  `EVN_ERROR_NAME` varchar(255) DEFAULT NULL,
  `EVN_ERROR_CODE` varchar(255) DEFAULT NULL,
  `EVN_ESCALATION_NAME` varchar(255) DEFAULT NULL,
  `EVN_ESCALATION_CODE` varchar(255) DEFAULT NULL,
  `EVN_CONDITION` varchar(255) DEFAULT NULL,
  `EVN_MESSAGE` mediumtext,
  `EVN_OPERATION_NAME` varchar(255) DEFAULT NULL,
  `EVN_OPERATION_IMPLEMENTATION_REF` varchar(255) DEFAULT NULL,
  `EVN_TIME_DATE` varchar(255) DEFAULT NULL,
  `EVN_TIME_CYCLE` varchar(255) DEFAULT NULL,
  `EVN_TIME_DURATION` varchar(255) DEFAULT NULL,
  `EVN_BEHAVIOR` varchar(20) NOT NULL DEFAULT 'CATCH',
  PRIMARY KEY (`EVN_UID`),
  KEY `BPMN_EVENT_I_1` (`EVN_UID`),
  KEY `BPMN_EVENT_I_2` (`PRJ_UID`),
  KEY `BPMN_EVENT_I_3` (`PRO_UID`),
  CONSTRAINT `fk_bpmn_event_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`),
  CONSTRAINT `fk_bpmn_event_process` FOREIGN KEY (`PRO_UID`) REFERENCES `BPMN_PROCESS` (`PRO_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_EXTENSION`
--

DROP TABLE IF EXISTS `BPMN_EXTENSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_EXTENSION` (
  `EXT_UID` varchar(32) NOT NULL,
  `PRJ_UID` varchar(32) NOT NULL,
  `EXT_ELEMENT` varchar(32) NOT NULL,
  `EXT_ELEMENT_TYPE` varchar(45) NOT NULL,
  `EXT_EXTENSION` mediumtext,
  PRIMARY KEY (`EXT_UID`),
  KEY `BPMN_EXTENSION_I_1` (`EXT_UID`),
  KEY `BPMN_EXTENSION_I_2` (`PRJ_UID`),
  CONSTRAINT `fk_bpmn_extension_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_FLOW`
--

DROP TABLE IF EXISTS `BPMN_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_FLOW` (
  `FLO_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL DEFAULT '',
  `DIA_UID` varchar(32) NOT NULL DEFAULT '',
  `FLO_TYPE` varchar(20) NOT NULL DEFAULT '',
  `FLO_NAME` varchar(255) DEFAULT '',
  `FLO_ELEMENT_ORIGIN` varchar(32) NOT NULL DEFAULT '',
  `FLO_ELEMENT_ORIGIN_TYPE` varchar(32) NOT NULL DEFAULT '',
  `FLO_ELEMENT_ORIGIN_PORT` int(11) NOT NULL DEFAULT '0',
  `FLO_ELEMENT_DEST` varchar(32) NOT NULL DEFAULT '',
  `FLO_ELEMENT_DEST_TYPE` varchar(32) NOT NULL DEFAULT '',
  `FLO_ELEMENT_DEST_PORT` int(11) NOT NULL DEFAULT '0',
  `FLO_IS_INMEDIATE` tinyint(4) DEFAULT NULL,
  `FLO_CONDITION` varchar(512) DEFAULT NULL,
  `FLO_X1` int(11) NOT NULL DEFAULT '0',
  `FLO_Y1` int(11) NOT NULL DEFAULT '0',
  `FLO_X2` int(11) NOT NULL DEFAULT '0',
  `FLO_Y2` int(11) NOT NULL DEFAULT '0',
  `FLO_STATE` mediumtext,
  `FLO_POSITION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FLO_UID`),
  KEY `BPMN_FLOW_I_1` (`FLO_UID`),
  KEY `BPMN_FLOW_I_2` (`PRJ_UID`),
  KEY `BPMN_FLOW_I_3` (`DIA_UID`),
  CONSTRAINT `fk_bpmn_flow_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`),
  CONSTRAINT `fk_bpmn_flow_diagram` FOREIGN KEY (`DIA_UID`) REFERENCES `BPMN_DIAGRAM` (`DIA_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_GATEWAY`
--

DROP TABLE IF EXISTS `BPMN_GATEWAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_GATEWAY` (
  `GAT_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) DEFAULT '',
  `GAT_NAME` varchar(255) DEFAULT NULL,
  `GAT_TYPE` varchar(30) NOT NULL DEFAULT '',
  `GAT_DIRECTION` varchar(30) DEFAULT 'UNSPECIFIED',
  `GAT_INSTANTIATE` tinyint(4) DEFAULT '0',
  `GAT_EVENT_GATEWAY_TYPE` varchar(20) DEFAULT 'NONE',
  `GAT_ACTIVATION_COUNT` int(11) DEFAULT '0',
  `GAT_WAITING_FOR_START` tinyint(4) DEFAULT '1',
  `GAT_DEFAULT_FLOW` varchar(32) DEFAULT '',
  PRIMARY KEY (`GAT_UID`),
  KEY `BPMN_GATEWAY_I_1` (`GAT_UID`),
  KEY `BPMN_GATEWAY_I_2` (`PRJ_UID`),
  KEY `BPMN_GATEWAY_I_3` (`PRO_UID`),
  CONSTRAINT `fk_bpmn_gateway_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`),
  CONSTRAINT `fk_bpmn_gateway_process` FOREIGN KEY (`PRO_UID`) REFERENCES `BPMN_PROCESS` (`PRO_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_LANE`
--

DROP TABLE IF EXISTS `BPMN_LANE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_LANE` (
  `LAN_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL,
  `LNS_UID` varchar(32) NOT NULL,
  `LAN_NAME` varchar(255) DEFAULT NULL,
  `LAN_CHILD_LANESET` varchar(32) DEFAULT NULL,
  `LAN_IS_HORIZONTAL` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`LAN_UID`),
  KEY `BPMN_LANE_I_1` (`LAN_UID`),
  KEY `BPMN_LANE_I_2` (`PRJ_UID`),
  KEY `BPMN_LANE_I_3` (`LNS_UID`),
  CONSTRAINT `fk_bpmn_lane_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_LANESET`
--

DROP TABLE IF EXISTS `BPMN_LANESET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_LANESET` (
  `LNS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL,
  `PRO_UID` varchar(32) DEFAULT NULL,
  `LNS_NAME` varchar(255) DEFAULT NULL,
  `LNS_PARENT_LANE` varchar(32) DEFAULT NULL,
  `LNS_IS_HORIZONTAL` tinyint(4) DEFAULT '1',
  `LNS_STATE` mediumtext,
  PRIMARY KEY (`LNS_UID`),
  KEY `BPMN_LANESET_I_1` (`LNS_UID`),
  KEY `BPMN_LANESET_I_2` (`PRJ_UID`),
  KEY `BPMN_LANESET_I_3` (`PRO_UID`),
  CONSTRAINT `fk_bpmn_laneset_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`),
  CONSTRAINT `fk_bpmn_laneset_process` FOREIGN KEY (`PRO_UID`) REFERENCES `BPMN_PROCESS` (`PRO_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_PARTICIPANT`
--

DROP TABLE IF EXISTS `BPMN_PARTICIPANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_PARTICIPANT` (
  `PAR_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) DEFAULT '',
  `LNS_UID` varchar(32) DEFAULT '',
  `PAR_NAME` varchar(255) NOT NULL DEFAULT '',
  `PAR_MINIMUM` int(11) DEFAULT '0',
  `PAR_MAXIMUM` int(11) DEFAULT '1',
  `PAR_NUM_PARTICIPANTS` int(11) DEFAULT '1',
  `PAR_IS_HORIZONTAL` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`PAR_UID`),
  KEY `BPMN_PARTICIPANT_I_1` (`PAR_UID`),
  KEY `BPMN_PARTICIPANT_I_2` (`PRJ_UID`),
  CONSTRAINT `fk_bpmn_participant_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_PROCESS`
--

DROP TABLE IF EXISTS `BPMN_PROCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_PROCESS` (
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL,
  `DIA_UID` varchar(32) DEFAULT NULL,
  `PRO_NAME` varchar(255) NOT NULL,
  `PRO_TYPE` varchar(10) NOT NULL DEFAULT 'NONE',
  `PRO_IS_EXECUTABLE` tinyint(4) NOT NULL DEFAULT '0',
  `PRO_IS_CLOSED` tinyint(4) NOT NULL DEFAULT '0',
  `PRO_IS_SUBPROCESS` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PRO_UID`),
  KEY `BPMN_PROCESS_I_1` (`PRO_UID`),
  KEY `BPMN_PROCESS_I_2` (`PRJ_UID`),
  CONSTRAINT `fk_bpmn_process_project` FOREIGN KEY (`PRJ_UID`) REFERENCES `BPMN_PROJECT` (`PRJ_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BPMN_PROJECT`
--

DROP TABLE IF EXISTS `BPMN_PROJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BPMN_PROJECT` (
  `PRJ_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_NAME` varchar(255) NOT NULL DEFAULT '',
  `PRJ_DESCRIPTION` varchar(512) DEFAULT NULL,
  `PRJ_TARGET_NAMESPACE` mediumtext,
  `PRJ_EXPRESION_LANGUAGE` mediumtext,
  `PRJ_TYPE_LANGUAGE` mediumtext,
  `PRJ_EXPORTER` mediumtext,
  `PRJ_EXPORTER_VERSION` mediumtext,
  `PRJ_CREATE_DATE` datetime NOT NULL,
  `PRJ_UPDATE_DATE` datetime DEFAULT NULL,
  `PRJ_AUTHOR` mediumtext,
  `PRJ_AUTHOR_VERSION` mediumtext,
  `PRJ_ORIGINAL_SOURCE` mediumtext,
  PRIMARY KEY (`PRJ_UID`),
  KEY `BPMN_PROJECT_I_1` (`PRJ_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CALENDAR_ASSIGNMENTS`
--

DROP TABLE IF EXISTS `CALENDAR_ASSIGNMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CALENDAR_ASSIGNMENTS` (
  `OBJECT_UID` varchar(32) NOT NULL DEFAULT '',
  `CALENDAR_UID` varchar(32) NOT NULL DEFAULT '',
  `OBJECT_TYPE` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`OBJECT_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Calendar Holidays';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CALENDAR_BUSINESS_HOURS`
--

DROP TABLE IF EXISTS `CALENDAR_BUSINESS_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CALENDAR_BUSINESS_HOURS` (
  `CALENDAR_UID` varchar(32) NOT NULL DEFAULT '',
  `CALENDAR_BUSINESS_DAY` varchar(10) NOT NULL DEFAULT '',
  `CALENDAR_BUSINESS_START` varchar(10) NOT NULL DEFAULT '',
  `CALENDAR_BUSINESS_END` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`CALENDAR_UID`,`CALENDAR_BUSINESS_DAY`,`CALENDAR_BUSINESS_START`,`CALENDAR_BUSINESS_END`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Calendar Business Hours';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CALENDAR_DEFINITION`
--

DROP TABLE IF EXISTS `CALENDAR_DEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CALENDAR_DEFINITION` (
  `CALENDAR_UID` varchar(32) NOT NULL DEFAULT '',
  `CALENDAR_NAME` varchar(100) NOT NULL DEFAULT '',
  `CALENDAR_CREATE_DATE` datetime NOT NULL,
  `CALENDAR_UPDATE_DATE` datetime DEFAULT NULL,
  `CALENDAR_WORK_DAYS` varchar(100) NOT NULL DEFAULT '',
  `CALENDAR_DESCRIPTION` mediumtext NOT NULL,
  `CALENDAR_STATUS` varchar(8) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`CALENDAR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Calendar Definition used by PM';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CALENDAR_HOLIDAYS`
--

DROP TABLE IF EXISTS `CALENDAR_HOLIDAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CALENDAR_HOLIDAYS` (
  `CALENDAR_UID` varchar(32) NOT NULL DEFAULT '',
  `CALENDAR_HOLIDAY_NAME` varchar(100) NOT NULL DEFAULT '',
  `CALENDAR_HOLIDAY_START` datetime NOT NULL,
  `CALENDAR_HOLIDAY_END` datetime NOT NULL,
  PRIMARY KEY (`CALENDAR_UID`,`CALENDAR_HOLIDAY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Calendar Holidays';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CASE_CONSOLIDATED`
--

DROP TABLE IF EXISTS `CASE_CONSOLIDATED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CASE_CONSOLIDATED` (
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `DYN_UID` varchar(32) NOT NULL DEFAULT '',
  `REP_TAB_UID` varchar(32) NOT NULL DEFAULT '',
  `CON_STATUS` varchar(20) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`TAS_UID`),
  KEY `indexConStatus` (`CON_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CASE_SCHEDULER`
--

DROP TABLE IF EXISTS `CASE_SCHEDULER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CASE_SCHEDULER` (
  `SCH_UID` varchar(32) NOT NULL,
  `SCH_DEL_USER_NAME` varchar(100) NOT NULL,
  `SCH_DEL_USER_PASS` varchar(100) NOT NULL,
  `SCH_DEL_USER_UID` varchar(100) NOT NULL,
  `SCH_NAME` varchar(100) NOT NULL,
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `SCH_TIME_NEXT_RUN` datetime NOT NULL,
  `SCH_LAST_RUN_TIME` datetime DEFAULT NULL,
  `SCH_STATE` varchar(15) NOT NULL DEFAULT 'ACTIVE',
  `SCH_LAST_STATE` varchar(60) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `SCH_OPTION` tinyint(4) NOT NULL DEFAULT '0',
  `SCH_START_TIME` datetime NOT NULL,
  `SCH_START_DATE` datetime NOT NULL,
  `SCH_DAYS_PERFORM_TASK` char(5) NOT NULL DEFAULT '',
  `SCH_EVERY_DAYS` tinyint(4) DEFAULT '0',
  `SCH_WEEK_DAYS` char(14) NOT NULL DEFAULT '0|0|0|0|0|0|0',
  `SCH_START_DAY` char(6) NOT NULL DEFAULT '',
  `SCH_MONTHS` char(27) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0',
  `SCH_END_DATE` datetime DEFAULT NULL,
  `SCH_REPEAT_EVERY` varchar(15) NOT NULL DEFAULT '',
  `SCH_REPEAT_UNTIL` varchar(15) NOT NULL DEFAULT '',
  `SCH_REPEAT_STOP_IF_RUNNING` tinyint(4) DEFAULT '0',
  `SCH_EXECUTION_DATE` datetime DEFAULT NULL,
  `CASE_SH_PLUGIN_UID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SCH_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Conditions store to show or hide dynaform fields..';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CASE_TRACKER`
--

DROP TABLE IF EXISTS `CASE_TRACKER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CASE_TRACKER` (
  `PRO_UID` varchar(32) NOT NULL DEFAULT '0',
  `CT_MAP_TYPE` varchar(10) NOT NULL DEFAULT '0',
  `CT_DERIVATION_HISTORY` int(11) NOT NULL DEFAULT '0',
  `CT_MESSAGE_HISTORY` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PRO_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CASE_TRACKER';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CASE_TRACKER_OBJECT`
--

DROP TABLE IF EXISTS `CASE_TRACKER_OBJECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CASE_TRACKER_OBJECT` (
  `CTO_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '0',
  `CTO_TYPE_OBJ` varchar(20) NOT NULL DEFAULT 'DYNAFORM',
  `CTO_UID_OBJ` varchar(32) NOT NULL DEFAULT '0',
  `CTO_CONDITION` mediumtext NOT NULL,
  `CTO_POSITION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`CTO_UID`),
  KEY `indexCaseTrackerObject` (`PRO_UID`,`CTO_UID_OBJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CATALOG`
--

DROP TABLE IF EXISTS `CATALOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATALOG` (
  `CAT_UID` varchar(32) NOT NULL DEFAULT '',
  `CAT_LABEL_ID` varchar(100) NOT NULL DEFAULT '',
  `CAT_TYPE` varchar(100) NOT NULL DEFAULT '',
  `CAT_FLAG` varchar(50) DEFAULT '',
  `CAT_OBSERVATION` mediumtext,
  `CAT_CREATE_DATE` datetime NOT NULL,
  `CAT_UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`CAT_UID`,`CAT_TYPE`),
  KEY `indexType` (`CAT_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Definitions catalog.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CONFIGURATION`
--

DROP TABLE IF EXISTS `CONFIGURATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONFIGURATION` (
  `CFG_UID` varchar(32) NOT NULL DEFAULT '',
  `OBJ_UID` varchar(128) NOT NULL DEFAULT '',
  `CFG_VALUE` mediumtext NOT NULL,
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`CFG_UID`,`OBJ_UID`,`PRO_UID`,`USR_UID`,`APP_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the users, processes and/or applications configuratio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CONTENT`
--

DROP TABLE IF EXISTS `CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTENT` (
  `CON_CATEGORY` varchar(30) NOT NULL DEFAULT '',
  `CON_PARENT` varchar(32) NOT NULL DEFAULT '',
  `CON_ID` varchar(100) NOT NULL DEFAULT '',
  `CON_LANG` varchar(10) NOT NULL DEFAULT '',
  `CON_VALUE` mediumtext NOT NULL,
  PRIMARY KEY (`CON_CATEGORY`,`CON_PARENT`,`CON_ID`,`CON_LANG`),
  KEY `indexUidLang` (`CON_ID`,`CON_LANG`),
  KEY `indexCatParUidLang` (`CON_CATEGORY`,`CON_PARENT`,`CON_ID`,`CON_LANG`),
  KEY `indexUid` (`CON_ID`,`CON_CATEGORY`,`CON_LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER CONTENT_UPDATE BEFORE UPDATE ON CONTENT

FOR EACH ROW
BEGIN

  DECLARE str MEDIUMTEXT;
  
  IF (NEW.CON_VALUE IS NULL) THEN
    SET str = '';
  ELSE
    SET str = NEW.CON_VALUE;
  END IF;
  
  CASE (NEW.CON_CATEGORY)
    WHEN 'APP_TITLE' THEN
      BEGIN
        UPDATE APP_CACHE_VIEW
        SET    APP_TITLE = str
        WHERE  APP_UID = NEW.CON_ID;
      END;
    
    WHEN 'PRO_TITLE' THEN
      BEGIN
        UPDATE APP_CACHE_VIEW
        SET    APP_PRO_TITLE = str
        WHERE  PRO_UID = NEW.CON_ID;
      END;
      
    WHEN 'TAS_TITLE' THEN
      BEGIN
        UPDATE APP_CACHE_VIEW
        SET    APP_TAS_TITLE = str
        WHERE  TAS_UID = NEW.CON_ID;
      END;
    
    ELSE
      BEGIN
      END;
  END CASE;
  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DASHBOARD`
--

DROP TABLE IF EXISTS `DASHBOARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DASHBOARD` (
  `DAS_UID` varchar(32) NOT NULL DEFAULT '',
  `DAS_TITLE` varchar(255) NOT NULL DEFAULT '',
  `DAS_DESCRIPTION` mediumtext,
  `DAS_CREATE_DATE` datetime NOT NULL,
  `DAS_UPDATE_DATE` datetime DEFAULT NULL,
  `DAS_STATUS` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`DAS_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dashboard definitions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DASHBOARD_DAS_IND`
--

DROP TABLE IF EXISTS `DASHBOARD_DAS_IND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DASHBOARD_DAS_IND` (
  `DAS_UID` varchar(32) NOT NULL DEFAULT '',
  `OWNER_UID` varchar(32) NOT NULL DEFAULT '',
  `OWNER_TYPE` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`DAS_UID`,`OWNER_UID`),
  CONSTRAINT `fk_dashboard_indicator_dashboard_das_ind` FOREIGN KEY (`DAS_UID`) REFERENCES `DASHBOARD` (`DAS_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dashboard definitions to user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DASHBOARD_INDICATOR`
--

DROP TABLE IF EXISTS `DASHBOARD_INDICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DASHBOARD_INDICATOR` (
  `DAS_IND_UID` varchar(32) NOT NULL DEFAULT '',
  `DAS_UID` varchar(32) NOT NULL DEFAULT '',
  `DAS_IND_TYPE` varchar(32) NOT NULL DEFAULT '',
  `DAS_IND_TITLE` varchar(255) NOT NULL DEFAULT '',
  `DAS_IND_GOAL` decimal(7,2) DEFAULT '0.00',
  `DAS_IND_DIRECTION` tinyint(4) NOT NULL DEFAULT '2',
  `DAS_UID_PROCESS` varchar(32) NOT NULL DEFAULT '',
  `DAS_IND_FIRST_FIGURE` varchar(32) DEFAULT '',
  `DAS_IND_FIRST_FREQUENCY` varchar(32) DEFAULT '',
  `DAS_IND_SECOND_FIGURE` varchar(32) DEFAULT '',
  `DAS_IND_SECOND_FREQUENCY` varchar(32) DEFAULT '',
  `DAS_IND_CREATE_DATE` datetime NOT NULL,
  `DAS_IND_UPDATE_DATE` datetime DEFAULT NULL,
  `DAS_IND_STATUS` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`DAS_IND_UID`),
  KEY `indexDashboard` (`DAS_UID`,`DAS_IND_TYPE`),
  CONSTRAINT `fk_dashboard_indicator_dashboard` FOREIGN KEY (`DAS_UID`) REFERENCES `DASHBOARD` (`DAS_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dashboard Indicators definitions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DASHLET`
--

DROP TABLE IF EXISTS `DASHLET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DASHLET` (
  `DAS_UID` varchar(32) NOT NULL DEFAULT '',
  `DAS_CLASS` varchar(50) NOT NULL DEFAULT '',
  `DAS_TITLE` varchar(255) NOT NULL DEFAULT '',
  `DAS_DESCRIPTION` mediumtext,
  `DAS_VERSION` varchar(10) NOT NULL DEFAULT '1.0',
  `DAS_CREATE_DATE` datetime NOT NULL,
  `DAS_UPDATE_DATE` datetime DEFAULT NULL,
  `DAS_STATUS` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`DAS_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dashblets definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DASHLET_INSTANCE`
--

DROP TABLE IF EXISTS `DASHLET_INSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DASHLET_INSTANCE` (
  `DAS_INS_UID` varchar(32) NOT NULL DEFAULT '',
  `DAS_UID` varchar(32) NOT NULL DEFAULT '',
  `DAS_INS_OWNER_TYPE` varchar(20) NOT NULL DEFAULT '',
  `DAS_INS_OWNER_UID` varchar(32) DEFAULT '',
  `DAS_INS_ADDITIONAL_PROPERTIES` mediumtext,
  `DAS_INS_CREATE_DATE` datetime NOT NULL,
  `DAS_INS_UPDATE_DATE` datetime DEFAULT NULL,
  `DAS_INS_STATUS` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`DAS_INS_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dashblets definitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DB_SOURCE`
--

DROP TABLE IF EXISTS `DB_SOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DB_SOURCE` (
  `DBS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '0',
  `DBS_TYPE` varchar(8) NOT NULL DEFAULT '0',
  `DBS_SERVER` varchar(100) NOT NULL DEFAULT '0',
  `DBS_DATABASE_NAME` varchar(100) NOT NULL DEFAULT '0',
  `DBS_USERNAME` varchar(32) NOT NULL DEFAULT '0',
  `DBS_PASSWORD` varchar(256) DEFAULT '',
  `DBS_PORT` int(11) DEFAULT '0',
  `DBS_ENCODE` varchar(32) DEFAULT '',
  `DBS_CONNECTION_TYPE` varchar(32) DEFAULT 'NORMAL',
  `DBS_TNS` varchar(256) DEFAULT '',
  PRIMARY KEY (`DBS_UID`,`PRO_UID`),
  KEY `indexDBSource` (`PRO_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DB_SOURCE';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DEPARTMENT`
--

DROP TABLE IF EXISTS `DEPARTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTMENT` (
  `DEP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEP_TITLE` mediumtext NOT NULL,
  `DEP_PARENT` varchar(32) NOT NULL DEFAULT '',
  `DEP_MANAGER` varchar(32) NOT NULL DEFAULT '',
  `DEP_LOCATION` int(11) NOT NULL DEFAULT '0',
  `DEP_STATUS` varchar(10) NOT NULL DEFAULT 'ACTIVE',
  `DEP_REF_CODE` varchar(50) NOT NULL DEFAULT '',
  `DEP_LDAP_DN` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`DEP_UID`),
  KEY `DEP_BYPARENT` (`DEP_PARENT`),
  KEY `BY_DEP_LDAP_DN` (`DEP_LDAP_DN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Departments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DIM_TIME_COMPLETE`
--

DROP TABLE IF EXISTS `DIM_TIME_COMPLETE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DIM_TIME_COMPLETE` (
  `TIME_ID` varchar(10) NOT NULL DEFAULT '',
  `MONTH_ID` int(11) NOT NULL DEFAULT '0',
  `QTR_ID` int(11) NOT NULL DEFAULT '0',
  `YEAR_ID` int(11) NOT NULL DEFAULT '0',
  `MONTH_NAME` varchar(3) NOT NULL DEFAULT '0',
  `MONTH_DESC` varchar(9) NOT NULL DEFAULT '',
  `QTR_NAME` varchar(4) NOT NULL DEFAULT '',
  `QTR_DESC` varchar(9) NOT NULL DEFAULT '',
  PRIMARY KEY (`TIME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The application';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DIM_TIME_DELEGATE`
--

DROP TABLE IF EXISTS `DIM_TIME_DELEGATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DIM_TIME_DELEGATE` (
  `TIME_ID` varchar(10) NOT NULL DEFAULT '',
  `MONTH_ID` int(11) NOT NULL DEFAULT '0',
  `QTR_ID` int(11) NOT NULL DEFAULT '0',
  `YEAR_ID` int(11) NOT NULL DEFAULT '0',
  `MONTH_NAME` varchar(3) NOT NULL DEFAULT '0',
  `MONTH_DESC` varchar(9) NOT NULL DEFAULT '',
  `QTR_NAME` varchar(4) NOT NULL DEFAULT '',
  `QTR_DESC` varchar(9) NOT NULL DEFAULT '',
  PRIMARY KEY (`TIME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The application';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DYNAFORM`
--

DROP TABLE IF EXISTS `DYNAFORM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DYNAFORM` (
  `DYN_UID` varchar(32) NOT NULL DEFAULT '',
  `DYN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DYN_TITLE` mediumtext NOT NULL,
  `DYN_DESCRIPTION` mediumtext,
  `PRO_UID` varchar(32) NOT NULL DEFAULT '0',
  `DYN_TYPE` varchar(20) NOT NULL DEFAULT 'xmlform',
  `DYN_FILENAME` varchar(100) NOT NULL DEFAULT '',
  `DYN_CONTENT` mediumtext,
  `DYN_LABEL` mediumtext,
  `DYN_VERSION` int(11) NOT NULL,
  `DYN_UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`DYN_UID`),
  UNIQUE KEY `INDEX_DYN_ID` (`DYN_ID`),
  KEY `INDEX_PRO_UID` (`PRO_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Forms required';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ELEMENT_TASK_RELATION`
--

DROP TABLE IF EXISTS `ELEMENT_TASK_RELATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ELEMENT_TASK_RELATION` (
  `ETR_UID` varchar(32) NOT NULL,
  `PRJ_UID` varchar(32) NOT NULL,
  `ELEMENT_UID` varchar(32) NOT NULL,
  `ELEMENT_TYPE` varchar(50) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL,
  PRIMARY KEY (`ETR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EMAIL_EVENT`
--

DROP TABLE IF EXISTS `EMAIL_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMAIL_EVENT` (
  `EMAIL_EVENT_UID` varchar(32) NOT NULL,
  `PRJ_UID` varchar(32) NOT NULL DEFAULT '',
  `EVN_UID` varchar(32) NOT NULL,
  `EMAIL_EVENT_FROM` varchar(100) NOT NULL DEFAULT '',
  `EMAIL_EVENT_TO` mediumtext NOT NULL,
  `EMAIL_EVENT_SUBJECT` varchar(255) DEFAULT '',
  `PRF_UID` varchar(32) DEFAULT '',
  `EMAIL_SERVER_UID` varchar(32) DEFAULT '',
  PRIMARY KEY (`EMAIL_EVENT_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EMAIL_SERVER`
--

DROP TABLE IF EXISTS `EMAIL_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMAIL_SERVER` (
  `MESS_UID` varchar(32) NOT NULL DEFAULT '',
  `MESS_ENGINE` varchar(256) NOT NULL DEFAULT '',
  `MESS_SERVER` varchar(256) NOT NULL DEFAULT '',
  `MESS_PORT` int(11) NOT NULL DEFAULT '0',
  `MESS_RAUTH` int(11) NOT NULL DEFAULT '0',
  `MESS_ACCOUNT` varchar(256) NOT NULL DEFAULT '',
  `MESS_PASSWORD` varchar(256) NOT NULL DEFAULT '',
  `MESS_FROM_MAIL` varchar(256) DEFAULT '',
  `MESS_FROM_NAME` varchar(256) DEFAULT '',
  `SMTPSECURE` varchar(3) NOT NULL DEFAULT 'No',
  `MESS_TRY_SEND_INMEDIATLY` int(11) NOT NULL DEFAULT '0',
  `MAIL_TO` varchar(256) DEFAULT '',
  `MESS_DEFAULT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MESS_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EVENT`
--

DROP TABLE IF EXISTS `EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT` (
  `EVN_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `EVN_STATUS` varchar(16) NOT NULL DEFAULT 'OPEN',
  `EVN_WHEN_OCCURS` varchar(32) DEFAULT 'SINGLE',
  `EVN_RELATED_TO` varchar(16) DEFAULT 'SINGLE',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `EVN_TAS_UID_FROM` varchar(32) DEFAULT '',
  `EVN_TAS_UID_TO` varchar(32) DEFAULT '',
  `EVN_TAS_ESTIMATED_DURATION` double DEFAULT '0',
  `EVN_TIME_UNIT` varchar(10) NOT NULL DEFAULT 'DAYS',
  `EVN_WHEN` double NOT NULL DEFAULT '0',
  `EVN_MAX_ATTEMPTS` tinyint(4) NOT NULL DEFAULT '3',
  `EVN_ACTION` varchar(50) NOT NULL DEFAULT '',
  `EVN_CONDITIONS` mediumtext,
  `EVN_ACTION_PARAMETERS` mediumtext,
  `TRI_UID` varchar(32) DEFAULT '',
  `EVN_POSX` int(11) NOT NULL DEFAULT '0',
  `EVN_POSY` int(11) NOT NULL DEFAULT '0',
  `EVN_TYPE` varchar(32) DEFAULT '',
  `TAS_EVN_UID` varchar(32) DEFAULT '',
  PRIMARY KEY (`EVN_UID`),
  KEY `indexEventTable` (`EVN_UID`),
  KEY `indexStatusActionProcess` (`EVN_STATUS`,`EVN_ACTION`,`PRO_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FIELDS`
--

DROP TABLE IF EXISTS `FIELDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIELDS` (
  `FLD_UID` varchar(32) NOT NULL DEFAULT '',
  `ADD_TAB_UID` varchar(32) NOT NULL DEFAULT '',
  `FLD_INDEX` int(11) NOT NULL DEFAULT '1',
  `FLD_NAME` varchar(60) NOT NULL DEFAULT '',
  `FLD_DESCRIPTION` mediumtext NOT NULL,
  `FLD_TYPE` varchar(20) NOT NULL DEFAULT '',
  `FLD_SIZE` int(11) DEFAULT '0',
  `FLD_NULL` tinyint(4) NOT NULL DEFAULT '1',
  `FLD_AUTO_INCREMENT` tinyint(4) NOT NULL DEFAULT '0',
  `FLD_KEY` tinyint(4) NOT NULL DEFAULT '0',
  `FLD_TABLE_INDEX` tinyint(4) NOT NULL DEFAULT '0',
  `FLD_FOREIGN_KEY` tinyint(4) DEFAULT '0',
  `FLD_FOREIGN_KEY_TABLE` varchar(32) NOT NULL DEFAULT '',
  `FLD_DYN_NAME` varchar(128) DEFAULT '',
  `FLD_DYN_UID` varchar(128) DEFAULT '',
  `FLD_FILTER` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`FLD_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FIELD_CONDITION`
--

DROP TABLE IF EXISTS `FIELD_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIELD_CONDITION` (
  `FCD_UID` varchar(32) NOT NULL DEFAULT '',
  `FCD_FUNCTION` varchar(50) NOT NULL,
  `FCD_FIELDS` mediumtext,
  `FCD_CONDITION` mediumtext,
  `FCD_EVENTS` mediumtext,
  `FCD_EVENT_OWNERS` mediumtext,
  `FCD_STATUS` varchar(10) DEFAULT NULL,
  `FCD_DYN_UID` varchar(32) NOT NULL,
  PRIMARY KEY (`FCD_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Conditions store to show or hide dynaform fields..';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GATEWAY`
--

DROP TABLE IF EXISTS `GATEWAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GATEWAY` (
  `GAT_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `GAT_NEXT_TASK` varchar(32) NOT NULL DEFAULT '',
  `GAT_X` int(11) NOT NULL DEFAULT '0',
  `GAT_Y` int(11) NOT NULL DEFAULT '0',
  `GAT_TYPE` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`GAT_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GMAIL_RELABELING`
--

DROP TABLE IF EXISTS `GMAIL_RELABELING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GMAIL_RELABELING` (
  `LABELING_UID` varchar(32) NOT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `CURRENT_LAST_INDEX` int(11) NOT NULL DEFAULT '0',
  `UNASSIGNED` int(11) NOT NULL DEFAULT '0',
  `STATUS` varchar(32) NOT NULL DEFAULT 'pending',
  `MSG_ERROR` mediumtext,
  PRIMARY KEY (`LABELING_UID`),
  KEY `indexStatus` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Task for label relabaling';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GROUPWF`
--

DROP TABLE IF EXISTS `GROUPWF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUPWF` (
  `GRP_UID` varchar(32) NOT NULL,
  `GRP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GRP_TITLE` mediumtext NOT NULL,
  `GRP_STATUS` char(8) NOT NULL DEFAULT 'ACTIVE',
  `GRP_LDAP_DN` varchar(255) NOT NULL DEFAULT '',
  `GRP_UX` varchar(128) DEFAULT 'NORMAL',
  PRIMARY KEY (`GRP_UID`),
  UNIQUE KEY `GRP_ID` (`GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GROUP_USER`
--

DROP TABLE IF EXISTS `GROUP_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_USER` (
  `GRP_UID` varchar(32) NOT NULL DEFAULT '0',
  `GRP_ID` int(11) DEFAULT '0',
  `USR_UID` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`GRP_UID`,`USR_UID`),
  KEY `indexForUsrUid` (`USR_UID`),
  KEY `INDEX_GRP_ID` (`GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HOLIDAY`
--

DROP TABLE IF EXISTS `HOLIDAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HOLIDAY` (
  `HLD_UID` int(11) NOT NULL AUTO_INCREMENT,
  `HLD_DATE` varchar(10) NOT NULL DEFAULT '0000-00-00',
  `HLD_DESCRIPTION` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`HLD_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `INPUT_DOCUMENT`
--

DROP TABLE IF EXISTS `INPUT_DOCUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INPUT_DOCUMENT` (
  `INP_DOC_UID` varchar(32) NOT NULL DEFAULT '',
  `INP_DOC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRO_UID` varchar(32) NOT NULL DEFAULT '0',
  `INP_DOC_TITLE` mediumtext NOT NULL,
  `INP_DOC_DESCRIPTION` mediumtext,
  `INP_DOC_FORM_NEEDED` varchar(20) NOT NULL DEFAULT 'REAL',
  `INP_DOC_ORIGINAL` varchar(20) NOT NULL DEFAULT 'COPY',
  `INP_DOC_PUBLISHED` varchar(20) NOT NULL DEFAULT 'PRIVATE',
  `INP_DOC_VERSIONING` tinyint(4) NOT NULL DEFAULT '0',
  `INP_DOC_DESTINATION_PATH` mediumtext,
  `INP_DOC_TAGS` mediumtext,
  `INP_DOC_TYPE_FILE` varchar(200) DEFAULT '*.*',
  `INP_DOC_MAX_FILESIZE` int(11) NOT NULL DEFAULT '0',
  `INP_DOC_MAX_FILESIZE_UNIT` varchar(2) NOT NULL DEFAULT 'KB',
  PRIMARY KEY (`INP_DOC_UID`),
  UNIQUE KEY `INDEX_INP_DOC_ID` (`INP_DOC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Documentation required';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ISO_COUNTRY`
--

DROP TABLE IF EXISTS `ISO_COUNTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ISO_COUNTRY` (
  `IC_UID` varchar(2) NOT NULL DEFAULT '',
  `IC_NAME` varchar(255) DEFAULT NULL,
  `IC_SORT_ORDER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IC_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ISO_LOCATION`
--

DROP TABLE IF EXISTS `ISO_LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ISO_LOCATION` (
  `IC_UID` varchar(2) NOT NULL DEFAULT '',
  `IL_UID` varchar(5) NOT NULL DEFAULT '',
  `IL_NAME` varchar(255) DEFAULT NULL,
  `IL_NORMAL_NAME` varchar(255) DEFAULT NULL,
  `IS_UID` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`IC_UID`,`IL_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ISO_SUBDIVISION`
--

DROP TABLE IF EXISTS `ISO_SUBDIVISION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ISO_SUBDIVISION` (
  `IC_UID` varchar(2) NOT NULL DEFAULT '',
  `IS_UID` varchar(4) NOT NULL DEFAULT '',
  `IS_NAME` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`IC_UID`,`IS_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LANGUAGE`
--

DROP TABLE IF EXISTS `LANGUAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LANGUAGE` (
  `LAN_ID` varchar(4) NOT NULL DEFAULT '',
  `LAN_LOCATION` varchar(4) NOT NULL DEFAULT '',
  `LAN_NAME` varchar(30) NOT NULL DEFAULT '',
  `LAN_NATIVE_NAME` varchar(30) NOT NULL DEFAULT '',
  `LAN_DIRECTION` char(1) NOT NULL DEFAULT 'L',
  `LAN_WEIGHT` int(11) NOT NULL DEFAULT '0',
  `LAN_ENABLED` char(1) NOT NULL DEFAULT '1',
  `LAN_CALENDAR` varchar(30) NOT NULL DEFAULT 'GREGORIAN',
  PRIMARY KEY (`LAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LEXICO`
--

DROP TABLE IF EXISTS `LEXICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LEXICO` (
  `LEX_TOPIC` varchar(64) NOT NULL DEFAULT '',
  `LEX_KEY` varchar(128) NOT NULL DEFAULT '',
  `LEX_VALUE` varchar(128) NOT NULL DEFAULT '',
  `LEX_CAPTION` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`LEX_TOPIC`,`LEX_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='LEXICOS, una tabla que contiene tablas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LICENSE_MANAGER`
--

DROP TABLE IF EXISTS `LICENSE_MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LICENSE_MANAGER` (
  `LICENSE_UID` varchar(32) NOT NULL,
  `LICENSE_USER` varchar(150) NOT NULL DEFAULT '0',
  `LICENSE_START` int(11) NOT NULL DEFAULT '0',
  `LICENSE_END` int(11) NOT NULL DEFAULT '0',
  `LICENSE_SPAN` int(11) NOT NULL DEFAULT '0',
  `LICENSE_STATUS` varchar(100) NOT NULL DEFAULT '',
  `LICENSE_DATA` mediumtext NOT NULL,
  `LICENSE_PATH` varchar(255) NOT NULL DEFAULT '0',
  `LICENSE_WORKSPACE` varchar(32) NOT NULL DEFAULT '0',
  `LICENSE_TYPE` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LICENSE_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LIST_CANCELED`
--

DROP TABLE IF EXISTS `LIST_CANCELED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIST_CANCELED` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_NUMBER` int(11) NOT NULL DEFAULT '0',
  `APP_TITLE` mediumtext,
  `APP_PRO_TITLE` mediumtext,
  `APP_TAS_TITLE` mediumtext,
  `APP_CANCELED_DATE` datetime DEFAULT NULL,
  `DEL_PREVIOUS_USR_UID` varchar(32) DEFAULT '',
  `DEL_CURRENT_USR_USERNAME` varchar(100) DEFAULT '',
  `DEL_CURRENT_USR_FIRSTNAME` varchar(50) DEFAULT '',
  `DEL_CURRENT_USR_LASTNAME` varchar(50) DEFAULT '',
  `DEL_DELEGATE_DATE` datetime NOT NULL,
  `DEL_INIT_DATE` datetime DEFAULT NULL,
  `DEL_DUE_DATE` datetime DEFAULT NULL,
  `DEL_PRIORITY` varchar(32) NOT NULL DEFAULT '3',
  `PRO_ID` int(11) DEFAULT '0',
  `USR_ID` int(11) DEFAULT '0',
  `TAS_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`APP_UID`,`DEL_INDEX`),
  KEY `INDEX_PRO_ID` (`PRO_ID`),
  KEY `INDEX_USR_ID` (`USR_ID`),
  KEY `INDEX_TAS_ID` (`TAS_ID`),
  KEY `indexCanceledUser` (`USR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Canceled list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LIST_COMPLETED`
--

DROP TABLE IF EXISTS `LIST_COMPLETED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIST_COMPLETED` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_NUMBER` int(11) NOT NULL DEFAULT '0',
  `APP_TITLE` mediumtext,
  `APP_PRO_TITLE` mediumtext,
  `APP_TAS_TITLE` mediumtext,
  `APP_CREATE_DATE` datetime DEFAULT NULL,
  `APP_FINISH_DATE` datetime DEFAULT NULL,
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `DEL_PREVIOUS_USR_UID` varchar(32) DEFAULT '',
  `DEL_CURRENT_USR_USERNAME` varchar(100) DEFAULT '',
  `DEL_CURRENT_USR_FIRSTNAME` varchar(50) DEFAULT '',
  `DEL_CURRENT_USR_LASTNAME` varchar(50) DEFAULT '',
  `PRO_ID` int(11) DEFAULT '0',
  `USR_ID` int(11) DEFAULT '0',
  `TAS_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`APP_UID`),
  KEY `INDEX_PRO_ID` (`PRO_ID`),
  KEY `INDEX_USR_ID` (`USR_ID`),
  KEY `INDEX_TAS_ID` (`TAS_ID`),
  KEY `usrListCompleted` (`USR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Completed list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LIST_INBOX`
--

DROP TABLE IF EXISTS `LIST_INBOX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIST_INBOX` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_NUMBER` int(11) NOT NULL DEFAULT '0',
  `APP_STATUS` varchar(32) DEFAULT '0',
  `APP_TITLE` mediumtext,
  `APP_PRO_TITLE` mediumtext,
  `APP_TAS_TITLE` mediumtext,
  `APP_UPDATE_DATE` datetime DEFAULT NULL,
  `DEL_PREVIOUS_USR_UID` varchar(32) DEFAULT '',
  `DEL_PREVIOUS_USR_USERNAME` varchar(100) DEFAULT '',
  `DEL_PREVIOUS_USR_FIRSTNAME` varchar(50) DEFAULT '',
  `DEL_PREVIOUS_USR_LASTNAME` varchar(50) DEFAULT '',
  `DEL_DELEGATE_DATE` datetime NOT NULL,
  `DEL_INIT_DATE` datetime DEFAULT NULL,
  `DEL_DUE_DATE` datetime DEFAULT NULL,
  `DEL_RISK_DATE` datetime DEFAULT NULL,
  `DEL_PRIORITY` varchar(32) NOT NULL DEFAULT '3',
  `PRO_ID` int(11) DEFAULT '0',
  `USR_ID` int(11) DEFAULT '0',
  `TAS_ID` int(11) DEFAULT '0',
  `APP_STATUS_ID` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`APP_UID`,`DEL_INDEX`),
  KEY `indexUser` (`USR_UID`),
  KEY `indexInboxUser` (`USR_UID`,`DEL_DELEGATE_DATE`),
  KEY `indexInboxUserStatusUpdateDate` (`USR_UID`,`APP_STATUS`,`APP_UPDATE_DATE`),
  KEY `INDEX_PRO_ID` (`PRO_ID`),
  KEY `INDEX_USR_ID` (`USR_ID`),
  KEY `INDEX_TAS_ID` (`TAS_ID`),
  KEY `INDEX_APP_STATUS_ID` (`APP_STATUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Inbox list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LIST_MY_INBOX`
--

DROP TABLE IF EXISTS `LIST_MY_INBOX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIST_MY_INBOX` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_NUMBER` int(11) NOT NULL DEFAULT '0',
  `APP_TITLE` mediumtext,
  `APP_PRO_TITLE` mediumtext,
  `APP_TAS_TITLE` mediumtext,
  `APP_CREATE_DATE` datetime DEFAULT NULL,
  `APP_UPDATE_DATE` datetime DEFAULT NULL,
  `APP_FINISH_DATE` datetime DEFAULT NULL,
  `APP_STATUS` varchar(100) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `DEL_PREVIOUS_USR_UID` varchar(32) DEFAULT '',
  `DEL_PREVIOUS_USR_USERNAME` varchar(100) DEFAULT '',
  `DEL_PREVIOUS_USR_FIRSTNAME` varchar(50) DEFAULT '',
  `DEL_PREVIOUS_USR_LASTNAME` varchar(50) DEFAULT '',
  `DEL_CURRENT_USR_UID` varchar(32) DEFAULT '',
  `DEL_CURRENT_USR_USERNAME` varchar(100) DEFAULT '',
  `DEL_CURRENT_USR_FIRSTNAME` varchar(50) DEFAULT '',
  `DEL_CURRENT_USR_LASTNAME` varchar(50) DEFAULT '',
  `DEL_DELEGATE_DATE` datetime DEFAULT NULL,
  `DEL_INIT_DATE` datetime DEFAULT NULL,
  `DEL_DUE_DATE` datetime DEFAULT NULL,
  `DEL_PRIORITY` varchar(32) NOT NULL DEFAULT '3',
  `PRO_ID` int(11) DEFAULT '0',
  `USR_ID` int(11) DEFAULT '0',
  `TAS_ID` int(11) DEFAULT '0',
  `APP_STATUS_ID` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`APP_UID`),
  KEY `INDEX_PRO_ID` (`PRO_ID`),
  KEY `INDEX_USR_ID` (`USR_ID`),
  KEY `INDEX_TAS_ID` (`TAS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='My Inbox list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LIST_PARTICIPATED_HISTORY`
--

DROP TABLE IF EXISTS `LIST_PARTICIPATED_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIST_PARTICIPATED_HISTORY` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_NUMBER` int(11) NOT NULL DEFAULT '0',
  `APP_TITLE` mediumtext,
  `APP_PRO_TITLE` mediumtext,
  `APP_TAS_TITLE` mediumtext,
  `DEL_PREVIOUS_USR_UID` varchar(32) DEFAULT '',
  `DEL_PREVIOUS_USR_USERNAME` varchar(100) DEFAULT '',
  `DEL_PREVIOUS_USR_FIRSTNAME` varchar(50) DEFAULT '',
  `DEL_PREVIOUS_USR_LASTNAME` varchar(50) DEFAULT '',
  `DEL_CURRENT_USR_USERNAME` varchar(100) DEFAULT '',
  `DEL_CURRENT_USR_FIRSTNAME` varchar(50) DEFAULT '',
  `DEL_CURRENT_USR_LASTNAME` varchar(50) DEFAULT '',
  `DEL_DELEGATE_DATE` datetime NOT NULL,
  `DEL_INIT_DATE` datetime DEFAULT NULL,
  `DEL_DUE_DATE` datetime DEFAULT NULL,
  `DEL_PRIORITY` varchar(32) NOT NULL DEFAULT '3',
  `PRO_ID` int(11) DEFAULT '0',
  `USR_ID` int(11) DEFAULT '0',
  `TAS_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`APP_UID`,`DEL_INDEX`),
  KEY `indexInboxUser` (`USR_UID`,`DEL_DELEGATE_DATE`),
  KEY `INDEX_PRO_ID` (`PRO_ID`),
  KEY `INDEX_USR_ID` (`USR_ID`),
  KEY `INDEX_TAS_ID` (`TAS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Participated history list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LIST_PARTICIPATED_LAST`
--

DROP TABLE IF EXISTS `LIST_PARTICIPATED_LAST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIST_PARTICIPATED_LAST` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_NUMBER` int(11) NOT NULL DEFAULT '0',
  `APP_TITLE` mediumtext,
  `APP_PRO_TITLE` mediumtext,
  `APP_TAS_TITLE` mediumtext,
  `APP_STATUS` varchar(20) DEFAULT '0',
  `DEL_PREVIOUS_USR_UID` varchar(32) DEFAULT '',
  `DEL_PREVIOUS_USR_USERNAME` varchar(100) DEFAULT '',
  `DEL_PREVIOUS_USR_FIRSTNAME` varchar(50) DEFAULT '',
  `DEL_PREVIOUS_USR_LASTNAME` varchar(50) DEFAULT '',
  `DEL_CURRENT_USR_USERNAME` varchar(100) DEFAULT '',
  `DEL_CURRENT_USR_FIRSTNAME` varchar(50) DEFAULT '',
  `DEL_CURRENT_USR_LASTNAME` varchar(50) DEFAULT '',
  `DEL_CURRENT_TAS_TITLE` varchar(255) NOT NULL DEFAULT '',
  `DEL_DELEGATE_DATE` datetime NOT NULL,
  `DEL_INIT_DATE` datetime DEFAULT NULL,
  `DEL_DUE_DATE` datetime DEFAULT NULL,
  `DEL_PRIORITY` varchar(32) NOT NULL DEFAULT '3',
  `DEL_THREAD_STATUS` varchar(32) NOT NULL DEFAULT 'OPEN',
  `PRO_ID` int(11) DEFAULT '0',
  `USR_ID` int(11) DEFAULT '0',
  `TAS_ID` int(11) DEFAULT '0',
  `APP_STATUS_ID` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`APP_UID`,`USR_UID`,`DEL_INDEX`),
  KEY `usrIndex` (`USR_UID`),
  KEY `delDelegateDate` (`DEL_DELEGATE_DATE`),
  KEY `INDEX_PRO_ID` (`PRO_ID`),
  KEY `INDEX_USR_ID` (`USR_ID`),
  KEY `INDEX_TAS_ID` (`TAS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Participated last list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LIST_PAUSED`
--

DROP TABLE IF EXISTS `LIST_PAUSED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIST_PAUSED` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_NUMBER` int(11) NOT NULL DEFAULT '0',
  `APP_TITLE` mediumtext,
  `APP_PRO_TITLE` mediumtext,
  `APP_TAS_TITLE` mediumtext,
  `APP_PAUSED_DATE` datetime NOT NULL,
  `APP_RESTART_DATE` datetime NOT NULL,
  `DEL_PREVIOUS_USR_UID` varchar(32) DEFAULT '',
  `DEL_PREVIOUS_USR_USERNAME` varchar(100) DEFAULT '',
  `DEL_PREVIOUS_USR_FIRSTNAME` varchar(50) DEFAULT '',
  `DEL_PREVIOUS_USR_LASTNAME` varchar(50) DEFAULT '',
  `DEL_CURRENT_USR_USERNAME` varchar(100) DEFAULT '',
  `DEL_CURRENT_USR_FIRSTNAME` varchar(50) DEFAULT '',
  `DEL_CURRENT_USR_LASTNAME` varchar(50) DEFAULT '',
  `DEL_DELEGATE_DATE` datetime NOT NULL,
  `DEL_INIT_DATE` datetime DEFAULT NULL,
  `DEL_DUE_DATE` datetime DEFAULT NULL,
  `DEL_PRIORITY` varchar(32) NOT NULL DEFAULT '3',
  `PRO_ID` int(11) DEFAULT '0',
  `USR_ID` int(11) DEFAULT '0',
  `TAS_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`APP_UID`,`DEL_INDEX`),
  KEY `INDEX_PRO_ID` (`PRO_ID`),
  KEY `INDEX_USR_ID` (`USR_ID`),
  KEY `INDEX_TAS_ID` (`TAS_ID`),
  KEY `indexPausedUser` (`USR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paused list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LIST_UNASSIGNED`
--

DROP TABLE IF EXISTS `LIST_UNASSIGNED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIST_UNASSIGNED` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_NUMBER` int(11) NOT NULL DEFAULT '0',
  `APP_TITLE` mediumtext,
  `APP_PRO_TITLE` mediumtext,
  `APP_TAS_TITLE` mediumtext,
  `DEL_PREVIOUS_USR_USERNAME` varchar(100) DEFAULT '',
  `DEL_PREVIOUS_USR_FIRSTNAME` varchar(50) DEFAULT '',
  `DEL_PREVIOUS_USR_LASTNAME` varchar(50) DEFAULT '',
  `APP_UPDATE_DATE` datetime NOT NULL,
  `DEL_PREVIOUS_USR_UID` varchar(32) DEFAULT '',
  `DEL_DELEGATE_DATE` datetime NOT NULL,
  `DEL_DUE_DATE` datetime DEFAULT NULL,
  `DEL_PRIORITY` varchar(32) NOT NULL DEFAULT '3',
  `PRO_ID` int(11) DEFAULT '0',
  `TAS_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`APP_UID`,`DEL_INDEX`),
  KEY `INDEX_PRO_ID` (`PRO_ID`),
  KEY `INDEX_TAS_ID` (`TAS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Unassigned list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LIST_UNASSIGNED_GROUP`
--

DROP TABLE IF EXISTS `LIST_UNASSIGNED_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIST_UNASSIGNED_GROUP` (
  `UNA_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `TYPE` varchar(255) NOT NULL DEFAULT '',
  `TYP_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`UNA_UID`,`USR_UID`,`TYPE`),
  KEY `INDEX_USR_ID` (`USR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Unassiged list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LOGIN_LOG`
--

DROP TABLE IF EXISTS `LOGIN_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOGIN_LOG` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOG_UID` varchar(32) NOT NULL DEFAULT '',
  `LOG_STATUS` varchar(100) NOT NULL DEFAULT '',
  `LOG_IP` varchar(15) NOT NULL DEFAULT '',
  `LOG_SID` varchar(100) NOT NULL DEFAULT '',
  `LOG_INIT_DATE` datetime DEFAULT NULL,
  `LOG_END_DATE` datetime DEFAULT NULL,
  `LOG_CLIENT_HOSTNAME` varchar(100) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`LOG_ID`),
  KEY `indexLoginLogSelect` (`LOG_SID`,`USR_UID`,`LOG_STATUS`,`LOG_END_DATE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LOG_CASES_SCHEDULER`
--

DROP TABLE IF EXISTS `LOG_CASES_SCHEDULER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOG_CASES_SCHEDULER` (
  `LOG_CASE_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_NAME` varchar(32) NOT NULL DEFAULT '',
  `EXEC_DATE` date NOT NULL,
  `EXEC_HOUR` varchar(32) NOT NULL DEFAULT '12:00',
  `RESULT` varchar(32) NOT NULL DEFAULT 'SUCCESS',
  `SCH_UID` varchar(32) NOT NULL DEFAULT 'OPEN',
  `WS_CREATE_CASE_STATUS` mediumtext NOT NULL,
  `WS_ROUTE_CASE_STATUS` mediumtext NOT NULL,
  PRIMARY KEY (`LOG_CASE_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cases Launched with Case Scheduler';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MESSAGE_APPLICATION`
--

DROP TABLE IF EXISTS `MESSAGE_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MESSAGE_APPLICATION` (
  `MSGAPP_UID` varchar(32) NOT NULL,
  `APP_UID` varchar(32) NOT NULL,
  `PRJ_UID` varchar(32) NOT NULL,
  `EVN_UID_THROW` varchar(32) NOT NULL,
  `EVN_UID_CATCH` varchar(32) NOT NULL,
  `MSGAPP_VARIABLES` mediumtext NOT NULL,
  `MSGAPP_CORRELATION` varchar(512) NOT NULL DEFAULT '',
  `MSGAPP_THROW_DATE` datetime NOT NULL,
  `MSGAPP_CATCH_DATE` datetime DEFAULT NULL,
  `MSGAPP_STATUS` varchar(25) NOT NULL DEFAULT 'UNREAD',
  PRIMARY KEY (`MSGAPP_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MESSAGE_EVENT_DEFINITION`
--

DROP TABLE IF EXISTS `MESSAGE_EVENT_DEFINITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MESSAGE_EVENT_DEFINITION` (
  `MSGED_UID` varchar(32) NOT NULL,
  `PRJ_UID` varchar(32) NOT NULL,
  `EVN_UID` varchar(32) NOT NULL,
  `MSGT_UID` varchar(32) NOT NULL DEFAULT '',
  `MSGED_USR_UID` varchar(32) NOT NULL DEFAULT '',
  `MSGED_VARIABLES` mediumtext NOT NULL,
  `MSGED_CORRELATION` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`MSGED_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MESSAGE_EVENT_RELATION`
--

DROP TABLE IF EXISTS `MESSAGE_EVENT_RELATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MESSAGE_EVENT_RELATION` (
  `MSGER_UID` varchar(32) NOT NULL,
  `PRJ_UID` varchar(32) NOT NULL,
  `EVN_UID_THROW` varchar(32) NOT NULL,
  `EVN_UID_CATCH` varchar(32) NOT NULL,
  PRIMARY KEY (`MSGER_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MESSAGE_TYPE`
--

DROP TABLE IF EXISTS `MESSAGE_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MESSAGE_TYPE` (
  `MSGT_UID` varchar(32) NOT NULL,
  `PRJ_UID` varchar(32) NOT NULL,
  `MSGT_NAME` varchar(512) DEFAULT '',
  PRIMARY KEY (`MSGT_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MESSAGE_TYPE_VARIABLE`
--

DROP TABLE IF EXISTS `MESSAGE_TYPE_VARIABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MESSAGE_TYPE_VARIABLE` (
  `MSGTV_UID` varchar(32) NOT NULL,
  `MSGT_UID` varchar(32) NOT NULL,
  `MSGTV_NAME` varchar(512) DEFAULT '',
  `MSGTV_DEFAULT_VALUE` varchar(512) DEFAULT '',
  PRIMARY KEY (`MSGTV_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NOTIFICATION_DEVICE`
--

DROP TABLE IF EXISTS `NOTIFICATION_DEVICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTIFICATION_DEVICE` (
  `DEV_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `SYS_LANG` varchar(10) DEFAULT '',
  `DEV_REG_ID` varchar(255) NOT NULL DEFAULT '',
  `DEV_TYPE` varchar(50) NOT NULL DEFAULT '',
  `DEV_CREATE` datetime NOT NULL,
  `DEV_UPDATE` datetime NOT NULL,
  PRIMARY KEY (`DEV_UID`,`USR_UID`),
  KEY `indexUserNotification` (`USR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Definitions Notification device.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NOTIFICATION_QUEUE`
--

DROP TABLE IF EXISTS `NOTIFICATION_QUEUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTIFICATION_QUEUE` (
  `NOT_UID` varchar(32) NOT NULL,
  `DEV_TYPE` varchar(50) NOT NULL,
  `DEV_UID` mediumtext NOT NULL,
  `NOT_MSG` mediumtext NOT NULL,
  `NOT_DATA` mediumtext NOT NULL,
  `NOT_STATUS` varchar(150) NOT NULL,
  `NOT_SEND_DATE` datetime NOT NULL,
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`NOT_UID`),
  KEY `indexNotStatus` (`NOT_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OAUTH_ACCESS_TOKENS`
--

DROP TABLE IF EXISTS `OAUTH_ACCESS_TOKENS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OAUTH_ACCESS_TOKENS` (
  `ACCESS_TOKEN` varchar(40) NOT NULL,
  `CLIENT_ID` varchar(80) NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `EXPIRES` datetime NOT NULL,
  `SCOPE` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`ACCESS_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OAUTH_AUTHORIZATION_CODES`
--

DROP TABLE IF EXISTS `OAUTH_AUTHORIZATION_CODES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OAUTH_AUTHORIZATION_CODES` (
  `AUTHORIZATION_CODE` varchar(40) NOT NULL,
  `CLIENT_ID` varchar(80) NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `REDIRECT_URI` varchar(2000) DEFAULT NULL,
  `EXPIRES` datetime NOT NULL,
  `SCOPE` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`AUTHORIZATION_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OAUTH_CLIENTS`
--

DROP TABLE IF EXISTS `OAUTH_CLIENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OAUTH_CLIENTS` (
  `CLIENT_ID` varchar(80) NOT NULL,
  `CLIENT_SECRET` varchar(80) NOT NULL,
  `CLIENT_NAME` varchar(256) NOT NULL,
  `CLIENT_DESCRIPTION` varchar(1024) NOT NULL,
  `CLIENT_WEBSITE` varchar(1024) NOT NULL,
  `REDIRECT_URI` varchar(2000) NOT NULL,
  `USR_UID` varchar(32) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OAUTH_REFRESH_TOKENS`
--

DROP TABLE IF EXISTS `OAUTH_REFRESH_TOKENS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OAUTH_REFRESH_TOKENS` (
  `REFRESH_TOKEN` varchar(40) NOT NULL,
  `CLIENT_ID` varchar(80) NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `EXPIRES` datetime NOT NULL,
  `SCOPE` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`REFRESH_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OAUTH_SCOPES`
--

DROP TABLE IF EXISTS `OAUTH_SCOPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OAUTH_SCOPES` (
  `TYPE` varchar(40) NOT NULL,
  `SCOPE` varchar(2000) DEFAULT NULL,
  `CLIENT_ID` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OBJECT_PERMISSION`
--

DROP TABLE IF EXISTS `OBJECT_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OBJECT_PERMISSION` (
  `OP_UID` varchar(32) NOT NULL DEFAULT '0',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '0',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '0',
  `USR_UID` varchar(32) NOT NULL DEFAULT '0',
  `OP_USER_RELATION` int(11) NOT NULL DEFAULT '0',
  `OP_TASK_SOURCE` varchar(32) DEFAULT '0',
  `OP_PARTICIPATE` int(11) NOT NULL DEFAULT '0',
  `OP_OBJ_TYPE` varchar(20) NOT NULL DEFAULT '0',
  `OP_OBJ_UID` varchar(32) NOT NULL DEFAULT '0',
  `OP_ACTION` varchar(10) NOT NULL DEFAULT '0',
  `OP_CASE_STATUS` varchar(10) DEFAULT '0',
  PRIMARY KEY (`OP_UID`),
  KEY `indexObjctPermission` (`PRO_UID`,`TAS_UID`,`USR_UID`,`OP_TASK_SOURCE`,`OP_OBJ_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OBJECT_PERMISSION';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OUTPUT_DOCUMENT`
--

DROP TABLE IF EXISTS `OUTPUT_DOCUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OUTPUT_DOCUMENT` (
  `OUT_DOC_UID` varchar(32) NOT NULL DEFAULT '',
  `OUT_DOC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OUT_DOC_TITLE` mediumtext NOT NULL,
  `OUT_DOC_DESCRIPTION` mediumtext,
  `OUT_DOC_FILENAME` mediumtext,
  `OUT_DOC_TEMPLATE` mediumtext,
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `OUT_DOC_REPORT_GENERATOR` varchar(10) NOT NULL DEFAULT 'HTML2PDF',
  `OUT_DOC_LANDSCAPE` tinyint(4) NOT NULL DEFAULT '0',
  `OUT_DOC_MEDIA` varchar(10) NOT NULL DEFAULT 'Letter',
  `OUT_DOC_LEFT_MARGIN` int(11) DEFAULT '30',
  `OUT_DOC_RIGHT_MARGIN` int(11) DEFAULT '15',
  `OUT_DOC_TOP_MARGIN` int(11) DEFAULT '15',
  `OUT_DOC_BOTTOM_MARGIN` int(11) DEFAULT '15',
  `OUT_DOC_GENERATE` varchar(10) NOT NULL DEFAULT 'BOTH',
  `OUT_DOC_TYPE` varchar(32) NOT NULL DEFAULT 'HTML',
  `OUT_DOC_CURRENT_REVISION` int(11) DEFAULT '0',
  `OUT_DOC_FIELD_MAPPING` mediumtext,
  `OUT_DOC_VERSIONING` tinyint(4) NOT NULL DEFAULT '0',
  `OUT_DOC_DESTINATION_PATH` mediumtext,
  `OUT_DOC_TAGS` mediumtext,
  `OUT_DOC_PDF_SECURITY_ENABLED` tinyint(4) DEFAULT '0',
  `OUT_DOC_PDF_SECURITY_OPEN_PASSWORD` varchar(32) DEFAULT '',
  `OUT_DOC_PDF_SECURITY_OWNER_PASSWORD` varchar(32) DEFAULT '',
  `OUT_DOC_PDF_SECURITY_PERMISSIONS` varchar(150) DEFAULT '',
  `OUT_DOC_OPEN_TYPE` int(11) DEFAULT '1',
  PRIMARY KEY (`OUT_DOC_UID`),
  UNIQUE KEY `INDEX_OUT_DOC_ID` (`OUT_DOC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PLUGINS_REGISTRY`
--

DROP TABLE IF EXISTS `PLUGINS_REGISTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLUGINS_REGISTRY` (
  `PR_UID` varchar(32) NOT NULL DEFAULT '',
  `PLUGIN_NAMESPACE` varchar(100) NOT NULL,
  `PLUGIN_DESCRIPTION` mediumtext,
  `PLUGIN_CLASS_NAME` varchar(100) NOT NULL,
  `PLUGIN_FRIENDLY_NAME` varchar(150) DEFAULT '',
  `PLUGIN_FILE` varchar(250) NOT NULL,
  `PLUGIN_FOLDER` varchar(100) NOT NULL,
  `PLUGIN_SETUP_PAGE` varchar(100) DEFAULT '',
  `PLUGIN_COMPANY_LOGO` varchar(100) DEFAULT '',
  `PLUGIN_WORKSPACES` varchar(100) DEFAULT '',
  `PLUGIN_VERSION` varchar(50) DEFAULT '',
  `PLUGIN_ENABLE` tinyint(4) DEFAULT '0',
  `PLUGIN_PRIVATE` tinyint(4) DEFAULT '0',
  `PLUGIN_MENUS` mediumtext,
  `PLUGIN_FOLDERS` mediumtext,
  `PLUGIN_TRIGGERS` mediumtext,
  `PLUGIN_PM_FUNCTIONS` mediumtext,
  `PLUGIN_REDIRECT_LOGIN` mediumtext,
  `PLUGIN_STEPS` mediumtext,
  `PLUGIN_CSS` mediumtext,
  `PLUGIN_JS` mediumtext,
  `PLUGIN_REST_SERVICE` mediumtext,
  `PLUGIN_CRON_FILES` mediumtext,
  `PLUGIN_TASK_EXTENDED_PROPERTIES` mediumtext,
  `PLUGIN_ATTRIBUTES` mediumtext,
  PRIMARY KEY (`PR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Details of plugins registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PMOAUTH_USER_ACCESS_TOKENS`
--

DROP TABLE IF EXISTS `PMOAUTH_USER_ACCESS_TOKENS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PMOAUTH_USER_ACCESS_TOKENS` (
  `ACCESS_TOKEN` varchar(40) NOT NULL,
  `REFRESH_TOKEN` varchar(40) NOT NULL,
  `USER_ID` varchar(32) DEFAULT NULL,
  `SESSION_ID` varchar(64) NOT NULL,
  `SESSION_NAME` varchar(64) NOT NULL,
  PRIMARY KEY (`ACCESS_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROCESS`
--

DROP TABLE IF EXISTS `PROCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROCESS` (
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRO_TITLE` mediumtext NOT NULL,
  `PRO_DESCRIPTION` mediumtext,
  `PRO_PARENT` varchar(32) NOT NULL DEFAULT '0',
  `PRO_TIME` double NOT NULL DEFAULT '1',
  `PRO_TIMEUNIT` varchar(20) NOT NULL DEFAULT 'DAYS',
  `PRO_STATUS` varchar(20) NOT NULL DEFAULT 'ACTIVE',
  `PRO_TYPE_DAY` char(1) NOT NULL DEFAULT '0',
  `PRO_TYPE` varchar(256) NOT NULL DEFAULT 'NORMAL',
  `PRO_ASSIGNMENT` varchar(20) NOT NULL DEFAULT 'FALSE',
  `PRO_SHOW_MAP` tinyint(4) NOT NULL DEFAULT '1',
  `PRO_SHOW_MESSAGE` tinyint(4) NOT NULL DEFAULT '1',
  `PRO_SUBPROCESS` tinyint(4) NOT NULL DEFAULT '0',
  `PRO_TRI_CREATE` varchar(32) NOT NULL DEFAULT '',
  `PRO_TRI_OPEN` varchar(32) NOT NULL DEFAULT '',
  `PRO_TRI_DELETED` varchar(32) NOT NULL DEFAULT '',
  `PRO_TRI_CANCELED` varchar(32) NOT NULL DEFAULT '',
  `PRO_TRI_PAUSED` varchar(32) NOT NULL DEFAULT '',
  `PRO_TRI_REASSIGNED` varchar(32) NOT NULL DEFAULT '',
  `PRO_TRI_UNPAUSED` varchar(32) NOT NULL DEFAULT '',
  `PRO_TYPE_PROCESS` varchar(32) NOT NULL DEFAULT 'PUBLIC',
  `PRO_SHOW_DELEGATE` tinyint(4) NOT NULL DEFAULT '1',
  `PRO_SHOW_DYNAFORM` tinyint(4) NOT NULL DEFAULT '0',
  `PRO_CATEGORY` varchar(48) NOT NULL DEFAULT '',
  `PRO_SUB_CATEGORY` varchar(48) NOT NULL DEFAULT '',
  `PRO_INDUSTRY` int(11) NOT NULL DEFAULT '1',
  `PRO_UPDATE_DATE` datetime DEFAULT NULL,
  `PRO_CREATE_DATE` datetime NOT NULL,
  `PRO_CREATE_USER` varchar(32) NOT NULL DEFAULT '',
  `PRO_HEIGHT` int(11) NOT NULL DEFAULT '5000',
  `PRO_WIDTH` int(11) NOT NULL DEFAULT '10000',
  `PRO_TITLE_X` int(11) NOT NULL DEFAULT '0',
  `PRO_TITLE_Y` int(11) NOT NULL DEFAULT '6',
  `PRO_DEBUG` int(11) NOT NULL DEFAULT '0',
  `PRO_DYNAFORMS` mediumtext,
  `PRO_DERIVATION_SCREEN_TPL` varchar(128) DEFAULT '',
  `PRO_COST` decimal(7,2) DEFAULT '0.00',
  `PRO_UNIT_COST` varchar(50) DEFAULT '',
  `PRO_ITEE` int(11) NOT NULL DEFAULT '0',
  `PRO_ACTION_DONE` mediumtext,
  PRIMARY KEY (`PRO_UID`),
  UNIQUE KEY `INDEX_PRO_ID` (`PRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store process Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROCESS_CATEGORY`
--

DROP TABLE IF EXISTS `PROCESS_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROCESS_CATEGORY` (
  `CATEGORY_UID` varchar(32) NOT NULL DEFAULT '',
  `CATEGORY_PARENT` varchar(32) NOT NULL DEFAULT '0',
  `CATEGORY_NAME` varchar(100) NOT NULL DEFAULT '',
  `CATEGORY_ICON` varchar(100) DEFAULT '',
  PRIMARY KEY (`CATEGORY_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Calendar Holidays';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROCESS_FILES`
--

DROP TABLE IF EXISTS `PROCESS_FILES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROCESS_FILES` (
  `PRF_UID` varchar(32) NOT NULL,
  `PRO_UID` varchar(32) NOT NULL,
  `USR_UID` varchar(32) NOT NULL,
  `PRF_UPDATE_USR_UID` varchar(32) NOT NULL,
  `PRF_PATH` varchar(256) NOT NULL DEFAULT '',
  `PRF_TYPE` varchar(32) DEFAULT '',
  `PRF_EDITABLE` tinyint(4) DEFAULT '1',
  `PRF_CREATE_DATE` datetime NOT NULL,
  `PRF_UPDATE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`PRF_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Application files metadata';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROCESS_OWNER`
--

DROP TABLE IF EXISTS `PROCESS_OWNER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROCESS_OWNER` (
  `OWN_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`OWN_UID`,`PRO_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROCESS_USER`
--

DROP TABLE IF EXISTS `PROCESS_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROCESS_USER` (
  `PU_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `PU_TYPE` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`PU_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROCESS_VARIABLES`
--

DROP TABLE IF EXISTS `PROCESS_VARIABLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROCESS_VARIABLES` (
  `VAR_UID` varchar(32) NOT NULL,
  `PRJ_UID` varchar(32) NOT NULL,
  `VAR_NAME` varchar(255) DEFAULT '',
  `VAR_FIELD_TYPE` varchar(32) DEFAULT '',
  `VAR_FIELD_SIZE` int(11) DEFAULT NULL,
  `VAR_LABEL` varchar(255) DEFAULT '',
  `VAR_DBCONNECTION` varchar(32) DEFAULT NULL,
  `VAR_SQL` mediumtext,
  `VAR_NULL` tinyint(32) DEFAULT '0',
  `VAR_DEFAULT` varchar(32) DEFAULT '',
  `VAR_ACCEPTED_VALUES` mediumtext,
  `INP_DOC_UID` varchar(32) DEFAULT '',
  PRIMARY KEY (`VAR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRO_REPORTING`
--

DROP TABLE IF EXISTS `PRO_REPORTING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRO_REPORTING` (
  `PRO_UID` varchar(32) NOT NULL,
  `MONTH` int(11) NOT NULL DEFAULT '0',
  `YEAR` int(11) NOT NULL DEFAULT '0',
  `AVG_TIME` decimal(7,2) DEFAULT '0.00',
  `SDV_TIME` decimal(7,2) DEFAULT '0.00',
  `TOTAL_CASES_IN` decimal(7,2) DEFAULT '0.00',
  `TOTAL_CASES_OUT` decimal(7,2) DEFAULT '0.00',
  `CONFIGURED_PROCESS_TIME` decimal(7,2) DEFAULT '0.00',
  `CONFIGURED_PROCESS_COST` decimal(7,2) DEFAULT '0.00',
  `TOTAL_CASES_OPEN` decimal(7,2) DEFAULT '0.00',
  `TOTAL_CASES_OVERDUE` decimal(7,2) DEFAULT '0.00',
  `TOTAL_CASES_ON_TIME` decimal(7,2) DEFAULT '0.00',
  `PRO_COST` decimal(7,2) DEFAULT '0.00',
  `PRO_UNIT_COST` varchar(50) DEFAULT '',
  PRIMARY KEY (`PRO_UID`,`MONTH`,`YEAR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data calculated by process';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RBAC_AUTHENTICATION_SOURCE`
--

DROP TABLE IF EXISTS `RBAC_AUTHENTICATION_SOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RBAC_AUTHENTICATION_SOURCE` (
  `AUTH_SOURCE_UID` varchar(32) NOT NULL DEFAULT '',
  `AUTH_SOURCE_NAME` varchar(50) NOT NULL DEFAULT '',
  `AUTH_SOURCE_PROVIDER` varchar(20) NOT NULL DEFAULT '',
  `AUTH_SOURCE_SERVER_NAME` varchar(50) NOT NULL DEFAULT '',
  `AUTH_SOURCE_PORT` int(11) DEFAULT '389',
  `AUTH_SOURCE_ENABLED_TLS` int(11) DEFAULT '0',
  `AUTH_SOURCE_VERSION` varchar(16) NOT NULL DEFAULT '3',
  `AUTH_SOURCE_BASE_DN` varchar(128) NOT NULL DEFAULT '',
  `AUTH_ANONYMOUS` int(11) DEFAULT '0',
  `AUTH_SOURCE_SEARCH_USER` varchar(128) NOT NULL DEFAULT '',
  `AUTH_SOURCE_PASSWORD` varchar(150) NOT NULL DEFAULT '',
  `AUTH_SOURCE_ATTRIBUTES` varchar(255) NOT NULL DEFAULT '',
  `AUTH_SOURCE_OBJECT_CLASSES` varchar(255) NOT NULL DEFAULT '',
  `AUTH_SOURCE_DATA` mediumtext,
  PRIMARY KEY (`AUTH_SOURCE_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RBAC_PERMISSIONS`
--

DROP TABLE IF EXISTS `RBAC_PERMISSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RBAC_PERMISSIONS` (
  `PER_UID` varchar(32) NOT NULL DEFAULT '',
  `PER_CODE` varchar(64) NOT NULL DEFAULT '',
  `PER_CREATE_DATE` datetime DEFAULT NULL,
  `PER_UPDATE_DATE` datetime DEFAULT NULL,
  `PER_STATUS` int(11) NOT NULL DEFAULT '1',
  `PER_SYSTEM` varchar(32) NOT NULL DEFAULT '00000000000000000000000000000002',
  PRIMARY KEY (`PER_UID`),
  KEY `indexPermissionsCode` (`PER_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RBAC_ROLES`
--

DROP TABLE IF EXISTS `RBAC_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RBAC_ROLES` (
  `ROL_UID` varchar(32) NOT NULL DEFAULT '',
  `ROL_PARENT` varchar(32) NOT NULL DEFAULT '',
  `ROL_SYSTEM` varchar(32) NOT NULL DEFAULT '',
  `ROL_CODE` varchar(32) NOT NULL DEFAULT '',
  `ROL_CREATE_DATE` datetime DEFAULT NULL,
  `ROL_UPDATE_DATE` datetime DEFAULT NULL,
  `ROL_STATUS` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ROL_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RBAC_ROLES_PERMISSIONS`
--

DROP TABLE IF EXISTS `RBAC_ROLES_PERMISSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RBAC_ROLES_PERMISSIONS` (
  `ROL_UID` varchar(32) NOT NULL DEFAULT '',
  `PER_UID` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ROL_UID`,`PER_UID`),
  KEY `indexRolesPermissions` (`ROL_UID`,`PER_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permissions of the roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RBAC_SYSTEMS`
--

DROP TABLE IF EXISTS `RBAC_SYSTEMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RBAC_SYSTEMS` (
  `SYS_UID` varchar(32) NOT NULL DEFAULT '',
  `SYS_CODE` varchar(32) NOT NULL DEFAULT '',
  `SYS_CREATE_DATE` datetime DEFAULT NULL,
  `SYS_UPDATE_DATE` datetime DEFAULT NULL,
  `SYS_STATUS` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SYS_UID`),
  KEY `indexSystemCode` (`SYS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Systems';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RBAC_USERS`
--

DROP TABLE IF EXISTS `RBAC_USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RBAC_USERS` (
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_USERNAME` varchar(100) NOT NULL DEFAULT '',
  `USR_PASSWORD` varchar(128) NOT NULL DEFAULT '',
  `USR_FIRSTNAME` varchar(50) NOT NULL DEFAULT '',
  `USR_LASTNAME` varchar(50) NOT NULL DEFAULT '',
  `USR_EMAIL` varchar(100) NOT NULL DEFAULT '',
  `USR_DUE_DATE` date NOT NULL,
  `USR_CREATE_DATE` datetime DEFAULT NULL,
  `USR_UPDATE_DATE` datetime DEFAULT NULL,
  `USR_STATUS` int(11) NOT NULL DEFAULT '1',
  `USR_AUTH_TYPE` varchar(32) NOT NULL DEFAULT '',
  `UID_AUTH_SOURCE` varchar(32) NOT NULL DEFAULT '',
  `USR_AUTH_USER_DN` varchar(255) NOT NULL DEFAULT '',
  `USR_AUTH_SUPERVISOR_DN` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`USR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RBAC_USERS_ROLES`
--

DROP TABLE IF EXISTS `RBAC_USERS_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RBAC_USERS_ROLES` (
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `ROL_UID` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`USR_UID`,`ROL_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Roles of the users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REPORT_TABLE`
--

DROP TABLE IF EXISTS `REPORT_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPORT_TABLE` (
  `REP_TAB_UID` varchar(32) NOT NULL DEFAULT '',
  `REP_TAB_TITLE` mediumtext NOT NULL,
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `REP_TAB_NAME` varchar(100) NOT NULL DEFAULT '',
  `REP_TAB_TYPE` varchar(6) NOT NULL DEFAULT '',
  `REP_TAB_GRID` varchar(150) DEFAULT '',
  `REP_TAB_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `REP_TAB_CREATE_DATE` datetime NOT NULL,
  `REP_TAB_STATUS` char(8) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`REP_TAB_UID`),
  KEY `indexProcessStatus` (`PRO_UID`,`REP_TAB_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REPORT_VAR`
--

DROP TABLE IF EXISTS `REPORT_VAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPORT_VAR` (
  `REP_VAR_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `REP_TAB_UID` varchar(32) NOT NULL DEFAULT '',
  `REP_VAR_NAME` varchar(255) NOT NULL DEFAULT '',
  `REP_VAR_TYPE` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`REP_VAR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ROUTE`
--

DROP TABLE IF EXISTS `ROUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROUTE` (
  `ROU_UID` varchar(32) NOT NULL DEFAULT '',
  `ROU_PARENT` varchar(32) NOT NULL DEFAULT '0',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `ROU_NEXT_TASK` varchar(32) NOT NULL DEFAULT '0',
  `ROU_CASE` int(11) NOT NULL DEFAULT '0',
  `ROU_TYPE` varchar(25) NOT NULL DEFAULT 'SEQUENTIAL',
  `ROU_DEFAULT` int(11) NOT NULL DEFAULT '0',
  `ROU_CONDITION` varchar(512) NOT NULL DEFAULT '',
  `ROU_TO_LAST_USER` varchar(20) NOT NULL DEFAULT 'FALSE',
  `ROU_OPTIONAL` varchar(20) NOT NULL DEFAULT 'FALSE',
  `ROU_SEND_EMAIL` varchar(20) NOT NULL DEFAULT 'TRUE',
  `ROU_SOURCEANCHOR` int(11) DEFAULT '1',
  `ROU_TARGETANCHOR` int(11) DEFAULT '0',
  `ROU_TO_PORT` int(11) NOT NULL DEFAULT '1',
  `ROU_FROM_PORT` int(11) NOT NULL DEFAULT '2',
  `ROU_EVN_UID` varchar(32) NOT NULL DEFAULT '',
  `GAT_UID` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ROU_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Differents flows for a flow in business process';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SCRIPT_TASK`
--

DROP TABLE IF EXISTS `SCRIPT_TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCRIPT_TASK` (
  `SCRTAS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRJ_UID` varchar(32) NOT NULL DEFAULT '',
  `ACT_UID` varchar(32) NOT NULL DEFAULT '',
  `SCRTAS_OBJ_TYPE` varchar(10) NOT NULL DEFAULT 'TRIGGER',
  `SCRTAS_OBJ_UID` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`SCRTAS_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SEQUENCES`
--

DROP TABLE IF EXISTS `SEQUENCES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEQUENCES` (
  `SEQ_NAME` varchar(50) NOT NULL DEFAULT '',
  `SEQ_VALUE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sequences, Controls the numerical sequence of a table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SESSION`
--

DROP TABLE IF EXISTS `SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SESSION` (
  `SES_UID` varchar(32) NOT NULL DEFAULT '',
  `SES_STATUS` varchar(16) NOT NULL DEFAULT 'ACTIVE',
  `USR_UID` varchar(32) NOT NULL DEFAULT 'ACTIVE',
  `SES_REMOTE_IP` varchar(32) NOT NULL DEFAULT '0.0.0.0',
  `SES_INIT_DATE` varchar(19) NOT NULL DEFAULT '',
  `SES_DUE_DATE` varchar(19) NOT NULL DEFAULT '',
  `SES_END_DATE` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`SES_UID`),
  KEY `indexSession` (`SES_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SESSION';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SESSION_STORAGE`
--

DROP TABLE IF EXISTS `SESSION_STORAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SESSION_STORAGE` (
  `ID` varchar(128) NOT NULL,
  `SET_TIME` varchar(10) NOT NULL,
  `DATA` mediumtext NOT NULL,
  `SESSION_KEY` varchar(128) NOT NULL,
  `CLIENT_ADDRESS` varchar(32) DEFAULT '0.0.0.0',
  PRIMARY KEY (`ID`),
  KEY `indexSessionStorage` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHADOW_TABLE`
--

DROP TABLE IF EXISTS `SHADOW_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SHADOW_TABLE` (
  `SHD_UID` varchar(32) NOT NULL DEFAULT '',
  `ADD_TAB_UID` varchar(32) NOT NULL DEFAULT '',
  `SHD_ACTION` varchar(10) NOT NULL DEFAULT '',
  `SHD_DETAILS` mediumtext NOT NULL,
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `SHD_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`SHD_UID`),
  KEY `indexShadowTable` (`SHD_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STAGE`
--

DROP TABLE IF EXISTS `STAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STAGE` (
  `STG_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `STG_POSX` int(11) NOT NULL DEFAULT '0',
  `STG_POSY` int(11) NOT NULL DEFAULT '0',
  `STG_INDEX` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STG_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STEP`
--

DROP TABLE IF EXISTS `STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STEP` (
  `STEP_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '0',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '0',
  `STEP_TYPE_OBJ` varchar(20) NOT NULL DEFAULT 'DYNAFORM',
  `STEP_UID_OBJ` varchar(32) NOT NULL DEFAULT '0',
  `STEP_CONDITION` mediumtext NOT NULL,
  `STEP_POSITION` int(11) NOT NULL DEFAULT '0',
  `STEP_MODE` varchar(10) DEFAULT 'EDIT',
  PRIMARY KEY (`STEP_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STEP_SUPERVISOR`
--

DROP TABLE IF EXISTS `STEP_SUPERVISOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STEP_SUPERVISOR` (
  `STEP_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '0',
  `STEP_TYPE_OBJ` varchar(20) NOT NULL DEFAULT 'DYNAFORM',
  `STEP_UID_OBJ` varchar(32) NOT NULL DEFAULT '0',
  `STEP_POSITION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STEP_UID`),
  KEY `indexStepSupervisor` (`PRO_UID`,`STEP_TYPE_OBJ`,`STEP_UID_OBJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='STEP_SUPERVISOR';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STEP_TRIGGER`
--

DROP TABLE IF EXISTS `STEP_TRIGGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STEP_TRIGGER` (
  `STEP_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `TRI_UID` varchar(32) NOT NULL DEFAULT '',
  `ST_TYPE` varchar(20) NOT NULL DEFAULT '',
  `ST_CONDITION` varchar(255) NOT NULL DEFAULT '',
  `ST_POSITION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STEP_UID`,`TAS_UID`,`TRI_UID`,`ST_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SUB_APPLICATION`
--

DROP TABLE IF EXISTS `SUB_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUB_APPLICATION` (
  `APP_UID` varchar(32) NOT NULL DEFAULT '',
  `APP_PARENT` varchar(32) NOT NULL DEFAULT '',
  `DEL_INDEX_PARENT` int(11) NOT NULL DEFAULT '0',
  `DEL_THREAD_PARENT` int(11) NOT NULL DEFAULT '0',
  `SA_STATUS` varchar(32) NOT NULL DEFAULT '',
  `SA_VALUES_OUT` mediumtext NOT NULL,
  `SA_VALUES_IN` mediumtext,
  `SA_INIT_DATE` datetime DEFAULT NULL,
  `SA_FINISH_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`APP_UID`,`APP_PARENT`,`DEL_INDEX_PARENT`,`DEL_THREAD_PARENT`),
  KEY `indexParent` (`APP_PARENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER SUB_APPLICATION_INSERT BEFORE INSERT ON SUB_APPLICATION
FOR EACH ROW
BEGIN
    DECLARE PREVIOUS_USR_UID VARCHAR(32);

    SET @PREVIOUS_USR_UID = '';

    SET @PREVIOUS_USR_UID = (
        SELECT APPDEL2.USR_UID
        FROM   APP_DELEGATION AS APPDEL1, APP_DELEGATION AS APPDEL2
        WHERE  APPDEL1.APP_UID = NEW.APP_PARENT AND APPDEL1.DEL_INDEX = NEW.DEL_INDEX_PARENT AND
               APPDEL1.APP_UID = APPDEL2.APP_UID AND APPDEL1.DEL_PREVIOUS = APPDEL2.DEL_INDEX
        LIMIT 1
    );

    IF (@PREVIOUS_USR_UID IS NULL) THEN
        SET @PREVIOUS_USR_UID = '';
    END IF;

    -- Update record in APP_CACHE_VIEW
    UPDATE APP_CACHE_VIEW
    SET    PREVIOUS_USR_UID = @PREVIOUS_USR_UID
    WHERE  APP_UID = NEW.APP_UID AND DEL_INDEX = (SELECT APPDEL.DEL_INDEX
                                                  FROM   APP_DELEGATION AS APPDEL
                                                  WHERE  APPDEL.APP_UID = NEW.APP_UID AND APPDEL.DEL_PREVIOUS = 0
                                                  LIMIT 1
                                                 );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SUB_PROCESS`
--

DROP TABLE IF EXISTS `SUB_PROCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUB_PROCESS` (
  `SP_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_PARENT` varchar(32) NOT NULL DEFAULT '',
  `TAS_PARENT` varchar(32) NOT NULL DEFAULT '',
  `SP_TYPE` varchar(20) NOT NULL DEFAULT '',
  `SP_SYNCHRONOUS` int(11) NOT NULL DEFAULT '0',
  `SP_SYNCHRONOUS_TYPE` varchar(20) NOT NULL DEFAULT '',
  `SP_SYNCHRONOUS_WAIT` int(11) NOT NULL DEFAULT '0',
  `SP_VARIABLES_OUT` mediumtext NOT NULL,
  `SP_VARIABLES_IN` mediumtext,
  `SP_GRID_IN` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`SP_UID`),
  KEY `indexSubProcess` (`PRO_UID`,`PRO_PARENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SWIMLANES_ELEMENTS`
--

DROP TABLE IF EXISTS `SWIMLANES_ELEMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SWIMLANES_ELEMENTS` (
  `SWI_UID` varchar(32) NOT NULL DEFAULT '',
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `SWI_TYPE` varchar(20) NOT NULL DEFAULT 'LINE',
  `SWI_X` int(11) NOT NULL DEFAULT '0',
  `SWI_Y` int(11) NOT NULL DEFAULT '0',
  `SWI_WIDTH` int(11) NOT NULL DEFAULT '0',
  `SWI_HEIGHT` int(11) NOT NULL DEFAULT '0',
  `SWI_NEXT_UID` varchar(32) DEFAULT '',
  PRIMARY KEY (`SWI_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TASK`
--

DROP TABLE IF EXISTS `TASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK` (
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TAS_TITLE` mediumtext NOT NULL,
  `TAS_DESCRIPTION` mediumtext,
  `TAS_DEF_TITLE` mediumtext,
  `TAS_DEF_SUBJECT_MESSAGE` mediumtext,
  `TAS_DEF_PROC_CODE` mediumtext,
  `TAS_DEF_MESSAGE` mediumtext,
  `TAS_DEF_DESCRIPTION` mediumtext,
  `TAS_TYPE` varchar(50) NOT NULL DEFAULT 'NORMAL',
  `TAS_DURATION` double NOT NULL DEFAULT '0',
  `TAS_DELAY_TYPE` varchar(30) NOT NULL DEFAULT '',
  `TAS_TEMPORIZER` double NOT NULL DEFAULT '0',
  `TAS_TYPE_DAY` char(1) NOT NULL DEFAULT '1',
  `TAS_TIMEUNIT` varchar(20) NOT NULL DEFAULT 'DAYS',
  `TAS_ALERT` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_PRIORITY_VARIABLE` varchar(100) NOT NULL DEFAULT '',
  `TAS_ASSIGN_TYPE` varchar(30) NOT NULL DEFAULT 'BALANCED',
  `TAS_ASSIGN_VARIABLE` varchar(100) NOT NULL DEFAULT '@@SYS_NEXT_USER_TO_BE_ASSIGNED',
  `TAS_GROUP_VARIABLE` varchar(100) DEFAULT NULL,
  `TAS_MI_INSTANCE_VARIABLE` varchar(100) NOT NULL DEFAULT '@@SYS_VAR_TOTAL_INSTANCE',
  `TAS_MI_COMPLETE_VARIABLE` varchar(100) NOT NULL DEFAULT '@@SYS_VAR_TOTAL_INSTANCES_COMPLETE',
  `TAS_ASSIGN_LOCATION` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_ASSIGN_LOCATION_ADHOC` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_TRANSFER_FLY` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_LAST_ASSIGNED` varchar(32) NOT NULL DEFAULT '0',
  `TAS_USER` varchar(32) NOT NULL DEFAULT '0',
  `TAS_CAN_UPLOAD` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_VIEW_UPLOAD` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_VIEW_ADDITIONAL_DOCUMENTATION` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_CAN_CANCEL` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_OWNER_APP` varchar(32) NOT NULL DEFAULT '',
  `STG_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_CAN_PAUSE` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_CAN_SEND_MESSAGE` varchar(20) NOT NULL DEFAULT 'TRUE',
  `TAS_CAN_DELETE_DOCS` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_SELF_SERVICE` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_START` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_TO_LAST_USER` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_SEND_LAST_EMAIL` varchar(20) NOT NULL DEFAULT 'TRUE',
  `TAS_DERIVATION` varchar(100) NOT NULL DEFAULT 'NORMAL',
  `TAS_POSX` int(11) NOT NULL DEFAULT '0',
  `TAS_POSY` int(11) NOT NULL DEFAULT '0',
  `TAS_WIDTH` int(11) NOT NULL DEFAULT '110',
  `TAS_HEIGHT` int(11) NOT NULL DEFAULT '60',
  `TAS_COLOR` varchar(32) NOT NULL DEFAULT '',
  `TAS_EVN_UID` varchar(32) NOT NULL DEFAULT '',
  `TAS_BOUNDARY` varchar(32) NOT NULL DEFAULT '',
  `TAS_DERIVATION_SCREEN_TPL` varchar(128) DEFAULT '',
  `TAS_SELFSERVICE_TIMEOUT` int(11) DEFAULT '0',
  `TAS_SELFSERVICE_TIME` int(11) DEFAULT '0',
  `TAS_SELFSERVICE_TIME_UNIT` varchar(15) DEFAULT '',
  `TAS_SELFSERVICE_TRIGGER_UID` varchar(32) DEFAULT '',
  `TAS_SELFSERVICE_EXECUTION` varchar(15) DEFAULT 'EVERY_TIME',
  `TAS_NOT_EMAIL_FROM_FORMAT` int(11) DEFAULT '0',
  `TAS_OFFLINE` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_EMAIL_SERVER_UID` varchar(32) DEFAULT '',
  `TAS_AUTO_ROOT` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_RECEIVE_SERVER_UID` varchar(32) DEFAULT '',
  `TAS_RECEIVE_LAST_EMAIL` varchar(20) NOT NULL DEFAULT 'FALSE',
  `TAS_RECEIVE_EMAIL_FROM_FORMAT` int(11) DEFAULT '0',
  `TAS_RECEIVE_MESSAGE_TYPE` varchar(20) NOT NULL DEFAULT 'text',
  `TAS_RECEIVE_MESSAGE_TEMPLATE` varchar(100) NOT NULL DEFAULT 'alert_message.html',
  `TAS_RECEIVE_SUBJECT_MESSAGE` mediumtext,
  `TAS_RECEIVE_MESSAGE` mediumtext,
  PRIMARY KEY (`TAS_UID`),
  UNIQUE KEY `INDEX_TAS_ID` (`TAS_ID`),
  KEY `indexTasUid` (`TAS_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Task of workflow';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TASK_USER`
--

DROP TABLE IF EXISTS `TASK_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_USER` (
  `TAS_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `TU_TYPE` int(11) NOT NULL DEFAULT '1',
  `TU_RELATION` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TAS_UID`,`USR_UID`,`TU_TYPE`,`TU_RELATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TIMER_EVENT`
--

DROP TABLE IF EXISTS `TIMER_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TIMER_EVENT` (
  `TMREVN_UID` varchar(32) NOT NULL,
  `PRJ_UID` varchar(32) NOT NULL,
  `EVN_UID` varchar(32) NOT NULL,
  `TMREVN_OPTION` varchar(50) NOT NULL DEFAULT 'DAILY',
  `TMREVN_START_DATE` date DEFAULT NULL,
  `TMREVN_END_DATE` date DEFAULT NULL,
  `TMREVN_DAY` varchar(5) NOT NULL DEFAULT '',
  `TMREVN_HOUR` varchar(5) NOT NULL DEFAULT '',
  `TMREVN_MINUTE` varchar(5) NOT NULL DEFAULT '',
  `TMREVN_CONFIGURATION_DATA` mediumtext NOT NULL,
  `TMREVN_NEXT_RUN_DATE` datetime DEFAULT NULL,
  `TMREVN_LAST_RUN_DATE` datetime DEFAULT NULL,
  `TMREVN_LAST_EXECUTION_DATE` datetime DEFAULT NULL,
  `TMREVN_STATUS` varchar(25) NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY (`TMREVN_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TRANSLATION`
--

DROP TABLE IF EXISTS `TRANSLATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRANSLATION` (
  `TRN_CATEGORY` varchar(100) NOT NULL DEFAULT '',
  `TRN_ID` varchar(100) NOT NULL DEFAULT '',
  `TRN_LANG` varchar(10) NOT NULL DEFAULT 'en',
  `TRN_VALUE` mediumtext NOT NULL,
  `TRN_UPDATE_DATE` date DEFAULT NULL,
  PRIMARY KEY (`TRN_CATEGORY`,`TRN_ID`,`TRN_LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TRIGGERS`
--

DROP TABLE IF EXISTS `TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRIGGERS` (
  `TRI_UID` varchar(32) NOT NULL DEFAULT '',
  `TRI_TITLE` mediumtext NOT NULL,
  `TRI_DESCRIPTION` mediumtext,
  `PRO_UID` varchar(32) NOT NULL DEFAULT '',
  `TRI_TYPE` varchar(20) NOT NULL DEFAULT 'SCRIPT',
  `TRI_WEBBOT` mediumtext NOT NULL,
  `TRI_PARAM` mediumtext,
  PRIMARY KEY (`TRI_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USR_USERNAME` varchar(100) NOT NULL DEFAULT '',
  `USR_PASSWORD` varchar(128) NOT NULL DEFAULT '',
  `USR_FIRSTNAME` varchar(50) NOT NULL DEFAULT '',
  `USR_LASTNAME` varchar(50) NOT NULL DEFAULT '',
  `USR_EMAIL` varchar(100) NOT NULL DEFAULT '',
  `USR_DUE_DATE` date NOT NULL,
  `USR_CREATE_DATE` datetime NOT NULL,
  `USR_UPDATE_DATE` datetime NOT NULL,
  `USR_STATUS` varchar(32) NOT NULL DEFAULT 'ACTIVE',
  `USR_COUNTRY` varchar(3) NOT NULL DEFAULT '',
  `USR_CITY` varchar(3) NOT NULL DEFAULT '',
  `USR_LOCATION` varchar(3) NOT NULL DEFAULT '',
  `USR_ADDRESS` varchar(255) NOT NULL DEFAULT '',
  `USR_PHONE` varchar(24) NOT NULL DEFAULT '',
  `USR_FAX` varchar(24) NOT NULL DEFAULT '',
  `USR_CELLULAR` varchar(24) NOT NULL DEFAULT '',
  `USR_ZIP_CODE` varchar(16) NOT NULL DEFAULT '',
  `DEP_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_POSITION` varchar(100) NOT NULL DEFAULT '',
  `USR_RESUME` varchar(100) NOT NULL DEFAULT '',
  `USR_BIRTHDAY` date DEFAULT NULL,
  `USR_ROLE` varchar(32) DEFAULT 'PROCESSMAKER_ADMIN',
  `USR_REPORTS_TO` varchar(32) DEFAULT '',
  `USR_REPLACED_BY` varchar(32) DEFAULT '',
  `USR_UX` varchar(128) DEFAULT 'NORMAL',
  `USR_COST_BY_HOUR` decimal(7,2) DEFAULT '0.00',
  `USR_UNIT_COST` varchar(50) DEFAULT '',
  `USR_PMDRIVE_FOLDER_UID` varchar(128) DEFAULT '',
  `USR_BOOKMARK_START_CASES` mediumtext,
  `USR_TIME_ZONE` varchar(100) DEFAULT '',
  `USR_DEFAULT_LANG` varchar(10) DEFAULT '',
  `USR_LAST_LOGIN` datetime DEFAULT NULL,
  PRIMARY KEY (`USR_UID`),
  UNIQUE KEY `INDEX_USR_ID` (`USR_ID`),
  KEY `indexUsrUid` (`USR_UID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `USERS_PROPERTIES`
--

DROP TABLE IF EXISTS `USERS_PROPERTIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS_PROPERTIES` (
  `USR_UID` varchar(32) NOT NULL DEFAULT '',
  `USR_LAST_UPDATE_DATE` datetime DEFAULT NULL,
  `USR_LOGGED_NEXT_TIME` int(11) DEFAULT '0',
  `USR_PASSWORD_HISTORY` mediumtext,
  `USR_SETTING_DESIGNER` mediumtext,
  PRIMARY KEY (`USR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `USR_REPORTING`
--

DROP TABLE IF EXISTS `USR_REPORTING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USR_REPORTING` (
  `USR_UID` varchar(32) NOT NULL,
  `TAS_UID` varchar(32) NOT NULL,
  `PRO_UID` varchar(32) NOT NULL,
  `MONTH` int(11) NOT NULL DEFAULT '0',
  `YEAR` int(11) NOT NULL DEFAULT '0',
  `TOTAL_QUEUE_TIME_BY_TASK` decimal(7,2) DEFAULT '0.00',
  `TOTAL_TIME_BY_TASK` decimal(7,2) DEFAULT '0.00',
  `TOTAL_CASES_IN` decimal(7,2) DEFAULT '0.00',
  `TOTAL_CASES_OUT` decimal(7,2) DEFAULT '0.00',
  `USER_HOUR_COST` decimal(7,2) DEFAULT '0.00',
  `AVG_TIME` decimal(7,2) DEFAULT '0.00',
  `SDV_TIME` decimal(7,2) DEFAULT '0.00',
  `CONFIGURED_TASK_TIME` decimal(7,2) DEFAULT '0.00',
  `TOTAL_CASES_OVERDUE` decimal(7,2) DEFAULT '0.00',
  `TOTAL_CASES_ON_TIME` decimal(7,2) DEFAULT '0.00',
  `PRO_COST` decimal(7,2) DEFAULT '0.00',
  `PRO_UNIT_COST` varchar(50) DEFAULT '',
  PRIMARY KEY (`USR_UID`,`TAS_UID`,`MONTH`,`YEAR`),
  KEY `indexReporting` (`USR_UID`,`TAS_UID`,`PRO_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data calculated users by task';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WEB_ENTRY`
--

DROP TABLE IF EXISTS `WEB_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_ENTRY` (
  `WE_UID` varchar(32) NOT NULL,
  `PRO_UID` varchar(32) NOT NULL,
  `TAS_UID` varchar(32) NOT NULL,
  `DYN_UID` varchar(32) DEFAULT NULL,
  `USR_UID` varchar(32) DEFAULT NULL,
  `WE_METHOD` varchar(4) DEFAULT 'HTML',
  `WE_INPUT_DOCUMENT_ACCESS` int(11) DEFAULT '0',
  `WE_DATA` mediumtext,
  `WE_CREATE_USR_UID` varchar(32) NOT NULL DEFAULT '',
  `WE_UPDATE_USR_UID` varchar(32) DEFAULT '',
  `WE_CREATE_DATE` datetime NOT NULL,
  `WE_UPDATE_DATE` datetime DEFAULT NULL,
  `WE_TYPE` varchar(8) NOT NULL DEFAULT 'SINGLE',
  `WE_CUSTOM_TITLE` mediumtext,
  `WE_AUTHENTICATION` varchar(14) NOT NULL DEFAULT 'ANONYMOUS',
  `WE_HIDE_INFORMATION_BAR` char(1) DEFAULT '1',
  `WE_CALLBACK` varchar(13) NOT NULL DEFAULT 'PROCESSMAKER',
  `WE_CALLBACK_URL` mediumtext,
  `WE_LINK_GENERATION` varchar(8) NOT NULL DEFAULT 'DEFAULT',
  `WE_LINK_SKIN` varchar(255) DEFAULT NULL,
  `WE_LINK_LANGUAGE` varchar(255) DEFAULT NULL,
  `WE_LINK_DOMAIN` mediumtext,
  `WE_SHOW_IN_NEW_CASE` char(1) DEFAULT '1',
  PRIMARY KEY (`WE_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WEB_ENTRY_EVENT`
--

DROP TABLE IF EXISTS `WEB_ENTRY_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_ENTRY_EVENT` (
  `WEE_UID` varchar(32) NOT NULL,
  `WEE_TITLE` mediumtext,
  `WEE_DESCRIPTION` mediumtext,
  `PRJ_UID` varchar(32) NOT NULL,
  `EVN_UID` varchar(32) NOT NULL,
  `ACT_UID` varchar(32) NOT NULL,
  `DYN_UID` varchar(32) DEFAULT NULL,
  `USR_UID` varchar(32) DEFAULT NULL,
  `WEE_STATUS` varchar(10) NOT NULL DEFAULT 'ENABLED',
  `WEE_WE_UID` varchar(32) NOT NULL DEFAULT '',
  `WEE_WE_TAS_UID` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`WEE_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-12 11:45:16
