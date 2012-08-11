set names utf8;


--清理media数据

delete from portal_cp_m5.actor_caption where actor_id not in (select actor_id from portal_cp_m5.actor);
delete from portal_cp_m5.actor_relation where actor_id not in (select actor_id from portal_cp_m5.actor);
delete from portal_cp_m5.actor_relation where parent_actor_id not in (select actor_id from portal_cp_m5.actor);
delete from portal_cp_m5.media_actor where actor_id not in (select actor_id from portal_cp_m5.actor);

delete from portal_cp_m5.item where media_id not in (select media_id from portal_cp_m5.media);
delete from portal_cp_m5.media_actor where media_id not in (select media_id from portal_cp_m5.media);
delete from portal_cp_m5.media_caption where media_id not in (select media_id from portal_cp_m5.media);
delete from portal_cp_m5.media_category where media_id not in (select media_id from portal_cp_m5.media);
delete from portal_cp_m5.media_relation where media_id not in (select media_id from portal_cp_m5.media);
delete from portal_cp_m5.media_relation where parent_media_id not in (select media_id from portal_cp_m5.media);
delete from portal_cp_m5.photo where media_id not in (select media_id from portal_cp_m5.media);
delete from portal_cp_m5.media_flag where media_id not in (select media_id from portal_cp_m5.media);
delete from portal_cp_m5.review where media_id not in (select media_id from portal_cp_m5.media);

delete from portal_cp_m5.category_caption where category_id not in (select category_id from portal_cp_m5.category);
delete from portal_cp_m5.category_relation where category_id not in (select category_id from portal_cp_m5.category);
delete from portal_cp_m5.category_relation where parent_category_id not in (select category_id from portal_cp_m5.category);
delete from portal_cp_m5.media_category where category_id not in (select category_id from portal_cp_m5.category);


replace into portal_cp_m5.category_caption (category_id,lang_id,name,description)
  (select category_id,'4',name,description from portal_cp_m5.category_caption 
    where category_id not in (select category_id from portal_cp_m5.category_caption where lang_id=4)
    and lang_id=1);
 replace into portal_cp_m5.media_caption (media_id,lang_id,name,description)
  (select media_id,'4',name,description from portal_cp_m5.media_caption 
    where media_id not in (select media_id from portal_cp_m5.media_caption where lang_id=4)
    and lang_id=1);
replace into portal_cp_m5.actor_caption (actor_id,lang_id,name,description)
  (select actor_id,'4',name,description from portal_cp_m5.actor_caption 
    where actor_id not in (select actor_id from portal_cp_m5.actor_caption where lang_id=4)
    and lang_id=1);
replace into portal_cp_m5.country_caption (country_id,lang_id,name,remark)
  (select country_id,'4',name,remark from portal_cp_m5.country_caption 
    where country_id not in (select country_id from portal_cp_m5.country_caption where lang_id=4)
    and lang_id=1);

insert into portal_cp_m5.photo (photo_id,media_id,photo) 
  (
  select '',a.media_id,'notavailable.jpg' 
    from portal_cp_m5.media a,content_item b
         left join portal_cp_m5.photo c on a.media_id=c.media_id
    where c.photo_id is null and a.media_id=b.content_item_id
   );

update portal_cp_m5.media_caption a,sport_match b,zh_cn_content_item_locale c
 set a.description=c.description,a.highlight=c.highlight
  where a.media_id=b.sport_match_id+1000000 and a.lang_id=2 and b.content_item_id=c.content_item_id;
update portal_cp_m5.media_caption a,sport_match b,zh_tw_content_item_locale c
 set a.description=c.description,a.highlight=c.highlight
  where a.media_id=b.sport_match_id+1000000 and a.lang_id=3 and b.content_item_id=c.content_item_id;

update portal_cp_m5.category_caption a,content_category_locale b set a.name=b.title
   where a.category_id=208 and b.content_category_id=129 and a.lang_id=b.locale_id;
update portal_cp_m5.category_caption a,content_category_locale b set a.name=b.title
   where a.category_id=201 and b.content_category_id=131 and a.lang_id=b.locale_id;

update portal_cp_m5.category_caption a,content_category_locale b set a.name=b.title
   where a.category_id=202 and b.content_category_id=133 and a.lang_id=b.locale_id;
update portal_cp_m5.category_caption a,content_category_locale b set a.name=b.title
   where a.category_id=203 and b.content_category_id=132 and a.lang_id=b.locale_id;
update portal_cp_m5.category_caption a,content_category_locale b set a.name=b.title
   where a.category_id=212 and b.content_category_id=139 and a.lang_id=b.locale_id;

update portal_cp_m5.category_caption set description=replace(description,'http://www.chinaportal.com/chinaportal/html/modules/message.php?static=purchase','static.jsp?fn=purchase');
