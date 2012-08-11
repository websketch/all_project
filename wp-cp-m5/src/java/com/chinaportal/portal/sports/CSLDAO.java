package com.chinaportal.portal.sports;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.chinaportal.portal.base.Context;
import com.chinaportal.portal.category.CategoryView;
import com.mediazone.bean.CategoryCaption;
import com.mediazone.bean.Media;
import com.mediazone.dao.BaseQuery;

public class CSLDAO extends BaseQuery
{
	public java.util.List getSeasonId(String parent_id, Integer lang)
	{
		List seasonList=new ArrayList();
		
		String sql = "";
		
		sql = "SELECT c.category_id , c.name AS name, cc.name AS cname " +
			  "FROM category c,category_relation cr,category_caption cc " +
		      "WHERE cr.parent_category_id='" + parent_id + "' " +
		      "AND c.category_id=cr.category_id " +
		      "AND c.category_id=cc.category_id " +
		      "AND cc.lang_id=" + lang + " "+
		      "ORDER BY c.category_id";
		
		try
		{
			executeJDBCQuery(sql, null, null);
			
			while(rs.next())
			{
				CategoryView cv = new CategoryView();
				
				String name  = rs.getString("name");
				String cname = rs.getString("cname");
				
				cv.setCategory_id(rs.getString("category_id"));
				cv.setCategory_name((cname != null ? cname: name));
				
				seasonList.add(cv);
			}	
			
			rs.close();
			ps.close();
			con.close();
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
			catch (Exception fe)
			{
				fe.printStackTrace();
			}
		}
		return seasonList;
	
	}
	
