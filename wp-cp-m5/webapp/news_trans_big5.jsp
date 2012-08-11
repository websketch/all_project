<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="java.util.*,com.chinaportal.portal.news.NewsTrans,com.mediazone.bean.NewsCaption" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
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
    	NewsTrans newsTrans = new NewsTrans();
    	newsTrans.convertToBig5();
    %>
    <br>
    <center>
      News Caption Traditionalize Success!
    </center>
    
  </body>
</html>
