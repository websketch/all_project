
set names utf8;

insert into category (category_id,name) values 
  (400,'Movies and TV Series'),
  (401,'TV Programs (SMG Exclusively on ChinaPortal in Northern America)'),
  (402,'Match Selections');

insert into category_relation (category_id,parent_category_id,sort) values
  (400,28,1),(401,28,2),(402,28,3);

insert into category_caption (category_id,lang_id,name) values
  (400,1,'Movies and TV Series'),
  (400,2,'影视精选'),
  (400,3,'影視精選'),
  (401,1,'TV Programs (SMG Exclusively on ChinaPortal in Northern America)'),
  (401,2,'电视专题 (上海文广北美独家播放)'),
  (401,3,'電視專題 (上海文廣北美獨家播放)'),
  (402,1,'Match Selections'),
  (402,2,'赛事节选'),
  (402,3,'賽事節選');

insert into media_category (media_id,category_id,sort) values
  (863601,400,1),(416801,400,2),(1043202,400,3),(651601,400,4),
  (2572,401,1),(2558,401,2),(2509,401,3),(2342,401,4),
  (1000366,402,1),(1000384,402,2),(1406,402,3),(1000380,402,4);

insert into distribute_channel (distribute_id,name) values
  (3,'Free');

insert into item (item_id,media_id,distribute_id,url,`release`) values
  ('',863601,3,'http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/guobayin1-384.wmv','1'),
  ('',416801,3,'http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/hanwudadi1_384.wmv','1'),
  ('',1043202,3,'http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/songlianshengzuotang04-384.cut.wmv','1'),
  ('',651601,3,'http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/xianjianqixiazhuan1-384.wmv','1'),
  ('',2572,3,'http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/32saturday384.wmv','1'),
  ('',2558,3,'http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/dichanye384.wmv','1'),
  ('',2509,3,'http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/shisannian384.wmv','1'),
  ('',2342,3,'http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/zhangxueyou384.wmv','1'),
  ('',1000366,3,'http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/asia03_384.wmv','1'),
  ('',1000384,3,'http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/chinaVSUZBK_20050910_384.wmv','1'),
  ('',1406,3,'http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/sp05050610_384Pre.wmv','1'),
  ('',1000380,3,'http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/y050822201_384.wmv','1');
