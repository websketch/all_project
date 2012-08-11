
insert into actor (select * from portal_cp_m5.actor);
insert into actor_caption (select * from portal_cp_m5.actor_caption);
insert into actor_relation (select * from portal_cp_m5.actor_relation);
insert into actor_score (select * from portal_cp_m5.actor_score);
insert into article (select * from portal_cp_m5.article);
insert into attribute (select * from portal_cp_m5.attribute);
insert into attribute_caption (select * from portal_cp_m5.attribute_caption);
insert into banner_clicks (select * from portal_cp_m5.banner_clicks); 
insert into `banner_impressions` (select * from portal_cp_m5.`banner_impressions`); 
insert into banners (select * from portal_cp_m5.banners); 
insert into block (select * from portal_cp_m5.block);
insert into block_element (select * from portal_cp_m5.block_element); 
insert into category (category_id,name,filter,style,create_time,creater,update_time,updater,release_time,`release`,close_time,crm_id)
  (select * from portal_cp_m5.category); 
insert into category_caption (select * from portal_cp_m5.category_caption); 
insert into category_relation (select * from portal_cp_m5.category_relation); 
insert into click_tracking (select * from portal_cp_m5.click_tracking); 
insert into content_item_hits (select * from portal_cp_m5.content_item_hits); 
insert into content_item_hits_weekly (select * from portal_cp_m5.content_item_hits_weekly); 
insert into country (select * from portal_cp_m5.country); 
insert into country_caption (select * from portal_cp_m5.country_caption); 
insert into crm (select * from portal_cp_m5.crm); 
insert into currency (select * from portal_cp_m5.currency); 
insert into distribute_channel (select * from portal_cp_m5.distribute_channel);

insert into field (select * from portal_cp_m5.field);
insert into field_caption (select * from portal_cp_m5.field_caption);
insert into flag (select * from portal_cp_m5.flag);
insert into flag_caption (select * from portal_cp_m5.flag_caption);
insert into function (select * from portal_cp_m5.function);
insert into item (item_id,media_id,man_item_id,distribute_id,policy_id,url,size,close_time,`release`,release_time)
  (select * from portal_cp_m5.item);
insert into lang (select * from portal_cp_m5.lang);
insert into mail_content (select * from portal_cp_m5.mail_content);
alter table mail_list add column name varchar(255) after email;
insert into mail_list (select * from portal_cp_m5.mail_list);
insert into media (media_id,name,homepage,level,premiere,upc,leng,status,starttime,endtime,subtitle,voice,size,release_time,close_time,`release`,clicked,play,download,provider_id,crm_id) (select * from portal_cp_m5.media);
insert into media_actor (select media_actor_id,media_id,actor_id,position_id,belongto_team,sway,updater,update_time,creater,create_time from portal_cp_m5.media_actor);
insert into media_attribute (select * from portal_cp_m5.media_attribute);
insert into media_caption (media_id,lang_id,name,description,location,premiere_area,metadata,preview,highlight,create_time,creater,update_time,updater) (select * from portal_cp_m5.media_caption);
insert into media_category (select * from portal_cp_m5.media_category);
insert into media_flag (media_id,flag_id) (select * from portal_cp_m5.media_flag);
insert into media_relation (select * from portal_cp_m5.media_relation);
insert into media_service (select * from portal_cp_m5.media_service);
insert into news (select * from portal_cp_m5.news);
insert into news_caption (select * from portal_cp_m5.news_caption);
insert into news_type (select * from portal_cp_m5.news_type);
insert into photo (select * from portal_cp_m5.photo);
insert into photo_caption (select * from portal_cp_m5.photo_caption);
insert into policy (select * from portal_cp_m5.policy);
insert into popular_list (select * from portal_cp_m5.popular_list);
insert into position (select * from portal_cp_m5.position);
insert into position_caption (select * from portal_cp_m5.position_caption);
insert into preview (select * from portal_cp_m5.preview);
insert into preview_caption (select * from portal_cp_m5.preview_caption);
insert into price_policy (select * from portal_cp_m5.price_policy);
insert into provider (select * from portal_cp_m5.provider);
insert into provider_caption (select * from portal_cp_m5.provider_caption);
insert into provider_crm (select * from portal_cp_m5.provider_crm);
alter table review change column user_id user_id varchar(255);
insert into review (select * from portal_cp_m5.review);
insert into role (select * from portal_cp_m5.role);
insert into role_function (select * from portal_cp_m5.role_function);
insert into role_relation (select * from portal_cp_m5.role_relation);
insert into scoretype (select * from portal_cp_m5.scoretype);
insert into scoretype_caption (select * from portal_cp_m5.scoretype_caption);
insert into search (select * from portal_cp_m5.search);
insert into source (select * from portal_cp_m5.source);
alter table `user` add column notify_news char(1) after status;
insert into `user` (user_id,login_name,name,password,status,notify_news,secret_question,answer,lang_id,crm_id,man_user_id)
            (select user_id,login_name,name,password,status,notify_news,secret_question,answer,lang_id,crm_id,MAN_USER_ID from portal_cp_m5.`user`);
insert into user_admin (select user_id,login_name,password,email,status,secret_question,answer,lang_id,crm_id,create_time,creater,update_time,updater from portal_cp_m5.user_admin);
insert into user_role (select * from portal_cp_m5.user_role);


create table `report_license_download_channel_2004` (select * from portal_cp_m5.`report_license_download_channel_2004`);
create table `report_license_download_channel_2005` (select * from portal_cp_m5.`report_license_download_channel_2005`);
create table `report_license_liveevent1_2005` (select * from portal_cp_m5.`report_license_liveevent1_2005`);
create table `report_license_streaming_medium_2004` (select * from portal_cp_m5.`report_license_streaming_medium_2004`);
create table `report_license_streaming_medium_2005` (select * from portal_cp_m5.`report_license_streaming_medium_2005`);
insert into send_mail (select * from portal_cp_m5.send_mail);
insert into send_mail_info (select * from portal_cp_m5.send_mail_info);
create table content_license_list (select * from portal_cp_m5.content_license_list);
create table user_activity (select * from portal_cp_m5.user_activity);
create table user_activity_stat (select * from portal_cp_m5.user_activity_stat);

