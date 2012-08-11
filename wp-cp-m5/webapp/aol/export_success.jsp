<%@ page contentType="text/html; charset=utf-8" %>

<%
String basePath = request.getContextPath();
if(basePath.equals("/")) 
	basePath = "";
%>
<jsp:useBean id="count" type="java.lang.Integer"  scope="request" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Pragma" content="no-cache">
</head>
<body>

<a href="<%=basePath%>/aol.htm">MAIN</a> &nbsp;|&nbsp;
<br />
<br />
<h1>Success</h1>
<b><%= count %></b> Medias have been exported.

</body>
</html>
