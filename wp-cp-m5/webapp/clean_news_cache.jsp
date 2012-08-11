<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="com.chinaportal.portal.util.VOCache" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ChinaPortal</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
  </head>
  
  <body>
    <%
    	String entertainment_news_type = "1";
    	String sports_news_type = "2";
    	String key = null;
    	VOCache vOCache = new VOCache();
    	for(int i=1; i<=4; i++){
    		key = "HomePageDAO.getNews("+entertainment_news_type+","+i+")";
    		vOCache.remove(key);
    		key = "SportsDAO.getNews("+sports_news_type+","+i+")";
    		vOCache.remove(key);
    	}
    %>
    <br>
    <center>
    Clean News Cache Success!
    </center>
  </body>
</html>
