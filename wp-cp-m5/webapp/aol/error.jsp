<%@ page contentType="text/html; charset=utf-8" %>
<jsp:useBean id="exception" type="java.lang.Throwable"  scope="request" />
<html>
<head>
  <title>ChinaPortal</title>
</head>
  <body>
    <h1>Technical Support</h1>
    
    <p>We're sorry, an error occurred processing your request.</p>
    
    <p>You got a <%= exception %>
    
  </body>
</html>
