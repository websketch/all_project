package com.chinaportal.portal.homepage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import com.chinaportal.portal.category.MediaView;
import com.chinaportal.portal.detail.MediaUtil;
import com.chinaportal.portal.sports.IdName;
import com.mediazone.bean.Actor;
import com.mediazone.bean.ActorCaption;
import com.mediazone.bean.Block;
import com.mediazone.bean.Category;
import com.mediazone.bean.CategoryCaption;
import com.mediazone.bean.Media;
import com.mediazone.bean.MediaCaption;
import com.mediazone.bean.Photo;
import com.mediazone.dao.BaseQuery;

public class HomePageDAO extends BaseQuery {
	private static Properties topMenus;

	private static Properties banners;

	public List getNews(Integer news_type_id,Integer lang){
		List result=new ArrayList();
		String sql="select n.news_id as news_id ,nc.title as title"+
			" from news n inner join news_caption nc on n.news_id=nc.news_id"+
			" where n.release=1 and news_type_id="+news_type_id.intValue()+" and nc.lang_id="+lang.intValue()+
			" order by n.news_id desc";
		this.setPageSize(12);
		try{
			executeJDBCQuery(sql, "1", null);
			while(rs.next()){
				IdName in = new IdName();
				in.setId(rs.getString("news_id"));
				in.setName(rs.getString("title"));
				if(in.getName()==null || in.getName().equals(""))
					continue;
				result.add(in);
			}
			rs.close();
			ps.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
			con.close();
			}catch(Exception e){
				
			}
		}
		return result;
	}
	
	public List getMoreByName(Integer lang, String name) {
		List mediaList = new ArrayList();
		name = name.toUpperCase();

		String hql = "select m from Media as m ,MediaCategory as mc where m.mediaId=mc.mediaId"
				+ "  and mc.categoryId=1 and m.release=1";
		if (name.equals("COMMING_SOON")) {
			hql += " and m.startTime>NOW() order by m.startTime, m.mediaId";
		} else {
			hql += " and m.startTime<NOW() and m.endTime>NOW()";
			if (name.equals("RECOMMEND"))
				hql += " order by mc.sort desc, m.mediaId desc";
			else if (name.equals("NEW"))
				hql += " order by m.startTime desc, m.mediaId desc";
		}

		try {
			List medias = executeQuery(hql);
			if (medias == null)
				return mediaList;
			visitMediaList(mediaList, medias, lang);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				this.closeSession();
			} catch (Exception fe) {

			}
		}
		return mediaList;
	}

	public List getRecommend(Integer lang) {
		List mediaList = new ArrayList();
		String hql = "select m.media_id ,m.name as name,mc.name as cname,mc.highlight as highlight,p.photo as photo"+
		" from ((media as m inner join media_category as mcc on m.media_id=mcc.media_id )"+
		" inner join media_caption as mc on m.media_id=mc.media_id) "+
		" inner join photo as p on m.media_id=p.media_id"+
		" where m.release=1 and m.starttime<NOW() and m.endtime>NOW() and mcc.category_id=1 and mc.lang_id="+lang.intValue()+
		" order by mcc.sort desc, m.starttime desc, m.media_id desc";
		//List conditions = new ArrayList();		
		//conditions.add(new java.sql.Date(System.currentTimeMillis()));

		try {
			//this.setPageSize(20);
			execJDBCQuery(hql, null, null);
			
			while(rs.next()){
				MediaView mv = new MediaView();
				mv.setId(rs.getString("media_id"));
				String name=rs.getString("name");
				mv.setName(rs.getString("cname"));
			    if(mv.getName()==null)
					mv.setName(name);
				mv.setHighlight(rs.getString("highlight"));
				mv.setPhoto(rs.getString("photo"));
				//getItemByJDBC(mv.getId(),mv);
				mediaList.add(mv);
			}
			rs.close();
			ps.close();
			con.close();
			for(int i=0;i<mediaList.size();i++){
				getItemByJDBC(((MediaView)mediaList.get(i)).getId(),(MediaView)mediaList.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try{
				this.close();
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return mediaList;		
	}

	public List getCommingSoonMedias(Integer lang, int pagesize) {
		List mediaList = new ArrayList();
		String hql = "select m.media_id ,m.name as name,mc.name as cname,p.photo as photo"+
				" from ((media as m inner join media_category as mcc on m.media_id=mcc.media_id )"+
				" inner join media_caption as mc on m.media_id=mc.media_id) "+	
				" inner join photo as p on m.media_id=p.media_id"+
				" where m.release=1 and m.starttime>NOW() and mcc.category_id=1 and mc.lang_id="+lang.intValue()+
				" order by m.starttime ,m.media_id";

		try {
			this.setPageSize(pagesize);			
			execJDBCQuery(hql,"1",null);
			if (rs == null)
				return mediaList;
			while(rs.next()){
				MediaView mv = new MediaView();
				mv.setId(rs.getString("media_id"));
				String name=rs.getString("name");
				mv.setName(rs.getString("cname"));
			    if(mv.getName()==null)
					mv.setName(name);
				mv.setPhoto(rs.getString("photo"));
				
				String sql = "select distinct a.actor_id as id, a.name as name, ac.name as cname"
					+ " from (actor a inner join media_actor ma on a.actor_id=ma.actor_id)"									
					+ " inner join actor_caption ac on a.actor_id=ac.actor_id"
					+ " where ma.media_id="+mv.getId()
					+ " and ac.lang_id="+lang.intValue()
					+ " and ma.position_id=1";
				PreparedStatement arps=con.prepareStatement(sql);
				ResultSet arrs=arps.executeQuery();
				String actors="";
				while(arrs.next()){
					String actor=arrs.getString("cname");
					if(actor==null)
						actor=arrs.getString("name");
					actors+=actor;
				}
				arrs.close();
				arps.close();
				mv.setActors(actors);
				
				mediaList.add(mv);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try{
				this.close();
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return mediaList;

	}

	public List getSpecial(Integer category_id, int pagesize, Integer lang) {
		List mediaList = new ArrayList();
		String hql = "select m.media_id ,m.name as name,mc.name as cname,p.photo as photo"+
		" from ((media as m inner join media_category as mcc on m.media_id=mcc.media_id )"+
		" inner join media_caption as mc on m.media_id=mc.media_id) "+
		" inner join photo as p on m.media_id=p.media_id"+
		" where m.starttime and m.starttime<NOW() and mcc.category_id=? and mc.lang_id="+lang.intValue()+
		" order by mcc.sort desc, m.starttime desc, m.media_id desc";
		List conditions = new ArrayList();		
		conditions.add(category_id.toString());
		try {
			this.setPageSize(pagesize);
			execJDBCQuery(hql, "1", conditions);
			while(rs.next()){
				MediaView mv = new MediaView();
				mv.setId(rs.getString("media_id"));
				String name=rs.getString("name");
				mv.setName(rs.getString("cname"));
			    if(mv.getName()==null)
					mv.setName(name);
				mv.setPhoto(rs.getString("photo"));
				//getItemByJDBC(mv.getId(),mv);
				mediaList.add(mv);
			}
			rs.close();
			ps.close();
			con.close();
			for(int i=0;i<mediaList.size();i++){
				getItemByJDBC(((MediaView)mediaList.get(i)).getId(),(MediaView)mediaList.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try{
				this.close();
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return mediaList;
	}

	public List getTopMenu(Integer lang) {
		if (topMenus == null)
			topMenus = new Properties();

		List result = (List) topMenus.get(lang);
		if (result != null)
			return result;

		String hql = "select b from Block as b where b.name='TOP_MENU'";
		try {
			List blocks = executeQuery(hql);
			if (blocks == null || blocks.size() < 1)
				return null;
			Block b = (Block) blocks.get(0);
			List categorys = b.getCategorys();
			if (categorys == null || categorys.size() < 1)
				return null;
			for (int i = 0; i < categorys.size(); i++) {
				Category c = (Category) categorys.get(i);
//				CategoryCaption cc = (CategoryCaption) c.getCaption(lang);

				CategoryCaption cc=null;
			      Set set = c.getCaptions();
			      Iterator iterator = set.iterator();
			      while (iterator.hasNext()) {
			        CategoryCaption cat = (CategoryCaption)iterator.next();
			         if (lang.equals(cat.getLangId())) 
				           cc = cat; 
			      }
				if (cc != null && cc.getName() != null)
					       c.setName(cc.getName());
				
//				if (cc != null && cc.getName() != null)
//					c.setName(cc.getName());
			}
			topMenus.put(lang, categorys);
			result = categorys;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				closeSession();
			} catch (Exception e) {

			}
		}
		return result;
	}

	protected void visitMediaList(List mediaList, List medias, Integer lang) {
		MediaView mv = null;
		for (int i = 0; i < medias.size(); i++) {
			mv = getDetail((Media) medias.get(i), lang);
			mediaList.add(mv);
		}
	}

	public static MediaView getDetail(Media m, Integer lang) {
		MediaView mv = new MediaView();
		mv.setId(m.getMediaId().toString());
//		MediaCaption mc = m.getCaption(lang);

 		MediaCaption mc=null;
 		Set set = m.getCaptions();
 		Iterator iterator = set.iterator();
 		while (iterator.hasNext()) {
 			MediaCaption cat = (MediaCaption) iterator.next();
 			if (lang.equals(cat.getLangId())) 
 				mc=cat;
 		}
 		    if (mc != null && mc.getName() != null)
 			    mv.setName(mc.getName());
 		    else
 			    mv.setName(m.getName());
 		    if (mc != null)
 			    mv.setHighlight(mc.getHighLight());
 		    if (mc != null && mc.getDescription() != null)
 				mv.setDescription(mc.getDescription());
 			if (mv.getDescription() != null)
 				mv.setDescription(mv.getDescription().replaceAll("\n", "<br>"));			
			if(m.getPhotos()!=null && m.getPhotos().size()>0){
				Photo p=(Photo)m.getPhotos().get(0);
				mv.setPhoto(p.getPhoto());
			}

		List actors = m.getActors();
			if (actors != null && actors.size() > 0) {
				String actor = "";
				int length = actors.size();
				for (int i = 0; i < length; i++) {
				  Actor a = (Actor) actors.get(i);				
				  ActorCaption ac=null ;
			      Set set1 = a.getCaptions();
			      Iterator iterator1 = set1.iterator();
			      while (iterator1.hasNext()) {
			        ActorCaption cat1 = (ActorCaption)iterator1.next();
			         if (lang.equals(cat1.getLangId())) 
				           ac = cat1; 
				  }
					if (ac != null && ac.getName() != null)
					    actor += ac.getName();
					else if (a.getName() != null)
					    actor += a.getName();
					if (i < length - 1)
						actor += " ";
			}
			mv.setActors(actor);
		}

		List directors = m.getDirectors();
		if (directors != null && directors.size() > 0) {
			String director = "";
			int length = directors.size();
			for (int i = 0; i < length; i++) {
				Actor a = (Actor) directors.get(i);
				  ActorCaption ac=null ;
			      Set set1 = a.getCaptions();
			      Iterator iterator1 = set1.iterator();
			      while (iterator1.hasNext()) {
			        ActorCaption cat = (ActorCaption)iterator1.next();
			         if (lang.equals(cat.getLangId())) 
				           ac = cat; 
			      }
				      if (ac != null && ac.getName() != null)
					       director += ac.getName();
				      else if (a.getName() != null)
					       director += a.getName();

			}
			mv.setDirectors(director);
		}
		MediaUtil.getItem(m, mv);
		return mv;
	}

	protected void visitComminMediaList(List mediaList, List medias,
			Integer lang) {
		MediaView mv = null;
		for (int i = 0; i < medias.size(); i++) {
			mv = getCommingDetail((Media) medias.get(i), lang);
			mediaList.add(mv);
		}
	}

	public static MediaView getCommingDetail(Media m, Integer lang) {
		MediaView mv = new MediaView();
		mv.setId(m.getMediaId().toString());
//		MediaCaption mc = m.getCaption(lang);
		
		MediaCaption mc=null;
 		Set set = m.getCaptions();
 		Iterator iterator = set.iterator();
 		while (iterator.hasNext()) {
 			MediaCaption cat = (MediaCaption) iterator.next();
 			if (lang.equals(cat.getLangId())) 
 				mc=cat;
 		}
		    if (mc != null && mc.getName() != null)
			    mv.setName(mc.getName());
		    else
			    mv.setName(m.getName());
		    if (mc != null)
		        mv.setHighlight(mc.getHighLight());
		if(m.getPhotos()!=null && m.getPhotos().size()>0){
			Photo p=(Photo)m.getPhotos().get(0);
			mv.setPhoto(p.getPhoto());
		}
		MediaUtil.getItem(m, mv);
		List actors = m.getActors();
		if (actors != null && actors.size() > 0) {
			String actor = "";
			int length = actors.size();
			for (int i = 0; i < length; i++) {
				Actor a = (Actor) actors.get(i);
//				ActorCaption ac = a.getCaption(lang);
				
				  ActorCaption ac=null ;
			      Set set1 = a.getCaptions();
			      Iterator iterator1 = set1.iterator();
			      while (iterator1.hasNext()) {
			        ActorCaption cat = (ActorCaption)iterator1.next();
			         if (lang.equals(cat.getLangId())) 
				           ac = cat; 
			      }
				      if (ac != null && ac.getName() != null)
					       actor += ac.getName();
				      else if (a.getName() != null)
					       actor += a.getName();
				if (i < length - 1)
					actor += " ";
			}
			mv.setActors(actor);
		}
		return mv;
	}

	public List getBanners(Integer active) {
		if (banners == null)
			banners = new Properties();
		if (banners.get(active) != null)
			return (List) banners.get(active);

		try {
			String hql = "select b from Banners as b where b.active="
					+ active.intValue() + " order by b.pageLocation asc";
			List result = this.executeQuery(hql);
			if (result != null)
				banners.put(active, result);
			else
				return new ArrayList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				closeSession();
			} catch (Exception e) {

			}
		}
		return (List) banners.get(active);
	}
	
	public static void getItemByJDBC(String media_id,MediaView mv){
		String sql = "select i.url as url,dc.name as name"
			+ " from item as i, distribute_channel as dc"
			+ " where i.distribute_id=dc.distribute_id and i.media_id="
			+ media_id;
		Connection con=null;
		try{
			con=ds.getConnection();
			PreparedStatement ps=con.prepareStatement(sql);			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String url=rs.getString("url");
				String dis_name=rs.getString("name");
				if ("Download".equals(dis_name)) {
					if(url.indexOf("http")!=-1){
						String temp=url.substring(0,url.lastIndexOf("/"));	
						mv.setDownloadURL(url.substring(url.lastIndexOf("/")+1,url.length()));
						mv.setDir(temp.substring(temp.lastIndexOf("/")+1,temp.length()));
					}
				} else if ("Streaming".equals(dis_name)) {
					mv.setOnlineURL(url);
				}
			}
			rs.close();
			ps.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				con.close();
			}catch(Exception e){
				
			}
		}
	}
}
