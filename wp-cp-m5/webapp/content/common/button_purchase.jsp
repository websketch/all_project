<%
String toUrl = "window.location.href='" + basePath + "/static.jsp?fn=purchase'";

if( currentSiteName.equals("japan") )
{
	toUrl = "jpPopup('http://www.keitainet.jp/MailIndex.html', 'keitainet')";
}
	//response.sendRedirect("http://www.keitainet.jp/MailIndex.html");
	//request.getHeader("referer")
	
%>
<button onclick="<%=toUrl%>"><bean:message key="media.order"/></button>
