set names utf8;

-- Insert sport content
delete from portal_cp_m5.category where category_id in 
    (select content_category_id from content_category where parent_category_id=130)
    and category_id!=129;
delete from portal_cp_m5.category_caption where category_id in 
    (select content_category_id from content_category where parent_category_id=130)
    and category_id!=129;
delete from portal_cp_m5.category_relation where parent_category_id in 
    (select content_category_id from content_category where parent_category_id=130)
    and category_id!=129;

insert into portal_cp_m5.category (category_id,name,create_time,update_time) 
    (select sport_item_id+200,sport_item_name,created_time,updated_time from sport_item);
insert into portal_cp_m5.category_caption (category_id,lang_id,name,create_time,update_time)
    (select sport_item_id+200,locale_id,sport_item_name,created_time,updated_time from sport_item_locale);
insert into portal_cp_m5.category_relation (category_id,parent_category_id,sort)
    (select sport_item_id+200,130,sport_item_id from sport_item);

insert into portal_cp_m5.category (category_id,name,create_time,update_time) 
    (select sport_season_id+220,sport_season_name,created_time,updated_time from sport_season);
insert into portal_cp_m5.category_caption (category_id,lang_id,name,create_time,update_time)
    (select sport_season_id+220,locale_id,sport_season_name,created_time,updated_time from sport_season_locale);
insert into portal_cp_m5.category_relation (category_id,parent_category_id,sort)
    (select sport_season_id+220,parent_id+220,sport_season_id from sport_season where parent_id!='0');
insert into portal_cp_m5.category_relation (category_id,parent_category_id,sort)
    (select sport_season_id+220,sport_item_id+200,sport_season_id from sport_season where parent_id='0');

delete from portal_cp_m5.media_category where media_id in 
    (select content_item_id from sport_match where sport_item_id!=8);

update sport_match_locale set fixture=replace(fixture,'－','-');
insert into portal_cp_m5.media (media_id,name,starttime,`release`) 
   (select a.sport_match_id+1000000,b.title,b.fixture,'1' from sport_match a,sport_match_locale b
     where a.sport_match_id=b.sport_match_id and b.locale_id=2);
insert into portal_cp_m5.media_caption (media_id,lang_id,name,location,description,highlight,create_time,update_time)
   (select sport_match_id+1000000,locale_id,title,venue,description,highlight,created_time,updated_time from sport_match_locale);
update portal_cp_m5.media_caption a,sport_match b,sport_match_locale c,zh_cn_content_item_locale d
   set a.description=d.description,a.highlight=d.highlight
   where a.media_id=b.sport_match_id+1000000 and a.lang_id=2 and b.sport_match_id=c.sport_match_id
         and c.locale_id=2 and b.content_item_id=d.content_item_id
	 and (a.description='' or a.description is null);
update portal_cp_m5.media_caption a,sport_match b,sport_match_locale c,zh_tw_content_item_locale d
   set a.description=d.description,a.highlight=d.highlight
   where a.media_id=b.sport_match_id+1000000 and a.lang_id=3 and b.sport_match_id=c.sport_match_id
         and c.locale_id=3 and b.content_item_id=d.content_item_id
	 and (a.description='' or a.description is null);
insert into portal_cp_m5.media_category (media_id,category_id)
   (select sport_match_id+1000000,sport_season_id+220 from sport_match);
update portal_cp_m5.photo a,sport_match b set a.media_id=b.sport_match_id+1000000 where a.media_id=b.content_item_id;

delete from portal_cp_m5.media where media_id in (select content_item_id from sport_match where sport_item_id!=8);
delete from portal_cp_m5.media_caption where media_id in (select content_item_id from sport_match where sport_item_id!=8);
delete from portal_cp_m5.media_relation 
    where media_id in (select content_item_id from sport_match)
          or parent_media_id in (select content_item_id from sport_match);
update portal_cp_m5.item a,sport_match b
     set a.media_id=b.sport_match_id+1000000
     where a.media_id=b.content_item_id;

delete from portal_cp_m5.scoretype;
insert into portal_cp_m5.scoretype (scoretype_id,name) values
   (1,'point'),(2,'score');

update sport_player_locale set `position`=REPLACE(`position`, ' ', '');
update sport_player_locale set `position`=null where `position`='';

