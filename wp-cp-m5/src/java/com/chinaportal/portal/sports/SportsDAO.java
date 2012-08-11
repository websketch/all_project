package com.chinaportal.portal.sports;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import com.chinaportal.portal.base.Context;
import com.chinaportal.portal.category.CategoryView;
import com.mediazone.bean.Block;
import com.mediazone.bean.Category;
import com.mediazone.bean.CategoryCaption;
import com.mediazone.bean.Media;
import com.mediazone.bean.MediaCaption;
import com.mediazone.dao.BaseBean;
import com.mediazone.dao.BaseQuery;
import com.mediazone.dao.DAOException;
import com.mediazone.util.TimeUtil;

public class SportsDAO extends BaseQuery
{
	
	public List getCategoriesMedias(String parent_id, Integer lang)
	{
		List list = new ArrayList();
		
		String sql = "";
		String categoryId = "";
		
		sql = "SELECT cr.category_id, cc.name " +
			  "FROM category_relation cr, category_caption cc " +
			  "WHERE cr.category_id=cc.category_id " +
			  "AND cr.parent_category_id=" + parent_id + " " +
			  "AND cc.lang_id=" + lang + " " +
			  "ORDER BY cr.category_id";
		
	   	try
	   	{
	   		BaseBean rs = BaseBean.queryEntity(sql);
	   		
	   		for( int i=0; i<rs.size(); i++ )
	   		{
	   			SubCategoryView cv = new SubCategoryView();
	   			
	   			categoryId = rs.getString(i,"category_id");
	   			
	   			cv.setId(categoryId);
	   			cv.setName(rs.getString(i,"name"));
	   			cv.setMatchs(getCategoryMedias(categoryId, lang));
	   			
	   			list.add(cv);
	   		}
	   	}
	   	catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
	   	finally
	   	{
			try
			{
				this.closeJDBCSession();
			}
			catch(Exception fe)
			{
				fe.printStackTrace();
			}
		}
		return list;
	}
	
	
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
	public MatchView getWeekReferMatch(String category_id, Integer lang) {

		MatchView mv = null;
		String hql = "select b from Block as b where b.name='CATEGORY_"
				+ category_id.toString() + "'";
		try {
			List blocks = executeQuery(hql);
			if (blocks == null || blocks.size() < 1)
				return mv;

			Block b = (Block) blocks.get(0);
			List medias = b.getMedias();
			if (medias == null || medias.size() < 1)
				return mv;

			Media m = (Media) medias.get(0);
			mv = MatchUtil.getDetail(m, lang);
			if(mv.getDescription()==null || mv.getDescription().equals(""))
				mv.setDescription(mv.getHighlight());
			if (mv.getDescription() != null && mv.getDescription().length() > 120)
				mv.setDescription(mv.getDescription().substring(0, 120) + "...");
			
			MatchUtil.getChannel(m, lang, mv);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				this.closeSession();
			} catch (DAOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return mv;
	}

	public String getSportsBlock(String category_id, Integer lang) {
		String body = "";
		String hql = "select b from Block as b where b.name='CATEGORY_"
				+ category_id.toString() + "'";
		try {
			List blocks = executeQuery(hql);
			if (blocks == null || blocks.size() < 1)
				return body;
			List articles = null;
//			List articles = b.getArticles();
			if (articles == null || articles.size() < 1)
				return "";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return body;
	}
	public List getCategory(String parent_id, Integer lang)
	{
		List list = new ArrayList();
		
		String sql = "";
		String categoryId = "";
		
		sql = "SELECT cr.category_id, cc.name " +
			  "FROM category_relation cr, category_caption cc " +
			  "WHERE cr.category_id=cc.category_id " +
			  "AND cr.parent_category_id=" + parent_id + " " +
			  "AND cc.lang_id=" + lang + " " +
			  "ORDER BY cr.category_id";
		
	   	try
	   	{
	   		BaseBean rs = BaseBean.queryEntity(sql);
	   		
	   		for( int i=0; i<rs.size(); i++ )
	   		{
	   			CategoryView cv = new CategoryView();
	   			
	   			categoryId = rs.getString(i,"category_id");
	   			
	   			cv.setCategory_id(categoryId);
	   			cv.setCategory_name(rs.getString(i,"name"));
	   			
	   			String startTime = getCategoryTime(categoryId);
	   			//System.out.println(startTime);
	   			if( startTime == null ) startTime = "";
				cv.setStartTime(startTime);
				
	   			list.add(cv);
	   		}
	   	}
	   	catch (Exception e) 
		{
			e.printStackTrace();
			return null;
		}
	   	finally
	   	{
			try
			{
				this.closeJDBCSession();
			}
			catch(Exception fe)
			{
				fe.printStackTrace();
			}
		}
		return list;
	
	}
	public String getCategoryTime(String category_id)
	{
		String sql = "";
		String startTime = "";
		
		sql = "SELECT m.starttime AS starttime FROM media AS m, media_category AS mc " +
			  "WHERE m.media_id=mc.media_id " +
			  "AND category_id=" + category_id + " " +
			  "ORDER BY m.starttime ASC LIMIT 1";
		
		try
		{
			BaseBean rs = BaseBean.queryEntity(sql);
			
			if( rs.size() > 0 )
			{
				startTime = rs.getString(0, "starttime");
				
				if( startTime == null ) startTime = "";	
			}
			//System.out.println(startTime);  
			return startTime;
       }
	   catch (Exception e) 
	   {
	        e.printStackTrace();
       }
	   return startTime;
	}
	
	public List getMediaBlock(String blockName, Integer lang) {
		List matchs = new ArrayList();
		
		String sql = "select m.media_id ,m.name as name,mc.name as cname, ph.photo as photo " +
		" from ((block b inner join block_element be on b.block_id=be.block_id)" +
		" inner join media m on be.source_pk_id=m.media_id )" +
		" inner join media_caption mc on m.media_id=mc.media_id" +
		" left join photo ph on ph.media_id=m.media_id " + 
		" where be.source_id =2 and b.name ='"+blockName+"' and mc.lang_id="+lang.intValue();
		
		try {
			executeJDBCQuery(sql, null, null);
			while(rs.next()){
				MatchView mv=new MatchView();
				mv.setId(rs.getString("media_id"));				
				
				//if((mv.getOnlineURL()==null||mv.getOnlineURL().equals("")) && (mv.getDownloadURL()==null || mv.getDownloadURL().equals("")))
				//	continue;	
				
				
				String name=rs.getString("name");
				String cname=rs.getString("cname");
				mv.setName(cname!=null ? cname:name);
				mv.setPhoto(rs.getString("photo"));
				matchs.add(mv);
			}
			rs.close();
			ps.close();
			con.close();
			for(int i=0;i<matchs.size();i++){
				MatchView mv=(MatchView)matchs.get(i);
				con=ds.getConnection();
				MatchUtil.getItemByJDBC(this.con,mv.getId(),mv);
				con.close();
			}
			for(int i=0;i<matchs.size();i++){
				sql = "select a.actor_id as id, a.name as name, ac.name as cname, p.position_id as position_id"
					+ " from ((actor a inner join media_actor ma on a.actor_id=ma.actor_id)"
					+ " inner join position p on ma.position_id=p.position_id)"
					+ " inner join actor_caption ac on a.actor_id=ac.actor_id"
					+ " where ma.media_id="+((MatchView)matchs.get(i)).getId()
					+ " and ac.lang_id="+lang.intValue();
				this.executeJDBCQuery(sql);
				List hosts = new ArrayList();
				List guests = new ArrayList();
				while(rs.next()){
					IdName in = new IdName();
					in.setId(rs.getString("id"));
					in.setName(rs.getString("cname"));
					if(in.getName()==null)
						in.setName(rs.getString("name"));
					int position_id=rs.getInt("position_id");
					if(position_id==18 || position_id==4)						
						hosts.add(in);
					else
						guests.add(in);					
				}
				if(hosts.size()>0)
					((MatchView)(matchs.get(i))).setHost(hosts);
				if(guests.size()>0)
					((MatchView)(matchs.get(i))).setGuest(guests);
				rs.close();
				ps.close();
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try{
				this.closeJDBCSession();
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
		return matchs;
	}
	
	public List getCategoryMedias(String category_id, Integer langId)
	{
		List scv = new ArrayList();
//		SubCategoryView scv = new SubCategoryView();
		String sql="";
		sql = "select m.media_id ,m.name as name,mc.name as cname,m.starttime as starttime"+
		" from (media as m inner join media_category as mcc on m.media_id=mcc.media_id )"+
		" inner join media_caption as mc on m.media_id=mc.media_id "+
		" where mc.lang_id="+langId+" and m.starttime<NOW() and mcc.category_id="+category_id+
		" order by m.starttime desc";
		try{
		rs=executeJDBCQuery(sql, null, null);
		while(rs.next()){
			MatchView mv=new MatchView();
			mv.setId(rs.getString("media_id"));
			String cname=rs.getString("cname");
			mv.setName(cname!=null ? cname:"");
			mv.setStarttime(rs.getString("starttime"));
			scv.add(mv);
		}
		rs.close();
		ps.close();
		con.close();
		for(int i=0;i<scv.size();i++){
			MatchView mv=(MatchView)(scv.get(i));
			con=ds.getConnection();
			MatchUtil.getItemByJDBC(this.con,mv.getId(),mv);
			con.close();
		}

		for(int i=0;i<scv.size();i++){
			sql = "select a.actor_id as id, a.name as name, ac.name as cname, p.position_id as position_id"
				+ " from ((actor a inner join media_actor ma on a.actor_id=ma.actor_id)"
				+ " inner join position p on ma.position_id=p.position_id)"
				+ " inner join actor_caption ac on a.actor_id=ac.actor_id"
				+ " where ma.media_id="+((MatchView)scv.get(i)).getId()
				+ " and ac.lang_id="+langId;
			this.executeJDBCQuery(sql);
			List hosts = new ArrayList();
			List guests = new ArrayList();
			while(rs.next()){
				IdName in = new IdName();
				in.setId(rs.getString("id"));
				in.setName(rs.getString("cname"));
				if(in.getName()==null)
					in.setName(rs.getString("name"));
				int position_id=rs.getInt("position_id");					
				if(position_id==18 || position_id==4){						
					hosts.add(in);
				  ((MatchView)(scv.get(i))).setHost_id(rs.getString("id"));
				}
				else
					guests.add(in);	
				    ((MatchView)(scv.get(i))).setVisiting_id(rs.getString("id"));
			}
			rs.close();
			ps.close();
			con.close();
			for(int j=0;j<hosts.size();j++){
				IdName in =(IdName)hosts.get(j);
				sql="select actor_id from actor_relation where parent_actor_id="+in.getId();
				con=ds.getConnection();
				PreparedStatement arps=con.prepareStatement(sql);
				ResultSet arrs=arps.executeQuery();
				if(arrs!=null && arrs.next()){
					in.setTeam(true);
				}else
					in.setTeam(false);
				arrs.close();
				arps.close();
				con.close();
			}
			for(int j=0;j<guests.size();j++){
				IdName in =(IdName)guests.get(j);
				sql="select actor_id from actor_relation where parent_actor_id="+in.getId();
				con=ds.getConnection();
				PreparedStatement arps=con.prepareStatement(sql);
				ResultSet arrs=arps.executeQuery();
				if(arrs!=null && arrs.next()){
					in.setTeam(true);
				}else
					in.setTeam(false);
				arrs.close();
				arps.close();
				con.close();
			}
			if(hosts.size()>0)
				
				((MatchView)(scv.get(i))).setHost(hosts);
			if(guests.size()>0)
				((MatchView)(scv.get(i))).setGuest(guests);
			rs.close();
			ps.close();
		}
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	}finally{
		try{
			this.closeJDBCSession();
		}catch(Exception fe){
			fe.printStackTrace();
		}
	}		
	return scv;
	}

	public SubCategoryView getCategoryBlock(String blockName, Integer lang) {
		SubCategoryView scv = new SubCategoryView();
	
		String sql = "select be.source_pk_id" +
		" from block b inner join block_element be on b.block_id=be.block_id" +
		" where be.source_id =4 and b.name='" + blockName+"'";
		Context ctx=new Context();
		try{
			executeJDBCQuery(sql, null, null);			
			if(rs.next()){
				String category_id=rs.getString(1);				
				CategoryView cv=ctx.getCategory(category_id);
				CategoryCaption cc = cv.getCaption(lang);
				scv.setId(category_id);
				scv.setName(cc.getName() != null?cc.getName():cc.getName());			
			}
			rs.close();
			ps.close();
			con.close();
			sql = "select m.media_id ,m.name as name,mc.name as cname,m.starttime as starttime"+
			" from (media as m inner join media_category as mcc on m.media_id=mcc.media_id )"+
			" inner join media_caption as mc on m.media_id=mc.media_id "+
			" where mc.lang_id="+lang.intValue()+" and m.starttime<NOW() and mcc.category_id="+scv.getId()+
			" order by m.starttime desc";
		
			rs=executeJDBCQuery(sql, null, null);
			scv.setMatchs(new ArrayList());
			while(rs.next()){
				MatchView mv=new MatchView();
				mv.setId(rs.getString("media_id"));
				
				
				//if((mv.getOnlineURL()==null||mv.getOnlineURL().equals("")) && (mv.getDownloadURL()==null || mv.getDownloadURL().equals("")))
				//	continue;				
				
				String name=rs.getString("name");
				String cname=rs.getString("cname");
				mv.setName(cname!=null ? cname:name);
				mv.setStarttime(TimeUtil.getWholeWithoutSecond(rs.getDate("starttime")));
				scv.getMatchs().add(mv);
			}
			rs.close();
			ps.close();
			con.close();
			for(int i=0;i<scv.getMatchs().size();i++){
				MatchView mv=(MatchView)(scv.getMatchs().get(i));
				con=ds.getConnection();
				MatchUtil.getItemByJDBC(this.con,mv.getId(),mv);
				con.close();
			}

			for(int i=0;i<scv.getMatchs().size();i++){
				sql = "select a.actor_id as id, a.name as name, ac.name as cname, p.position_id as position_id"
					+ " from ((actor a inner join media_actor ma on a.actor_id=ma.actor_id)"
					+ " inner join position p on ma.position_id=p.position_id)"
					+ " inner join actor_caption ac on a.actor_id=ac.actor_id"
					+ " where ma.media_id="+((MatchView)scv.getMatchs().get(i)).getId()
					+ " and ac.lang_id="+lang.intValue();
				this.executeJDBCQuery(sql);
				List hosts = new ArrayList();
				List guests = new ArrayList();
				while(rs.next()){
					IdName in = new IdName();
					in.setId(rs.getString("id"));
					in.setName(rs.getString("cname"));
					if(in.getName()==null)
						in.setName(rs.getString("name"));
					int position_id=rs.getInt("position_id");					
					if(position_id==18 || position_id==4)						
						hosts.add(in);
					else
						guests.add(in);					
				}
				rs.close();
				ps.close();
				con.close();
				for(int j=0;j<hosts.size();j++){
					IdName in =(IdName)hosts.get(j);
					sql="select actor_id from actor_relation where parent_actor_id="+in.getId();
					con=ds.getConnection();
					PreparedStatement arps=con.prepareStatement(sql);
					ResultSet arrs=arps.executeQuery();
					if(arrs!=null && arrs.next()){
						in.setTeam(true);
					}else
						in.setTeam(false);
					arrs.close();
					arps.close();
					con.close();
				}
				for(int j=0;j<guests.size();j++){
					IdName in =(IdName)guests.get(j);
					sql="select actor_id from actor_relation where parent_actor_id="+in.getId();
					con=ds.getConnection();
					PreparedStatement arps=con.prepareStatement(sql);
					ResultSet arrs=arps.executeQuery();
					if(arrs!=null && arrs.next()){
						in.setTeam(true);
					}else
						in.setTeam(false);
					arrs.close();
					arps.close();
					con.close();
				}
				if(hosts.size()>0)
					((MatchView)(scv.getMatchs().get(i))).setHost(hosts);
				if(guests.size()>0)
					((MatchView)(scv.getMatchs().get(i))).setGuest(guests);
				rs.close();
				ps.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try{
				this.closeJDBCSession();
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}		
		return scv;
	}

	public java.util.List getSubCategorys(String parent_id, Integer lang) {
		List catList = new ArrayList();
		String hql = "select c from Category as c,CategoryRelation as cr"
				+ " where c.categoryId=cr.categoryId"
				+ " and cr.parentCategoryId=" + parent_id
				+ " order by cr.sort asc";
		try {
			List cats = executeQuery(hql);
			if (cats == null || cats.size() < 1)
				return catList;
			for (int i = 0; i < cats.size(); i++) {
				SubCategoryView scv = new SubCategoryView();
				Category c = (Category) cats.get(i);
				scv.setId(c.getCategoryId().toString());
//				CategoryCaption cc = c.getCaption(lang);
				
				  CategoryCaption cc =null;
			      Set set =c.getCaptions();
			      Iterator iterator = set.iterator();
			      while (iterator.hasNext()) {
			        CategoryCaption cat = (CategoryCaption)iterator.next();
			         if (lang.equals(cat.getLangId())) 
				          cc= cat;
			     }
				
				if (cc != null) {
					if (cc.getName() != null)
						scv.setName(cc.getName());
					else
						scv.setName(c.getName());
				}
				catList.add(scv);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return catList;
	}

	public java.util.List getCommingGame(String blockName, Integer lang) {
		List gameList = new ArrayList();
		String hql = "select b from Block as b where b.name='" + blockName
				+ "'";

		try {
			List blocks = executeQuery(hql);
			if (blocks == null || blocks.size() < 1)
				return null;
			Block b = (Block) blocks.get(0);
			List categorys = b.getCategorys();
			for (int i = 0; i < categorys.size(); i++) {
				MatchView mv = new MatchView();
				Category c = (Category) categorys.get(i);
//				CategoryCaption cc = c.getCaptions(lang);
				
				
				  CategoryCaption cc=null;
			      Set set =c.getCaptions();
			      Iterator iterator = set.iterator();
			      while (iterator.hasNext()) {
			        CategoryCaption cat = (CategoryCaption)iterator.next();
			         if (lang.equals(cat.getLangId())) 
				        cc= cat; 
			     }
				
				if (cc != null) {
					if (cc.getName() != null)
						mv.setName(cc.getName());
					else
						mv.setName(c.getName());
				}
				List medias = c.getMedias();
				// Collections.sort(medias);
				String startTime = TimeUtil
						.getMonthDate(((Media) medias.get(0)).getStartTime());
				String endTime = TimeUtil.getMonthDate(((Media) medias
						.get(medias.size() - 1)).getStartTime());
				mv.setTime(startTime + "-" + endTime);
				gameList.add(mv);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				this.closeSession();
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
		return gameList;
	}

	public List getNewMaths(Integer lang) {
		List gameList = new ArrayList();
		String sql = "select be.source_pk_id"
				+ " from block b inner join block_element be on b.block_id=be.block_id"
				+ " where be.source_id =4 and b.name ='Sports_New_Game'";
		Context ctx = new Context();
		try {
			executeJDBCQuery(sql, null, null);
			String ids = "";
			Properties p = new Properties();
			while (rs.next()) {
				String category_id = rs.getString(1);
				CategoryView cv = ctx.getCategory(category_id);
				CategoryCaption cc = cv.getCaption(lang);
				String catName = "";
				if (cc != null && cc.getName() != null)
					catName = cc.getName();
				else
					catName = cv.getCategory_name();
				catName = "(" + catName + ")";
				List children = cv.getChildren();
				for (int j = 0; j < children.size(); j++) {
					CategoryView child = (CategoryView) ctx
							.getCategory((String) children.get(j));
					if (child.getCategory_name().indexOf(
							Calendar.getInstance().get(Calendar.YEAR) + "") != -1) {
						List sub_cats = child.getChildren();
						for (int k = 0; k < sub_cats.size(); k++) {
							String child_id = (String) sub_cats.get(k);
							p.put(child_id, catName);
							ids += child_id.toString() + ",";
						}
						break;
					}
				}
			}
			rs.close();
			ps.close();
			con.close();
			if (ids.length() > 0) {
				ids = "mcc.category_id IN (" + ids.substring(0, ids.length() - 1) + ")";
			} else {
				ids = "false";
			}
			sql = "select m.media_id ,m.name as name,mc.name as cname,m.starttime as starttime,mcc.category_id as cid"
					+ " from (media as m inner join media_category as mcc on m.media_id=mcc.media_id )"
					+ " inner join media_caption as mc on m.media_id=mc.media_id "
					+ " where mc.lang_id="
					+ lang.intValue()
					+ " and m.starttime<NOW() and " + ids + " order by m.starttime desc";
				executeJDBCQuery(sql);

			while (rs.next()) {
				MatchView mv = new MatchView();
				mv.setId(rs.getString("media_id"));
				MatchUtil.getItemByJDBC(this.con, mv.getId(), mv);
				/*
				if ((mv.getOnlineURL() == null || mv.getOnlineURL().equals(""))
						&& (mv.getDownloadURL() == null || mv.getDownloadURL()
								.equals("")))
					continue;
					*/
				String name = rs.getString("name");
				String cname = rs.getString("cname");
				String category_id=rs.getString("cid");
				mv.setName(p.getProperty(category_id)+(cname != null ? cname : name));
				mv.setStarttime(TimeUtil.getWholeWithoutSecond(rs
						.getDate("starttime")));
				gameList.add(mv);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				this.closeJDBCSession();
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
		return gameList;
	}

	public void addBySort(List gameList, Category c, Integer lang) {

		String catName = "";
//		CategoryCaption cc = c.getCaption(lang);
		  
		  CategoryCaption cc=null;
	      Set set =c.getCaptions();
	      Iterator iterator = set.iterator();
	      while (iterator.hasNext()) {
	        CategoryCaption cat = (CategoryCaption)iterator.next();
	         if (lang.equals(cat.getLangId())) 
		        cc= cat; 
	     }
		
		if (cc != null && cc.getName() != null)
			catName = cc.getName();
		else
			catName = c.getName();
		catName = "(" + catName + ")";
		List cats = c.getChildren();
		for (int i = 0; i < cats.size(); i++) {
			Category child = (Category) cats.get(i);
			if (child.getName().indexOf(
					Calendar.getInstance().get(Calendar.YEAR) + "") != -1) {
				List sub_cats = child.getChildren();
				if (sub_cats.size() > 0) {
					cats = sub_cats;
					break;
				}

			}
		}
		for (int i = 0; i < cats.size(); i++) {
			Category child = (Category) cats.get(i);
			List medias = child.getMedias();
			System.out.println(catName + child.getName() + "=" + medias.size());

			for (int j = 0; j < medias.size(); j++) {
				MatchView mv = new MatchView();
				Media m = (Media) medias.get(j);
				mv.setId(m.getMediaId().toString());
//				MediaCaption mc = m.getCaptions(lang);
				
				
				MediaCaption mc=null;
				Set set1 =m.getCaptions();
				Iterator iterator1 = set1.iterator();
				while (iterator.hasNext()) {
					MediaCaption cat = (MediaCaption) iterator1.next();
					if (lang.equals(cat.getLangId()))
						mc= cat;					
				}
				
				
				if (mc != null && mc.getName() != null)
					mv.setName(catName + mc.getName());
				else
					mv.setName(catName + m.getName());
				if (m.getStartTime() != null)
					mv.setStarttime(TimeUtil.getWholeWithoutSecond(m
							.getStartTime()));
				else
					mv.setStarttime("");
				MatchUtil.getItem(m, mv);
				gameList.add(mv);
			}
		}
	}
}
