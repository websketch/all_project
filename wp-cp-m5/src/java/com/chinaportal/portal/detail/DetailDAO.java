package com.chinaportal.portal.detail;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.chinaportal.portal.category.MediaView;
import com.chinaportal.portal.comment.CommentDAO;
import com.chinaportal.portal.util.VOCache;
import com.mediazone.dao.BaseQuery;
import com.mediazone.util.TimeUtil;

public class DetailDAO extends BaseQuery {
	public synchronized MediaView  getMediaDetail(String media_id,Integer lang){
        String key = "DetailDAO.getMediaDetail(" + media_id + "," + lang + ")";
		MediaView mv = (MediaView)VOCache.getVO(key);
        if (mv != null) {
			return mv;
		}
		mv = new MediaView();
		try{
			String sql = "select mcc.category_id, m.media_id ,m.name as name,m.starttime as starttime,mc.name as cname,mc.description as description,mc.highlight as highlight,p.photo as photo"+
			" from ((media as m inner join media_category as mcc on m.media_id=mcc.media_id )"+
			" inner join media_caption as mc on m.media_id=mc.media_id) "+
			" inner join photo as p on m.media_id=p.media_id"+
			" where m.media_id="+media_id+" and mc.lang_id="+lang.intValue()+
			" order by mcc.category_id desc limit 1";
			executeJDBCQuery(sql);
			boolean showURL = false;
			while (rs.next()) {
				mv.setCategory_id(rs.getString("category_id"));
				mv.setId(rs.getString("media_id"));
				mv.setStarttime(rs.getString("starttime").substring(0,10));
				String name = rs.getString("name");
				String cname = rs.getString("cname");
				mv.setName(cname != null ? cname : name);
				mv.setDescription(rs.getString("description"));
				if(mv.getDescription()!=null)
					mv.setDescription(mv.getDescription().replaceAll("\n","<br>"));
				mv.setHighlight(rs.getString("highlight"));
				mv.setPhoto(rs.getString("photo"));
				Date mvStarttime = TimeUtil.normaDateWithTime.parse(rs.getString("starttime"));
				Date now = new Date();
				showURL = mvStarttime.before(now);
			}
			rs.close();
			ps.close();	
			con.close();
			if (showURL) {
				con=ds.getConnection();
				MediaUtil.getItemByJDBC(con,media_id,mv);
				con.close();
			}
			sql = "select distinct a.actor_id as id, a.name as name, ac.name as cname, p.position_id as position_id"
				+ " from ((actor a inner join media_actor ma on a.actor_id=ma.actor_id)"
				+ " inner join position p on ma.position_id=p.position_id)"
				+ " inner join actor_caption ac on a.actor_id=ac.actor_id"
				+ " where ma.media_id="+ media_id
				+ " and ac.lang_id=" + lang.intValue();
			executeJDBCQuery(sql);
			String actors="";
			String directors="";
			while (rs.next()) {
				String actor_id=rs.getString("id");
				String name=rs.getString("cname");
				if (name == null)
					name=rs.getString("name");
				int position_id = rs.getInt("position_id");				
				if (position_id == 1)
					actors+=name+" ";
				else
					directors+=name+" ";
			}
			rs.close();
			ps.close();
			con.close();
			mv.setActors(actors);
			mv.setDirectors(directors);
			List children=new ArrayList();
			sql="select m.media_id ,m.name as name,mc.name as cname "+
				" from (media as m inner join media_relation as mr on m.media_id=mr.media_id )"+
				" inner join media_caption as mc on m.media_id=mc.media_id "+
				" where mr.parent_media_id="+media_id+" and mc.lang_id="+lang.intValue();
			executeJDBCQuery(sql);
			List childs=new ArrayList();
			while (rs.next()) {
				MediaView child_mv = new MediaView();
				child_mv.setId(rs.getString("media_id"));
				String name = rs.getString("name");
				String cname = rs.getString("cname");
				child_mv.setName(cname != null ? cname : name);				
				childs.add(child_mv);
			}
			rs.close();
			ps.close();
			con.close();
			if (showURL) {
				for(int i=0;i<childs.size();i++){
					MediaView child_mv =(MediaView)childs.get(i);
					con=ds.getConnection();
					MediaUtil.getItemByJDBC(con,child_mv.getId(),child_mv);
					con.close();
				}
			}
			mv.setChildren(childs);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();			
				if(con!=null && !con.isClosed())
					con.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		
		try{
			mv.setLevel(CommentDAO.getAverageRateJDBC(media_id,lang.toString())+"");
		}catch(Exception e){
			e.printStackTrace();
		}
		
    	VOCache.putVO(key, mv, new Long(12*60*60*1000));
		return mv;
	}

}
