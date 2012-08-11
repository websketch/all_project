<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ChinaPortal</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
  </head>
  
  <body>
    <%
    com.chinaportal.portal.util.VOCache.clearCache();
    com.chinaportal.portal.base.Context ctx=new com.chinaportal.portal.base.Context ();
    ctx.setCategorys();
    %>
    <br>
    <center>
    Clear Cache Successfully!
    </center>
  </body>
</html>
