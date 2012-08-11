/*
 * Created on 2005-6-30
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.chinaportal.portal.popular;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

import com.chinaportal.portal.util.VOCache;
import com.mediazone.bean.Category;
import com.mediazone.bean.Media;
import com.mediazone.bean.MediaCaption;
import com.mediazone.bean.Review;
import com.mediazone.dao.*;

/**
 * @author Administrator
 * 
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class PopularDAO extends BaseQuery {

	public List getPopularMedias( String tableName,Integer lang,int size,boolean needReview) {
        String key = "PopularDAO.getPopularMedias("+tableName+","+lang+","+size+","+needReview+")";
        List result = (List)VOCache.getVO(key);
        if (result != null) 
			return result;

		List mediaList = new ArrayList();
		String hql = "select m from Media as m, "+tableName+" as c where m.mediaId=c.mediaId and c.isAdult=0 order by c.avgHits desc,c.mediaId desc";		
		try {
			this.setPageSize(size);
			List medias = executeQuery(hql,"1");
			if (medias == null)
				return mediaList;
			visitMediaList(mediaList, medias, lang,needReview);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try{
			this.closeSession();
			}catch(Exception fe){
				
			}
		}
    	VOCache.putVO(key, mediaList, new Long(12*60*60*1000));
		return mediaList;

	}
	

	protected void visitMediaList(List mediaList, List medias, Integer lang,boolean needReview) {
		MediaView mv = null;
		for (int i = 0; i < medias.size(); i++) {
			Media m=(Media)medias.get(i);
			mv=new MediaView();
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
			       if (mc != null && mc.getName() != null)
				     mv.setName(mc.getName());
			       else
				     mv.setName(m.getName());
			       if(mc!=null && mc.getHighLight()!=null)
				     mv.setHighlight(mc.getHighLight());
//			if (mc != null && mc.getName() != null)
//				mv.setName(mc.getName());
//			else
//				mv.setName(m.getName());
//			if(mc!=null && mc.getHighlight()!=null)
//				mv.setHighlight(mc.getHighlight());
			if(needReview)
				mv.setLevel(""+getRating(m.getMediaId().intValue()));
			/*
			List categorys=m.getCategorys();
			if(categorys.size()>0){
				Category c=(Category)categorys.get(0);
				mv.setCategory_id(c.getCategory_id().toString());
			}else{
				
			}
			*/
			mediaList.add(mv);
		}
	}
	
    public int getRating(int media_id){
		int average_rating=0;
		
		try{
			java.sql.Connection con=this.session.connection();
			String sql="select rating from review where media_id="+media_id;
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			int totalRating =0;	
			int size=0;
			while(rs.next()){
				size++;
				totalRating +=rs.getInt("rating");
			}
			if(size>0){
				average_rating = (int)Math.round(totalRating *10.0/size);
			}
			if(rs!=null)
				rs.close();
			if(ps!=null)
				ps.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		/*
		if (reviewList !=null){			
			if(reviewList.size()==0)
				return 0;
			Integer review_number = new Integer(reviewList.size());
			int totalRating =0;				
			for (int i =0 ;i<reviewList.size();i++){  
				try{
					totalRating += Integer.parseInt(((Review)reviewList.get(i)).getRating());
				}
				catch (NumberFormatException e){
				}
			}
			try{
				average_rating = (int)Math.round(totalRating *10.0/reviewList.size());
			}catch(ArithmeticException e){
				
			}
		}
		*/
		return average_rating;
    }
	
	public static void main(String[] args){
		System.out.println(27*1.0/4);
	}

}

class Key{
	private Integer lang;
	private String tableName;
	
	public Integer getLang(){
		return lang;
	}
	
	public void setLang(Integer l){
		lang=l;
	}
	
	public String getTableName(){
		return tableName;
	}
	
	public void setTableName(String tn){
		tableName=tn;
	}
	
    public String toString() {
        return new ToStringBuilder(this)
            .append("category_id", getTableName())
            .append("lang_id", getLang())
            .toString();
    }

    public boolean equals(Object other) {
        if ( !(other instanceof Key) ) return false;
		Key castOther = (Key) other;
        return new EqualsBuilder()
            .append(this.getTableName(), castOther.getTableName())
            .append(this.getLang(), castOther.getLang())
            .isEquals();
    }

    public int hashCode() {
        return new HashCodeBuilder()
            .append(getTableName())
            .append(getLang())
            .toHashCode();
    }
}