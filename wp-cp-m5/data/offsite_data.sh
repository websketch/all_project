#!/bin/bash

function imp2cpm4_func() 
{
    mysql --user=$1 --password=$2 --host=$3 --execute=" \
          drop database if exists portal_cp_m4; \
          create database portal_cp_m4; \
          use portal_cp_m4; \
          source $4/cpm4_model_utf8.sql; \
          source $5/cp_data_en_us_locale.sql; \
          set names gbk; \
          source $5/cp_data_content.sql; \
          source $5/cp_data_zh_cn_locale.sql; \
          set names big5; \
          source $5/cp_data_zh_tw.sql; \
          set names tis620; \
          source $5/cp_data_th_th_locale.sql; "
}

function mapping_cpm4tocpm5_func()	
{
    mysql --user=$1 --password=$2 --host=$3 --execute=" \
          drop database if exists portal_cp_m5; \
          create database portal_cp_m5; \
          use portal_cp_m5; \
          source $4/mzus_model_utf8.sql; \
          use portal_cp_m4; \
          drop table if exists top_banner_bak; \
          create table top_banner_bak (select * from top_banner); \
          source modify_banners.sql; \
          source modify_mzus_model1.sql; \
          source mapping_content2.sql; \
          source mapping_actor3.sql; \
          source mapping_wttc4.sql; \
          source mapping_sports5.sql; \
          source mapping_other6.sql; \
          source cls_mapping_data7.sql; \
          use portal_cp_m5; \
          set names utf8; \
          source add_block.sql; \
          drop table portal_cp_m4.top_banner; \
          alter table portal_cp_m4.top_banner_bak rename to top_banner; \
	  source add_data.sql; "
}

function mapping_cpm5toudb_func ()
{
    mysql --user=$1 --password=$2 --host=$3 --execute=" \
        drop database if exists $5; \
        create database $5; \
        use $5; \
        source udb_model.sql; \
        source mapping_cpm5_udb.sql; "
}


function dump_content_data_func()
{
    mysqldump --user=$1 --password=$2 --host=$3 --no-create-info $4 \
              actor actor_caption actor_relation actor_score article \
              attribute attribute_caption banner_clicks banner_impressions \
              country country_caption crm currency distribute_channel \
              field field_caption field_category flag flag_caption \
              function item lang media media_actor media_attribute \
              media_caption media_category media_flag media_relation \
              media_service photo photo_caption policy position position_caption \
              preview preview_caption price_policy provider provider_caption \
              provider_crm role role_function role_relation scoretype \
              scoretype_caption search source table_role user_admin user_role\
              >$5/cpm5_content_data.temp
    sed 's/INSERT/REPLACE/g' $5/cpm5_content_data.temp > $5/cpm5_content_data.sql
    rm $5/cpm5_content_data.temp
}

function dump_offsite_data_func()
{
    mysqldump --user=$1 --password=$2 --host=$3 --add-drop-table $4 \
              category category_caption category_relation block block_element banners \
              actor actor_caption actor_relation actor_score article \
              attribute attribute_caption \
              country country_caption crm currency distribute_channel \
              field field_caption field_category flag flag_caption \
              function item lang media media_actor media_attribute \
              media_caption media_category media_flag media_relation \
              media_service photo photo_caption policy position position_caption \
              preview preview_caption price_policy provider provider_caption \
              provider_crm scoretype scoretype_caption search source \
              >$5/cpm5_offsite_data.dmp
}

function dump_category_func()
{
    mysqldump -u$1 -p$2 -h$3 --add-drop-table $4 \
              category category_caption category_relation block block_element banners \
              >$5/cpm5_category.sql
}

function dump_all_func()
{
    mysqldump --user=$1 --password=$2 --host=$3 --no-data $4 >$5/cpm5_model.sql
    mysqldump --user=$1 --password=$2 --host=$3 --no-create-info $4 >$5/cpm5_all_data.sql
}

function dump_stv_data_func()
{
    mysqldump -u$1 -p$2 -h$3 --no-create-info $4 \
              --where="media_id in (945,946,1164,1227)" \
              media media_caption > $5/cpm5_stv_data.temp
    sed 's/INSERT/REPLACE/g' $5/cpm5_stv_data.temp > $5/cpm5_stv_data.sql
    rm -f $5/cpm5_stv_data.temp
}

function sync_gb2big5_func()
{
    mysqldump -u$1 -p$2 -h$3  $4 --no-create-info \
             actor_caption attribute_caption category_caption country_caption field_caption \
             flag_caption media_caption news_caption photo_caption position_caption \
             preview_caption provider_caption scoretype_caption --where='lang_id=2' \
             > begin.dmp
    autogb --input utf8 --output gb < begin.dmp >cp_zh_cn_gb.dmp 
    autogb --input gb --output big5 < cp_zh_cn_gb.dmp >cp_zh_cn_big5.dmp
    autogb --input big5 --output utf8 < cp_zh_cn_big5.dmp >cp_zh_cn_utf8.dmp
    sed 's/,2,/,3,/g' cp_zh_cn_utf8.dmp >cp_zh_tw_utf8.dmp
    sed 's/INSERT INTO/REPLACE INTO/g' cp_zh_tw_utf8.dmp > last.dmp
    mysql -u$1 -p$2 -h$3  $4 <last.dmp
    rm -f begin.dmp
    rm -f cp_zh_cn_gb.dmp
    rm -f cp_zh_cn_big5.dmp
    rm -f cp_zh_cn_utf8.dmp
    rm -f cp_zh_tw_utf8.dmp
    rm -f last.dmp
}

# MAIN
user=wangxinlin
password=123456
host=127.0.0.1
database=portal_cp_m5
udbname=udb
db_model_path=./model
from_cpm4_data_path=../../portal-cp-data/cpm4_data
to_cpm5_data_path=../../portal-cp-data/cpm5_data
date;
case "$1" in
    imp2cpm4)
        imp2cpm4_func ${user} ${password} ${host} ${db_model_path} ${from_cpm4_data_path}
        ;;
    mapping)
        mapping_cpm4tocpm5_func ${user} ${password} ${host} ${db_model_path}
        ;;
    udb_mapping)
        mapping_cpm5toudb_func ${user} ${password} ${host} ${database} ${udbname}
        ;;
    dump_stv)
        dump_stv_data_func ${user} ${password} ${host} ${database} ${to_cpm5_data_path}
        ;;
    dump_content)
        dump_category_func ${user} ${password} ${host} ${database} ${to_cpm5_data_path}
        dump_content_data_func ${user} ${password} ${host} ${database} ${to_cpm5_data_path}
        ;;
    dump_all)
        dump_all_func ${user} ${password} ${host} ${database} ${to_cpm5_data_path}
        ;;
    dump_weekly)
        dump_content_data_func ${user} ${password} ${host} ${database} ${to_cpm5_data_path}
        ;;
    dump_category)
        dump_category_func ${user} ${password} ${host} ${database} ${to_cpm5_data_path}
        ;;
    dump_offsite)
        dump_offsite_data_func ${user} ${password} ${host} ${udbname} ${to_cpm5_data_path}
        ;;
    gb2big5)
        sync_gb2big5_func ${user} ${password} ${host} ${database}
        ;;
    *)
        echo "Usage:
        offsite_data.sh [imp2cpm4|mapping|udb_mapping|dump_stv|dump_content|dump_all|dump_weekly|dump_category|dump_offsite|gb2big5]"
	;;
esac
date;
