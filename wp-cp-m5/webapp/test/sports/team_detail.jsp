<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>
<%
Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");
TeamDetailDAO tdd=new TeamDetailDAO();
TeamView tv=tdd.getDetail(request.getParameter("team_id"),lang);
out.println(tv.getName()+"<br>");
out.println(tv.getPhoto()+"<br>");
out.println(tv.getBrief_introduction().replaceAll("\n","<br>")+"<br>");
out.println(tv.getDescription()+"<br>");
List children=tv.getActors();
for(int i=0;i<children.size();i++){
	ActorView av=(ActorView)children.get(i);
	out.println(av.getId()+" "+av.getName()+"    &nbsp;&nbsp;&nbsp;   ");
	out.println(av.getBorn()+"       &nbsp;&nbsp;&nbsp;     ");
	out.println(av.getHeight()+"      &nbsp;&nbsp;&nbsp;      ");
	out.println(av.getWeight()+"      &nbsp;&nbsp;&nbsp;    ");
	out.println(av.getNum()+" ");
	out.println(av.getCertificate()+" &nbsp;&nbsp;&nbsp;");
	out.println(av.getCountry()+"<br>");
}

%>