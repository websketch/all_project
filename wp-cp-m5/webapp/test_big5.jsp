<%@ page contentType="text/html; charset=gbk" %>
<%@ page import ="com.chinaportal.portal.news.NewsTrans"%>
<html>
<head>
  <title>ChinaPortal</title>
</head>
  <body>
    <h1>Technical Support</h1>
    <br>
    <%
     NewsTrans newsTrans = new NewsTrans();
     String bigStr = newsTrans.gbkToBig("ÖÐ¹ú");
    %>
   test big5:<br>   
   <%=bigStr%>
  </body>
</html>