/*
 * File   : $Source: /cvsroot/xpatrinet/wp-cp/src/java/com/chinaportal/portal/comment/CommentDAO.java,v $
 * Date   : $Date: 2005/11/16 22:33:38 $
 * Version: $Revision: 1.1.2.30 $
 * Author : $Author: hhhuang $
 */
package com.chinaportal.portal.comment;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.chinaportal.portal.category.MediaView;
import com.chinaportal.portal.sports.MatchView;
import com.chinaportal.portal.util.VOCache;
import com.mediazone.bean.MediaCaption;
import com.mediazone.bean.Review;
import com.mediazone.dao.BaseQuery;
import com.mediazone.dao.DAOException;
import com.mediazone.exception.ServiceException;
import com.mediazone.util.DBUtil;
import com.mediazone.util.HibernateUtil;


/**
 * @author Jason
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class CommentDAO {
	
	private static final Log log = LogFactory.getLog(CommentDAO.class);

	private Integer pk;
	
	public CommentDAO()
	{
	}
	
	public void create(Review review )throws DAOException
	{
		if ( isExist(  review ) == true )
		{
			review.setReviewId( pk );
			java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
			review.setReviewTime( date );			
			update( review );			
		}
		else
		{	
			Session session = null;;
			Transaction transaction = null;
			
			try 
			{
				session = HibernateUtil.currentSession();
				transaction = session.beginTransaction();
				java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
				review.setReviewTime( date );
				session.save( review );
				transaction.commit();					
				//todo:caculate average score
			} catch ( Exception hbex )

			{
				log.error("插入评论: "+hbex);
				hbex.printStackTrace();
			}
			finally
			{
				if ( transaction != null )
				{
					transaction = null;			
				}	
				HibernateUtil.closeSession();
			}
		}
		String key = "CommentDAO.query(" + review.getMediaId() + "," + review.getLangId() + ")";
		VOCache.remove(key);
		query(review.getMediaId().toString(), review.getLangId().toString());
		key = "DetailDAO.getMediaDetail(" + review.getMediaId() + "," + review.getLangId() + ")";
		MediaView mv = (MediaView)VOCache.getVO(key);
		if(mv==null){
			key = "MatchDetailDAO.getMatchDetail(" + review.getMediaId() + "," + review.getLangId() + ")";
			MatchView match=(MatchView)VOCache.getVO(key);
			match.setLevel(CommentDAO.getAverageRateJDBC(review.getMediaId().toString(),review.getLangId().toString())+"");
		}else
			mv.setLevel(CommentDAO.getAverageRateJDBC(review.getMediaId().toString(),review.getLangId().toString())+"");
	}
	
	public boolean isExist( Review review )
	{
		Review rw = null;
		Session session = null;;
		Transaction transaction = null;
		
		String hql="select rw from Review as rw ";
		hql += " where rw.mediaId="+review.getMediaId();
		hql += " and rw.categoryId="+review.getCategoryId();
		hql += " and rw.userId='"+review.getUserId()+"'";
		

		try{
			session = HibernateUtil.currentSession();
			transaction = session.beginTransaction();
			Query query = session.createQuery( hql );
			for( Iterator it=query.iterate();it.hasNext();)
			{
				rw  = (Review)it.next();
			}
			transaction.commit();
			HibernateUtil.currentSession().close();			
		} catch ( HibernateException hbex )
		{
			hbex.printStackTrace();
		}
		finally
		{
			if ( transaction != null )
			{
				transaction = null;			
			}	
		}
		if ( rw == null) return false;
		
		pk = rw.getReviewId();
		return true;	
	}
	
	public void update( Review review ) throws DAOException
	{
		Session session = null;;
		Transaction transaction = null;
		/*
		String hql = "update Review set title='" + review.getTitle()+"'";
		hql += " and content='" + review.getContent() + "'";
		hql += " and rating='" + review.getRating() + "'";	
		hql += " and review_time=" + review.getReview_time() + "";
		*/
		try{
			session = HibernateUtil.currentSession();
			transaction = session.beginTransaction();
			session.update(review);
			session.flush();
			transaction.commit();
			//HibernateUtil.currentSession().close();
		} catch ( HibernateException hbex )
		{			
			log.error("更新评论: "+hbex);
			hbex.printStackTrace();
		}
		finally
		{
			if ( transaction != null )
			{
				transaction = null;			
			}	
			HibernateUtil.closeSession();
		}
		String key = "CommentDAO.query(" + review.getMediaId() + "," + review.getLangId() + ")";
		VOCache.remove(key);
		query(review.getMediaId().toString(), review.getLangId().toString());
		key = "DetailDAO.getMediaDetail(" + review.getMediaId() + "," + review.getLangId() + ")";
		MediaView mv = (MediaView)VOCache.getVO(key);
		if(mv==null){
			key = "MatchDetailDAO.getMatchDetail(" + review.getMediaId() + "," + review.getLangId() + ")";
			MatchView match=(MatchView)VOCache.getVO(key);
			match.setLevel(CommentDAO.getAverageRateJDBC(review.getMediaId().toString(),review.getLangId().toString())+"");
		}else
			mv.setLevel(CommentDAO.getAverageRateJDBC(review.getMediaId().toString(),review.getLangId().toString())+"");
	}
	
	public String getMediaName( Integer media_id, Integer lang_id )throws DAOException
	{
		String medianame = null;
		Session session = null;;
		Transaction transaction = null;

		String hql = "select mc from MediaCaption as mc ";
		hql += " where mc.mediaId=:media_id and mc.langId=:lang_id";		
		
		try{
			session = HibernateUtil.currentSession();
			transaction = session.beginTransaction();
			Query query = session.createQuery(hql);
			query.setInteger("media_id", media_id.intValue()  );
			query.setInteger("lang_id", lang_id.intValue() );

			for( Iterator it=query.iterate();it.hasNext();)
			{
				MediaCaption mcn = (MediaCaption)it.next();
				medianame = mcn.getName();
			}
			transaction.commit();
			//HibernateUtil.currentSession().close();
		} catch ( HibernateException hbex )
		{			
			hbex.printStackTrace();
		}
		finally
		{
			if ( transaction != null )
			{
				transaction = null;			
			}	
			HibernateUtil.closeSession();
		}		
		return medianame;
	}
	
	// no use
	public Collection getReviewByID( Integer media_id,Integer category_id, Integer lang_id )throws DAOException
	{
		ArrayList list = new ArrayList();
		Session session = null;
		Transaction transaction = null;

		String hql = "select rw from Review as rw ";
		hql += " where rw.mediaId=:media_id and rw.langId=:lang_id";		
		hql += " and rw.categoryId=:category_id";
		
		try{
			session = HibernateUtil.currentSession();
			transaction = session.beginTransaction();
			Query query = session.createQuery(hql);
			query.setInteger("media_id", media_id.intValue()  );
			query.setInteger("lang_id", lang_id.intValue() );
			query.setInteger("category_id", category_id.intValue() );
			
			for( Iterator it=query.iterate();it.hasNext();)
			{
				Review rvw = (Review)it.next();
				list.add( rvw );
			}
			transaction.commit();
			//HibernateUtil.currentSession().close();
		} catch ( HibernateException hbex )
		{			
			hbex.printStackTrace();
		}
		finally
		{			
			if ( transaction != null )
			{
				transaction = null;			
			}			
			HibernateUtil.closeSession();
		}
		
		return list;	
	}
	
	//查询某个media的评论,针对某个lang
	public synchronized List query(String media_id, String lang_id) throws DAOException{
        String key = "CommentDAO.query(" + media_id + "," + lang_id + ")";
		List list = (List)VOCache.getVO(key);
        if (list != null || VOCache.containsKey(key)) {
			return list;
        }
		//List list = null;					
		String hql = "select review from Review as review where review.mediaId='" + media_id+ "' and review.langId='"+lang_id+"' order by review.reviewTime desc";
		BaseQuery bq = new BaseQuery();
		try {
			list = bq.executeQuery(hql);
		} catch (DAOException de) {
			log.error("查询某个media的评论,针对某个lang: "+de);
			de.printStackTrace();
		}finally{
			HibernateUtil.closeSession();
		}
		VOCache.putVO(key,list,new Long(365*24*60*60*1000));
		return list;		
	}
	
	//查询某个用户写的comment
	public List query(String media_id, String lang_id, String user_id) throws DAOException{
		List list = null;					
		String hql = "select review from Review as review where review.mediaId='" + media_id+ "' and review.langId='"+lang_id+"' and review.userId='"+user_id+"'";
		BaseQuery bq = new BaseQuery();
		try {
			list = bq.executeQuery(hql);
		} catch (DAOException de) {
			log.error("查询某个用户写的comment: "+de);
			de.printStackTrace();
		}finally{
			bq.closeSession();
		}
		return list;		
	}
	
	//use jdbc
	public static int getAverageRateJDBC(String media_id, String lang_id) throws DAOException{
		float averageRate = 0F;
		String sql = "select avg(rating) avgrating from review where media_id=? and lang_id=? and rating is not null";
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, media_id);
			pstmt.setString(2, lang_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				averageRate = rs.getFloat("avgrating");
			}
		}catch(ServiceException se){
			log.error("Comment Average Rating：getAverageRateJDBC, JDBC connection exception! "+se.getErrorCode());
		}catch (SQLException se) {
			log.error("求平均分发生异常："+se);
			log.error("SQLException:=====error code===" + se.getErrorCode());
			throw new DAOException(se);
		}finally{
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.closeConnection(conn);
		}
		int ave = Math.round(averageRate*10);
		return ave;		
	}
	
	
	public static int getAverageRateJDBCBak(String media_id, String lang_id) throws DAOException{
		float averageRate = 0F;
		int i = 0;
		String sql = "select rating from review where media_id=? and lang_id=?";
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, media_id);
			pstmt.setString(2, lang_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String rating = rs.getString("rating");
				if(rating!=null){
					i++;
					averageRate += Integer.parseInt(rating);
				}
			}
		}catch(ServiceException se){
			log.error("Comment Average Rating：getAverageRateJDBC, JDBC connection exception! "+se.getErrorCode());
		}catch (SQLException se) {
			log.error("求平均分发生异常："+se);
			log.error("SQLException:=====error code===" + se.getErrorCode());
			throw new DAOException(se);
		}finally{
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.closeConnection(conn);
		}
		if(i!=0){
			averageRate /= i;
		}
		int ave = Math.round(averageRate*10);
		return ave;		
	}
	
	/*
	public static int getAverageRateJDBCUseHb(String media_id, String lang_id) throws DAOException{
		float averageRate = 0F;
		int i = 0;
		String sql = "select rating from review where media_id=? and lang_id=?";
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Session session = null;
		try {
			session = HbUtil.getSession();
			conn = session.connection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, media_id);
			pstmt.setString(2, lang_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String rating = rs.getString("rating");
				if(rating!=null){
					i++;
					averageRate += Integer.parseInt(rating);
				}
			}
		}catch(HibernateException he){
			log.error("Comment Average Rating：getAverageRateJDBC! "+he);
		}catch (SQLException se) {
			log.error("求平均分发生异常："+se);
			log.error("SQLException:=====error code===" + se.getErrorCode());
			throw new DAOException(se);
		}finally{
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				session.disconnect();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
			HbUtil.closeSession(session);
		}
		if(i!=0){
			averageRate /= i;
		}
		int ave = Math.round(averageRate*10);
		return ave;		
	}	
	
	
	public static int getAverageRateJDBCUseHibernate(String media_id, String lang_id) throws DAOException{
		float averageRate = 0F;
		int i = 0;
		String sql = "select rating from review where media_id=? and lang_id=?";
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Session session = null;
		try {
			session = HibernateUtil.currentSession();
			conn = session.connection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, media_id);
			pstmt.setString(2, lang_id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String rating = rs.getString("rating");
				if(rating!=null){
					i++;
					averageRate += Integer.parseInt(rating);
				}
			}
		}catch(HibernateException he){
			log.error("Comment Average Rating：getAverageRateJDBC! "+he);
		}catch (SQLException se) {
			log.error("求平均分发生异常："+se);
			log.error("SQLException:=====error code===" + se.getErrorCode());
			throw new DAOException(se);
		}finally{
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				session.disconnect();
			} catch (HibernateException e) {
				e.printStackTrace();
			}
			HibernateUtil.closeSession();
		}
		if(i!=0){
			averageRate /= i;
		}
		int ave = Math.round(averageRate*10);
		return ave;		
	}	
	
	*/
	
	
	
	
	
	
	//计算平均分 average rating
	public int getAverageRate(String media_id, String lang_id) throws Exception{
		float averageRate = 0F;
		List list = null;
		int i = 0;
		list = this.query(media_id, lang_id);
		if(list!=null && list.size()!=0){
			Iterator it = list.iterator();
			while(it.hasNext()){
				Review review = (Review)(it.next());
				if(review.getRating()!=null){
					i++;
					averageRate += Integer.parseInt(review.getRating());
				}
			}
			if(i!=0){
				averageRate /= i;
			}
		}
		//int ave = new Float(averageRate*10).intValue();
		int ave = Math.round(averageRate*10);
		return ave;
	}
}
