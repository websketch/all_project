set names utf8;

-- 演员actor_id=media_id(content_item)&导演actor_id=media_id(content_item)+4000以便建media_actor表数据（同时方便处理actor_caption表数据）,
-- gender暂时存放导演还是演员(media_actor.position_id)
insert into portal_cp_m5.actor (actor_id,gender)
    (select content_item_id,'1' from en_us_content_item_locale where actor is not null and actor!='')
   union 
    (select content_item_id,'1' from th_th_content_item_locale where actor is not null and actor!='')
   union 
    (select content_item_id,'1' from zh_cn_content_item_locale where actor is not null and actor!='')
   union 
    (select content_item_id,'1' from zh_tw_content_item_locale where actor is not null and actor!='')
   ;
insert into portal_cp_m5.actor (actor_id,gender)
    (select content_item_id+4000,'2' from en_us_content_item_locale where director is not null and director!='')
   union 
    (select content_item_id+4000,'2' from th_th_content_item_locale where director is not null and director!='')
   union 
    (select content_item_id+4000,'2' from zh_cn_content_item_locale where director is not null and director!='')
   union 
    (select content_item_id+4000,'2' from zh_tw_content_item_locale where director is not null and director!='')
   ;
insert into portal_cp_m5.actor_caption (actor_id,lang_id,name)
     (select content_item_id,'1',actor from en_us_content_item_locale where actor is not null and actor!='')
    union
     (select content_item_id+4000,'1',director from en_us_content_item_locale where director is not null and director!='')
   ;
insert into portal_cp_m5.actor_caption (actor_id,lang_id,name)
     (select content_item_id,'2',actor from zh_cn_content_item_locale where actor is not null and actor!='')
    union
     (select content_item_id+4000,'2',director from zh_cn_content_item_locale where director is not null and director!='')
    ;
insert into portal_cp_m5.actor_caption (actor_id,lang_id,name)
     (select content_item_id,'3',actor from zh_tw_content_item_locale where actor is not null and actor!='')
    union
     (select content_item_id+4000,'3',director from zh_tw_content_item_locale where director is not null and director!='')
    ;
insert into portal_cp_m5.actor_caption (actor_id,lang_id,name)
     (select content_item_id,'4',actor from th_th_content_item_locale where actor is not null and actor!='')
    union
     (select content_item_id+4000,'4',director from th_th_content_item_locale where director is not null and director!='')
    ;
insert into portal_cp_m5.media_actor (media_actor_id,media_id,actor_id,position_id)
   (select '',actor_id,actor_id,gender from portal_cp_m5.actor where gender='1');
insert into portal_cp_m5.media_actor (media_actor_id,media_id,actor_id,position_id)
   (select '',actor_id-4000,actor_id,gender from portal_cp_m5.actor where gender='2');
update portal_cp_m5.actor set gender=null;
insert into portal_cp_m5.position (position_id,name) values (1,'actor'),(2,'director');
