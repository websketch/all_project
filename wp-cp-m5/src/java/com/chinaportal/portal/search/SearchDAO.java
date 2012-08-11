/*
 * Created on 2005-8-1
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.chinaportal.portal.category.MediaView;
import com.chinaportal.portal.detail.MediaUtil;
import com.mediazone.bean.Actor;
import com.mediazone.bean.ActorCaption;
import com.mediazone.bean.Media;
import com.mediazone.bean.MediaCaption;
import com.mediazone.bean.Photo;
import com.mediazone.dao.BaseQuery;
import com.mediazone.dao.DAOException;
import com.mediazone.exception.ServiceException;
import com.mediazone.util.DBUtil;
import com.mediazone.util.HibernateUtil;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class SearchDAO extends BaseQuery{
	
	/**
	 * @param key
	 * @param lang
	 * @return
	 * @throws Exception
	 */
	public Collection queryMedia(String key, Integer lang) throws Exception{
		List mediaList = new ArrayList();
		List medias = new ArrayList();
		String sql =""+
		"select media_id from media where name like ? "+
		"union "+
		"select distinct media_id from media_caption where lang_id ='"+lang+"' and name like ? "+
		"or description like ? or highlight like ? "+
		"union "+
		"select distinct a.media_id from media a,actor b,media_actor c "+
		"where a.media_id=c.media_id and b.actor_id=c.actor_id and b.name like ? "+
		"union "+
		"SELECT distinct a.media_id from media a,actor_caption b,media_actor c " +
		"where b.lang_id ='"+lang+"' and a.media_id=c.media_id and b.actor_id=c.actor_id and b.name like ? " ;

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+key+"%");
			pstmt.setString(2,"%"+key+"%");
			pstmt.setString(3,"%"+key+"%");
			pstmt.setString(4,"%"+key+"%");
			pstmt.setString(5,"%"+key+"%");
			pstmt.setString(6,"%"+key+"%");
			rs = pstmt.executeQuery();
			while(rs.next()){
				int media_id_int = rs.getInt("media_id");
				String media_id = Integer.toString(media_id_int);
				medias.add(media_id);
			}
		}catch(ServiceException se){
			throw new DAOException(se);
		}catch (SQLException se) {
			throw new DAOException(se);
		}finally{
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.closeConnection(conn);
		}
		for(int j=0; j<medias.size(); j++){
			MediaView mv = getDetailByMediaId((String)medias.get(j), lang);
			mediaList.add(mv);
		}
		return mediaList;
	}
	
	protected void visitMediaList(List mediaList, List medias, Integer lang) {
		MediaView mv = null;
		for (int i = 0; i < medias.size(); i++) {
			mv = getDetail((Media)medias.get(i),lang);
			mediaList.add(mv);
		}
	}
	
	/**
	 * Media to MediaView, see MediaUtil.getDetail
	 * @param m
	 * @param lang
	 * @return
	 */
	public MediaView getDetail(Media m,Integer lang){
		MediaView mv = new MediaView();
		mv.setId(m.getMediaId().toString());
//		MediaCaption mc = m.getCaptions(lang);
		
		MediaCaption mc=null;
		Set set = m.getCaptions();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			    MediaCaption cat = (MediaCaption) iterator.next();
			if (lang.equals(cat.getLangId())) 
			     mc = cat;
			}
		       if (mc != null && mc.getName() != null)
			     mv.setName(mc.getName());
		       else
			     mv.setName(m.getName());
		       if(mc!=null && mc.getHighLight()!=null)
			     mv.setHighlight(mc.getHighLight());

	   if (mv.getName()==null) 
		   mv.setName(m.getName());
		
//		if (mc != null && mc.getName() != null)
//			mv.setName(mc.getName());
//		else
//			mv.setName(m.getName());
//		mv.setPhoto(m.getPhoto());
		
		if(m.getPhotos()!=null && m.getPhotos().size()>0){
			Photo p=(Photo)m.getPhotos().get(0);
			mv.setPhoto(p.getPhoto());
		}
		
		
		mv.setDescription(mc.getDescription());
		if(mv.getDescription()!=null)
			mv.setDescription(mv.getDescription().replaceAll("\n","<br>"));
//		mv.setHighlight(mc.getHighlight());

		List actors = m.getActors();
		if (actors != null && actors.size()>0) {
			String actor = "";
			int length = actors.size();
			for (int i = 0; i < length; i++) {
				Actor a = (Actor) actors.get(i);
//				ActorCaption ac = a.getCaption(lang);
				
				ActorCaption ac=null;
				Set set1 = a.getCaptions();
				Iterator iterator1 = set1.iterator();
				while (iterator1.hasNext()) {
					ActorCaption cat = (ActorCaption) iterator1.next();
					if (lang.equals(cat.getLangId())) 
						   ac = cat;
					}
				       if (ac != null && ac.getName() != null)
					       actor += ac.getName();
				       else if (a.getName() != null)
					      actor += a.getName();
			
				
//				if (ac != null && ac.getName() != null)
//					actor += ac.getName();
//				else if (a.getName() != null)
//					actor += a.getName();
				if (i < length - 1)
					actor += " ";
			}
			mv.setActors(actor);
		}

		List directors = m.getDirectors();
		if (directors != null && directors.size()>0) {
			String director = "";
			int length = directors.size();
			for (int i = 0; i < length; i++) {
				Actor a = (Actor) directors.get(i);
//				ActorCaption ac = a.getCaption(lang);
				
				ActorCaption ac=null;
				Set set1 = a.getCaptions();
				Iterator iterator1 = set1.iterator();
				while (iterator1.hasNext()) {
					ActorCaption cat = (ActorCaption) iterator1.next();
					if (lang.equals(cat.getLangId())) 
						   ac = cat;
				}
				       if (ac != null && ac.getName() != null)
					       director += ac.getName();
				       else if (a.getName() != null)
					       director += a.getName();
				
				
//				
//				if (ac != null && ac.getName() != null)
//					director += ac.getName();
//				else if (a.getName() != null)
//					director += a.getName();
			}
			mv.setDirectors(director);
		}

		MediaUtil.getItem( m, mv);
		
		return mv;
	}
	
	public MediaView getDetailByMediaId(String media_id, Integer lang) throws DAOException{
		MediaView mv = null;
		String hql = "select media from Media as media where media.mediaId='"+media_id+"'";
		List medias = this.executeQuery(hql);
		this.closeSession();
		Media media = (Media)medias.get(0);
		mv = getDetail(media, lang);
		return mv;
	}
	
	
	public static void main(String[] args) {
		//select media_id from media where name like '%china%'
		//union
		//select distinct media_id from media_caption where name like '%china%'
		//or description like '%china%' or highlight like '%china%'
		//union
		//select distinct a.media_id from media a,actor b,media_actor c
		//where a.media_id=c.media_id and b.actor_id=c.actor_id and b.name like '%china%'
		//union
		//SELECT distinct a.media_id from media a,actor_caption b,media_actor c
		//where a.media_id=c.media_id and b.actor_id=c.actor_id and b.name like '%china%'
	}
}
