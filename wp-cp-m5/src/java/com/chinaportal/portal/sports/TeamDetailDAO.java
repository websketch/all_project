package com.chinaportal.portal.sports;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.xml.sax.InputSource;

import com.mediazone.bean.Actor;
import com.mediazone.bean.ActorCaption;
import com.mediazone.bean.Country;
import com.mediazone.bean.CountryCaption;
import com.mediazone.bean.Photo;
import com.mediazone.dao.BaseQuery;

public class TeamDetailDAO extends BaseQuery {
	public TeamView getDetail(String id,Integer lang){
		TeamView tv=null;
		String hql="select a from Actor as a where a.actorId="+id;
		try {
			List teams = executeQuery(hql);			
			if (teams == null || teams.size() < 1)
				return tv;
			else
				tv=new TeamView();
			
			Actor team = (Actor) teams.get(0);
			
			tv.setId(team.getActorId().toString());
			
//			ActorCaption ac=team.getCaptions(lang);
			
			
			ActorCaption ac=null;
			Set set = team.getCaptions();
			Iterator iterator = set.iterator();
			while (iterator.hasNext()) {
				ActorCaption cat = (ActorCaption) iterator.next();
				if (lang.equals(cat.getLangId()))
					ac=cat;
			}
			
			
			if(ac!=null && ac.getName()!=null)
				tv.setName(ac.getName());
			else
				tv.setName(team.getName());
			if(ac.getDescription()!=null && ac.getDescription().length()>0)
				ActorUtil.parseTeamDesc(ac.getDescription(),tv);
//			tv.setPhoto(team.getPhoto());
			
			if(team.getPhotos()!=null && team.getPhotos().size()>0){
				Photo p=(Photo)team.getPhotos().get(0);
			        tv.setPhoto(p.getPhoto());
			}
			
			if(tv.getPhoto()==null)							
				tv.setPhoto("notavailable.jpg");
			tv.setActors(ActorUtil.visitActors(team.getChildren(),lang));
			
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
		return tv;
	}
	
	public List getTeamList(String category_id,Integer lang){
		List result=new ArrayList();
		String hql="select a from Actor as a,Meida where a.categoryId="+category_id;
		try {
			List teams = executeQuery(hql);			
			if (teams == null || teams.size() < 1)
				return result;
					
			for(int i=0;i<teams.size();i++){
				TeamView	tv=new TeamView();
				Actor team = (Actor) teams.get(i);
				tv.setId(team.getActorId().toString());
//				ActorCaption ac=team.getCaptions(lang);
				
				ActorCaption ac=null;
				Set set =team.getCaptions();
				Iterator iterator = set.iterator();
				while (iterator.hasNext()) {
					ActorCaption cat = (ActorCaption) iterator.next();
					if (lang.equals(cat.getLangId()))
						ac = cat;
				}
				
				
				if(ac!=null && ac.getName()!=null)
					tv.setName(ac.getName());
				else
					tv.setName(team.getName());
				if(ac.getDescription()!=null && ac.getDescription().length()>0)
					ActorUtil.parseTeamDesc(ac.getDescription(),tv);
			
				if(tv.getPhoto()==null)
//					tv.setPhoto(team.getPhoto());
				if(team.getPhotos()!=null && team.getPhotos().size()>0){
					Photo p=(Photo)team.getPhotos().get(0);
				        tv.setPhoto(p.getPhoto());
				}
				
				
				tv.setActors(visitActors(team.getChildren(),lang));
				result.add(tv);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try{
				this.closeSession();
			}catch(Exception fe){
			}
		}
		return result;		
	}
	
	public static List visitActors(List actors,Integer lang){
		List avs=new ArrayList();
		ActorView av=null;
		for(int i=0;i<actors.size();i++){
			Actor a=(Actor)actors.get(i);
//			ActorCaption ac=a.getCaptions(lang);
			
			ActorCaption ac =null;
			Set set = a.getCaptions();
			Iterator iterator = set.iterator();
			while (iterator.hasNext()) {
				ActorCaption cat = (ActorCaption) iterator.next();
				if (lang.equals(cat.getLangId())) {
					 ac = cat;
				}
			}
			
			av=new ActorView();
			av.setId(a.getActorId().toString());
			if(ac.getName()!=null)
				av.setName(ac.getName());
			else
				av.setName(a.getName());			
			parseActorDesc(ac.getDescription(),av);
			avs.add(av);
		}
		return avs;
	}
	
	public static void parseActorDesc(String description,ActorView av){
		if(description!=null){
			if( description.indexOf("<description>")==-1){
				av.setDescription(description);
				return;
			}
		}else{
			av.setDescription("");
			return;
		}
		try{
			StringReader rd=new StringReader(description);
			InputSource in=new InputSource(rd);
			SAXBuilder builder = new SAXBuilder();
			Document doc = builder.build(in);
			Element root = doc.getRootElement();
			Element num=root.getChild("num");
			if(num!=null && num.getValue()!=null && !num.getValue().equals(""))
				av.setNum(num.getValue());

			
		}catch(Exception e){
			e.printStackTrace();
		}		
	}
}
