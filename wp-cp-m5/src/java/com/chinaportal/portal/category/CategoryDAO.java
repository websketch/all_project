/*
 * Created on 2005-6-30
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.chinaportal.portal.category;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

import com.chinaportal.portal.base.Context;
import com.chinaportal.portal.detail.MediaUtil;
import com.mediazone.bean.Category;
import com.mediazone.bean.CategoryCaption;
import com.mediazone.bean.Media;
import com.mediazone.bean.MediaCaption;
import com.mediazone.bean.Photo;
import com.mediazone.dao.BaseQuery;
import com.mediazone.dao.DAOException;


/**
 * @author Administrator
 * 
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class CategoryDAO extends BaseQuery {
	private String contextPath;
	
	public String getContextPath() {
		return contextPath;
	}
	

	public void setContextPath(String contextPath) {
		this.contextPath = contextPath;
	}
	

	public List getCategory(List ids, Integer lang) throws DAOException {
		List result=null;
		String hql="select c from Category as c where c.categoryId in(";
		
		for(int i=0; i<ids.size();i++){
			hql+=(String)ids.get(i);
			if(i!=(ids.size()-1))
				hql+=",";
		}
		hql+=")";
		try{
			result=this.executeQuery(hql);
		}catch (Exception e) {
			e.printStackTrace();
			return result;
		}finally{
			this.closeSession();
		}
		return result;
	}
	
	public List getPopular(Integer category_id, Integer lang){
		/*
		Key k=new Key();
		k.setLang(lang);
		k.setCategory_id(category_id);
		if(pops!=null){
			if(pops.get(k)!=null)
				return (List)pops.get(k);
		}
		else
			pops=new java.util.Properties();
		*/
		List mediaList = new ArrayList();
		String hql = "select m.media_id ,m.name as name,mc.name as cname"+
				" from ((media_category as mcc inner join media as m on mcc.media_id=m.media_id)" +
				" inner join content_item_hits_weekly as c on m.media_id=c.content_item_id)" +
		        " inner join media_caption as mc on m.media_id=mc.media_id"+
			    " where mcc.category_id="+category_id.toString()+" and mc.lang_id="+lang.intValue()+
			    " order by c.avg_hits desc,c.content_item_id desc ";
		
		try {
			this.setPageSize(10);
			ResultSet rs = executeJDBCQuery(hql,"1",null);
			if (rs == null )
				return mediaList;
			while(rs.next()){
				MediaView mv = new MediaView();
				mv.setId(rs.getString("media_id"));
				String name=rs.getString("name");
				mv.setName(rs.getString("cname"));
			    if(mv.getName()==null)
					mv.setName(name);
				mediaList.add(mv);
			}
			rs.close();
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
		//pops.put(k,mediaList);
		return mediaList;
	}
	
	protected void visitPopularList(List mediaList, List medias, Integer lang) {

		for (int i = 0; i < medias.size(); i++) {
			Media m=(Media)medias.get(i);
			MediaView mv = new MediaView();
			mv.setId(m.getMediaId().toString());
//			MediaCaption mc = m.getCaption(lang);
			
			MediaCaption mc=null;
			Set set = m.getCaptions();
			Iterator iterator = set.iterator();
			while (iterator.hasNext()) {
				MediaCaption cat = (MediaCaption) iterator.next();
				if (lang.equals(cat.getLangId())) 
					     mc = cat;	
				}
				 if(mc!=null && mc.getName()!=null)
						 mv.setName(mc.getName());
				 else
						 mv.setName(m.getName());
				
		
//			
	
//			
//			if (mc != null && mc.getName() != null)
//				mv.setName(mc.getName());
//			else
//				mv.setName(m.getName());
			mediaList.add(mv);
		}
	}	

	public CategoryView getCategoryInfo(Integer category_id, Integer lang) {
		CategoryView result=new CategoryView();
		CategoryView cv = null;
		try {
			Context ctx=new Context();
			cv=ctx.getCategory(category_id.toString());
			result.setCategory_id(category_id.toString());
			result.setPhoto(cv.getPhoto());
			result.setCategory_name(cv.getCategory_name());
			CategoryCaption cc = cv.getCaption(lang);
			if (cc != null) {		
				result.setDescription(cc.getDescript());   //add by Bily
				if(cv.getDescription()!=null)
				{
					//int pos=result.getDescription().indexOf("/static.jsp?fn=purchase");
					//if(pos!=-1)
					//	result.setDescription(cv.getDescription().substring(0,pos)+contextPath+cv.getDescription().substring(pos));
					result.setDescription(cv.getDescription());
				}
				if (cc.getName() != null)
					result.setCategory_name(cc.getName());

			}
			String location=result.getCategory_name();
			CategoryView parent=ctx.getParent(cv.getCategory_id());
			CategoryCaption parentcc=parent.getCaption(lang);
				String parent_name=null;
				String parent_id=parent.getCategory_id();
				if(parentcc!=null && parentcc.getName()!=null)
					parent_name=parentcc.getName();	
					
				if(parent.getParents()!=null && parent.getParents().size()>0){
					if(parent_id.equals("18")|| parent_id.equals("112") || parent_id.equals("121"))
						location=parent_name+"->"+location;
					else
						location="<a href=\""+contextPath+"/getCategory.do?category_id="+parent_id+"\">"+parent_name+"</a> -> "+location;
				}
				else
					location="<a href=\""+contextPath+"/getHomePage.do\">"+parent_name+"</a> -> "+location;
			result.setLocation(location);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}

	public List getCommingSoonMedias(Integer category_id, Integer lang) {
		List mediaList = new ArrayList();
		String hql = "select m.media_id ,m.name as name,mc.name as cname,p.photo as photo"+
				" from ((media as m inner join media_category as mcc on m.media_id=mcc.media_id )"+
				" inner join media_caption as mc on m.media_id=mc.media_id) "+
				" inner join photo as p on m.media_id=p.media_id"+
				" where m.starttime>NOW() and m.starttime<=DATE_ADD(NOW(), INTERVAL 28 DAY)"+
				"  and mcc.category_id="+category_id.intValue()+" and mc.lang_id="+lang.intValue()+
				" order by m.starttime, m.media_id";
		try {
			executeJDBCQuery(hql);
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
				mediaList.add(mv);
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
		return mediaList;

	}

	public List getCategoryMedias(Integer category_id, Integer lang,
			String curpage) {
		List mediaList = new ArrayList();
		String hql = "select m.media_id ,m.name as name,mc.name as cname,p.photo as photo"+
		" from ((media as m inner join media_category as mcc on m.media_id=mcc.media_id )"+
		" inner join media_caption as mc on m.media_id=mc.media_id) "+
		" inner join photo as p on m.media_id=p.media_id"+
		" where m.starttime<=NOW() and m.endtime>=NOW()  and mcc.category_id="+category_id.intValue()+" and mc.lang_id="+lang.intValue()+
		" order by mcc.sort desc, m.starttime desc, m.media_id desc";
		
		try {
			this.setPageSize(20);
			executeJDBCQuery(hql, curpage, null);
			while(rs.next()){
				MediaView mv = new MediaView();
				mv.setId(rs.getString("media_id"));
				String name=rs.getString("name");
				mv.setName(rs.getString("cname"));
			    if(mv.getName()==null)
					mv.setName(name);
				mv.setPhoto(rs.getString("photo"));
				MediaUtil.getItemByJDBC(this.con,mv.getId(),mv);
				mediaList.add(mv);
			}
			rs.close();
			ps.close();
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
		return mediaList;

	}
	
	public List getFreeMedias(Integer category_id, Integer lang,
			String curpage, int perpage)
	{
		List mediaList = new ArrayList();
		String hql = "select m.media_id ,m.name as name,mc.name as cname "+
		" from ((media as m inner join media_category as mcc on m.media_id=mcc.media_id )"+
		" inner join media_caption as mc on m.media_id=mc.media_id) "+
		" where mcc.category_id="+category_id.intValue()+" and mc.lang_id="+lang.intValue()+
		" order by mcc.sort asc, m.starttime desc, m.media_id desc";;
		try
		{
			//System.out.println(hql);
			this.setPageSize(perpage);
			executeJDBCQuery(hql, curpage, null);
			
			while(rs.next())
			{
				MediaView mv = new MediaView();
				mv.setId(rs.getString("media_id"));
				String name=rs.getString("name");
				mv.setName(rs.getString("cname"));
				
			    if(mv.getName()==null)
					mv.setName(name);
			    
				mv.setPhoto(MediaUtil.getPhotoByJDBC(this.con,mv.getId()));
				MediaUtil.getItemByJDBC(this.con,mv.getId(),mv);
				mediaList.add(mv);
			}
			rs.close();
			ps.close();
			for(int i=0;i<mediaList.size();i++)
			{
				MediaView mv =(MediaView)mediaList.get(i);
				String sql =  "select mc.name as cname,m.media_id as parent_id from media m , media_relation mr, media_caption mc" +
				" where mr.media_id="+mv.getId()+" and mr.parent_media_id=m.media_id and " +
						" mc.media_id=m.media_id and mc.lang_id="+lang.intValue();	
				executeJDBCQuery(sql);
				if(rs.next())
				{
					mv.setName(rs.getString(1)+"("+mv.getName()+")");
					mv.setParent_id(rs.getString(2));
					mv.setPhoto(MediaUtil.getPhotoByJDBC(this.con,rs.getString(2)));
				}
				rs.close();
				ps.close();
			}
		}
		catch(Exception e)
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
		return mediaList;
	}
	
	//no pagination
	public List getMedias(Integer category_id, Integer lang)throws DAOException {
		List mediaList = new ArrayList();
		String hql = "select m from Media as m,MediaCategory as mc where m.mediaId=mc.mediaId"
				+ " and m.startTime<=NOW() and m.endTime>=NOW() and mc.categoryId=:category_id"
				+ " order by mc.sort desc, m.startTime desc, m.mediaId desc";
		Properties conditions = new Properties();
		conditions.put("category_id", category_id);
		try {		
			List medias = executeQuery(hql, null, conditions);
			if (medias == null)
				return mediaList;
			visitMediaList(mediaList, medias, lang);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			this.closeSession();
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
	public static MediaView getDetail(Media m,Integer lang){
		MediaView mv = new MediaView();
		mv.setId(m.getMediaId().toString());
		
//		MediaCaption mc = m.getCaption(lang);
		
		MediaCaption mc;
		Set set = m.getCaptions();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			MediaCaption cat = (MediaCaption) iterator.next();
			if (lang.equals(cat.getLangId())) {
				     mc = cat;	
				 if(mc!=null && mc.getName()!=null)
					 mv.setName(mc.getName());
				 else
					 mv.setName(m.getName());
				 if (mc!= null)
				     mv.setHighlight(mc.getHighLight());
		        break;
			}
		}
		
//		if (mc != null && mc.getName() != null)
//			mv.setName(mc.getName());
//		else
//			mv.setName(m.getName());
//		if(mc!=null)
//			mv.setHighlight(mc.getHighlight());
//		mv.setPhoto(m.getPhoto());
		
		if(m.getPhotos()!=null && m.getPhotos().size()>0){
			Photo p=(Photo)m.getPhotos().get(0);
			mv.setPhoto(p.getPhoto());
		}

		
		MediaUtil.getItem( m, mv);
		return mv;
	}
	
	public MediaView getBlock(Integer category_id, Integer lang) {
		String sql = "select m.media_id as media_id, m.name as name, mc.name as cname ,p.photo as photo,mc.description as description" +
		" from (((block b inner join block_element be on b.block_id=be.block_id)" +
		" inner join media m on be.source_pk_id=m.media_id )" +
		" inner join media_caption mc on m.media_id=mc.media_id)" +
		" inner join photo as p on m.media_id=p.media_id"+
		" where be.source_id =2 and b.name ='CATEGORY_"+category_id.intValue()+"' and mc.lang_id="+lang.intValue();
		MediaView mv = null;
		try {
			ResultSet rs = executeJDBCQuery(sql, null, null);
			while(rs.next()){
				mv = new MediaView();
				mv.setId(rs.getString("media_id"));
				String name=rs.getString("name");
				mv.setName(rs.getString("cname"));
			    if(mv.getName()==null)
					mv.setName(name);
				mv.setDescription(rs.getString("description"));
				String description = mv.getDescription();
				if (description != null && description.length() > 200){
					description = description.substring(0, 200) + "...";
					mv.setDescription(description);
				}
				mv.setPhoto(rs.getString("photo"));
				
				MediaUtil.getItemByJDBC(this.con,mv.getId(),mv);
			}
			rs.close();
			ps.close();
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
		
		return mv;
	}

	public List getChildren(String parent_id, Integer lang) throws DAOException {
		List result=null;
		String hql="select c from Category as c,CategoryRelation as cr " +
				" where c.categoryId=cr.categoryId and cr.parentCategoryId="+parent_id+" order by cr.sort asc";
		try{
			result=executeQuery(hql);
			if(result!=null){  //add by Bily, solve bug
			for(int i=0;i<result.size();i++){
				Category c=(Category)result.get(i);		
				
//				CategoryCaption cc=(CategoryCaption)c.getCaption(lang);
				
				
				
                   CategoryCaption cc=null;
 			        Set set =c.getCaptions();
 			        Iterator iterator = set.iterator();
 			        while (iterator.hasNext()) {
 			          CategoryCaption cat = (CategoryCaption)iterator.next();
 			           if (lang.equals(cat.getLangId())) 
 			                	cc=cat; 
 			        }
 				        if(cc!=null && cc.getName()!=null)
 					           c.setName(cc.getName());
				List children=c.getChildren();
				for(int j=0;j<children.size()&& children.size()>0;j++){
					Category child=(Category)children.get(j);
					
//					CategoryCaption child_cc=(CategoryCaption)child.getCaption(lang);
					CategoryCaption child_cc=null;
					Set set1=child.getCaptions();
				      Iterator iterator1 = set1.iterator();
				      while (iterator1.hasNext()) {
				        CategoryCaption cat = (CategoryCaption)iterator1.next();
				         if (lang.equals(cat.getLangId())) 
					             child_cc=cat; 
				      }
					     if(child_cc!=null && child_cc.getName()!=null)
						         child.setName(child_cc.getName());
//					  Photo ph=null;
//					  List list=child.getPhotos();
//				         if(list!=null && list.size()>0){
//				        	 ph=(Photo)list.get(0);
//				         String photo=ph.getPhoto();
//				         
//				         }					  
				}
				c.setChildren(children);
			}
			}
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			this.closeSession();
		}
		return result;
	}
	
	
	public Category getParent(String category_id, Integer lang){
		Category category = null;
		
		return category;
	}
	public static void main(String[] args) {
	}
}

class Key{
	private Integer lang;
	private Integer category_id;
	
	public Integer getLang(){
		return lang;
	}
	
	public void setLang(Integer l){
		lang=l;
	}
	
	public Integer getCategory_id(){
		return category_id;
	}
	
	public void setCategory_id(Integer cid){
		category_id=cid;
	}
	
    public String toString() {
        return new ToStringBuilder(this)
            .append("category_id", getCategory_id())
            .append("lang_id", getLang())
            .toString();
    }

    public boolean equals(Object other) {
        if ( !(other instanceof Key) ) return false;
		Key castOther = (Key) other;
        return new EqualsBuilder()
            .append(this.getCategory_id(), castOther.getCategory_id())
            .append(this.getLang(), castOther.getLang())
            .isEquals();
    }

    public int hashCode() {
        return new HashCodeBuilder()
            .append(getCategory_id())
            .append(getLang())
            .toHashCode();
    }
}
