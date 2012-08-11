<form name="frm" action="test.jsp">
<input type="text" name="name" value="gg">
<input type="text" name="age" value="1">
<input type="submit">
</form>
<%
session.invalidate();
String url=request.getRequestURL().toString();
String paras=request.getQueryString();
out.println("url="+url);
out.println("<br>");
out.println("paras="+paras);
out.println("<br>"+request.getRequestURI());
out.println("<br>"+request.getHeader("referer"));
%>