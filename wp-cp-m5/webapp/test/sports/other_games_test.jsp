<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>
<%
OtherGameDAO ogd=new OtherGameDAO();

List subs=ogd.getSubCategorys("204,205,207", new Integer(2));

for(int i=0;i<subs.size();i++){
	SubCategoryView scv=(SubCategoryView)subs.get(i);
	out.println(scv.getName()+"<br>");
	List matchs=scv.getMatchs();
	for(int j=0;j<matchs.size();j++){
		MatchView mv =(MatchView)matchs.get(j);
		out.println(mv.getName());
		out.println(mv.getStarttime());
		List hosts=mv.getHost();
		if(hosts!=null){
			for(int k=0;k<hosts.size();k++){
				IdName in=(IdName)hosts.get(k);
				out.println(in.getName());
			}
		}
	
		List guests=mv.getGuest();
		if(guests!=null){
			for(int k=0;k<guests.size();k++){
				IdName in=(IdName)guests.get(k);
				out.println(in.getName());
			}
		}
		out.println("<br>");
	}
}
%>