<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../content/common/parameter.jsp" %>
<%@ include file="../trans.jsp" %>
<% 
	String dispatcherURL = "/static.jsp?fn=adultwarning&para="+tranEncode(returnUrl);
	response.sendRedirect(request.getContextPath()+dispatcherURL);
%>