insert into portal_cp_m5.actor (actor_id,name,category_id,create_time,update_time)
   (select sport_team_id+8600,sport_team_name,sport_item_id+200,created_time,updated_time from sport_team);
insert into portal_cp_m5.actor (actor_id,name,create_time,update_time)
   (select sport_player_id+8800,name,created_time,updated_time from sport_player);

insert into portal_cp_m5.actor_caption (actor_id,lang_id,name,create_time,update_time,description)
   (select a.sport_team_id+8600,a.locale_id,a.sport_team_name,a.created_time,a.updated_time,
           concat('<description><desc>',COALESCE(a.description,''),'</desc><brief_introduction>',COALESCE(a.brief_introduction,''),'</brief_introduction><team_member_photo>',COALESCE(b.team_member_photo,''),'</team_member_photo></description>')
    from sport_team_locale a,sport_team b where a.sport_team_id=b.sport_team_id);
insert into portal_cp_m5.actor_caption (actor_id,lang_id,name,create_time,update_time,description)
   (select a.sport_player_id+8800,a.locale_id,a.name,a.created_time,a.updated_time,
           concat('<description><position>',COALESCE(a.position,''),'</position><desc>',COALESCE(a.description,''),'</desc><born>',COALESCE(b.born,''),'</born><height>',COALESCE(b.height,''),'</height><weight>',COALESCE(b.weight,''),'</weight><num>',COALESCE(b.num,''),'</num><certificate>',COALESCE(b.certificate,''),'</certificate></description>')
    from sport_player_locale a,sport_player b where a.sport_player_id=b.sport_player_id);

insert into portal_cp_m5.actor_relation (actor_id,parent_actor_id)
    (select sport_player_id+8800,sport_team_id+8600 from sport_player_team_item);

insert into portal_cp_m5.position (position_id,name) values (17,'guest_field'),(18,'home_field'),(19,'other_field');
insert into portal_cp_m5.media_actor (media_actor_id,media_id,actor_id,position_id)
    (select '',sport_match_id+1000000,sport_team_id+8600,(17+is_main_field) from sport_match_team);

insert into portal_cp_m5.actor_score (media_actor_id,scoretype_id,`value`) 
    (select a.media_actor_id,1,b.point from portal_cp_m5.media_actor a,sport_match_team b
      where a.media_id=(b.sport_match_id+1000000) and a.actor_id=(b.sport_team_id+8600));
insert into portal_cp_m5.actor_score (media_actor_id,scoretype_id,`value`) 
    (select a.media_actor_id,2,b.score from portal_cp_m5.media_actor a,sport_match_team b
      where a.media_id=(b.sport_match_id+1000000) and a.actor_id=(b.sport_team_id+8600));

insert into portal_cp_m5.country_tmp  
    (select '',replace(a.country,'\r\n',''),replace(b.country,'\r\n','') from sport_player_locale a,sport_player_locale b 
      where a.sport_player_id=b.sport_player_id and a.locale_id=2 and b.locale_id=3
      and a.country!='' and a.country is not null and b.country!='' and b.country is not null
      and a.country!='\r\n'
      and replace(a.country,'\r\n','') not in (select name from portal_cp_m5.country)
      group by a.country,b.country);
replace into portal_cp_m5.country (country_id,name,status) 
    (select country_id,name_cn,'1' from portal_cp_m5.country_tmp);
replace into portal_cp_m5.country_caption (country_id,lang_id,name)
    (select country_id,'2',name_cn from portal_cp_m5.country_tmp);
replace into portal_cp_m5.country_caption (country_id,lang_id,name)
    (select country_id,'3',name_tw from portal_cp_m5.country_tmp);

drop table portal_cp_m5.country_tmp;

update portal_cp_m5.actor a,portal_cp_m5.country b,sport_player_locale c
    set a.country_id=b.country_id where a.actor_id=c.sport_player_id+8800 and c.country=b.name;


insert into portal_cp_m5.photo (photo_id,actor_id,photo) 
    (select '',sport_player_id+8800,image from sport_player where image is not null and image!='');

insert into portal_cp_m5.photo (photo_id,actor_id,photo)
    (select '',sport_team_id+8600,sport_team_logo from sport_team where sport_team_logo is not null and sport_team_logo!='');

