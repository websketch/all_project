<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../content/common/parameter.jsp" %>

<div style="background-color: #D96208;line-height:20px;">&nbsp;<b><bean:message key="label.focus_match" bundle="sports"/></b></div>
<div style="padding:3px;">
<logic:notEmpty name="Category_Block" property="id">
	<a href="<%=basePath%>/sports/MatchDetail.do?match_id=<bean:write name="Category_Block" property="id"/>"><img src="<%=smallImagePath%><bean:write name="Category_Block" property="photo"/>" border="0" align="left" style="padding-right:5px;padding-bottom:5px;" width="100" height="110">
	<b><bean:write name="Category_Block" property="name"/></b></a><br />
	<bean:write name="Category_Block" property="highlight"/><br /><br />
	<div align="right"><%@ include file="media_link.jsp" %></div>
</logic:notEmpty>
</div>
