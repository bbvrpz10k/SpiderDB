-- MySQL dump 10.19  Distrib 10.3.31-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: spider
-- ------------------------------------------------------
-- Server version	8.0.0

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
-- Table structure for table `Enterprise`
--

DROP TABLE IF EXISTS `Enterprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Enterprise` (
  `IDInerprise` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `PodatkeNumberUkraine` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IDInerprise`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Language`
--

DROP TABLE IF EXISTS `Language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Language` (
  `IdL` int(11) NOT NULL AUTO_INCREMENT,
  `NAme` varchar(64) NOT NULL,
  PRIMARY KEY (`IdL`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `Last10Check`
--

DROP TABLE IF EXISTS `Last10Check`;
/*!50001 DROP VIEW IF EXISTS `Last10Check`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Last10Check` (
  `purchase_id` tinyint NOT NULL,
  `Column1` tinyint NOT NULL,
  `FN` tinyint NOT NULL,
  `сума` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `NAME`
--

DROP TABLE IF EXISTS `NAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NAME` (
  `id_Name` int(11) NOT NULL AUTO_INCREMENT,
  `First` varchar(100) NOT NULL COMMENT 'Ім''я',
  `Second` varchar(100) DEFAULT NULL COMMENT 'Призвіще',
  `Three` varchar(100) DEFAULT NULL COMMENT 'По баткові',
  `Languadge_id` int(11) DEFAULT NULL,
  `Person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Name`),
  KEY `NAME_FK` (`Languadge_id`),
  KEY `NAME_FK_1` (`Person_id`),
  CONSTRAINT `NAME_FK` FOREIGN KEY (`Languadge_id`) REFERENCES `Language` (`IdL`),
  CONSTRAINT `NAME_FK_1` FOREIGN KEY (`Person_id`) REFERENCES `People` (`IdPeople`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PayOffice`
--

DROP TABLE IF EXISTS `PayOffice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PayOffice` (
  `IdPayOffice` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `IdEnterpise` int(11) NOT NULL,
  `Коди` varchar(100) NOT NULL,
  `Place` int(11) DEFAULT NULL,
  `FN` varchar(10) NOT NULL,
  PRIMARY KEY (`IdPayOffice`),
  KEY `PayOffice_FK` (`IdEnterpise`),
  KEY `PayOffice_FK_1` (`Place`),
  CONSTRAINT `PayOffice_FK` FOREIGN KEY (`IdEnterpise`) REFERENCES `Enterprise` (`IDInerprise`),
  CONSTRAINT `PayOffice_FK_1` FOREIGN KEY (`Place`) REFERENCES `Place` (`ID_Place`)
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `People`
--

DROP TABLE IF EXISTS `People`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `People` (
  `IdPeople` int(11) NOT NULL AUTO_INCREMENT,
  `Bright` datetime DEFAULT NULL,
  `PlaceBright` varchar(100) DEFAULT NULL,
  `D` datetime DEFAULT NULL,
  `Dp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdPeople`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Place`
--

DROP TABLE IF EXISTS `Place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Place` (
  `ID_Place` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Place`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PositionShop`
--

DROP TABLE IF EXISTS `PositionShop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PositionShop` (
  `id_pos` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `Number` double NOT NULL,
  `CostPerUnit` double NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_pos`),
  KEY `PositionShop_FK` (`article_id`),
  KEY `PositionShop_FK_1` (`purchase_id`),
  KEY `PositionShop_FK_2` (`currency_id`),
  CONSTRAINT `PositionShop_FK` FOREIGN KEY (`article_id`) REFERENCES `article` (`ID`),
  CONSTRAINT `PositionShop_FK_1` FOREIGN KEY (`purchase_id`) REFERENCES `Purchase` (`ID_purchase`),
  CONSTRAINT `PositionShop_FK_2` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`ID_currency`)
) ENGINE=InnoDB AUTO_INCREMENT=6605 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Purchase`
--

DROP TABLE IF EXISTS `Purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Purchase` (
  `ID_purchase` int(11) NOT NULL AUTO_INCREMENT,
  `Column1` datetime NOT NULL,
  `enterprise_id` int(11) NOT NULL,
  `Payoffice_id` int(11) DEFAULT NULL,
  `NUMBER` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID_purchase`),
  KEY `Purchase_FK` (`enterprise_id`),
  KEY `Purchase_FK_1` (`Payoffice_id`),
  CONSTRAINT `Purchase_FK` FOREIGN KEY (`enterprise_id`) REFERENCES `Enterprise` (`IDInerprise`),
  CONSTRAINT `Purchase_FK_1` FOREIGN KEY (`Payoffice_id`) REFERENCES `PayOffice` (`IdPayOffice`)
) ENGINE=InnoDB AUTO_INCREMENT=1622 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Sensor`
--

DROP TABLE IF EXISTS `Sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sensor` (
  `IdSensor` int(11) NOT NULL AUTO_INCREMENT,
  `NameSensor` varchar(100) NOT NULL,
  PRIMARY KEY (`IdSensor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `TotalProductEatToMonts`
--

DROP TABLE IF EXISTS `TotalProductEatToMonts`;
/*!50001 DROP VIEW IF EXISTS `TotalProductEatToMonts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `TotalProductEatToMonts` (
  `MONTHs` tinyint NOT NULL,
  `years` tinyint NOT NULL,
  `Total` tinyint NOT NULL,
  `Sum( spider.PositionShop.``Number``)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `TotalToMonts`
--

DROP TABLE IF EXISTS `TotalToMonts`;
/*!50001 DROP VIEW IF EXISTS `TotalToMonts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `TotalToMonts` (
  `MONTHs` tinyint NOT NULL,
  `years` tinyint NOT NULL,
  `Total` tinyint NOT NULL,
  `Sum( spider.PositionShop.``Number``)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `TotalToMontsPlace`
--

DROP TABLE IF EXISTS `TotalToMontsPlace`;
/*!50001 DROP VIEW IF EXISTS `TotalToMontsPlace`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `TotalToMontsPlace` (
  `MONTHs` tinyint NOT NULL,
  `years` tinyint NOT NULL,
  `Магазин` tinyint NOT NULL,
  `Адреса` tinyint NOT NULL,
  `сума` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `TypeArticle`
--

DROP TABLE IF EXISTS `TypeArticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TypeArticle` (
  `IDTA` int(11) NOT NULL AUTO_INCREMENT,
  `nameArticle` varchar(64) NOT NULL,
  PRIMARY KEY (`IDTA`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ValueSensor`
--

DROP TABLE IF EXISTS `ValueSensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ValueSensor` (
  `IdValueSensor` int(11) NOT NULL AUTO_INCREMENT,
  `Value` double NOT NULL,
  `IdSensor` int(11) NOT NULL,
  `DateGet` datetime NOT NULL,
  PRIMARY KEY (`IdValueSensor`),
  KEY `ValueSensor_Sensor_FK` (`IdSensor`),
  CONSTRAINT `ValueSensor_Sensor_FK` FOREIGN KEY (`IdSensor`) REFERENCES `Sensor` (`IdSensor`)
) ENGINE=InnoDB AUTO_INCREMENT=1046843 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Works`
--

DROP TABLE IF EXISTS `Works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Works` (
  `IdWork` int(11) NOT NULL AUTO_INCREMENT,
  `Start` datetime NOT NULL,
  `End` datetime NOT NULL,
  `How` varchar(128) DEFAULT NULL COMMENT 'Що зроблено',
  PRIMARY KEY (`IdWork`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(256) NOT NULL COMMENT 'Назва товару',
  `TypeArt` int(11) NOT NULL,
  `mersu` int(11) NOT NULL,
  `Note` varchar(100) DEFAULT NULL,
  `EAN-13` bigint(20) DEFAULT NULL COMMENT 'https://uk.wikipedia.org/wiki/European_Article_Number',
  PRIMARY KEY (`ID`),
  KEY `article_FK` (`mersu`),
  KEY `article_FK_1` (`TypeArt`),
  CONSTRAINT `article_FK` FOREIGN KEY (`mersu`) REFERENCES `mensure` (`IDMen`),
  CONSTRAINT `article_FK_1` FOREIGN KEY (`TypeArt`) REFERENCES `TypeArticle` (`IDTA`)
) ENGINE=InnoDB AUTO_INCREMENT=2545 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buy` (
  `IdBuy` int(11) NOT NULL AUTO_INCREMENT,
  `Date` datetime NOT NULL,
  `ChekNumber` varchar(100) DEFAULT NULL,
  `IDPayoffice` int(11) NOT NULL,
  PRIMARY KEY (`IdBuy`),
  KEY `buy_FK` (`IDPayoffice`),
  CONSTRAINT `buy_FK` FOREIGN KEY (`IDPayoffice`) REFERENCES `PayOffice` (`IdPayOffice`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cashflow`
--

DROP TABLE IF EXISTS `cashflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashflow` (
  `IdFlow` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Код руху',
  `TimeFlow` datetime NOT NULL COMMENT 'Час руху',
  `From` int(11) NOT NULL COMMENT 'Звідки',
  `To` int(11) NOT NULL COMMENT 'Куди',
  `Description` varchar(64) DEFAULT NULL COMMENT 'Призначення',
  `Write` datetime NOT NULL COMMENT 'Записано',
  PRIMARY KEY (`IdFlow`),
  KEY `cashflow_expense_FK` (`From`),
  KEY `cashflow_expense_FK_1` (`To`),
  CONSTRAINT `cashflow_expense_FK` FOREIGN KEY (`From`) REFERENCES `expense` (`IdExpense`),
  CONSTRAINT `cashflow_expense_FK_1` FOREIGN KEY (`To`) REFERENCES `expense` (`IdExpense`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='Рух коштів';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `ID_currency` int(11) NOT NULL AUTO_INCREMENT,
  `sName` varchar(5) NOT NULL,
  PRIMARY KEY (`ID_currency`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense` (
  `IdExpense` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Код рахунку',
  `NameExpense` varchar(32) NOT NULL COMMENT 'Назва рахунку',
  `Description` varchar(100) DEFAULT NULL COMMENT 'Призначення',
  PRIMARY KEY (`IdExpense`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mensure`
--

DROP TABLE IF EXISTS `mensure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensure` (
  `IDMen` int(11) NOT NULL AUTO_INCREMENT,
  `NameMensure` varchar(100) NOT NULL,
  PRIMARY KEY (`IDMen`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `Last10Check`
--

/*!50001 DROP TABLE IF EXISTS `Last10Check`*/;
/*!50001 DROP VIEW IF EXISTS `Last10Check`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sky`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Last10Check` AS select `PositionShop`.`purchase_id` AS `purchase_id`,`Purchase`.`Column1` AS `Column1`,`PayOffice`.`FN` AS `FN`,sum(`PositionShop`.`CostPerUnit` * `PositionShop`.`Number`) AS `сума` from ((`PositionShop` left join `Purchase` on(`PositionShop`.`purchase_id` = `Purchase`.`ID_purchase`)) left join `PayOffice` on(`Purchase`.`Payoffice_id` = `PayOffice`.`IdPayOffice`)) group by `PositionShop`.`purchase_id` order by `PositionShop`.`purchase_id` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TotalProductEatToMonts`
--

/*!50001 DROP TABLE IF EXISTS `TotalProductEatToMonts`*/;
/*!50001 DROP VIEW IF EXISTS `TotalProductEatToMonts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sky`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `TotalProductEatToMonts` AS select month(`Purchase`.`Column1`) AS `MONTHs`,year(`Purchase`.`Column1`) AS `years`,sum(`PositionShop`.`CostPerUnit` * `PositionShop`.`Number`) AS `Total`,sum(`PositionShop`.`Number`) AS `Sum( spider.PositionShop.``Number``)` from ((`PositionShop` left join `Purchase` on(`PositionShop`.`purchase_id` = `Purchase`.`ID_purchase`)) left join `article` on(`article`.`ID` = `PositionShop`.`article_id`)) where `article`.`TypeArt` = 1 group by month(`Purchase`.`Column1`),year(`Purchase`.`Column1`) order by year(`Purchase`.`Column1`),month(`Purchase`.`Column1`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TotalToMonts`
--

/*!50001 DROP TABLE IF EXISTS `TotalToMonts`*/;
/*!50001 DROP VIEW IF EXISTS `TotalToMonts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sky`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `TotalToMonts` AS select month(`Purchase`.`Column1`) AS `MONTHs`,year(`Purchase`.`Column1`) AS `years`,sum(`PositionShop`.`CostPerUnit` * `PositionShop`.`Number`) AS `Total`,sum(`PositionShop`.`Number`) AS `Sum( spider.PositionShop.``Number``)` from (`PositionShop` left join `Purchase` on(`PositionShop`.`purchase_id` = `Purchase`.`ID_purchase`)) group by month(`Purchase`.`Column1`),year(`Purchase`.`Column1`) order by year(`Purchase`.`Column1`),month(`Purchase`.`Column1`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TotalToMontsPlace`
--

/*!50001 DROP TABLE IF EXISTS `TotalToMontsPlace`*/;
/*!50001 DROP VIEW IF EXISTS `TotalToMontsPlace`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sky`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `TotalToMontsPlace` AS select month(`Purchase`.`Column1`) AS `MONTHs`,year(`Purchase`.`Column1`) AS `years`,`PayOffice`.`Name` AS `Магазин`,`Place`.`Name` AS `Адреса`,sum(`PositionShop`.`CostPerUnit` * `PositionShop`.`Number`) AS `сума` from (((`PositionShop` left join `Purchase` on(`PositionShop`.`purchase_id` = `Purchase`.`ID_purchase`)) left join `PayOffice` on(`Purchase`.`Payoffice_id` = `PayOffice`.`IdPayOffice`)) left join `Place` on(`Place`.`ID_Place` = `PayOffice`.`Place`)) group by `Place`.`ID_Place`,month(`Purchase`.`Column1`),year(`Purchase`.`Column1`) order by year(`Purchase`.`Column1`),month(`Purchase`.`Column1`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-14 20:51:11
