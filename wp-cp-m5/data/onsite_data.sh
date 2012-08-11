#!/bin/bash

function update_user_data_func()
{
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4 user user_activity user_activity_stat  \
              >tmp.dmp
    sed 's/ENGINE=MyISAM DEFAULT CHARSET=latin1/ENGINE=InnoDB DEFAULT CHARSET=utf8/g' tmp.dmp >tmp1.dmp
    mysql -u$5 -p$6 -h$7 --execute="  \
          drop database if exists tmp_portal_cp_m4; \
          create database tmp_portal_cp_m4; \
          use tmp_portal_cp_m4;set names gbk;source tmp1.dmp; \
	  drop table if exists $8.user; \
	  create table $8.user ( \
	    user_id int(11) NOT NULL auto_increment, \
 	    login_name varchar(255) default NULL, \
 	    name varchar(255) default NULL, \
 	    password varchar(20) default NULL, \
 	    status int(1) default NULL, \
 	    notify_news char(1) default NULL, \
 	    secret_question varchar(50) default NULL, \
 	    answer varchar(50) default NULL, \
 	    lang_id int(11) default NULL, \
 	    crm_id int(11) default NULL, \
 	    MAN_USER_ID varchar(255) default NULL, \
 	    PRIMARY KEY  (user_id) \
	   ) ENGINE=InnoDB DEFAULT CHARSET=utf8; \
          delete from $8.user_activity; \
          delete from $8.user_activity_stat; \
	  replace into $8.user (user_id,login_name,name,lang_id,notify_news,MAN_USER_ID) \
  	         (select '',email,name,email_lang,notify_news,user_id from user); \
          replace into $8.user_activity (select * from user_activity); \
          replace into $8.user_activity_stat (select * from user_activity_stat); \
          drop database tmp_portal_cp_m4;"
    rm -f tmp.dmp
    rm -f tmp1.dmp
}

function update_hits_data_func()
{
    mysqldump -u$1 -p$2 -h$3 --no-create-info $4 \
              content_item_hits content_item_hits_weekly content_license_list \
              >tmp.dmp
   mysql -u$5 -p$6 -h$7 $8 --execute=" \
          delete from content_item_hits; \
          delete from content_item_hits_weekly; \
          delete from content_license_list; \
          source tmp.dmp;"
    rm -f tmp.dmp
}

function update_news_data_func()
{
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4 --default-character-set=latin1 news_attr news_type zh_cn_news_locale provider >tmp_zh_cn.dmp
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4 --default-character-set=latin1 zh_tw_news_locale >tmp_zh_tw.dmp
    sed 's/ENGINE=MyISAM DEFAULT CHARSET=latin1/ENGINE=InnoDB DEFAULT CHARSET=utf8/g' tmp_zh_cn.dmp >tmp_zh_cn1.dmp
    sed 's/SET NAMES latin1/SET NAMES gb2312/g' tmp_zh_cn1.dmp > tmp_zh_cn.dmp
    sed 's/ENGINE=MyISAM DEFAULT CHARSET=latin1/ENGINE=InnoDB DEFAULT CHARSET=utf8/g' tmp_zh_tw.dmp >tmp_zh_tw1.dmp
    sed 's/SET NAMES latin1/SET NAMES big5/g' tmp_zh_tw1.dmp > tmp_zh_tw.dmp
    mysql -u$5 -p$6 -h$7 --execute=" \
          drop database if exists tmp_portal_cp_m4; \
          create database tmp_portal_cp_m4; use tmp_portal_cp_m4; \
          set names gb2312;    source tmp_zh_cn.dmp; \
          set names big5;   source tmp_zh_tw.dmp; \
          replace into $8.news_type (select * from news_type); \
          replace into $8.news (news_id,release,creater,news_type_id,create_time,update_time) \
                  (select news_id,release,party_id,news_type_id,created_date,modified_date from zh_cn_news_locale); \
          replace into $8.news (news_id,release,creater,news_type_id,create_time,update_time) \
                  (select news_id,release,party_id,news_type_id,created_date,modified_date from zh_tw_news_locale \
                          where news_id not in (select news_id from zh_cn_news_locale)); \
          replace into $8.news_caption (news_id,lang_id,title,body,origin,author,keyword,create_time,update_time)\
                  (select news_id,'2',title,content,origin,author,keyword,created_date,modified_date from zh_cn_news_locale); \
          replace into $8.news_caption (news_id,lang_id,title,body,origin,author,keyword,create_time,update_time)\
                  (select news_id,'3',title,content,origin,author,keyword,created_date,modified_date from zh_tw_news_locale); \
          update $8.news_caption a,news_attr b set a.image=b.image_name where a.news_id=b.news_id; \
          replace into $8.role (role_id,name) \
                  (select provider_id+5,name from provider); \
          replace into $8.provider (provider_id,is_partner,name,phone,address,role_id) \
                  (select provider_id,'0',name,phone,address,provider_id+5 from provider); \
          drop database tmp_portal_cp_m4;"
    rm -f tmp_zh_cn.dmp
    rm -f tmp_zh_cn1.dmp
    rm -f tmp_zh_tw.dmp
    rm -f tmp_zh_tw1.dmp
}

