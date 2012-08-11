<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>
<%
TeamDetailDAO tdd=new TeamDetailDAO();
List tvs=tdd.getTeamList("201",new Integer(2));
for(int i=0;i<tvs.size();i++){
	TeamView tv=(TeamView)tvs.get(i);
	out.println(tv.getName()+"<br>");
	out.println(tv.getPhoto()+"<br>");
	out.println(tv.getBrief_introduction().replaceAll("\n","<br>")+"<br>");
	out.println(tv.getDescription()+"<br>");
	List children=tv.getActors();
	for(int j=0;j<children.size();j++){
		ActorView av=(ActorView)children.get(j);
		out.println(av.getId()+" "+av.getName()+"    &nbsp;&nbsp;&nbsp;   ");		
		out.println(av.getNum()+" <br>");
	}
}
%>