package com.chinaportal.portal.detail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.chinaportal.portal.category.MediaView;
import com.chinaportal.portal.comment.CommentDAO;
import com.mediazone.bean.Actor;
import com.mediazone.bean.ActorCaption;
import com.mediazone.bean.Category;
import com.mediazone.bean.DistributeChannel;
import com.mediazone.bean.Item;
import com.mediazone.bean.Media;
import com.mediazone.bean.MediaCaption;
import com.mediazone.bean.Photo;
import com.mediazone.bean.Review;
import com.mediazone.dao.DAOException;
import com.mediazone.selfcare.UrlBuilder;

public class MediaUtil {
	public static MediaView getDetail(Media m,Integer lang){
		MediaView mv = new MediaView();
		mv.setId(m.getMediaId().toString());
		List cats=m.getCategorys();
		if(cats!=null && cats.size()>0){
			Category c=(Category)(m.getCategorys().get(0));
			mv.setCategory_id(c.getCategoryId().toString());
		}else
			mv.setCategory_id("1");
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
		     if(mc!=null && mc.getDescription()!=null)
				   mv.setDescription(mc.getDescription());
			  if(mv.getDescription()!=null)
				   mv.setDescription(mv.getDescription().replaceAll("\n","<br>"));
		      if(mc!=null && mc.getHighLight()!=null)
				   mv.setHighlight(mc.getHighLight());
		
//		if (mc != null && mc.getName() != null)
//			mv.setName(mc.getName());
//		else
//			mv.setName(m.getName());
//		mv.setPhoto(m.getPhoto());
		
		if(m.getPhotos()!=null && m.getPhotos().size()>0){
			Photo p=(Photo)m.getPhotos().get(0);
			mv.setPhoto(p.getPhoto());
		}
		
//		if(mc!=null && mc.getDescription()!=null)
//		mv.setDescription(mc.getDescription());
//		if(mv.getDescription()!=null)
//			mv.setDescription(mv.getDescription().replaceAll("\n","<br>"));
//		if(mc!=null && mc.getHighlight()!=null)
//			mv.setHighlight(mc.getHighlight());

		List actors = m.getActors();
		if (actors != null && actors.size()>0) {
			String actor = "";
			int length = actors.size();
			for (int i = 0; i < length; i++) {
				Actor a = (Actor) actors.get(i);
				
//				ActorCaption ac = a.getCaptions(lang);
				
				ActorCaption ac=null;
				Set set1 = a.getCaptions();
				Iterator iterator1 = set1.iterator();
				while (iterator1.hasNext()) {
					ActorCaption cat = (ActorCaption) iterator1.next();
					if (lang.equals(cat.getLangId())) 
						     ac= cat;
				}
				    if (ac != null && ac.getName() != null)
					         actor += ac.getName();
				     else if (a.getName() != null)
					         actor += a.getName();
					
				
//				
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
//				ActorCaption ac = a.getCaptions(lang);
				
				ActorCaption ac=null;
				Set set1 = a.getCaptions();
				Iterator iterator1 = set1.iterator();
				while (iterator1.hasNext()) {
					ActorCaption cat = (ActorCaption) iterator1.next();
					if (lang.equals(cat.getLangId())) 
						     ac= cat;
					}
				        if (ac != null && ac.getName() != null)
				        	director += ac.getName();
				        else if (a.getName() != null)
					         director += a.getName();
				
//				if (ac != null && ac.getName() != null)
//					director += ac.getName();
//				else if (a.getName() != null)
//					director += a.getName();
			}
			mv.setDirectors(director);
		}

		getItem( m, mv);
		List children=m.getChildren();
		List childs=new ArrayList();
		if(children!=null && children.size()>0){
			for(int i=0;i<children.size();i++){
				Media child=(Media)children.get(i);
				MediaView child_mv = new MediaView();
//				MediaCaption child_mc = child.getCaption(lang);
				
				MediaCaption child_mc=null;
				Set set2 = child.getCaptions();
				Iterator iterator2 = set2.iterator();
				while (iterator2.hasNext()) {
					MediaCaption cat = (MediaCaption) iterator2.next();
					if (lang.equals(cat.getLangId())) 
						   child_mc=cat;
				}
				       if (child_mc != null && child_mc.getName() != null)
					        child_mv.setName(child_mc.getName());
			            else
				        	child_mv.setName(child.getName());
					
				
				
//				if (child_mc != null && child_mc.getName() != null)
//					child_mv.setName(child_mc.getName());
//				else
//					child_mv.setName(child.getName());
				getItem( child, child_mv);
				childs.add(child_mv);
			}
		}
		mv.setChildren(childs);
		//mv.setLevel(getRating(m.getReviews())+"");
		try{
		mv.setLevel(CommentDAO.getAverageRateJDBC(m.getMediaId().toString(), lang.toString())+"");
		}catch(DAOException de){
			de.printStackTrace();
		}
		return mv;
	}
	
