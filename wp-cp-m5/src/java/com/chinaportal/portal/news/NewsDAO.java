/*
 * Created on 2005-7-25
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.news;


import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;

import com.mediazone.bean.Media;
import com.mediazone.dao.BaseQuery;
import com.mediazone.dao.DAOException;
import com.mediazone.util.HibernateUtil;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class NewsDAO extends BaseQuery {
	
	/**
	 * Query news.news_id can equal null, pageSize can equal zero or others if news_id does not equal null.
	 * @param news_id
	 * @param lang
	 * @param curPage
	 * @param pageSize
	 * @return List
	 * @throws DAOException
	 */
	public List query(Integer news_id, Integer news_type_id, Integer lang, String curPage, int pageSize) throws DAOException{
		List list = null;
		String hql = "select news from News as news where news.newsTypeId='"+news_type_id+"' and news.release=1 order by news.createTime desc";
		if(news_id!=null){
			hql = "select news from News as news where news.release=1 and news.newsId= '"+news_id+"'";
		//	//hql = hql + " where news_id=:news_id order by create_time";
		}
		//Properties conditions = new Properties();
		//conditions.put("news_id", news_id);
		if(pageSize!=0){
			this.setPageSize(pageSize);
		}else{
			this.setPageSize(20);
		}
		try{
			list = this.executeQuery(hql, curPage, null);
		}finally{
			this.closeSession();
		}
		return list;
		
	}
	
	
	// include no release
	public List queryAll(Integer news_id, Integer news_type_id, Integer lang, String curPage, int pageSize) throws DAOException{
		List list = null;
		String hql = "select news from News as news where news.newsTypeId='"+news_type_id+"' order by news.createTime desc";
		if(news_id!=null){
			hql = "select news from News as news where news.newsId= '"+news_id+"'";
		}
		if(pageSize!=0){
			this.setPageSize(pageSize);
		}else{
			this.setPageSize(20);
		}
		try{
			list = this.executeQuery(hql, curPage, null);
		}finally{
			this.closeSession();
		}
		return list;
		
	}
	
	public List query(Integer news_id, Integer lang, String curPage, int pageSize) throws DAOException{
		List list = null;
		list=this.query(news_id,null,lang,curPage,pageSize);
		return list;
	}
	
	public List queryNewsByType(Integer news_type_id, Integer lang, String curPage, int pageSize) throws DAOException{
		return this.query(null,news_type_id,lang,curPage,pageSize);
	}
	
	
	public List queryNewsByTypeIncludeNoRelease(Integer news_type_id, Integer lang, String curPage, int pageSize)throws DAOException{
		return this.queryAll(null,news_type_id,lang,curPage,pageSize);
	}
	
	
	
	/**
	 * Query medias by keyword
	 * @param keyword
	 * @param lang
	 * @return Collection
	 * @throws Exception
	 */
	public Collection queryMatch(String keyword, Integer lang) throws Exception{
		//List meidas = new ArrayList();
		Set meidasSet = new HashSet();
		List tempList = null;
		String[] keys = keyword.trim().split(",");
		Transaction tx = null;
		Query query = null;
		try {
			Session session = HibernateUtil.currentSession();
			for(int i=0; i<keys.length; i++){
				String hql = "select distinct media from Media as media, MediaCaption as mc, MediaActor as ma, Actor as actor, ActorCaption as ac " +
					"where media.mediaId=mc.mediaId and mc.langId=:lang_id and media.mediaId=ma.mediaId and ma.actorId=actor.actorId and actor.actorId=ac.actorId " +
					"and media.release=1 and (mc.name like '%"+keys[i]+"%' OR ac.name like '%"+keys[i]+"%' OR mc.description like '%"+keys[i]+"%' OR mc.highLight like '%"+keys[i]+"%')";
				//String hqll = "select media from Media as media, Media_caption as mc where mc.lang_id=:lang_id and media.media_id=1";
				//System.out.println("key: " + keys[i]);
				tx = session.beginTransaction();
				query = session.createQuery(hql);
				query.setInteger("lang_id", Integer.parseInt(lang.toString()));
				//query.setString("key", "%"+keys[i]+"%");
				//query.setString("ac_name", keys[i]);
				tempList = query.list();
				//System.out.println(tempList.size());
				for(int j=0; tempList!=null && j<tempList.size(); j++){
					Media media = (Media)tempList.get(j);
					//System.out.println(media.getCaption(lang).getName());
					//meidas.add(media);
					meidasSet.add(media);
				}
				//String hql2 = "select media from Media as media, Media_caption as mc, Media_actor as ma, Actor as actor, Actor_caption as ac " +
				//"where media.media_id=mc.media_id and mc.lang_id=:lang_id and media.media_id=ma.media_id and ma.actor_id=actor.actor_id and actor.actor_id=ac.actor_id" +
				//" and (mc.name like '%"+keys[i]+"%' OR ac.name like '%"+keys[i]+"%')";
				
			}
			tx.commit();
		} catch (HibernateException e) {
			if(tx!=null){
				tx.rollback();
			}
			throw new DAOException(e);
		} finally {
			HibernateUtil.closeSession();
		}
		return meidasSet;
	}
	
	
	/**
	 * Query medias ,not include sports. by hql limit(Now no using).
	 * @param category_id
	 * @return List
	 * @throws Exception
	 */
	public List queryNewMediasBak(Integer category_id) throws Exception {
		List newMedias = null;
		//String hqlbak = "select media from Media as media, Media_category as mc where " +
		//		"media.media_id=mc.media_id and mc.category_id!=:category_id " +
		//		"order by media.media_id desc limit 0,10";
		
		String hql="select distinct a from Media a,MediaCategory b " +
		"where a.mediaId=b.mediaId and b.categoryId not in (select cr.categoryId from CategoryRelation cr where cr.parentCategoryId='"+category_id+"') " +
		"and b.categoryId!='"+category_id+"' and b.categoryId not in (select cr.categoryId from CategoryRelation cr where cr.parentCategoryId in (select cr.categoryId from CategoryRelation cr where cr.parentCategoryId='"+category_id+"')) " +
		"and b.categoryId not in (select cr.categoryId from CategoryRelation cr where cr.parentCategoryId in (select cr.categoryId from CategoryRelation cr where cr.parentCategoryId in (select cr.categoryId from CategoryRelation cr where cr.parentCategoryId='"+category_id+"'))) " +
		"and a.release=1 order by a.releaseTime desc,a.mediaId desc limit 0,10";
		
		//String sql="select a.media_id from media a,media_category b " +
		//"where a.media_id=b.media_id and b.category_id not in (select category_id from category_relation where parent_category_id=70)" +
		//"and b.category_id!=70 and b.category_id not in (select category_id from category_relation where parent_category_id in (select category_id from category_relation where parent_category_id=70))" +
		//"and b.category_id not in (select category_id from category_relation where parent_category_id in (select category_id from category_relation where parent_category_id in (select category_id from category_relation where parent_category_id=70)))";
		//int id = Integer.parseInt(category_id.toString());
		Session session = null;
		Transaction transcation = null;
		Query query = null;
		try{
			session = HibernateUtil.currentSession();
			transcation = session.beginTransaction();
			query = session.createQuery(hql);
			//query.setInteger("category_id",id);
			newMedias = query.list();
			transcation.commit();
		}catch(HibernateException he){
			if(transcation!=null){
				transcation.rollback();
			}
			throw new DAOException(he);
		}finally{
			HibernateUtil.closeSession();
		}
		return newMedias;
	}
	
	
	/**
	 * Query medias ,not include sports. by pagination way method
	 * @param category_id
	 * @return List
	 * @throws Exception
	 */
	public List queryNewMedias(Integer category_id) throws Exception {
		List list = null;
		//String hqlbak = "select media from Media as media, Media_category as mc " +
		//		"where media.media_id=mc.media_id and mc.category_id!='"+category_id+"' order by media.media_id desc";
		String hql="select distinct a from Media a,MediaCategory b " +
				"where a.mediaId=b.mediaId and b.categoryId not in (select cr.categoryId from CategoryRelation cr where cr.parentCategoryId='"+category_id+"') " +
				"and b.categoryId!='"+category_id+"' and b.categoryId not in (select cr.categoryId from CategoryRelation cr where cr.parentCategoryId in (select cr.categoryId from CategoryRelation cr where cr.parentCategoryId='"+category_id+"')) " +
				"and b.categoryId not in (select cr.categoryId from CategoryRelation cr where cr.parentCategoryId in (select cr.categoryId from CategoryRelation cr where cr.parentCategoryId in (select cr.categoryId from CategoryRelation cr where cr.parentCategoryId='"+category_id+"'))) " +
				"and a.release=1 order by a.releaseTime desc,a.mediaId desc";
		this.setPageSize(10);
		try{
			list = this.executeQuery(hql, "1", null);
		}finally{
			this.closeSession();
		}
		return list;
	}
	
	
	/**
	 * Query medias for sports. by pagination way method
	 * @param category_id
	 * @return
	 * @throws Exception
	 */
	public List querySoprtsNewMedias(Integer category_id) throws Exception {
		List list = null;
		/*
		String sql =
			select media_id from media_category where category_id in (
					select category_id from category_relation where parent_category_id in (
					select category_id from category_relation where parent_category_id in (
					select category_id from category_relation where parent_category_id in (
					select category_id from category_relation where parent_category_id=130
					)))
					union
					select category_id from category_relation where parent_category_id in (
					select category_id from category_relation where parent_category_id in (
					select category_id from category_relation where parent_category_id=130
					))
					union
					select category_id from category_relation where parent_category_id=130
					union
					select category_id from category_relation where parent_category_id in (
					select category_id from category_relation where parent_category_id=130
					)
					)
					*/
		
		
		String hql="select distinct a from Media a,MediaCategory b " +
				"where a.mediaId=b.mediaId and (" +
				"b.categoryId in (" +
				"select cr.categoryId from CategoryRelation cr where cr.parentCategoryId in (" +
				"select cr.categoryId from CategoryRelation cr where cr.parentCategoryId in (" +
				"select cr.categoryId from CategoryRelation cr where cr.parentCategoryId in (" +
				"select cr.categoryId from CategoryRelation cr where cr.parentCategoryId=130" +
				")))) " +
				" or b.categoryId in( "+
				"select cr.categoryId from CategoryRelation cr where cr.parentCategoryId in ("+
				"select cr.categoryId from CategoryRelation cr where cr.parentCategoryId in ("+
				"select cr.categoryId from CategoryRelation cr where cr.parentCategoryId=130"+
				"))) "+
				" or b.categoryId in( "+
				"select cr.categoryId from CategoryRelation cr where cr.parentCategoryId=130)"+
				" or b.categoryId in( "+
				"select cr.categoryId from CategoryRelation cr where cr.parentCategoryId in ("+
				"select cr.categoryId from CategoryRelation cr where cr.parentCategoryId=130"+
				"))"+
				" or b.categoryId=130 "+
				") "+
				"and a.release=1 order by a.releaseTime desc,a.mediaId desc";
		this.setPageSize(10);
		try{
			list = this.executeQuery(hql, "1", null);
		}finally{
			this.closeSession();
		}
		return list;
	}
	
	
	public static void main(String[] args){
		NewsDAO newsDAO = new NewsDAO();
		Integer lang = new Integer(1);
		try {
			Collection medias = newsDAO.queryNewMedias(new Integer(70));
			System.out.println(medias.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