function update_comment_data_func()
{
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4  --default-character-set=latin1 zh_cn_cust_comment >tmp_zh_cn.dmp
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4  --default-character-set=latin1 zh_tw_cust_comment >tmp_zh_tw.dmp
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4  --default-character-set=latin1 th_th_cust_comment >tmp_th_th.dmp
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4  --default-character-set=latin1 user_rating en_us_cust_comment >tmp_en_us.dmp
    sed 's/ENGINE=MyISAM DEFAULT CHARSET=latin1/ENGINE=InnoDB DEFAULT CHARSET=utf8/g' tmp_zh_cn.dmp >tmp_zh_cn1.dmp
    sed 's/SET NAMES latin1/SET NAMES gb2312/g' tmp_zh_cn1.dmp > tmp_zh_cn.dmp 
    sed 's/ENGINE=MyISAM DEFAULT CHARSET=latin1/ENGINE=InnoDB DEFAULT CHARSET=utf8/g' tmp_zh_tw.dmp >tmp_zh_tw1.dmp
    sed 's/character set latin1 collate latin1_general_ci//g' tmp_zh_tw1.dmp > tmp_zh_tw.dmp
    sed 's/SET NAMES latin1/SET NAMES big5/g' tmp_zh_tw.dmp > tmp_zh_tw1.dmp
    sed 's/ENGINE=MyISAM DEFAULT CHARSET=latin1/ENGINE=InnoDB DEFAULT CHARSET=utf8/g' tmp_th_th.dmp >tmp_th_th1.dmp
    sed 's/SET NAMES latin1/SET NAMES tis620/g' tmp_th_th1.dmp > tmp_th_th.dmp
    sed 's/ENGINE=MyISAM DEFAULT CHARSET=latin1/ENGINE=InnoDB DEFAULT CHARSET=utf8/g' tmp_en_us.dmp >tmp_en_us1.dmp
    mysql -u$5 -p$6 -h$7 --execute=" \
          drop database if exists tmp_portal_cp_m4; \
          create database tmp_portal_cp_m4; use tmp_portal_cp_m4; \
          source tmp_en_us1.dmp; \
          set names gb2312;    source tmp_zh_cn.dmp; \
          set names big5;   source tmp_zh_tw1.dmp; \
          set names tis620; source tmp_th_th.dmp; \
          delete from $8.review; \
          insert into $8.review (review_id,lang_id,content,user_id,rating,media_id,review_time,title) \
                 (select '',2,comments,user_id,null,content_item_id,timestamp,title from zh_cn_cust_comment); \
          insert into $8.review (review_id,lang_id,content,user_id,rating,media_id,review_time,title) \
                 (select '',3,comments,user_id,null,content_item_id,timestamp,title from zh_tw_cust_comment); \
          insert into $8.review (review_id,lang_id,content,user_id,rating,media_id,review_time,title) \
                 (select '',4,comments,user_id,null,content_item_id,timestamp,title from th_th_cust_comment); \
          insert into $8.review (review_id,lang_id,content,user_id,rating,media_id,review_time,title) \
                 (select '',1,comments,user_id,null,content_item_id,timestamp,title from en_us_cust_comment); \
          insert into $8.review (review_id,user_id,rating,media_id,review_time) \
                 (select '',user_id,rating,content_item_id,timestamp from user_rating); \
          update $8.review a,$8.review b set a.rating=b.rating 
                 where a.user_id=b.user_id and a.media_id=b.media_id and a.rating is null and b.lang_id is null;
          update $8.review a,$8.review b set a.lang_id=5
                 where a.user_id=b.user_id and a.media_id=b.media_id and b.lang_id is not null
                       and a.lang_id is null;
          delete from $8.review where lang_id=5;
          drop database tmp_portal_cp_m4;"
    rm -f tmp_zh_cn.dmp
    rm -f tmp_zh_cn1.dmp
    rm -f tmp_en_us.dmp
    rm -f tmp_en_us1.dmp
    rm -f tmp_th_th.dmp
    rm -f tmp_th_th1.dmp
    rm -f tmp_zh_tw.dmp
    rm -f tmp_zh_tw1.dmp
}

