<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.homepage.*,com.chinaportal.portal.category.*"%>
<%
HomePageDAO pd=new HomePageDAO();
List medias=pd.getMoreByName(new Integer(2),"NEW");
for(int i=0;i<medias.size();i++){
	MediaView mv =(MediaView)medias.get(i);
	out.println(mv.getId()+" "+mv.getName()+" <br> ");
	out.println(mv.getHighlight()+"<br>");
	out.println(mv.getLevel()+"<br>");
	int level=Integer.parseInt(mv.getLevel());
	int first=level%10;
	int second=level/10;
	for(int j=0;j<second;j++){
		out.println("*");
	}
	if(first>=4)
		out.println("semi-*");
}
out.println("RECOMMEND="+pd.getMoreByName(new Integer(2),"RECOMMEND").size());
out.println("COMMING_SOON="+pd.getMoreByName(new Integer(2),"COMMING_SOON").size());
%>