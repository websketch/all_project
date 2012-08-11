-- MySQL dump 9.11
--
-- Host: localhost    Database: cpm4
-- ------------------------------------------------------
-- Server version	4.0.24_Debian-10-log

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `adm_uid` int(6) unsigned NOT NULL auto_increment,
  `adm_uname` varchar(20) default NULL,
  `passwd` varchar(50) default NULL,
  `adm_realname` varchar(30) default NULL,
  `right` int(4) default NULL,
  `provider_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`adm_uid`),
  KEY `NewIndex` (`adm_uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `content_item_id` int(11) NOT NULL default '0',
  `content_part_id` int(11) NOT NULL default '0',
  `content_channel_id` int(11) NOT NULL default '0',
  `man_channel_id` varchar(100) default NULL,
  `man_item_id` varchar(100) default NULL,
  `url` varchar(255) default NULL,
  `filesize` int(11) default NULL,
  PRIMARY KEY  (`content_item_id`,`content_part_id`,`content_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='common content fields';

--
-- Table structure for table `content_category`
--

DROP TABLE IF EXISTS `content_category`;
CREATE TABLE `content_category` (
  `content_category_id` int(11) NOT NULL auto_increment,
  `parent_category_id` int(11) default NULL,
  `description` varchar(100) default NULL,
  `image_name` varchar(100) default NULL,
  `order_id` int(11) default NULL,
  PRIMARY KEY  (`content_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each category group can contain many sub categories.';

--
-- Table structure for table `content_category_assoc`
--

DROP TABLE IF EXISTS `content_category_assoc`;
CREATE TABLE `content_category_assoc` (
  `content_item_id` int(11) NOT NULL default '0',
  `content_category_id` int(11) NOT NULL default '0',
  `order_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_item_id`,`content_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Association between content category and content item';

--
-- Table structure for table `content_category_locale`
--

DROP TABLE IF EXISTS `content_category_locale`;
CREATE TABLE `content_category_locale` (
  `content_category_id` int(11) NOT NULL default '0',
  `locale_id` int(11) NOT NULL default '0',
  `title` varchar(100) default NULL,
  `description` text,
  PRIMARY KEY  (`content_category_id`,`locale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='I18N for content_category';

--
-- Table structure for table `content_channel`
--

DROP TABLE IF EXISTS `content_channel`;
CREATE TABLE `content_channel` (
  `content_channel_id` int(11) NOT NULL auto_increment,
  `description` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`content_channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='channel of content like Streaming, download,  ..';

--
-- Table structure for table `content_item`
--

DROP TABLE IF EXISTS `content_item`;
CREATE TABLE `content_item` (
  `content_item_id` int(11) NOT NULL auto_increment,
  `content_type_id` int(11) NOT NULL default '0',
  `image_name` varchar(100) default NULL,
  `release_date` datetime default NULL,
  `provider_id` int(11) default NULL,
  `removed` char(1) default NULL,
  `from_date` datetime default NULL,
  `thru_date` datetime default NULL,
  `price` decimal(18,2) default NULL,
  `av_rating` decimal(18,6) default '0.000000',
  `created_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='content item';

--
-- Table structure for table `content_item_hits`
--

DROP TABLE IF EXISTS `content_item_hits`;
CREATE TABLE `content_item_hits` (
  `content_item_id` int(11) NOT NULL default '0',
  `hits` double(17,0) NOT NULL default '0',
  `parts` int(11) NOT NULL default '0',
  `avg_hits` double(17,4) NOT NULL default '0.0000',
  `is_adult` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `content_item_hits_weekly`
--

DROP TABLE IF EXISTS `content_item_hits_weekly`;
CREATE TABLE `content_item_hits_weekly` (
  `content_item_id` int(11) NOT NULL default '0',
  `hits` double(17,0) NOT NULL default '0',
  `parts` int(11) NOT NULL default '0',
  `avg_hits` double(17,4) NOT NULL default '0.0000',
  `is_adult` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `content_license_list`
--

DROP TABLE IF EXISTS `content_license_list`;
CREATE TABLE `content_license_list` (
  `crm_id` varchar(50) NOT NULL default '',
  `timestamp` varchar(25) NOT NULL default '',
  `user_id` varchar(30) NOT NULL default '',
  `ip_country` varchar(5) NOT NULL default '',
  `source_id` varchar(50) NOT NULL default '',
  `syndicator_id` varchar(50) NOT NULL default '',
  `device_type` varchar(50) NOT NULL default '',
  `device_id` varchar(50) NOT NULL default '',
  `content_account_id` varchar(50) NOT NULL default '',
  `man_channel_id` varchar(30) NOT NULL default '',
  `man_item_id` varchar(30) NOT NULL default '',
  `ip_address` varchar(15) NOT NULL default '',
  `handled_flag` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`timestamp`,`user_id`,`man_channel_id`,`man_item_id`,`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `content_part`
--

DROP TABLE IF EXISTS `content_part`;
CREATE TABLE `content_part` (
  `content_item_id` int(11) NOT NULL default '0',
  `content_part_id` int(11) NOT NULL default '0',
  `length` decimal(18,6) default NULL,
  PRIMARY KEY  (`content_item_id`,`content_part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='content parts: each content_item may contains more than one ';

--
-- Table structure for table `content_promo`
--

DROP TABLE IF EXISTS `content_promo`;
CREATE TABLE `content_promo` (
  `content_item_id` int(11) NOT NULL default '0',
  `content_category_id` int(11) NOT NULL default '0',
  `from_date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`content_item_id`,`content_category_id`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='promotional items';

--
-- Table structure for table `content_type`
--

DROP TABLE IF EXISTS `content_type`;
CREATE TABLE `content_type` (
  `content_type_id` int(11) NOT NULL auto_increment,
  `description` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`content_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='content type like video or music';

--
-- Table structure for table `email_list`
--

DROP TABLE IF EXISTS `email_list`;
CREATE TABLE `email_list` (
  `email` varchar(50) NOT NULL default '',
  `name` varchar(50) NOT NULL default '',
  `active` int(11) default NULL,
  PRIMARY KEY  (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `en_us_content_item_locale`
--

DROP TABLE IF EXISTS `en_us_content_item_locale`;
CREATE TABLE `en_us_content_item_locale` (
  `content_item_id` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `actor` varchar(100) default NULL,
  `director` varchar(100) default NULL,
  `origin` varchar(100) default NULL,
  `producer` varchar(100) default NULL,
  `highlight` varchar(255) default NULL,
  `description` text,
  PRIMARY KEY  (`content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='content description in English';

--
-- Table structure for table `en_us_content_part_locale`
--

DROP TABLE IF EXISTS `en_us_content_part_locale`;
CREATE TABLE `en_us_content_part_locale` (
  `content_item_id` int(11) NOT NULL default '0',
  `content_part_id` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`content_item_id`,`content_part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='en_US content parts description.';

--
-- Table structure for table `en_us_cust_comment`
--

DROP TABLE IF EXISTS `en_us_cust_comment`;
CREATE TABLE `en_us_cust_comment` (
  `cc_id` bigint(20) NOT NULL auto_increment,
  `content_item_id` int(11) NOT NULL default '0',
  `user_id` varchar(50) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `comments` text,
  `timestamp` timestamp(14) NOT NULL,
  PRIMARY KEY  (`cc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='en_US customer comments';

--
-- Table structure for table `locale`
--

DROP TABLE IF EXISTS `locale`;
CREATE TABLE `locale` (
  `locale_id` int(11) NOT NULL auto_increment,
  `locale_symbol` char(10) NOT NULL default '',
  `locale_desc` char(20) default NULL,
  PRIMARY KEY  (`locale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='locale list';

--
-- Table structure for table `news_attr`
--

DROP TABLE IF EXISTS `news_attr`;
CREATE TABLE `news_attr` (
  `news_id` int(11) unsigned NOT NULL default '0',
  `image_name` varchar(100) NOT NULL default '',
  `image_desc` varchar(255) default NULL,
  PRIMARY KEY  (`news_id`,`image_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `news_type`
--

DROP TABLE IF EXISTS `news_type`;
CREATE TABLE `news_type` (
  `news_type_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`news_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `provider_id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `address` varchar(150) default NULL,
  `phone` varchar(50) default NULL,
  `contact_name` varchar(50) default NULL,
  `contact_phone` varchar(50) default NULL,
  `contact_email` varchar(50) default NULL,
  `locale` varchar(10) NOT NULL default '',
  `show_time_flag` smallint(2) NOT NULL default '0',
  PRIMARY KEY  (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The provider of the content.';

--
-- Table structure for table `report_license_download_channel_2004`
--

DROP TABLE IF EXISTS `report_license_download_channel_2004`;
CREATE TABLE `report_license_download_channel_2004` (
  `content_item_id` int(10) unsigned NOT NULL default '0',
  `content_part_id` int(10) unsigned NOT NULL default '0',
  `month` tinyint(3) unsigned NOT NULL default '0',
  `day_1` smallint(5) unsigned NOT NULL default '0',
  `day_2` smallint(5) unsigned NOT NULL default '0',
  `day_3` smallint(5) unsigned NOT NULL default '0',
  `day_4` smallint(5) unsigned NOT NULL default '0',
  `day_5` smallint(5) unsigned NOT NULL default '0',
  `day_6` smallint(5) unsigned NOT NULL default '0',
  `day_7` smallint(5) unsigned NOT NULL default '0',
  `day_8` smallint(5) unsigned NOT NULL default '0',
  `day_9` smallint(5) unsigned NOT NULL default '0',
  `day_10` smallint(5) unsigned NOT NULL default '0',
  `day_11` smallint(5) unsigned NOT NULL default '0',
  `day_12` smallint(5) unsigned NOT NULL default '0',
  `day_13` smallint(5) unsigned NOT NULL default '0',
  `day_14` smallint(5) unsigned NOT NULL default '0',
  `day_15` smallint(5) unsigned NOT NULL default '0',
  `day_16` smallint(5) unsigned NOT NULL default '0',
  `day_17` smallint(5) unsigned NOT NULL default '0',
  `day_18` smallint(5) unsigned NOT NULL default '0',
  `day_19` smallint(5) unsigned NOT NULL default '0',
  `day_20` smallint(5) unsigned NOT NULL default '0',
  `day_21` smallint(5) unsigned NOT NULL default '0',
  `day_22` smallint(5) unsigned NOT NULL default '0',
  `day_23` smallint(5) unsigned NOT NULL default '0',
  `day_24` smallint(5) unsigned NOT NULL default '0',
  `day_25` smallint(5) unsigned NOT NULL default '0',
  `day_26` smallint(5) unsigned NOT NULL default '0',
  `day_27` smallint(5) unsigned NOT NULL default '0',
  `day_28` smallint(5) unsigned NOT NULL default '0',
  `day_29` smallint(5) unsigned NOT NULL default '0',
  `day_30` smallint(5) unsigned NOT NULL default '0',
  `day_31` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`content_item_id`,`content_part_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `report_license_download_channel_2005`
--

DROP TABLE IF EXISTS `report_license_download_channel_2005`;
CREATE TABLE `report_license_download_channel_2005` (
  `content_item_id` int(10) unsigned NOT NULL default '0',
  `content_part_id` int(10) unsigned NOT NULL default '0',
  `month` tinyint(3) unsigned NOT NULL default '0',
  `day_1` smallint(5) unsigned NOT NULL default '0',
  `day_2` smallint(5) unsigned NOT NULL default '0',
  `day_3` smallint(5) unsigned NOT NULL default '0',
  `day_4` smallint(5) unsigned NOT NULL default '0',
  `day_5` smallint(5) unsigned NOT NULL default '0',
  `day_6` smallint(5) unsigned NOT NULL default '0',
  `day_7` smallint(5) unsigned NOT NULL default '0',
  `day_8` smallint(5) unsigned NOT NULL default '0',
  `day_9` smallint(5) unsigned NOT NULL default '0',
  `day_10` smallint(5) unsigned NOT NULL default '0',
  `day_11` smallint(5) unsigned NOT NULL default '0',
  `day_12` smallint(5) unsigned NOT NULL default '0',
  `day_13` smallint(5) unsigned NOT NULL default '0',
  `day_14` smallint(5) unsigned NOT NULL default '0',
  `day_15` smallint(5) unsigned NOT NULL default '0',
  `day_16` smallint(5) unsigned NOT NULL default '0',
  `day_17` smallint(5) unsigned NOT NULL default '0',
  `day_18` smallint(5) unsigned NOT NULL default '0',
  `day_19` smallint(5) unsigned NOT NULL default '0',
  `day_20` smallint(5) unsigned NOT NULL default '0',
  `day_21` smallint(5) unsigned NOT NULL default '0',
  `day_22` smallint(5) unsigned NOT NULL default '0',
  `day_23` smallint(5) unsigned NOT NULL default '0',
  `day_24` smallint(5) unsigned NOT NULL default '0',
  `day_25` smallint(5) unsigned NOT NULL default '0',
  `day_26` smallint(5) unsigned NOT NULL default '0',
  `day_27` smallint(5) unsigned NOT NULL default '0',
  `day_28` smallint(5) unsigned NOT NULL default '0',
  `day_29` smallint(5) unsigned NOT NULL default '0',
  `day_30` smallint(5) unsigned NOT NULL default '0',
  `day_31` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`content_item_id`,`content_part_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `report_license_liveevent1_2005`
--

DROP TABLE IF EXISTS `report_license_liveevent1_2005`;
CREATE TABLE `report_license_liveevent1_2005` (
  `content_item_id` int(10) unsigned NOT NULL default '0',
  `content_part_id` int(10) unsigned NOT NULL default '0',
  `month` tinyint(3) unsigned NOT NULL default '0',
  `day_1` smallint(5) unsigned NOT NULL default '0',
  `day_2` smallint(5) unsigned NOT NULL default '0',
  `day_3` smallint(5) unsigned NOT NULL default '0',
  `day_4` smallint(5) unsigned NOT NULL default '0',
  `day_5` smallint(5) unsigned NOT NULL default '0',
  `day_6` smallint(5) unsigned NOT NULL default '0',
  `day_7` smallint(5) unsigned NOT NULL default '0',
  `day_8` smallint(5) unsigned NOT NULL default '0',
  `day_9` smallint(5) unsigned NOT NULL default '0',
  `day_10` smallint(5) unsigned NOT NULL default '0',
  `day_11` smallint(5) unsigned NOT NULL default '0',
  `day_12` smallint(5) unsigned NOT NULL default '0',
  `day_13` smallint(5) unsigned NOT NULL default '0',
  `day_14` smallint(5) unsigned NOT NULL default '0',
  `day_15` smallint(5) unsigned NOT NULL default '0',
  `day_16` smallint(5) unsigned NOT NULL default '0',
  `day_17` smallint(5) unsigned NOT NULL default '0',
  `day_18` smallint(5) unsigned NOT NULL default '0',
  `day_19` smallint(5) unsigned NOT NULL default '0',
  `day_20` smallint(5) unsigned NOT NULL default '0',
  `day_21` smallint(5) unsigned NOT NULL default '0',
  `day_22` smallint(5) unsigned NOT NULL default '0',
  `day_23` smallint(5) unsigned NOT NULL default '0',
  `day_24` smallint(5) unsigned NOT NULL default '0',
  `day_25` smallint(5) unsigned NOT NULL default '0',
  `day_26` smallint(5) unsigned NOT NULL default '0',
  `day_27` smallint(5) unsigned NOT NULL default '0',
  `day_28` smallint(5) unsigned NOT NULL default '0',
  `day_29` smallint(5) unsigned NOT NULL default '0',
  `day_30` smallint(5) unsigned NOT NULL default '0',
  `day_31` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`content_item_id`,`content_part_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `report_license_streaming_medium_2004`
--

DROP TABLE IF EXISTS `report_license_streaming_medium_2004`;
CREATE TABLE `report_license_streaming_medium_2004` (
  `content_item_id` int(10) unsigned NOT NULL default '0',
  `content_part_id` int(10) unsigned NOT NULL default '0',
  `month` tinyint(3) unsigned NOT NULL default '0',
  `day_1` smallint(5) unsigned NOT NULL default '0',
  `day_2` smallint(5) unsigned NOT NULL default '0',
  `day_3` smallint(5) unsigned NOT NULL default '0',
  `day_4` smallint(5) unsigned NOT NULL default '0',
  `day_5` smallint(5) unsigned NOT NULL default '0',
  `day_6` smallint(5) unsigned NOT NULL default '0',
  `day_7` smallint(5) unsigned NOT NULL default '0',
  `day_8` smallint(5) unsigned NOT NULL default '0',
  `day_9` smallint(5) unsigned NOT NULL default '0',
  `day_10` smallint(5) unsigned NOT NULL default '0',
  `day_11` smallint(5) unsigned NOT NULL default '0',
  `day_12` smallint(5) unsigned NOT NULL default '0',
  `day_13` smallint(5) unsigned NOT NULL default '0',
  `day_14` smallint(5) unsigned NOT NULL default '0',
  `day_15` smallint(5) unsigned NOT NULL default '0',
  `day_16` smallint(5) unsigned NOT NULL default '0',
  `day_17` smallint(5) unsigned NOT NULL default '0',
  `day_18` smallint(5) unsigned NOT NULL default '0',
  `day_19` smallint(5) unsigned NOT NULL default '0',
  `day_20` smallint(5) unsigned NOT NULL default '0',
  `day_21` smallint(5) unsigned NOT NULL default '0',
  `day_22` smallint(5) unsigned NOT NULL default '0',
  `day_23` smallint(5) unsigned NOT NULL default '0',
  `day_24` smallint(5) unsigned NOT NULL default '0',
  `day_25` smallint(5) unsigned NOT NULL default '0',
  `day_26` smallint(5) unsigned NOT NULL default '0',
  `day_27` smallint(5) unsigned NOT NULL default '0',
  `day_28` smallint(5) unsigned NOT NULL default '0',
  `day_29` smallint(5) unsigned NOT NULL default '0',
  `day_30` smallint(5) unsigned NOT NULL default '0',
  `day_31` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`content_item_id`,`content_part_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `report_license_streaming_medium_2005`
--

DROP TABLE IF EXISTS `report_license_streaming_medium_2005`;
CREATE TABLE `report_license_streaming_medium_2005` (
  `content_item_id` int(10) unsigned NOT NULL default '0',
  `content_part_id` int(10) unsigned NOT NULL default '0',
  `month` tinyint(3) unsigned NOT NULL default '0',
  `day_1` smallint(5) unsigned NOT NULL default '0',
  `day_2` smallint(5) unsigned NOT NULL default '0',
  `day_3` smallint(5) unsigned NOT NULL default '0',
  `day_4` smallint(5) unsigned NOT NULL default '0',
  `day_5` smallint(5) unsigned NOT NULL default '0',
  `day_6` smallint(5) unsigned NOT NULL default '0',
  `day_7` smallint(5) unsigned NOT NULL default '0',
  `day_8` smallint(5) unsigned NOT NULL default '0',
  `day_9` smallint(5) unsigned NOT NULL default '0',
  `day_10` smallint(5) unsigned NOT NULL default '0',
  `day_11` smallint(5) unsigned NOT NULL default '0',
  `day_12` smallint(5) unsigned NOT NULL default '0',
  `day_13` smallint(5) unsigned NOT NULL default '0',
  `day_14` smallint(5) unsigned NOT NULL default '0',
  `day_15` smallint(5) unsigned NOT NULL default '0',
  `day_16` smallint(5) unsigned NOT NULL default '0',
  `day_17` smallint(5) unsigned NOT NULL default '0',
  `day_18` smallint(5) unsigned NOT NULL default '0',
  `day_19` smallint(5) unsigned NOT NULL default '0',
  `day_20` smallint(5) unsigned NOT NULL default '0',
  `day_21` smallint(5) unsigned NOT NULL default '0',
  `day_22` smallint(5) unsigned NOT NULL default '0',
  `day_23` smallint(5) unsigned NOT NULL default '0',
  `day_24` smallint(5) unsigned NOT NULL default '0',
  `day_25` smallint(5) unsigned NOT NULL default '0',
  `day_26` smallint(5) unsigned NOT NULL default '0',
  `day_27` smallint(5) unsigned NOT NULL default '0',
  `day_28` smallint(5) unsigned NOT NULL default '0',
  `day_29` smallint(5) unsigned NOT NULL default '0',
  `day_30` smallint(5) unsigned NOT NULL default '0',
  `day_31` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`content_item_id`,`content_part_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `send_mail`
--

DROP TABLE IF EXISTS `send_mail`;
CREATE TABLE `send_mail` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `from_name` varchar(30) NOT NULL default '',
  `from_email` varchar(50) NOT NULL default '',
  `subject` varchar(255) NOT NULL default '',
  `language` varchar(10) NOT NULL default '',
  `format` varchar(10) NOT NULL default '',
  `schedule` bigint(12) unsigned NOT NULL default '0',
  `send_filename` varchar(150) NOT NULL default '',
  `email_list_source` varchar(100) NOT NULL default '',
  `email_table_name` varchar(100) NOT NULL default '',
  `smtp_server` varchar(100) NOT NULL default '',
  `smtp_username` varchar(30) NOT NULL default '',
  `smtp_userpassword` varchar(30) NOT NULL default '',
  `send_end_time` bigint(12) unsigned NOT NULL default '0',
  `send_state` smallint(1) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `send_mail_info`
--

DROP TABLE IF EXISTS `send_mail_info`;
CREATE TABLE `send_mail_info` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `send_end_time` bigint(12) unsigned NOT NULL default '0',
  `send_state` smallint(1) unsigned NOT NULL default '0',
  `parent_id` bigint(20) unsigned NOT NULL default '0',
  `user_name` varchar(50) NOT NULL default '',
  `user_email` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_game_schedule`
--

DROP TABLE IF EXISTS `sport_game_schedule`;
CREATE TABLE `sport_game_schedule` (
  `sport_game_schedule_id` int(11) unsigned NOT NULL auto_increment,
  `even_url` varchar(255) default NULL,
  `playstate` int(10) unsigned default '0',
  `image` varchar(255) default NULL,
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  `even_type` int(3) default NULL,
  PRIMARY KEY  (`sport_game_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_game_schedule_locale`
--

DROP TABLE IF EXISTS `sport_game_schedule_locale`;
CREATE TABLE `sport_game_schedule_locale` (
  `sport_game_schedule_id` int(11) NOT NULL default '0',
  `locale_id` int(11) unsigned NOT NULL default '0',
  `fixture` varchar(255) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `play_time` varchar(255) default NULL,
  `description` text,
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_game_schedule_id`,`locale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_item`
--

DROP TABLE IF EXISTS `sport_item`;
CREATE TABLE `sport_item` (
  `sport_item_id` int(11) unsigned NOT NULL auto_increment,
  `sport_item_name` varchar(255) NOT NULL default '',
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_item_locale`
--

DROP TABLE IF EXISTS `sport_item_locale`;
CREATE TABLE `sport_item_locale` (
  `sport_item_id` int(11) unsigned NOT NULL default '0',
  `locale_id` int(11) unsigned NOT NULL default '0',
  `sport_item_name` varchar(255) NOT NULL default '',
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_item_id`,`locale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_match`
--

DROP TABLE IF EXISTS `sport_match`;
CREATE TABLE `sport_match` (
  `sport_match_id` int(11) unsigned NOT NULL auto_increment,
  `sport_season_id` int(11) unsigned NOT NULL default '0',
  `content_item_id` int(10) unsigned default NULL,
  `sport_item_id` int(10) unsigned NOT NULL default '0',
  `image_name` varchar(255) default NULL,
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_match_locale`
--

DROP TABLE IF EXISTS `sport_match_locale`;
CREATE TABLE `sport_match_locale` (
  `sport_match_id` int(11) unsigned NOT NULL default '0',
  `locale_id` int(11) unsigned NOT NULL default '0',
  `title` varchar(255) default NULL,
  `venue` varchar(255) default NULL,
  `fixture` varchar(255) default NULL,
  `highlight` varchar(255) default NULL,
  `description` text,
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_match_id`,`locale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_match_team`
--

DROP TABLE IF EXISTS `sport_match_team`;
CREATE TABLE `sport_match_team` (
  `sport_match_id` int(11) unsigned NOT NULL default '0',
  `sport_team_id` int(11) unsigned NOT NULL default '0',
  `is_team_play` int(3) NOT NULL default '0',
  `is_main_field` int(3) NOT NULL default '0',
  `point` int(11) NOT NULL default '0',
  `score` int(11) NOT NULL default '0',
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_match_id`,`sport_team_id`,`is_team_play`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_player`
--

DROP TABLE IF EXISTS `sport_player`;
CREATE TABLE `sport_player` (
  `sport_player_id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `born` varchar(255) default NULL,
  `height` int(11) unsigned default NULL,
  `weight` int(11) unsigned default NULL,
  `num` int(11) unsigned default NULL,
  `certificate` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_player_locale`
--

DROP TABLE IF EXISTS `sport_player_locale`;
CREATE TABLE `sport_player_locale` (
  `sport_player_id` int(11) unsigned NOT NULL default '0',
  `locale_id` int(11) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `country` varchar(255) default NULL,
  `position` varchar(255) default NULL,
  `description` text,
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_player_id`,`locale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_player_team_item`
--

DROP TABLE IF EXISTS `sport_player_team_item`;
CREATE TABLE `sport_player_team_item` (
  `sport_player_id` int(11) unsigned NOT NULL default '0',
  `sport_team_id` int(11) unsigned NOT NULL default '0',
  `sport_item_id` int(11) unsigned NOT NULL default '0',
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_player_id`,`sport_item_id`,`sport_team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_season`
--

DROP TABLE IF EXISTS `sport_season`;
CREATE TABLE `sport_season` (
  `sport_season_id` int(11) unsigned NOT NULL auto_increment,
  `sport_item_id` int(11) unsigned NOT NULL default '0',
  `parent_id` int(11) unsigned NOT NULL default '0',
  `sport_season_name` varchar(255) NOT NULL default '',
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_season_locale`
--

DROP TABLE IF EXISTS `sport_season_locale`;
CREATE TABLE `sport_season_locale` (
  `sport_season_id` int(11) unsigned NOT NULL default '0',
  `locale_id` int(11) unsigned NOT NULL default '0',
  `sport_season_name` varchar(255) NOT NULL default '',
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_season_id`,`locale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_team`
--

DROP TABLE IF EXISTS `sport_team`;
CREATE TABLE `sport_team` (
  `sport_team_id` int(11) unsigned NOT NULL auto_increment,
  `sport_item_id` int(11) unsigned NOT NULL default '0',
  `sport_team_name` varchar(255) NOT NULL default '',
  `sport_team_logo` varchar(255) default NULL,
  `team_member_photo` varchar(255) default NULL,
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `sport_team_locale`
--

DROP TABLE IF EXISTS `sport_team_locale`;
CREATE TABLE `sport_team_locale` (
  `sport_team_id` int(11) unsigned NOT NULL default '0',
  `locale_id` int(10) unsigned NOT NULL default '0',
  `sport_team_name` varchar(255) NOT NULL default '',
  `brief_introduction` text,
  `description` text,
  `created_time` timestamp(14) NOT NULL,
  `updated_time` timestamp(14) NOT NULL default '00000000000000',
  PRIMARY KEY  (`sport_team_id`,`locale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `th_th_content_item_locale`
--

DROP TABLE IF EXISTS `th_th_content_item_locale`;
CREATE TABLE `th_th_content_item_locale` (
  `content_item_id` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `actor` varchar(100) default NULL,
  `director` varchar(100) default NULL,
  `origin` varchar(100) default NULL,
  `producer` varchar(100) default NULL,
  `highlight` varchar(255) default NULL,
  `description` text,
  PRIMARY KEY  (`content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='content description in English';

--
-- Table structure for table `th_th_content_part_locale`
--

DROP TABLE IF EXISTS `th_th_content_part_locale`;
CREATE TABLE `th_th_content_part_locale` (
  `content_item_id` int(11) NOT NULL default '0',
  `content_part_id` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`content_item_id`,`content_part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='en_US content parts description.';

--
-- Table structure for table `th_th_cust_comment`
--

DROP TABLE IF EXISTS `th_th_cust_comment`;
CREATE TABLE `th_th_cust_comment` (
  `cc_id` bigint(20) NOT NULL auto_increment,
  `content_item_id` int(11) NOT NULL default '0',
  `user_id` varchar(50) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `comments` text,
  `timestamp` timestamp(14) NOT NULL,
  PRIMARY KEY  (`cc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='thailand customer comments';

--
-- Table structure for table `top_banner`
--

DROP TABLE IF EXISTS `top_banner`;
CREATE TABLE `top_banner` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `content_category_id` int(11) default NULL,
  `image_url` varchar(255) default NULL,
  `link_url` varchar(255) default NULL,
  `order_id` int(11) unsigned default NULL,
  `banner_type` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(50) NOT NULL default '',
  `name` varchar(40) NOT NULL default '',
  `email` varchar(64) default NULL,
  `points` int(11) default NULL,
  `zip` varchar(20) default NULL,
  `notify_news` int(1) default NULL,
  `email_lang` varchar(10) default NULL,
  `notify_new_release` int(1) default NULL,
  `data1` varchar(100) default NULL,
  `data2` varchar(100) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users';

--
-- Table structure for table `user_activity`
--

DROP TABLE IF EXISTS `user_activity`;
CREATE TABLE `user_activity` (
  `user_id` varchar(50) NOT NULL default '',
  `vendor_id` varchar(50) NOT NULL default '',
  `subcat_id` int(11) default NULL,
  `content_item_id` int(10) default NULL,
  `lang` varchar(10) NOT NULL default '',
  `timestamp` timestamp(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `user_activity_stat`
--

DROP TABLE IF EXISTS `user_activity_stat`;
CREATE TABLE `user_activity_stat` (
  `stat_id` int(14) unsigned NOT NULL auto_increment,
  `vendor_id` varchar(50) default '0',
  `statdate` varchar(50) default NULL,
  `statistic` int(14) unsigned default NULL,
  PRIMARY KEY  (`stat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `user_rating`
--

DROP TABLE IF EXISTS `user_rating`;
CREATE TABLE `user_rating` (
  `rate_id` bigint(20) NOT NULL auto_increment,
  `user_id` varchar(50) NOT NULL default '',
  `content_item_id` int(11) NOT NULL default '0',
  `rating` smallint(6) NOT NULL default '0',
  `timestamp` timestamp(14) NOT NULL,
  PRIMARY KEY  (`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user rating';

--
-- Table structure for table `zh_cn_content_item_locale`
--

DROP TABLE IF EXISTS `zh_cn_content_item_locale`;
CREATE TABLE `zh_cn_content_item_locale` (
  `content_item_id` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `actor` varchar(100) default NULL,
  `director` varchar(100) default NULL,
  `origin` varchar(100) default NULL,
  `producer` varchar(100) default NULL,
  `highlight` varchar(255) default NULL,
  `description` text,
  PRIMARY KEY  (`content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='I18N, zh_CN locale description for content item';

--
-- Table structure for table `zh_cn_content_part_locale`
--

DROP TABLE IF EXISTS `zh_cn_content_part_locale`;
CREATE TABLE `zh_cn_content_part_locale` (
  `content_item_id` int(11) NOT NULL default '0',
  `content_part_id` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`content_item_id`,`content_part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='I18N, zh_CN locale description for content part';

--
-- Table structure for table `zh_cn_cust_comment`
--

DROP TABLE IF EXISTS `zh_cn_cust_comment`;
CREATE TABLE `zh_cn_cust_comment` (
  `cc_id` bigint(20) NOT NULL auto_increment,
  `content_item_id` int(11) NOT NULL default '0',
  `user_id` varchar(50) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `comments` text,
  `timestamp` timestamp(14) NOT NULL,
  PRIMARY KEY  (`cc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='zh_cn customer comments';

--
-- Table structure for table `zh_cn_match`
--

DROP TABLE IF EXISTS `zh_cn_match`;
CREATE TABLE `zh_cn_match` (
  `match_id` int(10) unsigned NOT NULL auto_increment,
  `content_item_id` int(10) unsigned default '0',
  `title` varchar(255) NOT NULL default '',
  `team_1` varchar(20) default '0',
  `team_2` varchar(20) default '0',
  `match_date` varchar(50) NOT NULL default '',
  `match_time` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='I18N, zh_CN locale description for match. For WTTC now';

--
-- Table structure for table `zh_cn_news_locale`
--

DROP TABLE IF EXISTS `zh_cn_news_locale`;
CREATE TABLE `zh_cn_news_locale` (
  `news_id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `news_type_id` int(11) unsigned NOT NULL default '0',
  `created_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `party_id` int(11) NOT NULL default '0',
  `content` text NOT NULL,
  `origin` varchar(100) default NULL,
  `author` varchar(100) default NULL,
  `keyword` varchar(255) NOT NULL default '',
  `modified_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `release` int(11) default NULL,
  PRIMARY KEY  (`news_id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `title_2` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `zh_cn_player`
--

DROP TABLE IF EXISTS `zh_cn_player`;
CREATE TABLE `zh_cn_player` (
  `player_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `type` tinyint(3) unsigned NOT NULL default '0',
  `country` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='I18N, zh_CN locale for player';

--
-- Table structure for table `zh_tw_content_item_locale`
--

DROP TABLE IF EXISTS `zh_tw_content_item_locale`;
CREATE TABLE `zh_tw_content_item_locale` (
  `content_item_id` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `actor` varchar(100) default NULL,
  `director` varchar(100) default NULL,
  `origin` varchar(100) default NULL,
  `producer` varchar(100) default NULL,
  `highlight` varchar(255) default NULL,
  `description` text,
  PRIMARY KEY  (`content_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='I18N, zh_CN locale description for content item';

--
-- Table structure for table `zh_tw_content_part_locale`
--

DROP TABLE IF EXISTS `zh_tw_content_part_locale`;
CREATE TABLE `zh_tw_content_part_locale` (
  `content_item_id` int(11) NOT NULL default '0',
  `content_part_id` int(11) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`content_item_id`,`content_part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='I18N, zh_CN locale description for content part';

--
-- Table structure for table `zh_tw_cust_comment`
--

DROP TABLE IF EXISTS `zh_tw_cust_comment`;
CREATE TABLE `zh_tw_cust_comment` (
  `cc_id` bigint(20) NOT NULL auto_increment,
  `content_item_id` int(11) NOT NULL default '0',
  `user_id` varchar(50) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `comments` text,
  `timestamp` timestamp(14) NOT NULL,
  PRIMARY KEY  (`cc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='zh_tw customer comments';

--
-- Table structure for table `zh_tw_match`
--

DROP TABLE IF EXISTS `zh_tw_match`;
CREATE TABLE `zh_tw_match` (
  `match_id` int(10) unsigned NOT NULL auto_increment,
  `content_item_id` int(10) unsigned default '0',
  `title` varchar(255) NOT NULL default '',
  `team_1` varchar(20) default '0',
  `team_2` varchar(20) default '0',
  `match_date` varchar(50) NOT NULL default '',
  `match_time` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='I18N, zh_CN locale description for match. For WTTC now';

--
-- Table structure for table `zh_tw_news_locale`
--

DROP TABLE IF EXISTS `zh_tw_news_locale`;
CREATE TABLE `zh_tw_news_locale` (
  `news_id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `news_type_id` int(11) unsigned NOT NULL default '0',
  `created_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `party_id` int(11) NOT NULL default '0',
  `content` text NOT NULL,
  `origin` varchar(100) default NULL,
  `author` varchar(100) default NULL,
  `keyword` varchar(255) NOT NULL default '',
  `modified_date` datetime NOT NULL default '0000-00-00 00:00:00',
  `release` int(11) default NULL,
  PRIMARY KEY  (`news_id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `zh_tw_player`
--

DROP TABLE IF EXISTS `zh_tw_player`;
CREATE TABLE `zh_tw_player` (
  `player_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `type` tinyint(3) unsigned NOT NULL default '0',
  `country` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='I18N, zh_CN locale for player';