function update_report_data_func()
{
    mysqldump -u$1 -p$2 -h$3 --no-create-info $4 \
              report_license_download_channel_2004 report_license_download_channel_2005 \
              report_license_liveevent1_2005 report_license_streaming_medium_2004  \
              report_license_streaming_medium_2005 \
              >tmp.dmp
    mysql -u$5 -p$6 -h$7 $8 --execute=" \
          delete from report_license_download_channel_2004; \
          delete from report_license_download_channel_2005; \
          delete from report_license_liveevent1_2005; \
          delete from report_license_streaming_medium_2004; \
          delete from report_license_streaming_medium_2005; \
          source tmp.dmp;"
    rm -f tmp.dmp
}

function update_mail_list_func()
{
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4 \
              email_list send_mail send_mail_info \
              >tmp.dmp
    sed 's/ENGINE=MyISAM DEFAULT CHARSET=latin1/ENGINE=InnoDB DEFAULT CHARSET=utf8/g' tmp.dmp >tmp1.dmp
    mysql -u$5 -p$6 -h$7 --execute="
          drop database if exists tmp_portal_cp_m4; \
          create database tmp_portal_cp_m4; \
          use tmp_portal_cp_m4;  \
          source tmp1.dmp; \
	  drop table if exists $8.mail_list; \
	  CREATE TABLE $8.mail_list ( \
	         email varchar(255) NOT NULL default '', \
	         name varchar(255) default NULL, \
	         lang_id int(11) NOT NULL default '0', \
	         status varchar(255) default NULL, \
	         endtime datetime default NULL, \
	         starttime datetime default NULL, \
	         create_time datetime default NULL, \
	         update_time datetime default NULL, \
	         PRIMARY KEY  (email,lang_id) \
	      ) ENGINE=InnoDB DEFAULT CHARSET=utf8; \
	  insert into $8.mail_list (email,name,status)  \
	         (select email,name,active from email_list); \
          alter table send_mail add column content longtext; \
          update send_mail a,$8.send_mail b set a.content=b.content where a.id=b.id; \
          replace into $8.send_mail (select * from send_mail); \
          replace into $8.send_mail_info (select * from send_mail_info); \
          drop database tmp_portal_cp_m4;"
    rm -f tmp.dmp
    rm -f tmp1.dmp
}

