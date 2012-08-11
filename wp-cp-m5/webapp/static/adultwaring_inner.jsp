<%@ include file="../trans.jsp" %>
<%
	//String category_id = request.getParameter("category_id");
	//String tar = request.getParameter("tar");
	//String parent_id = request.getParameter("parent_id");
	//String linkURI = request.getContextPath() +"/adult/adult_warning_do.jsp?category_id="+category_id+"&tar="+tar+"&parent_id="+parent_id;
	
	String returnAdultUrl = "";
 	String adultPara = request.getParameter("para");
 	if(adultPara!=null && !adultPara.equals("")) returnAdultUrl = tranEncode(adultPara);
 	String linkURI = request.getContextPath() +"/mature_warning_do.jsp?returnAdultUrl="+returnAdultUrl;
%>