<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>
<%
ActorDetailDAO tdd=new ActorDetailDAO();
ActorView av=tdd.getDetail("4848",new Integer(2));
out.println(av.getId()+" "+av.getName()+" <br> ");
out.println(av.getNum()+"<br>");
out.println(av.getBorn()+"  <br> ");
out.println(av.getHeight()+" <br> ");
out.println(av.getWeight()+"<br>");
out.println(av.getCountry()+"<br>");
out.println(av.getCertificate()+" <br>");

%>