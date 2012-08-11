set names utf8;

insert into portal_cp_m5.category (category_id,name) (select content_category_id,description from content_category);
insert into portal_cp_m5.category_caption (category_id,lang_id,name,description) 
   (select content_category_id,locale_id,title,description from content_category_locale);
insert into portal_cp_m5.category_relation(category_id,parent_category_id,sort)
  (select content_category_id,parent_category_id,order_id from content_category);

insert into portal_cp_m5.distribute_channel (distribute_id,name,man_channel_id) 
  values (1,'Streaming','streaming_medium'),(2,'Download','download_channel');

insert into portal_cp_m5.media (media_id,name,`release_time`,`release`,starttime,endtime,provider_id,level)
   (select a.content_item_id,b.title,a.release_date,if(a.removed,0,1),a.from_date,a.thru_date,a.provider_id,a.av_rating
     from content_item a,zh_cn_content_item_locale b where a.content_item_id=b.content_item_id);

insert into portal_cp_m5.media (media_id,name,`release_time`,`release`,starttime,endtime,provider_id,level,leng)
    (select (a.content_item_id*400+a.content_part_id),b.title,c.release_date,if(c.removed,0,1),c.from_date,c.thru_date,c.provider_id,c.av_rating,a.length
       from content_part a,zh_cn_content_part_locale b,content_item c where a.content_item_id=b.content_item_id
          and a.content_part_id=b.content_part_id and a.content_item_id=c.content_item_id and a.content_item_id in (
     select content_item_id from content_part group by content_item_id having count(*)>1)
     );

update portal_cp_m5.media a,content_part b
    set a.leng=b.length
    where a.media_id=b.content_item_id and b.content_item_id not in (
      select content_item_id from content_part where content_part_id>1);

insert into portal_cp_m5.media_relation (media_id,parent_media_id,sort)
    (select (content_item_id*400+content_part_id),content_item_id,content_part_id from content_part
      where content_item_id in (select content_item_id from content_part group by content_item_id having count(*)>1));

insert into portal_cp_m5.media_category (media_id,category_id,sort)
    (select content_item_id,content_category_id,order_id from content_category_assoc);

insert into portal_cp_m5.lang (lang_id,name,code,`release`)
     (select locale_id,locale_desc,locale_symbol,'1' from locale);

insert into portal_cp_m5.media_caption (media_id,lang_id,name,description,highlight)
     (select content_item_id,'2',title,description,highlight from zh_cn_content_item_locale);
insert into portal_cp_m5.media_caption (media_id,lang_id,name,description)
     (select (a.content_item_id*400+a.content_part_id),'2',b.title,b.title
       from content_part a,zh_cn_content_part_locale b,content_item c where a.content_item_id=b.content_item_id
          and a.content_part_id=b.content_part_id and a.content_item_id=c.content_item_id and a.content_item_id in (
     select content_item_id from content_part group by content_item_id having count(*)>1)
     );

insert into portal_cp_m5.media_caption (media_id,lang_id,name,description,highlight)
     (select content_item_id,'1',title,description,highlight from en_us_content_item_locale);
insert into portal_cp_m5.media_caption (media_id,lang_id,name,description)
     (select (a.content_item_id*400+a.content_part_id),'1',b.title,b.title
       from content_part a,en_us_content_part_locale b,content_item c where a.content_item_id=b.content_item_id
          and a.content_part_id=b.content_part_id and a.content_item_id=c.content_item_id and a.content_item_id in (
     select content_item_id from content_part group by content_item_id having count(*)>1)
     );

insert into portal_cp_m5.media_caption (media_id,lang_id,name,description,highlight)
     (select content_item_id,'3',title,description,highlight from zh_tw_content_item_locale);
insert into portal_cp_m5.media_caption (media_id,lang_id,name,description)
     (select (a.content_item_id*400+a.content_part_id),'3',b.title,b.title
       from content_part a,zh_tw_content_part_locale b,content_item c where a.content_item_id=b.content_item_id
          and a.content_part_id=b.content_part_id and a.content_item_id=c.content_item_id and a.content_item_id in (
     select content_item_id from content_part group by content_item_id having count(*)>1)
     );

insert into portal_cp_m5.media_caption (media_id,lang_id,name,description,highlight)
     (select content_item_id,'4',title,description,highlight from th_th_content_item_locale);
insert into portal_cp_m5.media_caption (media_id,lang_id,name,description)
     (select (a.content_item_id*400+a.content_part_id),'4',b.title,b.title
       from content_part a,th_th_content_part_locale b,content_item c where a.content_item_id=b.content_item_id
          and a.content_part_id=b.content_part_id and a.content_item_id=c.content_item_id and a.content_item_id in (
     select content_item_id from content_part group by content_item_id having count(*)>1)
     );

insert into portal_cp_m5.item (item_id,media_id,man_item_id,distribute_id,url,size)
    (select '',content_item_id,man_item_id,content_channel_id,url,filesize
      from content where content_item_id not in (
      select content_item_id from content_part where content_part_id>1)
      );
insert into portal_cp_m5.item (item_id,media_id)
    (select distinct '',content_item_id from content_part where content_part_id>1);
 
insert into portal_cp_m5.item (item_id,media_id,man_item_id,distribute_id,url,size)
    (select '',(content_item_id*400+content_part_id),man_item_id,content_channel_id,url,filesize
      from content where content_item_id in (
      select content_item_id from content_part where content_part_id>1)
      );

insert into portal_cp_m5.flag (flag_id,name) (select * from content_type);
insert into portal_cp_m5.media_flag (media_id,flag_id) (select content_item_id,content_type_id from content_item);

insert into portal_cp_m5.photo (photo_id,media_id,photo) 
    (select '',content_item_id,image_name from content_item where image_name is not null and image_name!='');
insert into portal_cp_m5.photo (photo_id,category_id,photo)
    (select '',content_category_id,image_name from content_category where image_name is not null and image_name!='');
-- insert into portal_cp_m5.photo_caption