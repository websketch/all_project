<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.homepage.*,com.chinaportal.portal.category.*"%>
<%
CategoryDAO pd=new CategoryDAO();
List medias=pd.getPopular(new Integer(2),new Integer(2));
for(int i=0;i<medias.size();i++){
	MediaView mv =(MediaView)medias.get(i);
	out.println(mv.getId()+" "+mv.getName()+" <br> ");
}
%>