<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>
<%
SubCategoryView scv=(SubCategoryView)request.getAttribute("Sports_Index_CSL");
List matchs=scv.getMatchs();

out.println("中超<br>");
for(int i=0;i<matchs.size();i++){
	MatchView mv =(MatchView)matchs.get(i);
	out.println(mv.getName());
	out.println(mv.getStarttime());
	List hosts=mv.getHost();
	if(hosts!=null){
		for(int j=0;j<hosts.size();j++){
			IdName in=(IdName)hosts.get(j);
			out.println(in.getName());
		}
	}
	
	List guests=mv.getGuest();
	if(guests!=null){
		for(int j=0;j<guests.size();j++){
			IdName in=(IdName)guests.get(j);
			out.println(in.getName());
		}
	}
	out.println("<br>");
}


out.println("中超杯<br>");
scv=(SubCategoryView)request.getAttribute("Sports_Index_CSLL");
matchs=scv.getMatchs();
for(int i=0;i<matchs.size();i++){
	MatchView mv =(MatchView)matchs.get(i);
	out.println(mv.getName());
	out.println(mv.getStarttime());
	List hosts=mv.getHost();
	if(hosts!=null){
		for(int j=0;j<hosts.size();j++){
			IdName in=(IdName)hosts.get(j);
			out.println(in.getName());
		}
	}
	
	List guests=mv.getGuest();
	if(guests!=null){
		for(int j=0;j<guests.size();j++){
			IdName in=(IdName)guests.get(j);
			out.println(in.getName());
		}
	}
	out.println("<br>");
}

out.println("<br><br>");
out.println("其他赛事<br>");
matchs=(List)request.getAttribute("Sports_Other_Main_Game");
for(int i=0;i<matchs.size();i++){
	MatchView mv =(MatchView)matchs.get(i);
	out.println(mv.getName());
	out.println(mv.getStarttime());
	List hosts=mv.getHost();
	if(hosts!=null){
		for(int j=0;j<hosts.size();j++){
			IdName in=(IdName)hosts.get(j);
			out.println(in.getName());
		}
	}
	
	List guests=mv.getGuest();
	if(guests!=null){
		for(int j=0;j<guests.size();j++){
			IdName in=(IdName)guests.get(j);
			out.println(in.getName());
		}
	}
		out.println("<br>");
}

out.println("<br><br>");
out.println("CBA<br>");
matchs=(List)request.getAttribute("Sports_Index_CBA");

for(int i=0;i<matchs.size();i++){
	MatchView mv =(MatchView)matchs.get(i);
	out.print(mv.getName());
	out.print(mv.getStarttime());
	List hosts=mv.getHost();
	if(hosts!=null){
		for(int j=0;j<hosts.size();j++){
			IdName in=(IdName)hosts.get(j);
			out.print(in.getName());
		}
	}
	
	List guests=mv.getGuest();
	if(guests!=null){
		for(int j=0;j<guests.size();j++){
			IdName in=(IdName)guests.get(j);
			out.print(in.getName());
		}
	}
		out.println("<br>");
}

out.println("<br><br>");
out.println("乒乓球<br>");
matchs=(List)request.getAttribute("Sports_Index_Table_Tennis");

for(int i=0;i<matchs.size();i++){
	MatchView mv =(MatchView)matchs.get(i);
	out.print(mv.getName());
	out.print(mv.getStarttime());
	List hosts=mv.getHost();
	if(hosts!=null){
		for(int j=0;j<hosts.size();j++){
			IdName in=(IdName)hosts.get(j);
			out.print(in.getName());
		}
	}
	
	List guests=mv.getGuest();
	if(guests!=null){
		for(int j=0;j<guests.size();j++){
			IdName in=(IdName)guests.get(j);
			out.print(in.getName());
		}
	}
	out.println("<br>");
}
%>