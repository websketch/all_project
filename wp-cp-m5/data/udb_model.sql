-- MySQL dump 10.9
--
-- Host: localhost    Database: cms-base-m1
-- ------------------------------------------------------
-- Server version	4.1.8-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` int(11) NOT NULL default '0',
  `name` varchar(50) default NULL,
  `MAN_USER_ID` varchar(255) default NULL,
  `MAN_CRM_ID` varchar(255) default NULL,
  `balance` int(10) default NULL,
  `point` int(20) default NULL,
  `cardpoint` int(20) default NULL,
  `join_date` datetime default NULL,
  `email` varchar(255) default NULL,
  `address1` varchar(255) default NULL,
  `address2` varchar(255) default NULL,
  `phone` varchar(20) default NULL,
  `mobile` varchar(20) default NULL,
  `level` varchar(4) default NULL,
  `status` char(1) default NULL,
  `limited_monthSum` int(10) default NULL,
  `is_preuse` char(1) default NULL,
  `pay_method_id` int(11) default NULL,
  `lang_id` int(11) default NULL,
  `zipcode` varchar(255) default NULL,
  `identity_type` varchar(255) default NULL,
  `identity_no` varchar(255) default NULL,
  `income` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `birthday` varchar(255) default NULL,
  `profession` varchar(255) default NULL,
  `degree` varchar(255) default NULL,
  PRIMARY KEY  (`account_id`),
  KEY `pay_method_id` (`pay_method_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `account_bind`
--