	//getCategoryList cba refer list and cba later season list
	public java.util.List getCategoryList(String parent_id, Integer lang)
	{
		List catList = new ArrayList();
		List list=new ArrayList();
		
		String sql = "";
		String sql1 = "";
		
		sql = "SELECT mc.category_id, cc.name, m.media_id, m.starttime " +
			  "FROM media m, media_category mc, category_relation cr, category_caption cc " +
			  "WHERE m.media_id=mc.media_id AND mc.category_id=cr.category_id " +
			  "AND cr.parent_category_id='" + parent_id + "' " +
			  "AND cc.lang_id=" + lang + " " +
			  "AND mc.category_id=cc.category_id " +				
			  "GROUP BY mc.category_id " +
			  "ORDER BY mc.category_id, m.starttime";
		
		try
		{
			executeJDBCQuery(sql, null, null);
			
			while(rs.next())
			{
				CategoryView mv=new CategoryView();
				mv.setCategory_id(rs.getString("media_id"));				
				list.add(mv);
			}	
			
			rs.close();
			ps.close();
			con.close();

			if (list == null || list.size() < 1) return catList;
			
			for (int i = 0; i < list.size(); i++)
			{
				CategoryView mv1=(CategoryView) list.get(i);
				SubCategoryView scv = new SubCategoryView();
				
				sql1 = "SELECT m.media_id, m.name AS name, mc.name AS cname, m.starttime AS starttime " +
					   "FROM (media AS m INNER JOIN media_category AS mcc ON m.media_id=mcc.media_id )" +
					   "INNER JOIN media_caption AS mc ON m.media_id=mc.media_id " +
					   "WHERE mc.lang_id=" + lang.intValue() + " " +
					   "AND mcc.category_id=" + mv1.getCategory_id();
				
				executeJDBCQuery(sql1);
				
				scv.setMatchs(new ArrayList());
				
				while (rs.next())
				{
					MatchView mv = new MatchView();
					
					mv.setId(rs.getString("media_id"));
					
					MatchUtil.getItemByJDBC(this.con, mv.getId(), mv);
					
					String name = rs.getString("name");
					String cname = rs.getString("cname");
					
					mv.setName(cname != null ? cname : name);
					
					String starttime=rs.getString("starttime");
					
					if(starttime!=null)
					{
						if("00:00:00".equals(starttime.substring(11,starttime.length())))
							starttime=starttime.substring(0,10);
						else
							starttime=starttime.substring(0,16);
					}
					mv.setStarttime(starttime);
					scv.getMatchs().add(mv);
				}
				rs.close();
				ps.close();
				con.close();
				
				fillMatchs(scv,lang);
				catList.add(scv);
				
				rs.close();
				ps.close();
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
			catch (Exception fe)
			{
				fe.printStackTrace();
			}
		}
		return catList;
	}

	public MatchView getWeekReferMatch(String category_id, Integer lang) {
		String sql = "select m.media_id as media_id, m.name as name, mc.name as cname ,p.photo as photo,mc.description as description"
				+ " from (((block b inner join block_element be on b.block_id=be.block_id)"
				+ " inner join media m on be.source_pk_id=m.media_id )"
				+ " inner join media_caption mc on m.media_id=mc.media_id)"
				+ " inner join photo as p on m.media_id=p.media_id"
				+ " where be.source_id =2 and b.name ='CATEGORY_"
				+ category_id
				+ "' and mc.lang_id=" + lang.intValue();
		MatchView mv = null;
		try {
			ResultSet rs = executeJDBCQuery(sql, null, null);
			while (rs.next()) {
				mv = new MatchView();
				mv.setId(rs.getString("media_id"));
				String name = rs.getString("name");
				mv.setName(rs.getString("cname"));
				if (mv.getName() == null)
					mv.setName(name);
				mv.setDescription(rs.getString("description"));
				String description = mv.getDescription();
				if (description != null && description.length() > 120) {
					description = description.substring(0, 120) + "...";
					mv.setDescription(description);
				}
				mv.setPhoto(rs.getString("photo"));

				MatchUtil.getItemByJDBC(this.con, mv.getId(), mv);
			}
			rs.close();
			ps.close();
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
		/*
		 * String hql = "select b from Block as b where b.name='CATEGORY_" +
		 * category_id.toString() + "'"; try { List blocks = executeQuery(hql);
		 * if (blocks == null || blocks.size() < 1) return mv; Block b = (Block)
		 * blocks.get(0); List medias = b.getMedias(); if (medias == null ||
		 * medias.size() < 1) return mv; Media m = (Media) medias.get(0); mv =
		 * MatchUtil.getDetail(m, lang); MatchUtil.getChannel(m, lang, mv);
		 * String description = mv.getDescription(); if (description != null &&
		 * description.length() > 120) description = description.substring(0,
		 * 120) + "..."; } catch (Exception e) { e.printStackTrace(); return
		 * null; }
		 */
		return mv;
	}

	public java.util.List getSubCategorys(String parent_id, Integer lang) {
		List catList = new ArrayList();
		Context ctx = new Context();
		try {
			CategoryView cv = ctx.getCategory(parent_id);
			List children = cv.getChildren();
			// String current=Calendar.getInstance().get(Calendar.YEAR)+"";
			String current="2005";  // All matches played in year 2005 
			if(parent_id.equals("202"))
				current="-"+Calendar.getInstance().get(Calendar.YEAR);
			for (int i = 0; i < children.size(); i++) {
				CategoryView child = (CategoryView) ctx
						.getCategory((String) children.get(i));
				if (child.getCategory_name().indexOf(current) != -1) {
					List sub_cats = child.getChildren();
					if (sub_cats.size() > 0) {
						children = sub_cats;
						break;
					}
				}
			}
	

			if (children == null || children.size() < 1)
				return catList;
			for (int i = 0; i < children.size(); i++) {
				SubCategoryView scv = new SubCategoryView();
				CategoryView child = (CategoryView) ctx
						.getCategory((String) children.get(i));
				scv.setId(child.getCategory_id());
				CategoryCaption cc = child.getCaption(lang);
				if (cc != null) {
					if (cc.getName() != null)
						scv.setName(cc.getName());
					else
						scv.setName(child.getCategory_name());
				} else
					scv.setName(child.getCategory_name());
				String sql = "select m.media_id ,m.name as name,mc.name as cname,m.starttime as starttime"
						+ " from (media as m inner join media_category as mcc on m.media_id=mcc.media_id )"
						+ " inner join media_caption as mc on m.media_id=mc.media_id "
						+ " where mc.lang_id="
						+ lang.intValue()
						+ " and mcc.category_id ="
						+ child.getCategory_id();
				executeJDBCQuery(sql);
				scv.setMatchs(new ArrayList());
				while (rs.next()) {
					MatchView mv = new MatchView();
					mv.setId(rs.getString("media_id"));
					MatchUtil.getItemByJDBC(this.con, mv.getId(), mv);
					String name = rs.getString("name");
					String cname = rs.getString("cname");
					mv.setName(cname != null ? cname : name);
					String starttime=rs.getString("starttime");
					if(starttime!=null){
						if("00:00:00".equals(starttime.substring(11,starttime.length())))
							starttime=starttime.substring(0,10);
						else
							starttime=starttime.substring(0,16);
					}
					mv.setStarttime(starttime);
					scv.getMatchs().add(mv);
				}
				rs.close();
				ps.close();
				con.close();
				fillMatchs(scv,lang);
				catList.add(scv);
				rs.close();
				ps.close();
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
		return catList;
	}

	protected void fillMatchs(SubCategoryView scv,Integer lang) throws Exception{
		for (int j = 0; j < scv.getMatchs().size(); j++) {
			String sql = "select distinct a.actor_id as id, a.name as name, ac.name as cname, p.position_id as position_id"
					+ " from ((actor a inner join media_actor ma on a.actor_id=ma.actor_id)"
					+ " inner join position p on ma.position_id=p.position_id)"
					+ " inner join actor_caption ac on a.actor_id=ac.actor_id"
					+ " where ma.media_id="
					+ ((MatchView) scv.getMatchs().get(j)).getId()
					+ " and ac.lang_id=" + lang.intValue();
			this.executeJDBCQuery(sql);
			List hosts = new ArrayList();
			List guests = new ArrayList();
			while (rs.next()) {
				IdName in = new IdName();
				in.setId(rs.getString("id"));
				in.setName(rs.getString("cname"));
				if (in.getName() == null)
					in.setName(rs.getString("name"));
				int position_id = rs.getInt("position_id");
				sql = "select actor_id from actor_relation where parent_actor_id="
						+ in.getId();
				PreparedStatement arps = con.prepareStatement(sql);
				ResultSet arrs = arps.executeQuery();
				if (arrs != null && arrs.next()) {
					in.setTeam(true);
				} else
					in.setTeam(false);
				arrs.close();
				arps.close();
				if (position_id == 18 || position_id == 4)
					hosts.add(in);
				else
					guests.add(in);

			}
			if (hosts.size() > 0)
				((MatchView) (scv.getMatchs().get(j))).setHost(hosts);
			if (guests.size() > 0)
				((MatchView) (scv.getMatchs().get(j))).setGuest(guests);
			rs.close();
			ps.close();
			con.close();
		}
	}
	/*
	 * flag=5 classic match
	 */
	public List getCWGC(String parent_id, Integer lang) {
		List catList = new ArrayList();
		String hql = "select m from Media as m,MediaCategory as mc,MediaFlag as mf "
				+ " where m.mediaId=mc.mediaId and mc.categoryId="
				+ parent_id
				+ " and m.mediaId =mf.mediaId and (mf.flagId=5 or mf.flagId=6)"
				+ " order by mf.flagId desc,m.startTime asc,m.mediaId asc";
		try {
			List medias = executeQuery(hql);
			String match_day = null;
			List matchList = new ArrayList();
			for (int i = 0; i < medias.size(); i++) {
				Media m = (Media) medias.get(i);
				MatchView mv = MatchUtil.getDetail(m, lang);
				// if(mv.getStarttime()==null || mv.getStarttime().length()<11){
				// continue;
				// }
				String match_time = mv.getStarttime();
				if (match_time != null && match_time.length() >= 11)
					match_time = match_time.substring(0, 11);
				if (i == 0)
					match_day = match_time;
				if (!match_day.equals(match_time)) {
					SubCategoryView scv = new SubCategoryView();
					scv.setName(match_day);
					scv.setMatchs(matchList);
					catList.add(scv);

					// reset
					matchList = new ArrayList();
					matchList.add(mv);
					match_day = match_time;
				} else
					matchList.add(mv);

			}
			SubCategoryView scv = new SubCategoryView();
			scv.setName(match_day);
			scv.setMatchs(matchList);
			catList.add(scv);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return catList;
	}
}
