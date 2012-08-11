<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>
<%
MatchDetailDAO mdd=new MatchDetailDAO();
MatchView mv=mdd.getMatchDetail("201","1183",new Integer(2));
out.println(mv.getDescription());
out.println(mv.getHighlight());
out.println(mv.getName()+"<br>");
out.println(mv.getChannel_name()+"<br>");
out.println(mv.getPhoto()+"<br>");
out.println(mv.getStarttime());
out.println(mv.getDescription()+"<br>");
List hosts=mv.getHost();
if(hosts!=null){
	for(int i=0;i<hosts.size();i++){
		IdName in=(IdName)hosts.get(i);
		out.println(in.getName());
	}
}
out.println(" vs ");
List guests=mv.getGuest();
if(guests!=null){
	for(int i=0;i<guests.size();i++){
		IdName in=(IdName)guests.get(i);
		out.println(in.getName());
	}
}

%>