function update_thai_data_func()
{
    mysqldump -u$1 -p$2 -h$3 --add-drop-table --default-character-set=latin1 $4 \
              content_category_locale th_th_content_item_locale th_th_content_part_locale \
              content_part content_item >tmp.dmp 
    sed 's/ENGINE=MyISAM DEFAULT CHARSET=latin1/ENGINE=InnoDB DEFAULT CHARSET=utf8/g' tmp.dmp >tmp1.dmp
    sed 's/SET NAMES latin1/SET NAMES tis620/g' tmp1.dmp >tmp.dmp
    mysql -u$5 -p$6 -h$7 --execute=" 
          drop database if exists tmp_portal_cp_m4;
          create database tmp_portal_cp_m4;
          use tmp_portal_cp_m4; 
          source tmp.dmp;
          replace into $8.category_caption (category_id,lang_id,name,description)
                  (select content_category_id,'4',title,description from content_category_locale
                          where locale_id=4);
          replace into $8.media_caption (media_id,lang_id,name,description,highlight)
                  (select content_item_id,'4',title,description,highlight 
                          from th_th_content_item_locale);
          replace into $8.media_caption (media_id,lang_id,name,description)
                  (select (a.content_item_id*400+a.content_part_id),'4',b.title,b.title
                          from content_part a,th_th_content_part_locale b,content_item c 
                          where a.content_item_id=b.content_item_id and a.content_part_id=b.content_part_id
                                and a.content_item_id=c.content_item_id and a.content_item_id in 
                                    (select content_item_id from content_part group by content_item_id
                                            having count(*)>1));
          drop database tmp_portal_cp_m4;"
    rm -f tmp.dmp
    rm -f tmp1.dmp	
}

