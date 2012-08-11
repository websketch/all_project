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

public class ActorUtil {
	
	public static void parseTeamDesc(String description,TeamView tv){
		try{
			StringReader rd=new StringReader(description);
			InputSource in=new InputSource(rd);
			SAXBuilder builder = new SAXBuilder();
			Document doc = builder.build(in);
			Element root = doc.getRootElement();
			Element brief_introduction=root.getChild("brief_introduction");
			if(brief_introduction!=null && brief_introduction.getValue()!=null && !brief_introduction.getValue().equals(""))
				tv.setBrief_introduction(brief_introduction.getValue().replaceAll("\n","<br>"));
			Element desc=root.getChild("desc");
			if(desc!=null && desc.getValue()!=null && !desc.getValue().equals(""))
				tv.setDescription(desc.getValue());
			Element team_member_photo=root.getChild("team_member_photo");
			if(team_member_photo!=null && team_member_photo.getValue()!=null && !team_member_photo.getValue().equals(""))
				tv.setPhoto(team_member_photo.getValue());			
		}catch(Exception e){
			e.printStackTrace();
		}
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
			
			Element position=root.getChild("position");
			if(position!=null && position.getValue()!=null && !position.getValue().equals(""))
				av.setPosition(position.getValue());	
			else
				av.setPosition("");
			
			Element born=root.getChild("born");
			if(born!=null && born.getValue()!=null)
				av.setBorn(born.getValue());
			
			Element height=root.getChild("height");
			if(height!=null && height.getValue()!=null && !height.getValue().equals(""))
				av.setHeight(height.getValue());	
			
			Element weight=root.getChild("weight");
			if(weight!=null && weight.getValue()!=null && !weight.getValue().equals(""))
				av.setWeight(weight.getValue());
			
			Element num=root.getChild("num");
			if(num!=null && num.getValue()!=null && !num.getValue().equals(""))
				av.setNum(num.getValue());
			
			Element certificate=root.getChild("certificate");
			if(certificate!=null && certificate.getValue()!=null && !certificate.getValue().equals(""))
				av.setCertificate(certificate.getValue());
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public static List visitActors(List actors,Integer lang){
		List avs=new ArrayList();
		ActorView av=null;
		for(int i=0;i<actors.size();i++){
			Actor a=(Actor)actors.get(i);
//			ActorCaption ac=a.getCaption(lang);
			
			ActorCaption ac=null;
			Set set = a.getCaptions();
			Iterator iterator = set.iterator();
			while (iterator.hasNext()) {
				ActorCaption cat = (ActorCaption) iterator.next();
				if (lang.equals(cat.getLangId())) 
					ac = cat;
			}
			
			
			av=new ActorView();
			av.setId(a.getActorId().toString());
			if(ac.getName()!=null)
				av.setName(ac.getName());
			else
				av.setName(a.getName());
			Country c=a.getCountry();
			CountryCaption cc=null;
			if(c!=null){
//				cc=c.getCaption(lang);
				
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
			}else
				av.setCountry("");
			
			parseActorDesc(ac.getDescription(),av);
			avs.add(av);
		}
		return avs;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String desc="<description><desc>山东鲁能队的打法始终如一，早在当初桑德拉奇时代就确立了迅捷直接的战术风格，偶尔也打些长传，但主要的还是利用中场队员的速度技术和充沛的体能，不断的奔跑控球，以迫使对方防守队员失去自己的位置，从而为前锋队员创造机会。另外，今年李金羽的加盟为山东队的锋线带来了不少灵性，他和尼古拉斯的配合将无坚不摧。10次参加甲A联赛，在1999年获得冠军。</desc><brief_introduction>领队：韩公政主教练：图巴科维奇助理教练：徐永来 邹新光守门员教练：达尔克、王军体能教练：马宝刚队医：郑伟、王连成、唐立军翻译：姚杰、杨勇</brief_introduction>" +
				"<team_member_photo></team_member_photo></description>";
		ActorUtil.parseTeamDesc(desc,null);
		String test=
			"<description>" +
				"<desc></desc>" +
				"<born>1976-1-29</born>" +
				"<height>168</height>" +
				"<weight>70</weight>" +
				"<num>9</num>" +
				"<certificate>MP1635 </certificate>" +
			"</description>";


	}

}
