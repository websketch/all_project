-- Modify mzus table model.
alter table portal_cp_m5.review add column lang_id int(11) after review_id;
alter table portal_cp_m5.news add news_type_id int(11) after actor_id;
alter table portal_cp_m5.news add `release` int(11) after actor_id;
alter table portal_cp_m5.news_caption add origin varchar(255) after style;
alter table portal_cp_m5.news_caption add author varchar(255) after style;
alter table portal_cp_m5.news_caption add keyword varchar(255) after style;
create table portal_cp_m5.send_mail (select * from send_mail where 1=2);
create table portal_cp_m5.send_mail_info (select * from send_mail_info where 1=2);
alter table portal_cp_m5.send_mail change id id bigint(20) unsigned auto_increment primary key;
alter table portal_cp_m5.send_mail add column content longtext;
alter table portal_cp_m5.mail_list add column name varchar(255) after email;
create table portal_cp_m5.content_license_list (select * from content_license_list where 1=2);
create table portal_cp_m5.content_item_hits (select * from content_item_hits where 1=2);
create table portal_cp_m5.content_item_hits_weekly (select * from content_item_hits_weekly where 1=2);
create table portal_cp_m5.news_type (select * from news_type where 1=2);
alter table portal_cp_m5.news_type change news_type_id news_type_id int(11) not null auto_increment primary key;
create table portal_cp_m5.table_role (
    source_id int(11),
    source_fk_id int(11),
    role_id int(11),
    primary key (source_id,source_fk_id,role_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table portal_cp_m5.report_license_download_channel_2004 (select * from report_license_download_channel_2004 where 1=2);
create table portal_cp_m5.report_license_download_channel_2005 (select * from report_license_download_channel_2005 where 1=2);
create table portal_cp_m5.report_license_liveevent1_2005 (select * from report_license_liveevent1_2005 where 1=2);
create table portal_cp_m5.report_license_streaming_medium_2004 (select * from report_license_streaming_medium_2004 where 1=2);
create table portal_cp_m5.report_license_streaming_medium_2005 (select * from report_license_streaming_medium_2005 where 1=2);
alter table portal_cp_m5.`user` add column name varchar(255) after login_name;
alter table portal_cp_m5.`user` add column notify_news char(1) after status;
alter table portal_cp_m5.provider add column role_id int(11) default null;
CREATE TABLE portal_cp_m5.`user_admin` (
  `user_id` int(11) NOT NULL auto_increment,
  `login_name` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `status` int(1) default NULL,
  `secret_question` varchar(50) default NULL,
  `answer` varchar(50) default NULL,
  `lang_id` int(11) default NULL,
  `crm_id` int(11) default NULL,
  `create_time` datetime default NULL,
  `creater` varchar(255) default NULL,
  `update_time` datetime default NULL,
  `updater` varchar(255) default NULL,
  PRIMARY KEY  (`user_id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table portal_cp_m5.user_activity (select * from user_activity where 1=2);
create table portal_cp_m5.user_activity_stat (select * from user_activity_stat where 1=2);
alter table portal_cp_m5.content_item_hits DEFAULT CHARSET utf8;
alter table portal_cp_m5.content_item_hits_weekly DEFAULT CHARSET utf8;
alter table portal_cp_m5.content_license_list DEFAULT CHARSET utf8;
alter table portal_cp_m5.news_type DEFAULT CHARSET utf8;
alter table portal_cp_m5.report_license_download_channel_2004 DEFAULT CHARSET utf8;
alter table portal_cp_m5.report_license_download_channel_2005 DEFAULT CHARSET utf8;
alter table portal_cp_m5.report_license_liveevent1_2005 DEFAULT CHARSET utf8;
alter table portal_cp_m5.report_license_streaming_medium_2004 DEFAULT CHARSET utf8;
alter table portal_cp_m5.report_license_streaming_medium_2005 DEFAULT CHARSET utf8;
alter table portal_cp_m5.send_mail DEFAULT CHARSET utf8;
alter table portal_cp_m5.send_mail_info DEFAULT CHARSET utf8;
alter table portal_cp_m5.user_activity DEFAULT CHARSET utf8;
alter table portal_cp_m5.user_activity_stat DEFAULT CHARSET utf8;