function update_ng10_func()
{
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4 --default-character-set=latin1 \
              sport_season_locale sport_match_locale  --where="locale_id=2" >tmp_zh_cn.dmp
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4 --default-character-set=latin1 \
              sport_season sport_match zh_cn_content_item_locale content content_item >>tmp_zh_cn.dmp
    mysqldump -u$1 -p$2 -h$3 --no-create-info $4 --default-character-set=latin1 \
              sport_season_locale sport_match_locale  --where="locale_id=3" >tmp_zh_tw.dmp
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4 --default-character-set=latin1 \
              zh_tw_content_item_locale >>tmp_zh_tw.dmp
    sed 's/ENGINE=MyISAM DEFAULT CHARSET=latin1/ENGINE=InnoDB DEFAULT CHARSET=utf8/g' tmp_zh_cn.dmp >tmp_zh_cn1.dmp
    sed 's/SET NAMES latin1/SET NAMES gb2312/g' tmp_zh_cn1.dmp > tmp_zh_cn.dmp
    sed 's/ENGINE=MyISAM DEFAULT CHARSET=latin1/ENGINE=InnoDB DEFAULT CHARSET=utf8/g' tmp_zh_tw.dmp >tmp_zh_tw1.dmp
    sed 's/SET NAMES latin1/SET NAMES big5/g' tmp_zh_tw1.dmp > tmp_zh_tw.dmp
    mysql -u$5 -p$6 -h$7 --execute=" \
          drop database if exists tmp_portal_cp_m4; \
          create database tmp_portal_cp_m4; use tmp_portal_cp_m4; \
          set names gb2312;    source tmp_zh_cn.dmp; \
          set names big5;   source tmp_zh_tw.dmp; \
          replace into $8.category (category_id,name,create_time,update_time) 
                  (select sport_season_id+220,sport_season_name,created_time,updated_time 
                          from sport_season where sport_item_id=18);
          replace into $8.category_caption (category_id,lang_id,name,create_time,update_time)
                  (select a.sport_season_id+220,a.locale_id,a.sport_season_name,a.created_time,a.updated_time 
                          from sport_season_locale a,sport_season b
                          where a.sport_season_id=b.sport_season_id and b.sport_item_id=18);
          replace into $8.category_relation (category_id,parent_category_id,sort)
                  (select sport_season_id+220,parent_id+220,sport_season_id 
                          from sport_season where parent_id!='0' and sport_item_id=18);
          replace into $8.category_relation (category_id,parent_category_id,sort)
                  (select sport_season_id+220,sport_item_id+200,sport_season_id 
                          from sport_season where parent_id='0' and sport_item_id=18);
          update sport_match_locale set fixture=replace(fixture,'￡-','-');
          replace into $8.media (media_id,name,starttime,release) 
                  (select a.sport_match_id+1000000,b.title,b.fixture,'1' from sport_match a,sport_match_locale b
                          where a.sport_match_id=b.sport_match_id and b.locale_id=2
                                and a.sport_item_id=18);
          replace into $8.media_caption 
                  (media_id,lang_id,name,location,description,highlight,create_time,update_time)
                  (select sport_match_id+1000000,locale_id,title,venue,description,highlight,created_time,updated_time 
                          from sport_match_locale a where sport_match_id in 
                               (select sport_match_id from sport_match where sport_item_id=18));
          update $8.media_caption a,sport_match b,sport_match_locale c,zh_cn_content_item_locale d
                 set a.description=d.description,a.highlight=d.highlight
                 where a.media_id=b.sport_match_id+1000000 and a.lang_id=2 and b.sport_match_id=c.sport_match_id
                       and c.locale_id=2 and b.content_item_id=d.content_item_id
                       and (a.description='' or a.description is null) and b.sport_item_id=18;
          update $8.media_caption a,sport_match b,sport_match_locale c,zh_tw_content_item_locale d
                 set a.description=d.description,a.highlight=d.highlight
                 where a.media_id=b.sport_match_id+1000000 and a.lang_id=3 and b.sport_match_id=c.sport_match_id
                       and c.locale_id=3 and b.content_item_id=d.content_item_id
                       and (a.description='' or a.description is null) and b.sport_item_id=18;
          replace into $8.media_category (media_id,category_id)
                  (select sport_match_id+1000000,sport_season_id+220 from sport_match where sport_item_id=18);
          delete from $8.item where media_id in 
                 (select sport_match_id+1000000 from sport_match where sport_item_id=18);
          insert into $8.item (item_id,media_id,man_item_id,distribute_id,url,size)
                 (select '',b.sport_match_id+1000000,a.man_item_id,a.content_channel_id,a.url,a.filesize
                         from content a,sport_match b
                         where a.content_item_id=b.content_item_id and b.sport_item_id=18);
          delete from $8.photo where media_id in 
                 (select sport_match_id+1000000 from sport_match where sport_item_id=18);
          insert into $8.photo (photo_id,media_id,photo) 
                  (select '',b.sport_match_id+1000000,a.image_name 
                          from content_item a,sport_match b 
                          where a.image_name is not null and a.image_name!=''
                                and a.content_item_id=b.content_item_id and b.sport_item_id=18);
          drop database tmp_portal_cp_m4;"
    rm -f tmp_zh_cn.dmp
    rm -f tmp_zh_cn1.dmp
    rm -f tmp_zh_tw.dmp
    rm -f tmp_zh_tw1.dmp
}

function update_item_func()
{
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4 content content_part sport_match \
              >tmp.dmp
    mysql -u$5 -p$6 -h$7 --execute=" \
          drop database if exists tmp_portal_cp_m4; \
          create database tmp_portal_cp_m4; use tmp_portal_cp_m4; \
          source tmp.dmp; \
          delete from $8.item;
          insert into $8.item (item_id,media_id,man_item_id,distribute_id,url,size)
                 (select '',content_item_id,man_item_id,content_channel_id,url,filesize
                         from content where content_item_id not in (
                              select content_item_id from content_part where content_part_id>1));
          insert into $8.item (item_id,media_id)
                 (select distinct '',content_item_id from content_part where content_part_id>1);
          insert into $8.item (item_id,media_id,man_item_id,distribute_id,url,size)
                 (select '',(content_item_id*400+content_part_id),man_item_id,content_channel_id,url,filesize
                         from content where content_item_id in (
                              select content_item_id from content_part where content_part_id>1));
          update $8.item a,sport_match b
                 set a.media_id=b.sport_match_id+1000000
                 where a.media_id=b.content_item_id;
          delete from $8.item where media_id not in (select media_id from $8.media);
          drop database tmp_portal_cp_m4;"
    rm -f tmp.dmp
}

