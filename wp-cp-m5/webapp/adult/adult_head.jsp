<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*, com.mediazone.bean.Category,com.chinaportal.portal.category.CategoryView" %>
<%@ include file="../content/common/parameter.jsp" %>
<jsp:useBean id="categoryDAO" class="com.chinaportal.portal.category.CategoryDAO" scope="page"/>
<% isAdultPage = true;%>
<% 
	//String parent_id = request.getParameter("category_id");
	String parent_id = "20";//成人频道id
	com.chinaportal.portal.base.Context ctx=new com.chinaportal.portal.base.Context();	
	List categorys = ctx.getChildren(parent_id, lang_id);
%>	

<!-- adult channel catalog -->
<div style="text-align:right;margin-top:5px;margin-right:8px;margin-bottom:5px;">
<% for(int i=0; i<categorys.size(); i++){
		 CategoryView category = (CategoryView)categorys.get(i);
		 String category_id = category.getCategory_id();
%>		 
	<a style="text-decoration: underline;" href="<%=basePath%>/adult/adultAction.do?tar=catalog&category_id=<%=category_id%>"><%=category.getCategory_name()%></a> |  
<%}%>
	<a style="text-decoration: underline;" href="<%=basePath%>/static.jsp?fn=compliance"><bean:message key="adult.compliance" bundle="adult" /></a>
</div>

<!-- ad image -->
<div class="box111">
	<!--{include file="adult/block_adult_homepage_ad.tpl"}-->
	<%@ include file="adult_home_ad.jsp" %>
</div>

<div class="box112">
	<%@ include file="adult_home_subscribe.jsp" %>
</div>

<div class="space_line"></div>
