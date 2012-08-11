set names utf8;

insert into portal_cp_m5.position (position_id,name) values (3,'世乒赛队1'),(4,'世乒赛队2');
drop table if exists portal_cp_m5.country_tmp;
create table portal_cp_m5.country_tmp 
    (
      country_id int(11) auto_increment primary key,
      name_cn varchar(255),
      name_tw varchar(255)
     )ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into portal_cp_m5.country_tmp  
    (select '',a.country,b.country from zh_cn_player a,zh_tw_player b 
      where a.player_id=b.player_id group by a.country,b.country);
replace into portal_cp_m5.country (country_id,name,status) 
    (select country_id,name_cn,'1' from portal_cp_m5.country_tmp);
replace into portal_cp_m5.country_caption (country_id,lang_id,name)
    (select country_id,'2',name_cn from portal_cp_m5.country_tmp);
replace into portal_cp_m5.country_caption (country_id,lang_id,name)
    (select country_id,'3',name_tw from portal_cp_m5.country_tmp);
update portal_cp_m5.media a,zh_cn_match b set a.starttime=concat(b.match_date,' ',b.match_time) 
    where a.media_id=b.content_item_id;
delete from portal_cp_m5.media_category 
    where category_id=129 and media_id not in (select content_item_id from zh_cn_match);
update portal_cp_m5.media a,zh_cn_match b set a.name=b.title 
    where a.media_id=b.content_item_id and (a.name is null or a.name='');
update portal_cp_m5.media_caption a,zh_cn_match b set a.name=b.title 
    where a.media_id=b.content_item_id and (a.name is null or a.name='') and a.lang_id=2;
update portal_cp_m5.media_caption a,zh_tw_match b set a.name=b.title 
    where a.media_id=b.content_item_id and (a.name is null or a.name='') and a.lang_id=3;
insert into portal_cp_m5.actor (actor_id,country_id,name)
    (select a.player_id+8000,b.country_id,a.name from zh_cn_player a,portal_cp_m5.country b
      where a.country=b.name);
insert into portal_cp_m5.actor_caption (actor_id,lang_id,name,description)
     (select player_id+8000,'2',name,description from zh_cn_player);
insert into portal_cp_m5.actor_caption (actor_id,lang_id,name,description)
     (select player_id+8000,'3',name,description from zh_tw_player);
insert into portal_cp_m5.photo (photo_id,actor_id,photo)
    (select '',player_id+8000,image from zh_cn_player where image is not null and image!='');
insert into portal_cp_m5.media_actor (media_id,actor_id,position_id)
    (select content_item_id,team_1+8000,'3' from zh_cn_match 
      where team_1 is not null and team_1!='' and team_1 not like '%,%');
insert into portal_cp_m5.media_actor (media_id,actor_id,position_id)
    (select content_item_id,team_2+8000,'4' from zh_cn_match 
      where team_2 is not null and team_2!='' and team_2 not like '%,%');
insert into portal_cp_m5.media_actor (media_id,actor_id,position_id)
    (select content_item_id,substr(team_1,1,locate(',',team_1)-1)+8000,'3' from zh_cn_match
      where team_1 like '%,%');
insert into portal_cp_m5.media_actor (media_id,actor_id,position_id)
    (select content_item_id,substr(team_1,locate(',',team_1)+1,5)+8000,'3' from zh_cn_match
      where team_1 like '%,%');
insert into portal_cp_m5.media_actor (media_id,actor_id,position_id)
    (select content_item_id,substr(team_2,1,locate(',',team_2)-1)+8000,'4' from zh_cn_match
      where team_2 like '%,%');
insert into portal_cp_m5.media_actor (media_id,actor_id,position_id)
    (select content_item_id,substr(team_2,locate(',',team_2)+1,5)+8000,'4' from zh_cn_match
      where team_2 like '%,%');
insert into portal_cp_m5.media_category (media_id,category_id) 
    (select content_item_id,129 from zh_cn_match where content_item_id not in 
      (select media_id from portal_cp_m5.media_category));

-- 世乒赛历年精彩赛事回顾
insert into portal_cp_m5.flag (flag_id,name) values (5,'Former classic match');
insert into portal_cp_m5.flag (flag_id,name) values (6,'Normal match');
insert into portal_cp_m5.media_flag 
    (select content_item_id,5 from zh_cn_match where match_date like '%历年精彩赛事%');
insert into portal_cp_m5.media_flag
    (select content_item_id,6 from zh_cn_match where match_date not like '%历年精彩赛事%');