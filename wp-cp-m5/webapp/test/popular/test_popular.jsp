<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.popular.*"%>
<%
PopularDAO pd=new PopularDAO();
List medias=pd.getPopularMedias("Content_item_hits", new Integer(2),10);
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
%>