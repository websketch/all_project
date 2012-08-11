<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../content/common/parameter.jsp" %>
<%@ include file="../trans.jsp" %>
<%
 String forwardUrl = "https://secure.chinaportal.com/ext/index.aspx?CrmId=chinaportal&action=authenticate&Flow=1&ReturnUrl="+tranEncode(returnUrl);
 response.sendRedirect(forwardUrl);
%> 