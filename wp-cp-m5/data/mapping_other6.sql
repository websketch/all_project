set names utf8;

-- block \ review(comment) \ news \ mail \ top_banner \ user ...

insert into portal_cp_m5.block (block_id,name)
  select a.content_category_id,concat('CATEGORY_',a.content_category_id) from content_promo a,(
  select content_category_id,max(from_date) from_date from content_promo group by content_category_id
  ) b where a.content_category_id=b.content_category_id and a.from_date=b.from_date;

insert into portal_cp_m5.block_element (block_id,source_id,source_pk_id)
  select a.content_category_id,'2',a.content_item_id from content_promo a,(
  select content_category_id,max(from_date) from_date from content_promo where content_item_id in (
  select media_id from portal_cp_m5.media )
   group by content_category_id
  ) b where a.content_category_id=b.content_category_id and a.from_date=b.from_date;


insert into portal_cp_m5.review (review_id,lang_id,content,user_id,rating,media_id,review_time,title)
   (select '',2,comments,user_id,null,content_item_id,timestamp,title from zh_cn_cust_comment);
insert into portal_cp_m5.review (review_id,lang_id,content,user_id,rating,media_id,review_time,title)
   (select '',3,comments,user_id,null,content_item_id,timestamp,title from zh_tw_cust_comment);
insert into portal_cp_m5.review (review_id,lang_id,content,user_id,rating,media_id,review_time,title)
   (select '',4,comments,user_id,null,content_item_id,timestamp,title from th_th_cust_comment);
insert into portal_cp_m5.review (review_id,lang_id,content,user_id,rating,media_id,review_time,title)
   (select '',1,comments,user_id,null,content_item_id,timestamp,title from en_us_cust_comment);
insert into portal_cp_m5.review (review_id,user_id,rating,media_id,review_time)
   (select '',user_id,rating,content_item_id,timestamp from user_rating);
update portal_cp_m5.review a,portal_cp_m5.review b set a.rating=b.rating 
   where a.user_id=b.user_id and a.media_id=b.media_id and a.rating is null and b.lang_id is null;
update portal_cp_m5.review a,portal_cp_m5.review b set a.lang_id=5
  where a.user_id=b.user_id and a.media_id=b.media_id and b.lang_id is not null
    and a.lang_id is null;
delete from portal_cp_m5.review where lang_id=5;

insert into portal_cp_m5.media (media_id,name,starttime,endtime,release_time,`release`) 
    (select sport_game_schedule_id+7000,title,'20050411','20060411','20050601','1' 
       from sport_game_schedule_locale where locale_id=2);

insert into portal_cp_m5.media_caption (media_id,lang_id,name,description)
     (select sport_game_schedule_id+7000,locale_id,title,description from sport_game_schedule_locale);

insert into portal_cp_m5.flag (flag_id,name) values ('4','For schedule game');
insert into portal_cp_m5.media_flag (select (sport_game_schedule_id+7000),'4' from sport_game_schedule);
        
insert into portal_cp_m5.attribute values 
    (1,null,'even_url'),(2,null,'playstate'),(3,null,'even_type');
insert into portal_cp_m5.media_attribute 
    (select sport_game_schedule_id+7000,1,even_url 
       from sport_game_schedule where even_url is not null and even_url!='');
insert into portal_cp_m5.media_attribute 
    (select sport_game_schedule_id+7000,2,playstate 
       from sport_game_schedule where playstate is not null);
insert into portal_cp_m5.media_attribute 
    (select sport_game_schedule_id+7000,3,even_type 
       from sport_game_schedule where even_type is not null and even_type!='');


-- Insert news content
insert into portal_cp_m5.news (news_id,`release`,creater,news_type_id,create_time,update_time) 
     (select news_id,`release`,party_id,news_type_id,created_date,modified_date from zh_cn_news_locale);
insert into portal_cp_m5.news (news_id,`release`,creater,news_type_id,create_time,update_time) 
     (select news_id,`release`,party_id,news_type_id,created_date,modified_date from zh_tw_news_locale
       where news_id not in (select news_id from zh_cn_news_locale));
insert into portal_cp_m5.news_caption (news_id,lang_id,title,body,origin,author,keyword,create_time,update_time)
     (select news_id,'2',title,content,origin,author,keyword,created_date,modified_date from zh_cn_news_locale);
insert into portal_cp_m5.news_caption (news_id,lang_id,title,body,origin,author,keyword,create_time,update_time)
     (select news_id,'3',title,content,origin,author,keyword,created_date,modified_date from zh_tw_news_locale);
update portal_cp_m5.news_caption a,news_attr b
     set a.image=b.image_name where a.news_id=b.news_id;

-- top_banner
insert into portal_cp_m5.banners (banner_id,bannerlocation,bannergotourl,pagelocation,active) 
     (select id,image_url,link_url,order_id,banner_type from top_banner);

-- newsletter
insert into portal_cp_m5.send_mail (select *,'' from send_mail);
insert into portal_cp_m5.send_mail_info (select * from send_mail_info);
insert into portal_cp_m5.mail_list (email,name,status) 
  (select email,name,active from email_list);


insert into portal_cp_m5.content_license_list (select * from content_license_list);
insert into portal_cp_m5.content_item_hits (select * from content_item_hits);
insert into portal_cp_m5.content_item_hits_weekly (select * from content_item_hits_weekly);
insert into portal_cp_m5.news_type (select * from news_type);


insert into portal_cp_m5.`user` (user_id,login_name,name,lang_id,notify_news,MAN_USER_ID) 
   (select '',email,name,email_lang,notify_news,user_id from `user`);


insert into portal_cp_m5.role (role_id,name)
  (select provider_id+5,name from provider);
insert into portal_cp_m5.provider (provider_id,is_partner,name,phone,address,role_id)
    (select provider_id,'0',name,phone,address,provider_id+5 from provider);

insert into portal_cp_m5.user_admin (user_id,login_name,name,password)
  (select adm_uid,adm_uname,adm_realname,passwd from admin_user);
insert into portal_cp_m5.user_role (user_id,role_id)
  (select adm_uid,provider_id+5 from admin_user where provider_id>0);

insert into portal_cp_m5.user_activity (select * from user_activity);
insert into portal_cp_m5.user_activity_stat (select * from user_activity_stat);
