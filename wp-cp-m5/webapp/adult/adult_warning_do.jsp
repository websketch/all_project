<%@ page contentType="text/html; charset=utf-8" %>
<%
	String category_id = request.getParameter("category_id");
	String tar = request.getParameter("tar");
	String parent_id = request.getParameter("parent_id");
	String URI = "";
	//String tolinkURI = "";
	if(category_id.equals("103")){
		URI = request.getContextPath()+"/getCategory.do?category_id="+category_id+"&parent_id="+parent_id;
	}else{
		URI = request.getContextPath()+"/adult/adultAction.do?category_id="+category_id+"&tar="+tar;
	}
	//tolinkURI = request.getContextPath()+URI + "?category_id="+category_id+"&tar="+tar;
	session.setAttribute("warned", new Boolean(true));
	response.sendRedirect(URI);
%>