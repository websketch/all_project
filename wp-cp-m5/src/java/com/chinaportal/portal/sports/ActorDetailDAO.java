package com.chinaportal.portal.sports;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.mediazone.bean.Actor;
import com.mediazone.bean.ActorCaption;
import com.mediazone.bean.Country;
import com.mediazone.bean.CountryCaption;
import com.mediazone.bean.Photo;
import com.mediazone.dao.BaseQuery;

public class ActorDetailDAO extends BaseQuery {
	public ActorView getDetail(String id, Integer lang) {
		ActorView av = null;
		String hql = "select a from Actor as a where a.actorId=" + id;
		try {
			List actors = executeQuery(hql);
			if (actors == null || actors.size() < 1)
				return av;
			else
				av = new ActorView();

			Actor a = (Actor) actors.get(0);

			av.setId(a.getActorId().toString());

//			ActorCaption ac = a.getCaption(lang);
			
			ActorCaption ac=null;
			Set set = a.getCaptions();
			Iterator iterator = set.iterator();
			while (iterator.hasNext()) {
			  ActorCaption cat = (ActorCaption) iterator.next();
			  if (lang.equals(cat.getLangId())) 
					 ac = cat;
			  }
		  	     if (ac != null && ac.getName() != null)
				     av.setName(ac.getName());
			     else
				     av.setName(a.getName());
//			if (ac != null && ac.getName() != null)
//				av.setName(ac.getName());
//			else
//				av.setName(a.getName());
			if (ac.getDescription() != null && ac.getDescription().length() > 0)
				ActorUtil.parseActorDesc(ac.getDescription(), av);
			
			Country c=a.getCountry();
			CountryCaption cc=null;
			if(c!=null){
//				cc=c.getCaptions(lang);
				
				Set set1 = c.getCaptions();
				Iterator iterator1 = set1.iterator();
				while (iterator1.hasNext()) {
					CountryCaption cat = (CountryCaption) iterator1.next();
					if (lang.equals(cat.getLangId())) 
						   cc=cat;
					}
				      if(cc!=null)
					       av.setCountry(cc.getName());
				        else
					       av.setCountry(c.getName());
		
//				if(cc!=null)
//					av.setCountry(cc.getName());
//				else
//					av.setCountry(c.getName());
			}
			
			List photos=a.getPhotos();
			if(photos!=null && photos.size()>0){
				Photo p=(Photo)photos.get(0);
				av.setPhoto(p.getPhoto());
			}
			if(av.getPhoto()==null || av.getPhoto().equals(""))							
				av.setPhoto("notavailable.jpg");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try{
				this.closeSession();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return av;
	}

}