update_udb_data_func()
{
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4 \
              banner_clicks banner_impressions click_tracking content_item_hits \
              content_item_hits_weekly content_license_list mail_content \
              mail_list news news_caption news_type popular_list \
              report_license_download_channel_2004 report_license_download_channel_2005 \
              report_license_liveevent1_2005 report_license_streaming_medium_2004 \
              report_license_streaming_medium_2005 review send_mail send_mail_info \
              user user_activity user_activity_stat \
              >cpm5_onsite_data.dmp
    mysql -u$5 -p$6 -h$7 --execute=" \
          drop database if exists udb_tmp; \
          create database udb_tmp; \
          use udb_tmp; \
          source cpm5_onsite_data.dmp; \
          replace into $8.banner_clicks (select * from banner_clicks); \
          replace into $8.banner_impressions (select * from banner_impressions); \
          replace into $8.click_tracking (select * from click_tracking); \
          replace into $8.content_item_hits (select * from content_item_hits); \
          replace into $8.content_item_hits_weekly (select * from content_item_hits_weekly); \
          drop table if exists $8.content_license_list; \
          create table $8.content_license_list (select * from content_license_list); \
          replace into $8.mail_content (select * from mail_content); \
          drop table if exists $8.mail_list; \
          create table $8.mail_list (select * from mail_list); \
          replace into $8.news (select * from news); \
          replace into $8.news_caption (select * from news_caption); \
          replace into $8.news_type (select * from news_type); \
          replace into $8.popular_list (select * from popular_list); \
          drop table if exists $8.report_license_download_channel_2004; \
          create table $8.report_license_download_channel_2004 \
                 (select * from report_license_download_channel_2004); \
          drop table if exists $8.report_license_download_channel_2005; \
          create table $8.report_license_download_channel_2005 \
                 (select * from report_license_download_channel_2005); \
          drop table if exists $8.report_license_liveevent1_2005; \
          create table $8.report_license_liveevent1_2005 \
                 (select * from report_license_liveevent1_2005); \
          drop table if exists $8.report_license_streaming_medium_2004; \
          create table $8.report_license_streaming_medium_2004 \
                 (select * from report_license_streaming_medium_2004); \
          drop table if exists $8.report_license_streaming_medium_2005; \
          create table $8.report_license_streaming_medium_2005 \
                 (select * from report_license_streaming_medium_2005); \
          replace into $8.review (select * from review); \
          replace into $8.send_mail (select * from send_mail); \
          replace into $8.send_mail_info (select * from send_mail_info); \
          drop table if exists $8.user; \
          create table $8.user \
                 (select user_id,login_name,name,password,status,notify_news,secret_question, \
                         answer,lang_id,crm_id,MAN_USER_ID from user); \
          drop table if exists $8.user_activity; \
          create table $8.user_activity (select * from user_activity); \
          drop table if exists $8.user_activity_stat; \
          create table $8.user_activity_stat (select * from user_activity_stat); \
          drop database udb_tmp; "
}


function help_func()
{
echo "Usage: 
    onside_data.sh [user|hits|news|report|mail|comment|thai|ng10|item]
  Update data from cpm4(latin1) to cpm5(utf8). 
  Before executing it, you must validate database configuration is right.

  Options explain:
   [user]	(cpm4->cpm5) Update user data, include tables:user,user_activity_stat,user_activityi
   [hits]	(cpm4->cpm5) Update hits data, 
		include tables:content_item_hits, content_item_hits_weekly,content_license_list
   [news]	(cpm4->cpm5) Update news data, include tables:news_type,news,news_caption,provider
   [comment]	(cpm4->cpm5) Update user comment data and rating data, include tables:review
   [report]	(cpm4->cpm5) Update report data, include all tables about report license
   [mail]	(cpm4->cpm5) Update email list data, email content data and send mail information data, 
		include tables:email_list,send_mail,send_mail_info
   [thai]	(cpm4->cpm5) Update Thai data, include all tables related to Thai
   [ng10]	(cpm4->cpm5) Update National Game 10th data, include tables:category, media, item etc
   [item]	(cpm4->cpm5) Update item data to make media file\'s path keeping newest
   [udb_data]   (cpm5->udb) Update onsite data from cpm5 to uniform database"
}