DROP TABLE IF EXISTS `account_bind`;
CREATE TABLE `account_bind` (
  `account_bind_id` int(11) NOT NULL auto_increment,
  `serialNO` varchar(255) default NULL,
  `account_id` int(11) default NULL,
  `user_id` varchar(255) default NULL,
  `status` char(1) default NULL,
  `start_datetime` datetime default NULL,
  `end_datetime` datetime default NULL,
  `pay_method_id` int(11) default NULL,
  PRIMARY KEY  (`account_bind_id`),
  KEY `account_id` (`account_id`),
  KEY `pay_method_id` (`pay_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `action_getpoint`
--

DROP TABLE IF EXISTS `action_getpoint`;
CREATE TABLE `action_getpoint` (
  `operate_action_id` int(11) NOT NULL default '0',
  `getpoint_rule_id` int(11) NOT NULL default '0',
  `sort` varchar(4) default NULL,
  `status` varchar(255) default NULL,
  `start_datetime` datetime default NULL,
  `end_datetime` datetime default NULL,
  PRIMARY KEY  (`operate_action_id`,`getpoint_rule_id`),
  KEY `getpoint_rule_id` (`getpoint_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor` (
  `actor_id` int(11) NOT NULL auto_increment,
  `country_id` int(11) default NULL,
  `name` varchar(255) NOT NULL default '',
  `gender` char(1) default NULL,
  `birth` datetime default NULL,
  `category_id` int(11) default NULL,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `actor_caption`
--

DROP TABLE IF EXISTS `actor_caption`;
CREATE TABLE `actor_caption` (
  `actor_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `description` longtext,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`actor_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `actor_relation`
--

DROP TABLE IF EXISTS `actor_relation`;
CREATE TABLE `actor_relation` (
  `actor_id` int(11) NOT NULL default '0',
  `parent_actor_id` int(11) NOT NULL default '0',
  `position_id` int(11) default NULL,
  `sort` int(11) default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`actor_id`,`parent_actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `actor_score`
--

DROP TABLE IF EXISTS `actor_score`;
CREATE TABLE `actor_score` (
  `media_actor_id` int(11) NOT NULL default '0',
  `scoretype_id` int(11) NOT NULL default '0',
  `value` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`media_actor_id`,`scoretype_id`),
  KEY `scoretype_id` (`scoretype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `ad_id` int(11) NOT NULL auto_increment,
  `ad_user_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `description` text,
  `post` varchar(255) default NULL,
  `max_watch_time` int(20) default NULL,
  `type` varchar(255) default NULL,
  `starttime` datetime default NULL,
  `endtime` datetime default NULL,
  `status` datetime default NULL,
  PRIMARY KEY  (`ad_id`),
  KEY `ad_user_id` (`ad_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad`
--


/*!40000 ALTER TABLE `ad` DISABLE KEYS */;
LOCK TABLES `ad` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ad` ENABLE KEYS */;

--
-- Table structure for table `ad_caption`
--

DROP TABLE IF EXISTS `ad_caption`;
CREATE TABLE `ad_caption` (
  `ad_id` int(11) default NULL,
  `lang_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `description` text,
  `post` varchar(255) default NULL,
  KEY `ad_id` (`ad_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_caption`
--


/*!40000 ALTER TABLE `ad_caption` DISABLE KEYS */;
LOCK TABLES `ad_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ad_caption` ENABLE KEYS */;

--
-- Table structure for table `ad_user`
--

DROP TABLE IF EXISTS `ad_user`;
CREATE TABLE `ad_user` (
  `ad_user_id` int(11) NOT NULL auto_increment,
  `company_name` varchar(255) default NULL,
  `contact` varchar(255) default NULL,
  `province` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `address1` text,
  `address2` text,
  `zipcode` varchar(255) default NULL,
  `areacode` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `description` text,
  `join_date` datetime default NULL,
  `update_date` datetime default NULL,
  PRIMARY KEY  (`ad_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ad_user`
--


/*!40000 ALTER TABLE `ad_user` DISABLE KEYS */;
LOCK TABLES `ad_user` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ad_user` ENABLE KEYS */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `body` longtext,
  `start_time` datetime default NULL,
  `end_time` datetime default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`article_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `article`
--


/*!40000 ALTER TABLE `article` DISABLE KEYS */;
LOCK TABLES `article` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `attribute_id` int(11) NOT NULL auto_increment,
  `category_id` int(11) default NULL,
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`attribute_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute`
--


/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
LOCK TABLES `attribute` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;

--
-- Table structure for table `attribute_caption`
--

DROP TABLE IF EXISTS `attribute_caption`;
CREATE TABLE `attribute_caption` (
  `attribute_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`attribute_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attribute_caption`
--


/*!40000 ALTER TABLE `attribute_caption` DISABLE KEYS */;
LOCK TABLES `attribute_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `attribute_caption` ENABLE KEYS */;

--
-- Table structure for table `auto_order_log`
--

DROP TABLE IF EXISTS `auto_order_log`;
CREATE TABLE `auto_order_log` (
  `auto_order_log_id` int(11) NOT NULL auto_increment,
  `account_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  `parent_order_id` int(11) default NULL,
  `order_detail_id` int(11) default NULL,
  `parent_order_detail_id` int(11) default NULL,
  `source_order_detail_id` int(11) default NULL,
  `send_payment_gw` char(1) default NULL,
  `ope_message` varchar(255) default NULL,
  PRIMARY KEY  (`auto_order_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auto_order_log`
--


/*!40000 ALTER TABLE `auto_order_log` DISABLE KEYS */;
LOCK TABLES `auto_order_log` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `auto_order_log` ENABLE KEYS */;

--
-- Table structure for table `banner_clicks`
--

DROP TABLE IF EXISTS `banner_clicks`;
CREATE TABLE `banner_clicks` (
  `banner_click_id` int(11) NOT NULL auto_increment,
  `banner_id` int(11) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`banner_click_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banner_clicks`
--


/*!40000 ALTER TABLE `banner_clicks` DISABLE KEYS */;
LOCK TABLES `banner_clicks` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `banner_clicks` ENABLE KEYS */;

--
-- Table structure for table `banner_impressions`
--

DROP TABLE IF EXISTS `banner_impressions`;
CREATE TABLE `banner_impressions` (
  `banner_impression_id` int(11) NOT NULL auto_increment,
  `banner_id` int(11) NOT NULL default '0',
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`banner_impression_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banner_impressions`
--


/*!40000 ALTER TABLE `banner_impressions` DISABLE KEYS */;
LOCK TABLES `banner_impressions` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `banner_impressions` ENABLE KEYS */;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `banner_id` int(11) NOT NULL auto_increment,
  `bannerName` varchar(255) NOT NULL default '',
  `bannerLocation` varchar(255) NOT NULL default '',
  `bannerGoToURL` varchar(255) NOT NULL default '',
  `totalImpressions` int(11) NOT NULL default '0',
  `active` int(11) NOT NULL default '0',
  `pageLocation` int(11) NOT NULL default '0',
  PRIMARY KEY  (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banners`
--


/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
LOCK TABLES `banners` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL auto_increment,
  `billcyclehistory_id` int(11) default NULL,
  `account_id` int(11) default NULL,
  `bill_start_datetime` char(14) default NULL,
  `bill_end_datetime` char(14) default NULL,
  `generate_datetime` char(14) default NULL,
  `total_charge` int(10) default NULL,
  `total_cardpoint` int(20) default NULL,
  `total_point` int(20) default NULL,
  `total_adjustment` int(10) default NULL,
  `total_bad_debts` int(10) default NULL,
  `total_balance` int(10) default NULL,
  `payoff_date` char(14) default NULL,
  PRIMARY KEY  (`bill_id`),
  KEY `billcyclehistory_id` (`billcyclehistory_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill`
--


/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
LOCK TABLES `bill` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;

--
-- Table structure for table `bill_balance`
--

DROP TABLE IF EXISTS `bill_balance`;
CREATE TABLE `bill_balance` (
  `bill_balance_id` int(11) NOT NULL auto_increment,
  `bill_id` int(11) default NULL,
  `pay_method_id` int(11) default NULL,
  `total_charge` int(10) default NULL,
  `total_point` int(20) default NULL,
  `total_cardpoint` int(20) default NULL,
  `total_bad_debts` int(10) default NULL,
  `total_balance` int(10) default NULL,
  `total_adjustment` int(10) default NULL,
  `payoff_date` char(14) default NULL,
  PRIMARY KEY  (`bill_balance_id`),
  KEY `bill_id` (`bill_id`),
  KEY `pay_method_id` (`pay_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill_balance`
--


/*!40000 ALTER TABLE `bill_balance` DISABLE KEYS */;
LOCK TABLES `bill_balance` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `bill_balance` ENABLE KEYS */;

--
-- Table structure for table `billcycle`
--

DROP TABLE IF EXISTS `billcycle`;
CREATE TABLE `billcycle` (
  `billcycle_id` int(11) NOT NULL auto_increment,
  `base_date` varchar(255) default NULL,
  `description` text,
  `period` int(11) default NULL,
  `unit` varchar(255) default NULL,
  `due_days` int(11) default NULL,
  `dueperiod` int(11) default NULL,
  `dueunit` varchar(255) default NULL,
  `freepenaltyperiod` int(11) default NULL,
  `freepenalty` varchar(255) default NULL,
  PRIMARY KEY  (`billcycle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `billcycle`
--


/*!40000 ALTER TABLE `billcycle` DISABLE KEYS */;
LOCK TABLES `billcycle` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `billcycle` ENABLE KEYS */;

--
-- Table structure for table `billcyclehistory`
--

DROP TABLE IF EXISTS `billcyclehistory`;
CREATE TABLE `billcyclehistory` (
  `billcyclehistory_id` int(11) NOT NULL auto_increment,
  `billcycle_id` int(11) default NULL,
  `bill_start_datetime` datetime default NULL,
  `bill_end_datetime` datetime default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`billcyclehistory_id`),
  KEY `billcycle_id` (`billcycle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `billcyclehistory`
--


/*!40000 ALTER TABLE `billcyclehistory` DISABLE KEYS */;
LOCK TABLES `billcyclehistory` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `billcyclehistory` ENABLE KEYS */;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
CREATE TABLE `block` (
  `block_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `block`
--


/*!40000 ALTER TABLE `block` DISABLE KEYS */;
LOCK TABLES `block` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `block` ENABLE KEYS */;

--
-- Table structure for table `block_element`
--

DROP TABLE IF EXISTS `block_element`;
CREATE TABLE `block_element` (
  `block_id` int(11) NOT NULL default '0',
  `source_id` int(11) NOT NULL default '0',
  `sort` varchar(4) default NULL,
  `source_pk_id` int(11) NOT NULL default '0',
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`block_id`,`source_id`,`source_pk_id`),
  KEY `source_id` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `block_element`
--


/*!40000 ALTER TABLE `block_element` DISABLE KEYS */;
LOCK TABLES `block_element` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `block_element` ENABLE KEYS */;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `card_id` int(11) NOT NULL auto_increment,
  `card_sn` varchar(255) default NULL,
  `card_no` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `generate_date` datetime default NULL,
  `expire_date` datetime default NULL,
  `status` varchar(255) default NULL,
  `currency_id` int(11) default NULL,
  `sum` int(10) default NULL,
  `cardpoint` int(20) default NULL,
  `cardbatch_id` int(11) default NULL,
  `cardcategory_id` int(11) default NULL,
  `barcode` varchar(255) default NULL,
  `pinpasswd` varchar(255) default NULL,
  PRIMARY KEY  (`card_id`),
  UNIQUE KEY `card_no1` (`card_no`),
  KEY `currency_id` (`currency_id`),
  KEY `cardbatch_id` (`cardbatch_id`),
  KEY `cardcategory_id` (`cardcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `card`
--


/*!40000 ALTER TABLE `card` DISABLE KEYS */;
LOCK TABLES `card` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;

--
-- Table structure for table `cardbatch`
--

DROP TABLE IF EXISTS `cardbatch`;
CREATE TABLE `cardbatch` (
  `cardbatch_id` int(11) NOT NULL auto_increment,
  `start_no` varchar(255) default NULL,
  `end_no` varchar(255) default NULL,
  `generate_date` datetime default NULL,
  `generate_count` int(10) default NULL,
  `expire_date` datetime default NULL,
  `ope_id` int(11) default NULL,
  `cardcategory_id` int(11) default NULL,
  `del_date` datetime default NULL,
  PRIMARY KEY  (`cardbatch_id`),
  KEY `cardcategory_id` (`cardcategory_id`),
  KEY `ope_id` (`ope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cardbatch`
--


/*!40000 ALTER TABLE `cardbatch` DISABLE KEYS */;
LOCK TABLES `cardbatch` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `cardbatch` ENABLE KEYS */;

--
-- Table structure for table `cardbatchsalehistory`
--

DROP TABLE IF EXISTS `cardbatchsalehistory`;
CREATE TABLE `cardbatchsalehistory` (
  `cardbatchsalehistory_id` int(11) NOT NULL auto_increment,
  `saledate` datetime default NULL,
  `salecount` int(15) default NULL,
  `saletype` varchar(255) default NULL,
  `total_sum` int(10) default NULL,
  `total_cardpoint` int(10) default NULL,
  `discount` int(10) default NULL,
  `paystatus` varchar(255) default NULL,
  `sp_id` int(11) default NULL,
  `cardbatch_id` int(11) default NULL,
  `ope_id` int(11) default NULL,
  PRIMARY KEY  (`cardbatchsalehistory_id`),
  KEY `sp_id` (`sp_id`),
  KEY `cardbatch_id` (`cardbatch_id`),
  KEY `ope_id` (`ope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cardbatchsalehistory`
--


/*!40000 ALTER TABLE `cardbatchsalehistory` DISABLE KEYS */;
LOCK TABLES `cardbatchsalehistory` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `cardbatchsalehistory` ENABLE KEYS */;

--
-- Table structure for table `cardcategory`
--

DROP TABLE IF EXISTS `cardcategory`;
CREATE TABLE `cardcategory` (
  `cardcategory_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` text,
  `type` varchar(2) default NULL,
  `currency_id` int(11) default NULL,
  `price` int(10) default NULL,
  `cardpoint` int(11) default NULL,
  `cardnodefine_id` int(11) default NULL,
  `category_code` varchar(255) default NULL,
  `password_type` varchar(255) default NULL,
  `password_length` int(5) default NULL,
  `barcode_cardnodefine_id` int(11) default NULL,
  `status` varchar(255) default NULL,
  `start_datetime` datetime default NULL,
  `end_datetime` datetime default NULL,
  PRIMARY KEY  (`cardcategory_id`),
  KEY `currency_id` (`currency_id`),
  KEY `cardnodefine_id` (`cardnodefine_id`),
  KEY `barcode_cardnodefine_id` (`barcode_cardnodefine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cardcategory`
--


/*!40000 ALTER TABLE `cardcategory` DISABLE KEYS */;
LOCK TABLES `cardcategory` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `cardcategory` ENABLE KEYS */;

--
-- Table structure for table `cardhandlehistory`
--

DROP TABLE IF EXISTS `cardhandlehistory`;
CREATE TABLE `cardhandlehistory` (
  `cardhandlehistory_id` int(11) NOT NULL auto_increment,
  `account_id` int(11) default NULL,
  `handle_type` varchar(255) default NULL,
  `handle_datetime` datetime default NULL,
  `card_id` int(11) default NULL,
  `ope_id` int(11) default NULL,
  PRIMARY KEY  (`cardhandlehistory_id`),
  KEY `account_id` (`account_id`),
  KEY `card_id` (`card_id`),
  KEY `ope_id` (`ope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cardhandlehistory`
--


/*!40000 ALTER TABLE `cardhandlehistory` DISABLE KEYS */;
LOCK TABLES `cardhandlehistory` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `cardhandlehistory` ENABLE KEYS */;

--
-- Table structure for table `cardnodefine`
--

DROP TABLE IF EXISTS `cardnodefine`;
CREATE TABLE `cardnodefine` (
  `cardnodefine_id` int(11) NOT NULL auto_increment,
  `description` text,
  PRIMARY KEY  (`cardnodefine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cardnodefine`
--


/*!40000 ALTER TABLE `cardnodefine` DISABLE KEYS */;
LOCK TABLES `cardnodefine` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `cardnodefine` ENABLE KEYS */;

--
-- Table structure for table `cardnofielddefine`
--

DROP TABLE IF EXISTS `cardnofielddefine`;
CREATE TABLE `cardnofielddefine` (
  `cardnofielddefine_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` text,
  `length` int(5) default NULL,
  `sort` int(2) default NULL,
  `fieldtype` varchar(255) default NULL,
  `chartype` varchar(255) default NULL,
  `maxvalue` varchar(255) default NULL,
  `cardnodefine_id` int(11) default NULL,
  `defaultvalue` varchar(255) default NULL,
  PRIMARY KEY  (`cardnofielddefine_id`),
  KEY `cardnodefine_id` (`cardnodefine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cardnofielddefine`
--


/*!40000 ALTER TABLE `cardnofielddefine` DISABLE KEYS */;
LOCK TABLES `cardnofielddefine` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `cardnofielddefine` ENABLE KEYS */;

--
-- Table structure for table `cardsaledetail`
--

DROP TABLE IF EXISTS `cardsaledetail`;
CREATE TABLE `cardsaledetail` (
  `cardsaledetail_id` int(11) NOT NULL auto_increment,
  `saledate` datetime default NULL,
  `sum` int(10) default NULL,
  `discount` int(10) default NULL,
  `saletype` varchar(255) default NULL,
  `card_id` int(11) default NULL,
  `cardbatchsalehistory_id` int(11) default NULL,
  PRIMARY KEY  (`cardsaledetail_id`),
  KEY `cardbatchsalehistory_id` (`cardbatchsalehistory_id`),
  KEY `card_id` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cardsaledetail`
--


/*!40000 ALTER TABLE `cardsaledetail` DISABLE KEYS */;
LOCK TABLES `cardsaledetail` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `cardsaledetail` ENABLE KEYS */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `filter` varchar(255) default NULL,
  `style` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  `release_time` datetime default NULL,
  `release` char(1) default NULL,
  `close_time` datetime default NULL,
  `click_url` varchar(255) default NULL,
  `crm_id` int(11) default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--


/*!40000 ALTER TABLE `category` DISABLE KEYS */;
LOCK TABLES `category` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

--
-- Table structure for table `category_caption`
--

DROP TABLE IF EXISTS `category_caption`;
CREATE TABLE `category_caption` (
  `category_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `description` longtext,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`category_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_caption`
--


/*!40000 ALTER TABLE `category_caption` DISABLE KEYS */;
LOCK TABLES `category_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `category_caption` ENABLE KEYS */;

--
-- Table structure for table `category_relation`
--

DROP TABLE IF EXISTS `category_relation`;
CREATE TABLE `category_relation` (
  `category_id` int(11) NOT NULL default '0',
  `parent_category_id` int(11) NOT NULL default '0',
  `sort` int(11) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`category_id`,`parent_category_id`),
  KEY `parent_category_id` (`parent_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_relation`
--


/*!40000 ALTER TABLE `category_relation` DISABLE KEYS */;
LOCK TABLES `category_relation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `category_relation` ENABLE KEYS */;

--
-- Table structure for table `click_tracking`
--

DROP TABLE IF EXISTS `click_tracking`;
CREATE TABLE `click_tracking` (
  `id` mediumint(9) NOT NULL auto_increment,
  `affiliate_id` varchar(50) default NULL,
  `timestamp` timestamp NOT NULL default '0000-00-00 00:00:00',
  `ipAddress` varchar(50) default NULL,
  `redirecturl` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `click_tracking`
--


/*!40000 ALTER TABLE `click_tracking` DISABLE KEYS */;
LOCK TABLES `click_tracking` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `click_tracking` ENABLE KEYS */;

--
-- Table structure for table `content_item_hits`
--

DROP TABLE IF EXISTS `content_item_hits`;
CREATE TABLE `content_item_hits` (
  `content_item_id` int(11) NOT NULL default '0',
  `hits` double(17,0) NOT NULL default '0',
  `parts` int(11) NOT NULL default '0',
  `avg_hits` double(17,4) NOT NULL default '0.0000',
  `is_adult` tinyint(4) NOT NULL default '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_item_hits`
--


/*!40000 ALTER TABLE `content_item_hits` DISABLE KEYS */;
LOCK TABLES `content_item_hits` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_item_hits` ENABLE KEYS */;

--
-- Table structure for table `content_item_hits_weekly`
--

DROP TABLE IF EXISTS `content_item_hits_weekly`;
CREATE TABLE `content_item_hits_weekly` (
  `content_item_id` int(11) NOT NULL default '0',
  `hits` double(17,0) NOT NULL default '0',
  `parts` int(11) NOT NULL default '0',
  `avg_hits` double(17,4) NOT NULL default '0.0000',
  `is_adult` tinyint(4) NOT NULL default '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `content_item_hits_weekly`
--


/*!40000 ALTER TABLE `content_item_hits_weekly` DISABLE KEYS */;
LOCK TABLES `content_item_hits_weekly` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_item_hits_weekly` ENABLE KEYS */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL auto_increment,
  `code` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--


/*!40000 ALTER TABLE `country` DISABLE KEYS */;
LOCK TABLES `country` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

--
-- Table structure for table `country_caption`
--

DROP TABLE IF EXISTS `country_caption`;
CREATE TABLE `country_caption` (
  `country_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `remark` text,
  PRIMARY KEY  (`country_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country_caption`
--


/*!40000 ALTER TABLE `country_caption` DISABLE KEYS */;
LOCK TABLES `country_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `country_caption` ENABLE KEYS */;

--
-- Table structure for table `crm`
--

DROP TABLE IF EXISTS `crm`;
CREATE TABLE `crm` (
  `crm_id` int(11) NOT NULL auto_increment,
  `description` longtext,
  `name` varchar(255) default NULL,
  `MAN_CRM_ID` varchar(255) default NULL,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`crm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  PRIMARY KEY  (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency`
--


/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
LOCK TABLES `currency` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;

--
-- Table structure for table `currency_caption`
--

DROP TABLE IF EXISTS `currency_caption`;
CREATE TABLE `currency_caption` (
  `currency_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`currency_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currency_caption`
--


/*!40000 ALTER TABLE `currency_caption` DISABLE KEYS */;
LOCK TABLES `currency_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `currency_caption` ENABLE KEYS */;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `discount_id` int(11) NOT NULL auto_increment,
  `validation_id` int(11) default NULL,
  `account_level` varchar(255) default NULL,
  `account_type` varchar(255) default NULL,
  `description` longtext,
  `discount` int(4) default NULL,
  `start_datetime` datetime default NULL,
  `end_datetime` datetime default NULL,
  `status` char(1) default NULL,
  PRIMARY KEY  (`discount_id`),
  KEY `validation_id` (`validation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `discount`
--


/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
LOCK TABLES `discount` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;

--
-- Table structure for table `discount_caption`
--

DROP TABLE IF EXISTS `discount_caption`;
CREATE TABLE `discount_caption` (
  `discount_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `description` longtext,
  PRIMARY KEY  (`discount_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `discount_caption`
--


/*!40000 ALTER TABLE `discount_caption` DISABLE KEYS */;
LOCK TABLES `discount_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `discount_caption` ENABLE KEYS */;

--
-- Table structure for table `distribute_channel`
--

DROP TABLE IF EXISTS `distribute_channel`;
CREATE TABLE `distribute_channel` (
  `distribute_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` longtext,
  `MAN_CHANNEL_ID` varchar(255) default NULL,
  `provider_id` int(11) default NULL,
  PRIMARY KEY  (`distribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `distribute_channel`
--


/*!40000 ALTER TABLE `distribute_channel` DISABLE KEYS */;
LOCK TABLES `distribute_channel` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `distribute_channel` ENABLE KEYS */;

--
-- Table structure for table `email_list`
--

DROP TABLE IF EXISTS `email_list`;
CREATE TABLE `email_list` (
  `email` varchar(50) character set utf8 NOT NULL default '',
  `name` varchar(50) character set utf8 NOT NULL default '',
  `active` int(11) default NULL,
  `type` varchar(255) default 'n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_list`
--


/*!40000 ALTER TABLE `email_list` DISABLE KEYS */;
LOCK TABLES `email_list` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `email_list` ENABLE KEYS */;

--
-- Table structure for table `feerecord_16t`
--

DROP TABLE IF EXISTS `feerecord_16t`;
CREATE TABLE `feerecord_16t` (
  `feeRecord_16T_id` int(11) NOT NULL auto_increment,
  `billcyclehistory_id` int(11) default NULL,
  `total_charge` int(10) default NULL,
  `charge_datetime` char(14) default NULL,
  PRIMARY KEY  (`feeRecord_16T_id`),
  KEY `billcyclehistory_id` (`billcyclehistory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feerecord_16t`
--


/*!40000 ALTER TABLE `feerecord_16t` DISABLE KEYS */;
LOCK TABLES `feerecord_16t` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `feerecord_16t` ENABLE KEYS */;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
CREATE TABLE `field` (
  `field_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field`
--


/*!40000 ALTER TABLE `field` DISABLE KEYS */;
LOCK TABLES `field` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `field` ENABLE KEYS */;

--
-- Table structure for table `field_caption`
--

DROP TABLE IF EXISTS `field_caption`;
CREATE TABLE `field_caption` (
  `field_id` int(11) NOT NULL default '0',
  `category_id` int(11) NOT NULL default '0',
  `field_category_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`field_category_id`,`lang_id`),
  KEY `field_id` (`field_id`),
  KEY `category_id` (`category_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_caption`
--


/*!40000 ALTER TABLE `field_caption` DISABLE KEYS */;
LOCK TABLES `field_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `field_caption` ENABLE KEYS */;

--
-- Table structure for table `field_category`
--

DROP TABLE IF EXISTS `field_category`;
CREATE TABLE `field_category` (
  `field_id` int(11) default NULL,
  `category_id` int(11) default NULL,
  `field_category_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `sort` int(11) default '0',
  `search` int(11) default '0',
  `detail` int(11) default '0',
  PRIMARY KEY  (`field_category_id`),
  KEY `field_id` (`field_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_category`
--


/*!40000 ALTER TABLE `field_category` DISABLE KEYS */;
LOCK TABLES `field_category` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `field_category` ENABLE KEYS */;

--
-- Table structure for table `field_role`
--

DROP TABLE IF EXISTS `field_role`;
CREATE TABLE `field_role` (
  `id` int(11) NOT NULL auto_increment,
  `field_id` int(11) NOT NULL default '0',
  `role_id` int(11) NOT NULL default '0',
  `operate` char(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_role`
--


/*!40000 ALTER TABLE `field_role` DISABLE KEYS */;
LOCK TABLES `field_role` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `field_role` ENABLE KEYS */;

--
-- Table structure for table `flag`
--

DROP TABLE IF EXISTS `flag`;
CREATE TABLE `flag` (
  `flag_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`flag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flag`
--


/*!40000 ALTER TABLE `flag` DISABLE KEYS */;
LOCK TABLES `flag` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `flag` ENABLE KEYS */;

--
-- Table structure for table `flag_caption`
--

DROP TABLE IF EXISTS `flag_caption`;
CREATE TABLE `flag_caption` (
  `flag_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `description` longtext,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`flag_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flag_caption`
--


/*!40000 ALTER TABLE `flag_caption` DISABLE KEYS */;
LOCK TABLES `flag_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `flag_caption` ENABLE KEYS */;

--
-- Table structure for table `from_bank`
--

DROP TABLE IF EXISTS `from_bank`;
CREATE TABLE `from_bank` (
  `from_bank_id` int(11) NOT NULL auto_increment,
  `ord_no_rule_id` int(11) default NULL,
  `serial_no` varchar(50) default NULL,
  `bank_name` varchar(255) default NULL,
  `description` text,
  `country` varchar(255) default NULL,
  `province` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `contact_name` varchar(255) default NULL,
  `address1` text,
  `address2` text,
  `zipcode` varchar(10) default NULL,
  `areacode` varchar(10) default NULL,
  `phone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `remark` text,
  `starttime` datetime default NULL,
  `endtime` datetime default NULL,
  PRIMARY KEY  (`from_bank_id`),
  KEY `ord_no_rule_id` (`ord_no_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `from_bank`
--


/*!40000 ALTER TABLE `from_bank` DISABLE KEYS */;
LOCK TABLES `from_bank` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `from_bank` ENABLE KEYS */;

--
-- Table structure for table `from_bank_caption`
--

DROP TABLE IF EXISTS `from_bank_caption`;
CREATE TABLE `from_bank_caption` (
  `from_bank_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `bank_name` varchar(255) default NULL,
  `description` text,
  `country` varchar(255) default NULL,
  `province` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `contact_name` varchar(255) default NULL,
  `address1` text,
  `address2` text,
  `zipcode` varchar(10) default NULL,
  `areacode` varchar(10) default NULL,
  `phone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  PRIMARY KEY  (`from_bank_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `from_bank_caption`
--


/*!40000 ALTER TABLE `from_bank_caption` DISABLE KEYS */;
LOCK TABLES `from_bank_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `from_bank_caption` ENABLE KEYS */;

--
-- Table structure for table `function`
--

DROP TABLE IF EXISTS `function`;
CREATE TABLE `function` (
  `function_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` longtext,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `function`
--


/*!40000 ALTER TABLE `function` DISABLE KEYS */;
LOCK TABLES `function` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `function` ENABLE KEYS */;

--
-- Table structure for table `getpoint`
--

DROP TABLE IF EXISTS `getpoint`;
CREATE TABLE `getpoint` (
  `getpoint_id` int(11) NOT NULL auto_increment,
  `getpoint_rule_id` int(11) default NULL,
  `account_id` int(11) default NULL,
  `point` int(20) default NULL,
  `getpoint_datetime` datetime default NULL,
  `status` char(1) default NULL,
  PRIMARY KEY  (`getpoint_id`),
  KEY `getpoint_rule_id` (`getpoint_rule_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `getpoint`
--


/*!40000 ALTER TABLE `getpoint` DISABLE KEYS */;
LOCK TABLES `getpoint` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `getpoint` ENABLE KEYS */;

--
-- Table structure for table `getpoint_rule`
--

DROP TABLE IF EXISTS `getpoint_rule`;
CREATE TABLE `getpoint_rule` (
  `getpoint_rule_id` int(11) NOT NULL auto_increment,
  `rule_classname` varchar(255) default NULL,
  `description` text,
  `type` varchar(30) default NULL,
  `status` varchar(30) default NULL,
  `start_datetime` datetime default NULL,
  `end_datetime` datetime default NULL,
  PRIMARY KEY  (`getpoint_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `getpoint_rule`
--


/*!40000 ALTER TABLE `getpoint_rule` DISABLE KEYS */;
LOCK TABLES `getpoint_rule` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `getpoint_rule` ENABLE KEYS */;

--
-- Table structure for table `getpoint_rule_caption`
--

DROP TABLE IF EXISTS `getpoint_rule_caption`;
CREATE TABLE `getpoint_rule_caption` (
  `getpoint_rule_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`getpoint_rule_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `getpoint_rule_caption`
--


/*!40000 ALTER TABLE `getpoint_rule_caption` DISABLE KEYS */;
LOCK TABLES `getpoint_rule_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `getpoint_rule_caption` ENABLE KEYS */;

--
-- Table structure for table `http_record`
--

DROP TABLE IF EXISTS `http_record`;
CREATE TABLE `http_record` (
  `http_record_id` int(11) NOT NULL auto_increment,
  `parent_record_id` int(11) default NULL,
  `record_time` datetime default NULL,
  `account_id` int(11) default NULL,
  `man_user_id` varchar(255) default NULL,
  `man_crm_id` varchar(255) default NULL,
  `url` text,
  `description` text,
  `status` varchar(4) default NULL,
  `target_id` int(11) default NULL,
  `type` varchar(2) default NULL,
  PRIMARY KEY  (`http_record_id`),
  KEY `account_id` (`account_id`),
  KEY `target_id` (`target_id`),
  KEY `parent_record_id` (`parent_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `http_record`
--


/*!40000 ALTER TABLE `http_record` DISABLE KEYS */;
LOCK TABLES `http_record` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `http_record` ENABLE KEYS */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL auto_increment,
  `media_id` int(11) NOT NULL default '0',
  `MAN_ITEM_ID` varchar(255) default NULL,
  `distribute_id` int(11) default NULL,
  `policy_id` int(11) default NULL,
  `voice` varchar(255) default NULL,
  `subtitle` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `size` int(11) default '0',
  `close_time` datetime default NULL,
  `release` char(1) default NULL,
  `release_time` datetime default NULL,
  `upload_time` datetime default NULL,
  `clicked` bigint(20) default NULL,
  `visited` bigint(20) default NULL,
  `download` bigint(20) default NULL,
  `removed` char(1) default NULL,
  `status` varchar(255) default NULL,
  `play` bigint(20) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`item_id`),
  KEY `distribute_id` (`distribute_id`),
  KEY `media_id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item`
--


/*!40000 ALTER TABLE `item` DISABLE KEYS */;
LOCK TABLES `item` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

--
-- Table structure for table `lanbill`
--

DROP TABLE IF EXISTS `lanbill`;
CREATE TABLE `lanbill` (
  `bill_id` int(11) NOT NULL auto_increment,
  `merid` varchar(255) default NULL,
  `paymentmethod` varchar(255) default NULL,
  `order_id` varchar(255) default NULL,
  `currency_id` varchar(255) default NULL,
  `tran_amt` int(11) default NULL,
  `tran_date` datetime default NULL,
  `tran_enddate` datetime default NULL,
  `tran_seq` varchar(255) default NULL,
  `tran_type` varchar(255) default NULL,
  `tran_status` varchar(255) default NULL,
  `tran_code` varchar(255) default NULL,
  `mer_param` text,
  `return_url` text,
  `operation_log` longtext,
  PRIMARY KEY  (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lanbill`
--


/*!40000 ALTER TABLE `lanbill` DISABLE KEYS */;
LOCK TABLES `lanbill` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `lanbill` ENABLE KEYS */;

--
-- Table structure for table `lang`
--

DROP TABLE IF EXISTS `lang`;
CREATE TABLE `lang` (
  `lang_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `code` varchar(255) default NULL,
  `release` char(1) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lang`
--


/*!40000 ALTER TABLE `lang` DISABLE KEYS */;
LOCK TABLES `lang` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `lang` ENABLE KEYS */;

--
-- Table structure for table `level_change_record`
--

DROP TABLE IF EXISTS `level_change_record`;
CREATE TABLE `level_change_record` (
  `account_id` int(11) NOT NULL default '0',
  `from_level` varchar(255) NOT NULL default '',
  `to_level` varchar(255) NOT NULL default '',
  `change_reason` text,
  `change_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `remark` text,
  `ope_id` int(11) default NULL,
  PRIMARY KEY  (`account_id`,`change_time`),
  KEY `ope_id` (`ope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `level_change_record`
--


/*!40000 ALTER TABLE `level_change_record` DISABLE KEYS */;
LOCK TABLES `level_change_record` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `level_change_record` ENABLE KEYS */;

--
-- Table structure for table `logic_dictionary_field`
--

DROP TABLE IF EXISTS `logic_dictionary_field`;
CREATE TABLE `logic_dictionary_field` (
  `logic_dictionary_field_id` int(11) NOT NULL auto_increment,
  `tablename` varchar(100) NOT NULL default '',
  `fieldname` varchar(100) NOT NULL default '',
  `isprimarykey` char(1) NOT NULL default '0',
  `pkbeanname` varchar(255) NOT NULL default '',
  `fieldtype` varchar(255) NOT NULL default 'String',
  `showlist` varchar(255) NOT NULL default '1',
  `showedit` varchar(255) NOT NULL default '1',
  `showtype` varchar(255) NOT NULL default '1',
  `sort` int(3) NOT NULL default '0',
  `editable` char(1) NOT NULL default '1',
  `validation` varchar(255) NOT NULL default '0',
  `beanfieldname` varchar(255) NOT NULL default '',
  `reftablename` varchar(255) NOT NULL default '',
  `reffieldname` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`logic_dictionary_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `logic_dictionary_table`
--

DROP TABLE IF EXISTS `logic_dictionary_table`;
CREATE TABLE `logic_dictionary_table` (
  `logic_dictionary_table_id` int(11) NOT NULL auto_increment,
  `tablename` varchar(100) NOT NULL default '',
  `beanname` varchar(255) NOT NULL default '',
  `daoname` varchar(255) NOT NULL default '',
  `orderfield` varchar(255) default '',
  `searchfield` varchar(255) default '',
  PRIMARY KEY  (`logic_dictionary_table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `mail_content`
--

DROP TABLE IF EXISTS `mail_content`;
CREATE TABLE `mail_content` (
  `mail_content_id` int(11) NOT NULL auto_increment,
  `lang_id` int(11) NOT NULL default '0',
  `subject` varchar(255) default NULL,
  `content` longtext,
  `status` varchar(255) default NULL,
  `send_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`mail_content_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mail_content`
--


/*!40000 ALTER TABLE `mail_content` DISABLE KEYS */;
LOCK TABLES `mail_content` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `mail_content` ENABLE KEYS */;

--
-- Table structure for table `mail_list`
--

DROP TABLE IF EXISTS `mail_list`;
CREATE TABLE `mail_list` (
  `email` varchar(255) NOT NULL default '',
  `lang_id` int(11) NOT NULL default '0',
  `status` varchar(255) default NULL,
  `endtime` datetime default NULL,
  `starttime` datetime default NULL,
  `create_time` datetime default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`email`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mail_list`
--


/*!40000 ALTER TABLE `mail_list` DISABLE KEYS */;
LOCK TABLES `mail_list` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `mail_list` ENABLE KEYS */;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `media_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `provider_id` int(11) default NULL,
  `homepage` varchar(255) default NULL,
  `level` varchar(255) default NULL,
  `premiere` datetime default NULL,
  `upc` varchar(255) default NULL,
  `leng` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `starttime` datetime default NULL,
  `endtime` datetime default NULL,
  `subtitle` varchar(10) default NULL,
  `voice` varchar(10) default NULL,
  `size` varchar(10) default NULL,
  `release_time` datetime default NULL,
  `close_time` datetime default NULL,
  `release` char(1) default NULL,
  `clicked` bigint(20) default '0',
  `play` bigint(20) default '0',
  `download` bigint(20) default '0',
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `click_url` varchar(255) default NULL,
  `crm_id` int(11) default NULL,
  PRIMARY KEY  (`media_id`),
  KEY `provider_id` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media`
--


/*!40000 ALTER TABLE `media` DISABLE KEYS */;
LOCK TABLES `media` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;

--
-- Table structure for table `media_actor`
--

DROP TABLE IF EXISTS `media_actor`;
CREATE TABLE `media_actor` (
  `media_actor_id` int(11) NOT NULL auto_increment,
  `media_id` int(11) NOT NULL default '0',
  `actor_id` int(11) NOT NULL default '0',
  `position_id` int(11) NOT NULL default '0',
  `belongto_team` int(11) NOT NULL default '0',
  `sway` varchar(255) default NULL,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`media_actor_id`),
  KEY `media_id` (`media_id`),
  KEY `actor_id` (`actor_id`),
  KEY `position_id` (`position_id`),
  KEY `belongto_team` (`belongto_team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_actor`
--


/*!40000 ALTER TABLE `media_actor` DISABLE KEYS */;
LOCK TABLES `media_actor` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `media_actor` ENABLE KEYS */;

--
-- Table structure for table `media_attribute`
--

DROP TABLE IF EXISTS `media_attribute`;
CREATE TABLE `media_attribute` (
  `media_id` int(11) NOT NULL default '0',
  `attribute_id` int(11) NOT NULL default '0',
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`media_id`,`attribute_id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_attribute`
--


/*!40000 ALTER TABLE `media_attribute` DISABLE KEYS */;
LOCK TABLES `media_attribute` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `media_attribute` ENABLE KEYS */;

--
-- Table structure for table `media_caption`
--

DROP TABLE IF EXISTS `media_caption`;
CREATE TABLE `media_caption` (
  `media_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `description` longtext,
  `location` varchar(255) default NULL,
  `premiere_area` varchar(255) default NULL,
  `post` varchar(255) default NULL,
  `metadata` longtext,
  `preview` varchar(255) default NULL,
  `highlight` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`media_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_caption`
--


/*!40000 ALTER TABLE `media_caption` DISABLE KEYS */;
LOCK TABLES `media_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `media_caption` ENABLE KEYS */;

--
-- Table structure for table `media_category`
--

DROP TABLE IF EXISTS `media_category`;
CREATE TABLE `media_category` (
  `media_id` int(11) NOT NULL default '0',
  `category_id` int(11) NOT NULL default '0',
  `sort` int(11) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`media_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_category`
--


/*!40000 ALTER TABLE `media_category` DISABLE KEYS */;
LOCK TABLES `media_category` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `media_category` ENABLE KEYS */;

--
-- Table structure for table `media_flag`
--

DROP TABLE IF EXISTS `media_flag`;
CREATE TABLE `media_flag` (
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  `media_id` int(11) NOT NULL default '0',
  `flag_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`media_id`,`flag_id`),
  KEY `flag_id` (`flag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_flag`
--


/*!40000 ALTER TABLE `media_flag` DISABLE KEYS */;
LOCK TABLES `media_flag` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `media_flag` ENABLE KEYS */;

--
-- Table structure for table `media_producer`
--

DROP TABLE IF EXISTS `media_producer`;
CREATE TABLE `media_producer` (
  `media_id` int(11) NOT NULL default '0',
  `producer_id` int(11) NOT NULL default '0',
  `sway` varchar(255) default NULL,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`media_id`,`producer_id`),
  KEY `producer_id` (`producer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_producer`
--


/*!40000 ALTER TABLE `media_producer` DISABLE KEYS */;
LOCK TABLES `media_producer` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `media_producer` ENABLE KEYS */;

--
-- Table structure for table `media_relation`
--

DROP TABLE IF EXISTS `media_relation`;
CREATE TABLE `media_relation` (
  `media_id` int(11) NOT NULL default '0',
  `parent_media_id` int(11) NOT NULL default '0',
  `sort` int(5) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`media_id`,`parent_media_id`),
  KEY `parent_media_id` (`parent_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_relation`
--


/*!40000 ALTER TABLE `media_relation` DISABLE KEYS */;
LOCK TABLES `media_relation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `media_relation` ENABLE KEYS */;

--
-- Table structure for table `media_service`
--

DROP TABLE IF EXISTS `media_service`;
CREATE TABLE `media_service` (
  `media_id` int(11) NOT NULL default '0',
  `user_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`media_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_service`
--


/*!40000 ALTER TABLE `media_service` DISABLE KEYS */;
LOCK TABLES `media_service` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `media_service` ENABLE KEYS */;

--
-- Table structure for table `media_url`
--

DROP TABLE IF EXISTS `media_url`;
CREATE TABLE `media_url` (
  `media_url_id` int(11) NOT NULL auto_increment,
  `ipserver` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `starttime` datetime default NULL,
  `endtime` datetime default NULL,
  PRIMARY KEY  (`media_url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `media_url`
--


/*!40000 ALTER TABLE `media_url` DISABLE KEYS */;
LOCK TABLES `media_url` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `media_url` ENABLE KEYS */;

--
-- Table structure for table `netip`
--

DROP TABLE IF EXISTS `netip`;
CREATE TABLE `netip` (
  `netip_id` int(11) NOT NULL default '0',
  `pay_method_id` int(11) default NULL,
  `from_ip` varchar(255) default NULL,
  `to_ip` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `starttime` datetime default NULL,
  `endtime` datetime default NULL,
  PRIMARY KEY  (`netip_id`),
  KEY `pay_method_id` (`pay_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `netip`
--


/*!40000 ALTER TABLE `netip` DISABLE KEYS */;
LOCK TABLES `netip` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `netip` ENABLE KEYS */;

--
-- Table structure for table `netip_mediaurl`
--

DROP TABLE IF EXISTS `netip_mediaurl`;
CREATE TABLE `netip_mediaurl` (
  `netip_id` int(11) NOT NULL default '0',
  `media_url_id` int(11) NOT NULL default '0',
  `type` varchar(255) default NULL,
  `sort` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `starttime` datetime default NULL,
  `endtime` datetime default NULL,
  PRIMARY KEY  (`netip_id`,`media_url_id`),
  KEY `media_url_id` (`media_url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `netip_mediaurl`
--


/*!40000 ALTER TABLE `netip_mediaurl` DISABLE KEYS */;
LOCK TABLES `netip_mediaurl` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `netip_mediaurl` ENABLE KEYS */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL auto_increment,
  `category_id` int(11) default NULL,
  `media_id` int(11) default NULL,
  `actor_id` int(11) default NULL,
  `release` char(1) default NULL,
  `news_type_id` int(11) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--


/*!40000 ALTER TABLE `news` DISABLE KEYS */;
LOCK TABLES `news` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

--
-- Table structure for table `news_caption`
--

DROP TABLE IF EXISTS `news_caption`;
CREATE TABLE `news_caption` (
  `news_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `title` varchar(255) default NULL,
  `description` longtext,
  `click_url` varchar(255) default NULL,
  `style` varchar(255) default NULL,
  `keyword` varchar(255) default NULL,
  `author` varchar(255) default NULL,
  `origin` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  `body` longtext,
  `image` varchar(255) default NULL,
  PRIMARY KEY  (`news_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news_caption`
--


/*!40000 ALTER TABLE `news_caption` DISABLE KEYS */;
LOCK TABLES `news_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `news_caption` ENABLE KEYS */;

--
-- Table structure for table `news_type`
--

DROP TABLE IF EXISTS `news_type`;
CREATE TABLE `news_type` (
  `news_type_id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`news_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news_type`
--


/*!40000 ALTER TABLE `news_type` DISABLE KEYS */;
LOCK TABLES `news_type` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `news_type` ENABLE KEYS */;

--
-- Table structure for table `operate`
--

DROP TABLE IF EXISTS `operate`;
CREATE TABLE `operate` (
  `operate_id` int(11) NOT NULL auto_increment,
  `operate_action_id` int(11) default NULL,
  `operate_time` datetime default NULL,
  `description` text,
  `account_id` int(11) default NULL,
  `ope_id` int(11) default NULL,
  `account_band_id` int(11) default NULL,
  `feeRecord_16T_id` int(11) default NULL,
  `card_id` int(11) default NULL,
  `watch_ad_record_id` int(11) default NULL,
  `order_id` int(11) default NULL,
  `ope_ip` varchar(255) default NULL,
  `param1` varchar(255) default NULL,
  `param2` varchar(255) default NULL,
  `param3` varchar(255) default NULL,
  PRIMARY KEY  (`operate_id`),
  KEY `operate_action_id` (`operate_action_id`),
  KEY `account_id` (`account_id`),
  KEY `account_band_id` (`account_band_id`),
  KEY `feeRecord_16T_id` (`feeRecord_16T_id`),
  KEY `watch_ad_record_id` (`watch_ad_record_id`),
  KEY `order_id` (`order_id`),
  KEY `ope_id` (`ope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operate`
--


/*!40000 ALTER TABLE `operate` DISABLE KEYS */;
LOCK TABLES `operate` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `operate` ENABLE KEYS */;

--
-- Table structure for table `operate_action`
--

DROP TABLE IF EXISTS `operate_action`;
CREATE TABLE `operate_action` (
  `operate_action_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` text,
  PRIMARY KEY  (`operate_action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operate_action`
--


/*!40000 ALTER TABLE `operate_action` DISABLE KEYS */;
LOCK TABLES `operate_action` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `operate_action` ENABLE KEYS */;

--
-- Table structure for table `operate_action_caption`
--

DROP TABLE IF EXISTS `operate_action_caption`;
CREATE TABLE `operate_action_caption` (
  `operate_action_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `description` text,
  PRIMARY KEY  (`operate_action_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operate_action_caption`
--


/*!40000 ALTER TABLE `operate_action_caption` DISABLE KEYS */;
LOCK TABLES `operate_action_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `operate_action_caption` ENABLE KEYS */;

--
-- Table structure for table `ord_no_fielddefine`
--

DROP TABLE IF EXISTS `ord_no_fielddefine`;
CREATE TABLE `ord_no_fielddefine` (
  `ord_no_fielddefine_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` text,
  `length` int(5) default NULL,
  `sort` int(2) default NULL,
  `fieldtype` varchar(255) default NULL,
  `chartype` varchar(255) default NULL,
  `maxvalue` varchar(255) default NULL,
  `ord_no_rule_id` int(11) default NULL,
  `defaultvalue` varchar(255) default NULL,
  PRIMARY KEY  (`ord_no_fielddefine_id`),
  KEY `ord_no_rule_id` (`ord_no_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ord_no_fielddefine`
--


/*!40000 ALTER TABLE `ord_no_fielddefine` DISABLE KEYS */;
LOCK TABLES `ord_no_fielddefine` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ord_no_fielddefine` ENABLE KEYS */;

--
-- Table structure for table `ord_no_rule`
--

DROP TABLE IF EXISTS `ord_no_rule`;
CREATE TABLE `ord_no_rule` (
  `ord_no_rule_id` int(11) NOT NULL auto_increment,
  `description` text,
  PRIMARY KEY  (`ord_no_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ord_no_rule`
--


/*!40000 ALTER TABLE `ord_no_rule` DISABLE KEYS */;
LOCK TABLES `ord_no_rule` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `ord_no_rule` ENABLE KEYS */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(15) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `serial_no` varchar(255) default NULL,
  `account_id` int(11) default NULL,
  `pay_method_id` int(2) default NULL,
  `user_id` varchar(255) default NULL,
  `order_amount` int(10) default NULL,
  `total_due` int(10) default NULL,
  `currency_id` int(11) default NULL,
  `invoice_need` char(1) default NULL,
  `invoice_heading` varchar(100) default NULL,
  `order_date` datetime default NULL,
  `recip_lastname` varchar(30) default NULL,
  `recip_firstname` varchar(30) default NULL,
  `address1` varchar(200) default NULL,
  `address2` varchar(200) default NULL,
  `zipcode` varchar(10) default NULL,
  `ope_message` text,
  `user_message` text,
  `remark` text,
  `ope_id` int(11) default NULL,
  `status` varchar(4) default NULL,
  `billcyclehistory_id` int(11) default NULL,
  `pay_datetime` datetime default NULL,
  `pay_sum` int(10) default NULL,
  `pay_point` int(11) default NULL,
  `pay_cardpoint` int(11) default NULL,
  `pay_user_ip` varchar(255) default NULL,
  `pay_ope_id` int(11) default NULL,
  `bill_balance` int(10) default NULL,
  `adjustment_sum` int(10) default NULL,
  `adjustment_reason` text,
  `adjustment_ope_id` int(11) default NULL,
  `adjustment_datetime` datetime default NULL,
  `bad_debts_sum` int(10) default NULL,
  `bad_debts_reason` text,
  `bad_debts_datetime` datetime default NULL,
  `bad_debts_ope_id` int(11) default NULL,
  PRIMARY KEY  (`order_id`),
  KEY `account_id` (`account_id`),
  KEY `pay_method_id` (`pay_method_id`),
  KEY `currency_id` (`currency_id`),
  KEY `billcyclehistory_id` (`billcyclehistory_id`),
  KEY `parent_id` (`parent_id`),
  KEY `pay_ope_id` (`pay_ope_id`),
  KEY `adjustment_ope_id` (`adjustment_ope_id`),
  KEY `bad_debts_ope_id` (`bad_debts_ope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--


/*!40000 ALTER TABLE `order` DISABLE KEYS */;
LOCK TABLES `order` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

--
-- Table structure for table `order_caption`
--

DROP TABLE IF EXISTS `order_caption`;
CREATE TABLE `order_caption` (
  `order_id` int(15) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `remark` longtext,
  `adjustment_reason` varchar(255) default NULL,
  `bad_debts_reason` varchar(255) default NULL,
  PRIMARY KEY  (`order_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_caption`
--


/*!40000 ALTER TABLE `order_caption` DISABLE KEYS */;
LOCK TABLES `order_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `order_caption` ENABLE KEYS */;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL auto_increment,
  `order_id` int(15) default NULL,
  `validation_id` int(11) default NULL,
  `parent_id` int(11) default NULL,
  `quantity` int(6) default NULL,
  `currency_id` int(11) default NULL,
  `list_price` int(10) default NULL,
  `sale_price` int(10) default NULL,
  `status` varchar(2) default NULL,
  `aloop` int(11) default NULL,
  `description` text,
  `order_date` datetime default NULL,
  `cancel_date` datetime default NULL,
  `cancel_reason` text,
  `authorized_time` datetime default NULL,
  PRIMARY KEY  (`order_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `validation_id` (`validation_id`),
  KEY `currency_id` (`currency_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--


/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
LOCK TABLES `order_detail` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;

--
-- Table structure for table `order_detail_caption`
--

DROP TABLE IF EXISTS `order_detail_caption`;
CREATE TABLE `order_detail_caption` (
  `order_detail_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `description` text,
  `cancel_reason` varchar(255) default NULL,
  PRIMARY KEY  (`order_detail_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail_caption`
--


/*!40000 ALTER TABLE `order_detail_caption` DISABLE KEYS */;
LOCK TABLES `order_detail_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `order_detail_caption` ENABLE KEYS */;

--
-- Table structure for table `order_his`
--

DROP TABLE IF EXISTS `order_his`;
CREATE TABLE `order_his` (
  `order_his_id` int(11) NOT NULL auto_increment,
  `order_id` int(15) default NULL,
  `history` text,
  `remark` text,
  `ope_id` int(11) default NULL,
  `ope_date` datetime default NULL,
  PRIMARY KEY  (`order_his_id`),
  KEY `order_id` (`order_id`),
  KEY `ope_id` (`ope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_his`
--


/*!40000 ALTER TABLE `order_his` DISABLE KEYS */;
LOCK TABLES `order_his` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `order_his` ENABLE KEYS */;

--
-- Table structure for table `os_currentstep`
--

DROP TABLE IF EXISTS `os_currentstep`;
CREATE TABLE `os_currentstep` (
  `ID` bigint(20) NOT NULL default '0',
  `ENTRY_ID` bigint(20) default NULL,
  `STEP_ID` int(11) default NULL,
  `ACTION_ID` int(11) default NULL,
  `OWNER` varchar(35) default NULL,
  `START_DATE` datetime default NULL,
  `FINISH_DATE` datetime default NULL,
  `DUE_DATE` datetime default NULL,
  `STATUS` varchar(40) default NULL,
  `CALLER` varchar(35) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ENTRY_ID` (`ENTRY_ID`),
  KEY `OWNER` (`OWNER`),
  KEY `CALLER` (`CALLER`),
  CONSTRAINT `os_currentstep_ibfk_1` FOREIGN KEY (`ENTRY_ID`) REFERENCES `os_wfentry` (`ID`),
  CONSTRAINT `os_currentstep_ibfk_2` FOREIGN KEY (`OWNER`) REFERENCES `os_user` (`USERNAME`),
  CONSTRAINT `os_currentstep_ibfk_3` FOREIGN KEY (`CALLER`) REFERENCES `os_user` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `os_currentstep`
--


/*!40000 ALTER TABLE `os_currentstep` DISABLE KEYS */;
LOCK TABLES `os_currentstep` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `os_currentstep` ENABLE KEYS */;

--
-- Table structure for table `os_currentstep_prev`
--

DROP TABLE IF EXISTS `os_currentstep_prev`;
CREATE TABLE `os_currentstep_prev` (
  `ID` bigint(20) NOT NULL default '0',
  `PREVIOUS_ID` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`ID`,`PREVIOUS_ID`),
  KEY `ID` (`ID`),
  KEY `PREVIOUS_ID` (`PREVIOUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `os_currentstep_prev`
--


/*!40000 ALTER TABLE `os_currentstep_prev` DISABLE KEYS */;
LOCK TABLES `os_currentstep_prev` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `os_currentstep_prev` ENABLE KEYS */;

--
-- Table structure for table `os_group`
--

DROP TABLE IF EXISTS `os_group`;
CREATE TABLE `os_group` (
  `GROUPNAME` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`GROUPNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `os_group`
--


/*!40000 ALTER TABLE `os_group` DISABLE KEYS */;
LOCK TABLES `os_group` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `os_group` ENABLE KEYS */;

--
-- Table structure for table `os_historystep`
--

DROP TABLE IF EXISTS `os_historystep`;
CREATE TABLE `os_historystep` (
  `ID` bigint(20) NOT NULL default '0',
  `ENTRY_ID` bigint(20) default NULL,
  `STEP_ID` int(11) default NULL,
  `ACTION_ID` int(11) default NULL,
  `OWNER` varchar(35) default NULL,
  `START_DATE` datetime default NULL,
  `FINISH_DATE` datetime default NULL,
  `DUE_DATE` datetime default NULL,
  `STATUS` varchar(40) default NULL,
  `CALLER` varchar(35) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `ENTRY_ID` (`ENTRY_ID`),
  KEY `OWNER` (`OWNER`),
  KEY `CALLER` (`CALLER`),
  CONSTRAINT `os_historystep_ibfk_1` FOREIGN KEY (`ENTRY_ID`) REFERENCES `os_wfentry` (`ID`),
  CONSTRAINT `os_historystep_ibfk_2` FOREIGN KEY (`OWNER`) REFERENCES `os_user` (`USERNAME`),
  CONSTRAINT `os_historystep_ibfk_3` FOREIGN KEY (`CALLER`) REFERENCES `os_user` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `os_historystep`
--


/*!40000 ALTER TABLE `os_historystep` DISABLE KEYS */;
LOCK TABLES `os_historystep` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `os_historystep` ENABLE KEYS */;

--
-- Table structure for table `os_historystep_prev`
--

DROP TABLE IF EXISTS `os_historystep_prev`;
CREATE TABLE `os_historystep_prev` (
  `ID` bigint(20) NOT NULL default '0',
  `PREVIOUS_ID` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`ID`,`PREVIOUS_ID`),
  KEY `ID` (`ID`),
  KEY `PREVIOUS_ID` (`PREVIOUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `os_historystep_prev`
--


/*!40000 ALTER TABLE `os_historystep_prev` DISABLE KEYS */;
LOCK TABLES `os_historystep_prev` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `os_historystep_prev` ENABLE KEYS */;

--
-- Table structure for table `os_membership`
--

DROP TABLE IF EXISTS `os_membership`;
CREATE TABLE `os_membership` (
  `USERNAME` varchar(20) NOT NULL default '',
  `GROUPNAME` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`USERNAME`,`GROUPNAME`),
  KEY `USERNAME` (`USERNAME`),
  KEY `GROUPNAME` (`GROUPNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `os_membership`
--


/*!40000 ALTER TABLE `os_membership` DISABLE KEYS */;
LOCK TABLES `os_membership` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `os_membership` ENABLE KEYS */;

--
-- Table structure for table `os_propertyentry`
--

DROP TABLE IF EXISTS `os_propertyentry`;
CREATE TABLE `os_propertyentry` (
  `GLOBAL_KEY` varchar(140) NOT NULL default '',
  `ITEM_KEY` varchar(200) NOT NULL default '',
  `ITEM_TYPE` tinyint(4) default NULL,
  `STRING_VALUE` varchar(255) default NULL,
  `DATE_VALUE` datetime default NULL,
  `DATA_VALUE` blob,
  `FLOAT_VALUE` float default NULL,
  `NUMBER_VALUE` decimal(10,0) default NULL,
  PRIMARY KEY  (`GLOBAL_KEY`,`ITEM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `os_propertyentry`
--


/*!40000 ALTER TABLE `os_propertyentry` DISABLE KEYS */;
LOCK TABLES `os_propertyentry` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `os_propertyentry` ENABLE KEYS */;

--
-- Table structure for table `os_stepids`
--

DROP TABLE IF EXISTS `os_stepids`;
CREATE TABLE `os_stepids` (
  `ID` bigint(20) NOT NULL auto_increment,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `os_stepids`
--


/*!40000 ALTER TABLE `os_stepids` DISABLE KEYS */;
LOCK TABLES `os_stepids` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `os_stepids` ENABLE KEYS */;

--
-- Table structure for table `os_user`
--

DROP TABLE IF EXISTS `os_user`;
CREATE TABLE `os_user` (
  `USERNAME` varchar(100) NOT NULL default '',
  `PASSWORDHASH` mediumtext,
  PRIMARY KEY  (`USERNAME`),
  KEY `USERNAME` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `os_wfentry`
--

DROP TABLE IF EXISTS `os_wfentry`;
CREATE TABLE `os_wfentry` (
  `ID` bigint(20) NOT NULL default '0',
  `NAME` varchar(60) default NULL,
  `STATE` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `os_wfentry`
--


/*!40000 ALTER TABLE `os_wfentry` DISABLE KEYS */;
LOCK TABLES `os_wfentry` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `os_wfentry` ENABLE KEYS */;

--
-- Table structure for table `parameter`
--

DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `paraid` varchar(50) default '',
  `name` varchar(255) default '',
  `itemid` varchar(50) default '',
  `issystem` char(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `partner`
--

DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner` (
  `partner_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `lang_id` int(11) NOT NULL default '0',
  `caption` varchar(255) default NULL,
  `picture` varchar(255) default NULL,
  `homepage` varchar(255) default NULL,
  `description` longtext,
  `MAN_CRM_ID` varchar(255) default NULL,
  `MAN_ACCOUNT_ID` varchar(255) default NULL,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`partner_id`,`name`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `partner`
--


/*!40000 ALTER TABLE `partner` DISABLE KEYS */;
LOCK TABLES `partner` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `partner` ENABLE KEYS */;

--
-- Table structure for table `pay_method`
--

DROP TABLE IF EXISTS `pay_method`;
CREATE TABLE `pay_method` (
  `pay_method_id` int(11) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `description` text,
  `pay_region_desc` varchar(255) default NULL,
  `pay_url` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `starttime` datetime default NULL,
  `endtime` datetime default NULL,
  `is_preuse` char(1) default NULL,
  `account_postfix` varchar(255) default NULL,
  PRIMARY KEY  (`pay_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pay_method`
--


/*!40000 ALTER TABLE `pay_method` DISABLE KEYS */;
LOCK TABLES `pay_method` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `pay_method` ENABLE KEYS */;

--
-- Table structure for table `pay_method_caption`
--

DROP TABLE IF EXISTS `pay_method_caption`;
CREATE TABLE `pay_method_caption` (
  `pay_method_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(30) default NULL,
  `description` text,
  `pay_region_desc` varchar(255) default NULL,
  PRIMARY KEY  (`pay_method_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pay_method_caption`
--


/*!40000 ALTER TABLE `pay_method_caption` DISABLE KEYS */;
LOCK TABLES `pay_method_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `pay_method_caption` ENABLE KEYS */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL auto_increment,
  `paymententity_id` int(11) default NULL,
  `order_id` varchar(255) default NULL,
  `pe_order_id` varchar(255) default NULL,
  `pe_bill_id` varchar(255) default NULL,
  `currency_id` varchar(255) default NULL,
  `tran_amt` int(11) default NULL,
  `tran_date` datetime default NULL,
  `tran_enddate` datetime default NULL,
  `tran_seq` varchar(255) default NULL,
  `tran_type` varchar(255) default NULL,
  `tran_status` varchar(255) default NULL,
  `tran_code` varchar(255) default NULL,
  `mer_param` text,
  `return_url` text,
  `operation_log` longtext,
  PRIMARY KEY  (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--


/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
LOCK TABLES `payment` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

--
-- Table structure for table `paymententity`
--

DROP TABLE IF EXISTS `paymententity`;
CREATE TABLE `paymententity` (
  `paymententity_id` int(11) NOT NULL auto_increment,
  `merid` varchar(255) default NULL,
  `paymentmethod` varchar(255) default NULL,
  `paymententitymercode` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `starttime` datetime default NULL,
  `endtime` datetime default NULL,
  PRIMARY KEY  (`paymententity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paymententity`
--


/*!40000 ALTER TABLE `paymententity` DISABLE KEYS */;
LOCK TABLES `paymententity` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `paymententity` ENABLE KEYS */;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL auto_increment,
  `category_id` int(11) default NULL,
  `media_id` int(11) default NULL,
  `actor_id` int(11) default NULL,
  `photo` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`photo_id`),
  KEY `category_id` (`category_id`),
  KEY `media_id` (`media_id`),
  KEY `actor_id` (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `photo`
--


/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
LOCK TABLES `photo` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

--
-- Table structure for table `photo_caption`
--

DROP TABLE IF EXISTS `photo_caption`;
CREATE TABLE `photo_caption` (
  `lang_id` int(11) NOT NULL default '0',
  `photo_id` int(11) NOT NULL default '0',
  `title` varchar(255) default NULL,
  `click_url` varchar(255) default NULL,
  `description` longtext,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`lang_id`,`photo_id`),
  KEY `photo_id` (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `photo_caption`
--


/*!40000 ALTER TABLE `photo_caption` DISABLE KEYS */;
LOCK TABLES `photo_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `photo_caption` ENABLE KEYS */;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
CREATE TABLE `policy` (
  `policy_id` int(11) NOT NULL auto_increment,
  `MAN_POLICY_ID` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `provider_id` varchar(255) default NULL,
  `available` varchar(255) default NULL,
  `redirecturl` longtext,
  PRIMARY KEY  (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `policy`
--


/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
LOCK TABLES `policy` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;

--
-- Table structure for table `popular_list`
--

DROP TABLE IF EXISTS `popular_list`;
CREATE TABLE `popular_list` (
  `popular_list_id` int(11) NOT NULL auto_increment,
  `url` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `orderID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`popular_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `popular_list`
--


/*!40000 ALTER TABLE `popular_list` DISABLE KEYS */;
LOCK TABLES `popular_list` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `popular_list` ENABLE KEYS */;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `position_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--


/*!40000 ALTER TABLE `position` DISABLE KEYS */;
LOCK TABLES `position` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `position` ENABLE KEYS */;

--
-- Table structure for table `position_caption`
--

DROP TABLE IF EXISTS `position_caption`;
CREATE TABLE `position_caption` (
  `position_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `caption` varchar(255) default NULL,
  `descript` longtext,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`position_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position_caption`
--


/*!40000 ALTER TABLE `position_caption` DISABLE KEYS */;
LOCK TABLES `position_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `position_caption` ENABLE KEYS */;

--
-- Table structure for table `preview`
--

DROP TABLE IF EXISTS `preview`;
CREATE TABLE `preview` (
  `preview_id` int(11) NOT NULL auto_increment,
  `category_id` int(11) default NULL,
  `media_id` int(11) default NULL,
  `actor_id` int(11) default NULL,
  `url` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`preview_id`),
  KEY `category_id` (`category_id`),
  KEY `media_id` (`media_id`),
  KEY `actor_id` (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `preview`
--


/*!40000 ALTER TABLE `preview` DISABLE KEYS */;
LOCK TABLES `preview` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `preview` ENABLE KEYS */;

--
-- Table structure for table `preview_caption`
--

DROP TABLE IF EXISTS `preview_caption`;
CREATE TABLE `preview_caption` (
  `preview_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `title` varchar(255) default NULL,
  `description` longtext,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`preview_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `preview_caption`
--


/*!40000 ALTER TABLE `preview_caption` DISABLE KEYS */;
LOCK TABLES `preview_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `preview_caption` ENABLE KEYS */;

--
-- Table structure for table `price_policy`
--

DROP TABLE IF EXISTS `price_policy`;
CREATE TABLE `price_policy` (
  `price_policy_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `policy_id` int(11) default NULL,
  `currency_id` varchar(4) default NULL,
  `price` int(12) default NULL,
  `access_time` varchar(255) default NULL,
  `discount` int(4) default NULL,
  `onsale` int(4) default NULL,
  `extend` longtext,
  `status` varchar(255) default NULL,
  `starttime` datetime default NULL,
  `endtime` datetime default NULL,
  `recurring` varchar(255) default NULL,
  `sort` int(11) default NULL,
  `MAN_PACKAGE_ID` varchar(255) default NULL,
  PRIMARY KEY  (`price_policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price_policy`
--


/*!40000 ALTER TABLE `price_policy` DISABLE KEYS */;
LOCK TABLES `price_policy` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `price_policy` ENABLE KEYS */;

--
-- Table structure for table `producer`
--

DROP TABLE IF EXISTS `producer`;
CREATE TABLE `producer` (
  `producer_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`producer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producer`
--


/*!40000 ALTER TABLE `producer` DISABLE KEYS */;
LOCK TABLES `producer` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `producer` ENABLE KEYS */;

--
-- Table structure for table `producer_caption`
--

DROP TABLE IF EXISTS `producer_caption`;
CREATE TABLE `producer_caption` (
  `producer_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `caption` varchar(255) default NULL,
  `description` longtext,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`producer_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producer_caption`
--


/*!40000 ALTER TABLE `producer_caption` DISABLE KEYS */;
LOCK TABLES `producer_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `producer_caption` ENABLE KEYS */;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `provider_id` int(11) NOT NULL auto_increment,
  `partner_flag` char(1) default NULL,
  `MAN_ACCOUNT_ID` varchar(255) default NULL,
  `user_id` int(11) default NULL,
  `name` varchar(255) NOT NULL default '',
  `phone` varchar(255) default NULL,
  `logo` varchar(255) default NULL,
  `homepage` varchar(255) default NULL,
  `redirect_url` varchar(255) default NULL,
  `visited` bigint(20) default '0',
  `download` bigint(20) default '0',
  `play` bigint(20) default '0',
  `address` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  `role_id` int(11) default NULL,
  PRIMARY KEY  (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provider`
--


/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
LOCK TABLES `provider` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;

--
-- Table structure for table `provider_caption`
--

DROP TABLE IF EXISTS `provider_caption`;
CREATE TABLE `provider_caption` (
  `provider_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `description` longtext,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`provider_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provider_caption`
--


/*!40000 ALTER TABLE `provider_caption` DISABLE KEYS */;
LOCK TABLES `provider_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `provider_caption` ENABLE KEYS */;

--
-- Table structure for table `provider_crm`
--

DROP TABLE IF EXISTS `provider_crm`;
CREATE TABLE `provider_crm` (
  `provider_id` int(11) NOT NULL default '0',
  `crm_id` int(11) NOT NULL default '0',
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`provider_id`,`crm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provider_crm`
--


/*!40000 ALTER TABLE `provider_crm` DISABLE KEYS */;
LOCK TABLES `provider_crm` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `provider_crm` ENABLE KEYS */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL auto_increment,
  `lang_id` int(11) default NULL,
  `content` longtext,
  `user_id` int(11) default NULL,
  `rating` char(1) default NULL,
  `media_id` int(11) default NULL,
  `category_id` int(11) default NULL,
  `review_time` datetime default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`review_id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review`
--


/*!40000 ALTER TABLE `review` DISABLE KEYS */;
LOCK TABLES `review` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` longtext,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `role_function`
--

DROP TABLE IF EXISTS `role_function`;
CREATE TABLE `role_function` (
  `role_id` int(11) NOT NULL default '0',
  `function_id` int(11) NOT NULL default '0',
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`role_id`,`function_id`),
  KEY `function_id` (`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_function`
--


/*!40000 ALTER TABLE `role_function` DISABLE KEYS */;
LOCK TABLES `role_function` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `role_function` ENABLE KEYS */;

--
-- Table structure for table `role_relation`
--

DROP TABLE IF EXISTS `role_relation`;
CREATE TABLE `role_relation` (
  `role_id` int(11) NOT NULL default '0',
  `parent_role_id` int(11) NOT NULL default '0',
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`role_id`,`parent_role_id`),
  KEY `parent_role_id` (`parent_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_relation`
--


/*!40000 ALTER TABLE `role_relation` DISABLE KEYS */;
LOCK TABLES `role_relation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `role_relation` ENABLE KEYS */;

--
-- Table structure for table `scoretype`
--

DROP TABLE IF EXISTS `scoretype`;
CREATE TABLE `scoretype` (
  `scoretype_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`scoretype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scoretype`
--


/*!40000 ALTER TABLE `scoretype` DISABLE KEYS */;
LOCK TABLES `scoretype` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `scoretype` ENABLE KEYS */;

--
-- Table structure for table `scoretype_caption`
--

DROP TABLE IF EXISTS `scoretype_caption`;
CREATE TABLE `scoretype_caption` (
  `scoretype_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `description` longtext,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`scoretype_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scoretype_caption`
--


/*!40000 ALTER TABLE `scoretype_caption` DISABLE KEYS */;
LOCK TABLES `scoretype_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `scoretype_caption` ENABLE KEYS */;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
CREATE TABLE `search` (
  `field_id` int(11) NOT NULL default '0',
  `category_id` int(11) NOT NULL default '0',
  `type` int(11) NOT NULL default '0',
  PRIMARY KEY  (`field_id`,`category_id`,`type`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `search`
--


/*!40000 ALTER TABLE `search` DISABLE KEYS */;
LOCK TABLES `search` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `search` ENABLE KEYS */;

--
-- Table structure for table `search_index`
--

DROP TABLE IF EXISTS `search_index`;
CREATE TABLE `search_index` (
  `media_id` int(11) NOT NULL default '0',
  `url` varchar(255) NOT NULL default '',
  `metadata` text NOT NULL,
  `description` text NOT NULL,
  `caption` text NOT NULL,
  `location` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `categories` varchar(255) NOT NULL default '',
  `channel_id` int(11) NOT NULL default '0',
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `search_index`
--


/*!40000 ALTER TABLE `search_index` DISABLE KEYS */;
LOCK TABLES `search_index` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `search_index` ENABLE KEYS */;

--
-- Table structure for table `send_mail`
--

DROP TABLE IF EXISTS `send_mail`;
CREATE TABLE `send_mail` (
  `id` bigint(20) unsigned NOT NULL default '0',
  `from_name` varchar(30)  default '',
  `from_email` varchar(50)  default '',
  `subject` varchar(255)  default '',
  `language` varchar(10)  default '',
  `format` varchar(10)  default '',
  `schedule` bigint(12) default '0',
  `send_filename` varchar(150)  default '',
  `email_list_source` varchar(100)  default '',
  `email_table_name` varchar(100)  default '',
  `smtp_server` varchar(100)  default '',
  `smtp_username` varchar(30)  default '',
  `smtp_userpassword` varchar(30)  default '',
  `send_end_time` bigint(12) unsigned  default '0',
  `send_state` smallint(1) unsigned  default '0',
  `description` varchar(255)  default '',
  `content` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `send_mail_info`
--

DROP TABLE IF EXISTS `send_mail_info`;
CREATE TABLE `send_mail_info` (
  `id` bigint(20) unsigned NOT NULL default '0',
  `send_end_time` bigint(12) unsigned  default '0',
  `send_state` smallint(1) unsigned  default '0',
  `parent_id` bigint(20) unsigned  default '0',
  `user_name` varchar(50)  default '',
  `user_email` varchar(255)  default ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `send_mail_info`
--


/*!40000 ALTER TABLE `send_mail_info` DISABLE KEYS */;
LOCK TABLES `send_mail_info` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `send_mail_info` ENABLE KEYS */;

--
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
CREATE TABLE `source` (
  `source_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `source`
--


/*!40000 ALTER TABLE `source` DISABLE KEYS */;
LOCK TABLES `source` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `source` ENABLE KEYS */;

--
-- Table structure for table `sp`
--

DROP TABLE IF EXISTS `sp`;
CREATE TABLE `sp` (
  `sp_id` int(11) NOT NULL auto_increment,
  `country` varchar(255) default NULL,
  `credit` varchar(50) default NULL,
  `name` varchar(255) default NULL,
  `contact` varchar(255) default NULL,
  `province` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `address1` text,
  `address2` text,
  `zipcode` varchar(10) default NULL,
  `areacode` varchar(10) default NULL,
  `phone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `remark` text,
  `ope_id` int(11) default NULL,
  `join_date` datetime default NULL,
  `update_date` datetime default NULL,
  PRIMARY KEY  (`sp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sp`
--


/*!40000 ALTER TABLE `sp` DISABLE KEYS */;
LOCK TABLES `sp` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `sp` ENABLE KEYS */;

--
-- Table structure for table `sp_creditchange`
--

DROP TABLE IF EXISTS `sp_creditchange`;
CREATE TABLE `sp_creditchange` (
  `sp_creditchange_id` int(11) NOT NULL auto_increment,
  `remark` text,
  `original` varchar(255) default NULL,
  `destination` varchar(255) default NULL,
  `sp_id` int(11) default NULL,
  `change_time` datetime default NULL,
  PRIMARY KEY  (`sp_creditchange_id`),
  KEY `sp_id` (`sp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sp_creditchange`
--


/*!40000 ALTER TABLE `sp_creditchange` DISABLE KEYS */;
LOCK TABLES `sp_creditchange` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `sp_creditchange` ENABLE KEYS */;

--
-- Table structure for table `table_role`
--

DROP TABLE IF EXISTS `table_role`;
CREATE TABLE `table_role` (
  `id` int(11) NOT NULL auto_increment,
  `table_id` int(11) NOT NULL default '0',
  `record_id` int(11) NOT NULL default '0',
  `role_id` int(11) NOT NULL default '0',
  `operate` char(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_role`
--


/*!40000 ALTER TABLE `table_role` DISABLE KEYS */;
LOCK TABLES `table_role` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `table_role` ENABLE KEYS */;

--
-- Table structure for table `target`
--

DROP TABLE IF EXISTS `target`;
CREATE TABLE `target` (
  `target_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` text,
  `status` varchar(255) default NULL,
  `starttime` datetime default NULL,
  `endtime` datetime default NULL,
  PRIMARY KEY  (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `target`
--


/*!40000 ALTER TABLE `target` DISABLE KEYS */;
LOCK TABLES `target` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `target` ENABLE KEYS */;

--
-- Table structure for table `unsubscribe_list`
--

DROP TABLE IF EXISTS `unsubscribe_list`;
CREATE TABLE `unsubscribe_list` (
  `email` varchar(255) NOT NULL default '',
  `requestTime` datetime default NULL,
  PRIMARY KEY  (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unsubscribe_list`
--


/*!40000 ALTER TABLE `unsubscribe_list` DISABLE KEYS */;
LOCK TABLES `unsubscribe_list` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `unsubscribe_list` ENABLE KEYS */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `login_name` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `secret_question` varchar(50) default NULL,
  `answer` varchar(50) default NULL,
  `lang_id` int(11) default NULL,
  `crm_id` int(11) default NULL,
  `MAN_USER_ID` varchar(255) default NULL,
  `regis_time` datetime default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--


/*!40000 ALTER TABLE `user` DISABLE KEYS */;
LOCK TABLES `user` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

--
-- Table structure for table `user_admin`
--

DROP TABLE IF EXISTS `user_admin`;
CREATE TABLE `user_admin` (
  `user_id` int(11) NOT NULL auto_increment,
  `login_name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `status` int(1) default NULL,
  `secret_question` varchar(50) default NULL,
  `answer` varchar(50) default NULL,
  `lang_id` int(11) default NULL,
  `crm_id` int(11) default NULL,
  `create_time` varchar(14) default NULL,
  `creater` varchar(255) default NULL,
  `update_time` varchar(14) default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL default '0',
  `role_id` int(11) NOT NULL default '0',
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`user_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--


/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
LOCK TABLES `user_role` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;

--
-- Table structure for table `validation`
--

DROP TABLE IF EXISTS `validation`;
CREATE TABLE `validation` (
  `validation_id` int(11) NOT NULL auto_increment,
  `source_id` int(11) default NULL,
  `source_fk_id` int(11) default NULL,
  `start_datetime` datetime default NULL,
  `end_datetime` datetime default NULL,
  `status` varchar(30) default NULL,
  `currency_id` int(11) default NULL,
  `price` int(10) default NULL,
  `name` varchar(255) default NULL,
  `description` text,
  `period` int(2) default NULL,
  `time_unit` varchar(255) default NULL,
  `attribute` int(1) default NULL,
  PRIMARY KEY  (`validation_id`),
  KEY `source_id` (`source_id`),
  KEY `currency_id` (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `validation`
--


/*!40000 ALTER TABLE `validation` DISABLE KEYS */;
LOCK TABLES `validation` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `validation` ENABLE KEYS */;

--
-- Table structure for table `validation_caption`
--

DROP TABLE IF EXISTS `validation_caption`;
CREATE TABLE `validation_caption` (
  `validation_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `description` text,
  PRIMARY KEY  (`validation_id`,`lang_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `validation_caption`
--


/*!40000 ALTER TABLE `validation_caption` DISABLE KEYS */;
LOCK TABLES `validation_caption` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `validation_caption` ENABLE KEYS */;

--
-- Table structure for table `watch_ad_record`
--

DROP TABLE IF EXISTS `watch_ad_record`;
CREATE TABLE `watch_ad_record` (
  `watch_ad_record_id` int(20) NOT NULL auto_increment,
  `ad_id` int(11) default NULL,
  `starttime` char(14) default NULL,
  `endtime` char(14) default NULL,
  `during_time` int(20) default NULL,
  `account_id` int(11) default NULL,
  PRIMARY KEY  (`watch_ad_record_id`),
  KEY `ad_id` (`ad_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `watch_ad_record`
--


/*!40000 ALTER TABLE `watch_ad_record` DISABLE KEYS */;
LOCK TABLES `watch_ad_record` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `watch_ad_record` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

