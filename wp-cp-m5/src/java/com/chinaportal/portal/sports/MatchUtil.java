package com.chinaportal.portal.sports;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.chinaportal.portal.category.MediaView;
import com.chinaportal.portal.detail.MediaUtil;
import com.mediazone.bean.Actor;
import com.mediazone.bean.ActorCaption;
import com.mediazone.bean.Category;
import com.mediazone.bean.CategoryCaption;
import com.mediazone.bean.DistributeChannel;
import com.mediazone.bean.Item;
import com.mediazone.bean.Media;
import com.mediazone.bean.MediaCaption;
import com.mediazone.bean.Photo;
import com.mediazone.bean.Review;
import com.mediazone.selfcare.UrlBuilder;
import com.mediazone.util.TimeUtil;

public class MatchUtil {
	public static MatchView getDetail(Media m, Integer lang) {
		MatchView mv = new MatchView();
		mv.setId(m.getMediaId().toString());
//		MediaCaption mc = m.getCaption(lang);
		
		MediaCaption mc =null;
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
		if (m.getStartTime() != null)
			mv.setStarttime(TimeUtil.getWholeWithoutSecond(m.getStartTime()));
		else
			mv.setStarttime("");

		if (m.getEndTime() != null)
			mv.setEndtime(TimeUtil.getWholeWithoutSecond(m.getEndTime()));
		else
			mv.setEndtime("");
		List photos=m.getPhotos();
		if(photos!=null && photos.size()>0){
			Photo p=(Photo)photos.get(0);
			mv.setPhoto(p.getPhoto());
		}else
			mv.setPhoto("notavailable.jpg");
			
		if(mc != null &&mc.getDescription()!=null)
			mv.setDescription(mc.getDescription());
		if(mv.getDescription()==null)
			mv.setDescription("");
		if(mc!=null && mc.getHighLight()!=null)
			mv.setHighlight(mc.getHighLight());
		if(mv.getHighlight()==null)
			mv.setHighlight("");
		List guests = m.getGuest();
		if (guests != null && guests.size() > 0) {
			List guest_list = new ArrayList();
			for (int i = 0; i < guests.size(); i++) {
				Actor host = (Actor) guests.get(i);
				IdName in = new IdName();
				in.setId(host.getActorId().toString());

//				ActorCaption ac = host.getCaptions(lang);
				
				ActorCaption ac =null;
				Set set1 =host.getCaptions();
				Iterator iterator1 = set1.iterator();
				while (iterator1.hasNext()) {
					ActorCaption cat = (ActorCaption) iterator1.next();
					if (lang.equals(cat.getLangId())) {
						ac= cat;
					}
				}
				
				if (ac != null && ac.getName() != null)
					in.setName(ac.getName());
				else
					in.setName(host.getName());
				if(host.getChildren().size()>0)
					in.setTeam(true);
				else
					in.setTeam(false);
				
				guest_list.add(in);
			}
			mv.setGuest(guest_list);
		}

		List hosts = m.getHost();
		if (hosts != null && hosts.size() > 0) {
			List host_list = new ArrayList();
			for (int i = 0; i < hosts.size(); i++) {
				Actor host = (Actor) hosts.get(i);
				IdName in = new IdName();
				in.setId(host.getActorId().toString());

//				ActorCaption ac = host.getCaption(lang);
				
 				ActorCaption ac=null;
 				Set set1 =host.getCaptions();
 				Iterator iterator1 = set1.iterator();
 				while (iterator1.hasNext()) {
 					ActorCaption cat = (ActorCaption) iterator1.next();
 					if (lang.equals(cat.getLangId())) {
 						ac=cat;
 					}
 				}
				
				if (ac != null && ac.getName() != null)
					in.setName(ac.getName());
				else
					in.setName(host.getName());
				if(host.getChildren().size()>0)
					in.setTeam(true);
				else
					in.setTeam(false);
				
				host_list.add(in);
			}
			mv.setHost(host_list);
		}

		getItem(m,mv);
		//mv.setReviews(m.getReviews());
		mv.setLevel(MediaUtil.getRating(mv.getReviews())+"");
		return mv;
	}
	public static void getItem(Media m,MatchView mv){
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
	public static void getChannel(Media m,Integer lang, MatchView mv){
		List categorys=m.getCategorys();
		Category c=null;
		if(categorys!=null && categorys.size()>0){
			int category_id=-1;
			for(int i=0;i<categorys.size();i++){
				Category temp=(Category)categorys.get(0);
				if(category_id<temp.getCategoryId().intValue())
					c=temp;
			}
			
			Set parents=null;
			boolean find=false;
			while((parents=c.getParents())!=null && parents.size()>0 && find==false){
				Iterator it=parents.iterator();
				while(it.hasNext()){
					Category p=(Category)it.next();
					if(p.getCategoryId().intValue()==130){
						mv.setChannel_id(c.getCategoryId().toString());
//						CategoryCaption cc=c.getCaption(lang);
						
						CategoryCaption cc=null;
					      Set set =c.getCaptions();
					      Iterator iterator = set.iterator();
					      while (iterator.hasNext()) {
					        CategoryCaption cat = (CategoryCaption)iterator.next();
					         if (lang.equals(cat.getLangId())) 
						         cc = cat; 
					     }
//						
						if(cc!=null && cc.getName()!=null)
							mv.setChannel_name(cc.getName());
						else
							mv.setChannel_name(c.getName());
						find=true;
						break;
					}
					else
						c=p;
				}
			}
		}
	}
	public static void visitMediaList(List mediaList, List medias, Integer lang) {
		visitMediaList( mediaList,  medias, lang,false);
	}
	public static void visitMediaList(List mediaList, List medias, Integer lang,boolean needChannel) {
		MatchView mv = null;
		for (int i = 0; i < medias.size(); i++) {
			Media m=(Media) medias.get(i);
			mv = getDetail(m, lang);
			if(needChannel){
				getChannel( m, lang,  mv);
			}
			mediaList.add(mv);
		}
	}
	public static void getItemByJDBC(java.sql.Connection con,String media_id,MatchView mv){
		String sql = "select i.url as url,dc.name as name"
			+ " from item as i, distribute_channel as dc"
			+ " where i.distribute_id=dc.distribute_id and i.media_id="
			+ media_id;
		try{
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
		}		
	}	
}