# MAIN
cpm4_dbhost=127.0.0.1
cpm4_dbuser=wangxinlin
cpm4_dbpasswd=123456
cpm4_dbname=portal_cp_m4

cpm5_dbhost=127.0.0.1
cpm5_dbuser=wangxinlin
cpm5_dbpasswd=123456
cpm5_dbname=portal_cp_m5

udb_host=127.0.0.1
udb_user=wangxinlin
udb_passwd=123456
udb_name=wxl

case "$1" in
    user)
        update_user_data_func ${cpm4_dbuser} ${cpm4_dbpasswd} ${cpm4_dbhost} ${cpm4_dbname} \
                              ${cpm5_dbuser} ${cpm5_dbpasswd} ${cpm5_dbhost} ${cpm5_dbname}
        ;;
    hits)
        update_hits_data_func ${cpm4_dbuser} ${cpm4_dbpasswd} ${cpm4_dbhost} ${cpm4_dbname} \
                              ${cpm5_dbuser} ${cpm5_dbpasswd} ${cpm5_dbhost} ${cpm5_dbname} 
        ;;
    news)
        update_news_data_func ${cpm4_dbuser} ${cpm4_dbpasswd} ${cpm4_dbhost} ${cpm4_dbname} \
                              ${cpm5_dbuser} ${cpm5_dbpasswd} ${cpm5_dbhost} ${cpm5_dbname}
        ;;
    report)
        update_report_data_func ${cpm4_dbuser} ${cpm4_dbpasswd} ${cpm4_dbhost} ${cpm4_dbname} \
                                ${cpm5_dbuser} ${cpm5_dbpasswd} ${cpm5_dbhost} ${cpm5_dbname}
        ;;
    mail)
        update_mail_list_func ${cpm4_dbuser} ${cpm4_dbpasswd} ${cpm4_dbhost} ${cpm4_dbname} \
                              ${cpm5_dbuser} ${cpm5_dbpasswd} ${cpm5_dbhost} ${cpm5_dbname}
        ;;
    comment)
        update_comment_data_func ${cpm4_dbuser} ${cpm4_dbpasswd} ${cpm4_dbhost} ${cpm4_dbname} \
                                 ${cpm5_dbuser} ${cpm5_dbpasswd} ${cpm5_dbhost} ${cpm5_dbname} 
        ;;
    thai)
        update_thai_data_func ${cpm4_dbuser} ${cpm4_dbpasswd} ${cpm4_dbhost} ${cpm4_dbname} \
                              ${cpm5_dbuser} ${cpm5_dbpasswd} ${cpm5_dbhost} ${cpm5_dbname}
        ;;
    ng10)
        update_ng10_func ${cpm4_dbuser} ${cpm4_dbpasswd} ${cpm4_dbhost} ${cpm4_dbname} \
                         ${cpm5_dbuser} ${cpm5_dbpasswd} ${cpm5_dbhost} ${cpm5_dbname}
        ;;
    item)
        update_item_func ${cpm4_dbuser} ${cpm4_dbpasswd} ${cpm4_dbhost} ${cpm4_dbname} \
                         ${cpm5_dbuser} ${cpm5_dbpasswd} ${cpm5_dbhost} ${cpm5_dbname}
        ;;
    udb_data)
        update_udb_data_func ${cpm5_dbuser} ${cpm5_dbpasswd} ${cpm5_dbhost} ${cpm5_dbname} \
                             ${udb_user} ${udb_passwd} ${udb_host} ${udb_name}
        ;;
    *)
        help_func
        ;;
esac

