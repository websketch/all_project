<%@ page contentType="text/html; charset=utf-8" %>
<jsp:include page="content/common/header.jsp" />

<%@ page import="com.mediazone.man.toho.UserUnsubscribeTransaction" %>
<%@ page import="com.mediazone.man.toho.ManResponseBean" %>
<%
	String email = request.getParameter("Email");
	String rem = request.getParameter("rem");
	String pageResponse = "";
	String error = "";
	
	if ( email != null && email.length() > 0 && rem != null && rem.equals("true") )
	{
		UserUnsubscribeTransaction uut = new UserUnsubscribeTransaction();
		ManResponseBean responseBean = uut.unsubscribe(email, request.getCookies());
		
		if ( responseBean.getMAN_ERROR_CODE().equals("0") )
		{
			pageResponse = "We have received your request. It may take up to 7 business days to completely unsubscribe";
		}
		else
		{
			error = "An Error has occurred";
		}
	}
	
	if ( email == null )
		email = "";
%>
<form name="unsubscribe" method="get" action="">
<input type="hidden" name="rem" value="true"/>
<table style="border:0px solid" width="100%" border="0" cellspacing="0" cellpadding="3">
	<% if (  rem != null && rem.equals("true") ) { %>
	<tr>
		<td>&nbsp;</td>
	</tr>	
	<tr>
		<td align="center"><b><font color="yellow"><%=pageResponse%></font><font color="red"><%=error%></font></b></td>
	</tr>
	<% } else { %>
	<tr>
		<td align="center" bgcolor="blue"><b>E-Mail Removal Management Center</b></td>
	</tr>
	<tr>
		<td align="center">
			Enter your email address below and you'll be put on our Remove list, If you have multiple email addresses, or use email aliases please enter them as well.		
			<br/><br/>
			Removal requests can take up to 7 days to be completely processed, however we diligently processes all removes.
			
			<br/>
			<br/>
			<b>We honor ALL removal requests</b>
			<br/>
			<br/>
			Email Address:  <input type="text" name="Email" value="<%=email%>"/> <input type="submit" name="submit" value="Click To Remove" style="height:20px;vertical-align: middle;font-size:11px;"/>
		</td>
	</tr>
	<% } %>
</table>
</form>

<jsp:include page="content/common/footer.jsp" />