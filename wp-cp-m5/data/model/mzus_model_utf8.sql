-- MySQL dump 10.10
--
-- Host: 192.168.192.3    Database: upgrade_mzus
-- ------------------------------------------------------
-- Server version	4.1.8-standard-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor` (
  `actor_id` int(11) NOT NULL auto_increment,
  `country_id` int(11) default NULL,
  `name` varchar(255) NOT NULL default '',
  `gender` char(1) default NULL,
  `birth` date default NULL,
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
  PRIMARY KEY  (`actor_id`,`lang_id`)
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
  PRIMARY KEY  (`media_actor_id`,`scoretype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`article_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `attribute_id` int(11) NOT NULL auto_increment,
  `category_id` int(11) default NULL,
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `attribute_caption`
--

DROP TABLE IF EXISTS `attribute_caption`;
CREATE TABLE `attribute_caption` (
  `attribute_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`attribute_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
CREATE TABLE `block` (
  `block_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `block_element`
--

DROP TABLE IF EXISTS `block_element`;
CREATE TABLE `block_element` (
  `block_id` int(11) NOT NULL default '0',
  `source_id` int(11) NOT NULL default '0',
  `sort` varchar(4) default NULL,
  `source_pk_id` int(11) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`block_id`,`source_id`,`source_pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `crm_id` int(11) default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`category_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`category_id`,`parent_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `click_tracking`
--

DROP TABLE IF EXISTS `click_tracking`;
CREATE TABLE `click_tracking` (
  `id` mediumint(9) NOT NULL default '0',
  `affiliate_id` varchar(50) default NULL,
  `timestamp` timestamp NOT NULL default '0000-00-00 00:00:00',
  `ipAddress` varchar(50) default NULL,
  `redirecturl` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `currency_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  PRIMARY KEY  (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
CREATE TABLE `field` (
  `field_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`field_category_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `field_category`
--

DROP TABLE IF EXISTS `field_category`;
CREATE TABLE `field_category` (
  `field_id` int(11) default NULL,
  `category_id` int(11) default NULL,
  `field_category_id` int(11) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `sort` tinyint(1) default NULL,
  `search` tinyint(1) default NULL,
  `detail` tinyint(1) default NULL,
  PRIMARY KEY  (`field_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`flag_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL auto_increment,
  `media_id` int(11) NOT NULL default '0',
  `MAN_ITEM_ID` varchar(255) default NULL,
  `distribute_id` int(11) default NULL,
  `policy_id` int(11) default NULL,
  `url` varchar(255) default NULL,
  `size` int(11) default '0',
  `close_time` datetime default NULL,
  `release` char(1) default NULL,
  `release_time` datetime default NULL,
  PRIMARY KEY  (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`mail_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`email`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `media_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `homepage` varchar(255) default NULL,
  `level` varchar(255) default NULL,
  `premiere` date default NULL,
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
  `provider_id` int(11) default NULL,
  `crm_id` int(11) default NULL,
  PRIMARY KEY  (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`media_actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `media_attribute`
--

DROP TABLE IF EXISTS `media_attribute`;
CREATE TABLE `media_attribute` (
  `media_id` int(11) NOT NULL default '0',
  `attribute_id` int(11) NOT NULL default '0',
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`media_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `metadata` longtext,
  `preview` varchar(255) default NULL,
  `highlight` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`media_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`media_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `media_flag`
--

DROP TABLE IF EXISTS `media_flag`;
CREATE TABLE `media_flag` (
  `media_id` int(11) NOT NULL default '0',
  `flag_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`media_id`,`flag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`media_id`,`parent_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL auto_increment,
  `category_id` int(11) default NULL,
  `media_id` int(11) default NULL,
  `actor_id` int(11) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  `body` longtext,
  `image` varchar(255) default NULL,
  PRIMARY KEY  (`news_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`lang_id`,`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `popular_list`
--

DROP TABLE IF EXISTS `popular_list`;
CREATE TABLE `popular_list` (
  `popular_list_id` int(11) NOT NULL default '0',
  `url` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `orderID` int(11) NOT NULL default '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `position_caption`
--

DROP TABLE IF EXISTS `position_caption`;
CREATE TABLE `position_caption` (
  `position_id` int(11) NOT NULL default '0',
  `lang_id` int(11) NOT NULL default '0',
  `caption` varchar(255) default NULL,
  `description` longtext,
  `updater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`position_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`preview_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`preview_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `provider_id` int(11) NOT NULL auto_increment,
  `is_partner` char(1) default NULL,
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
  PRIMARY KEY  (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`provider_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL auto_increment,
  `content` longtext,
  `user_id` varchar(255) default NULL,
  `rating` char(1) default NULL,
  `media_id` int(11) default NULL,
  `category_id` int(11) default NULL,
  `review_time` datetime default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`role_id`,`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`role_id`,`parent_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY  (`scoretype_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
CREATE TABLE `search` (
  `field_id` int(11) NOT NULL default '0',
  `category_id` int(11) NOT NULL default '0',
  `type` int(11) NOT NULL default '0',
  PRIMARY KEY  (`field_id`,`category_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `login_name` varchar(255) default NULL,
  `password` varchar(20) default NULL,
  `status` int(1) default NULL,
  `secret_question` varchar(50) default NULL,
  `answer` varchar(50) default NULL,
  `lang_id` int(11) default NULL,
  `crm_id` int(11) default NULL,
  `MAN_USER_ID` varchar(255) default NULL,
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
  PRIMARY KEY  (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