	public static void getItem(Media m,MediaView mv){
		List items = m.getItems();
		String url = null;
		String man_account_id = null;
		String man_item_id = null;
		String man_channel_id = null;
		String dis_name = "";
		if (items != null && items.size() > 0) {
			for (int i = 0; i < items.size(); i++) {
				Item item = (Item) items.get(i);
//				man_account_id = item.getManAccountId();
				man_item_id = item.getManItemId();
				DistributeChannel dc = item.getDistribute();
				url=item.getUrl();

				if (dc != null) {					
					man_channel_id = dc.getManChannelId();
					if (dc.getName() != null)
						dis_name = dc.getName();
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
			}
		}
	}
	public static void getItemByJDBC(java.sql.Connection con,String media_id,MediaView mv){
		String sql = "select i.policy_id as policy_id, i.url as url, dc.name as name"
			+ " from item as i left join distribute_channel as dc"
			+ " on i.distribute_id=dc.distribute_id where i.media_id="
			+ media_id;
		//System.out.println(sql);
		try{
			PreparedStatement ps=con.prepareStatement(sql);			
			ResultSet rs = ps.executeQuery();
			String policy_id=null;
			
			while(rs.next())
			{
				policy_id=rs.getString("policy_id");
				String url=rs.getString("url");
				String dis_name=rs.getString("name");
				
				if ("Download".equals(dis_name))
				{
					if(url.indexOf("http")!=-1)
					{
						String temp=url.substring(0,url.lastIndexOf("/"));	
						mv.setDownloadURL(url.substring(url.lastIndexOf("/")+1,url.length()));
						mv.setDir(temp.substring(temp.lastIndexOf("/")+1,temp.length()));
					}
				} else if ("Streaming".equals(dis_name)) {
					mv.setOnlineURL(url);
				} else if ("Free".equals(dis_name)) {
					mv.setFreeUrl(url);
				}
			}
			
			rs.close();
			ps.close();
			mv.setPrice("");
			
			if(policy_id!=null){
				sql="SELECT pp.price,pp.man_package_id FROM price_policy AS pp  where pp.policy_id="+policy_id;
				ps=con.prepareStatement(sql);			
				rs = ps.executeQuery();
				if(rs.next()){					
					mv.setPrice(rs.getDouble("price")/100+"");
					mv.setManPackageId(rs.getString("man_package_id"));
				}
				rs.close();
				ps.close();
			}
				
		}catch(Exception e){
			e.printStackTrace();
		}		
	}
	public static void visitMediaList(List mediaList, List medias, Integer lang) {
		MediaView mv = null;
		for (int i = 0; i < medias.size(); i++) {
			mv = getDetail((Media)medias.get(i),lang);
			mediaList.add(mv);
		}
	}
	
    public static int getRating(List reviewList){
		if(reviewList==null || reviewList.size()==0)
			return 0;
		int average_rating=0;
		if (reviewList !=null){			
			Integer review_number = new Integer(reviewList.size());
			int totalRating =0;	
			int num=0;
			for (int i =0 ;i<reviewList.size();i++){  
				Review review = (Review)reviewList.get(i);
				try{
					if(review.getRating()!=null){
						num++;
						totalRating += Integer.parseInt(review.getRating());
					}					
				}
				catch (NumberFormatException e){
				}
			}
			try{
				average_rating = (int)Math.round(totalRating *10.0/num);
			}catch(ArithmeticException e){
				
			}
		}
		return average_rating;
    }
    
    /*
     * get photo filename from photo table
     * ganquan(2005-10-30)
     */
    public static String getPhotoByJDBC(java.sql.Connection con, String media_id)
    {
    	String photo = "";
		String sql = "select p.photo from photo as p "
			+ " where p.media_id="+media_id;
		try
		{
			PreparedStatement ps=con.prepareStatement(sql);			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				photo = rs.getString("photo");				
			}
			rs.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return photo;
    }
}
