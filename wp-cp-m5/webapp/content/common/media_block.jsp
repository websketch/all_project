<div>
	<a href="<%=basePath%>/getDetail.do?media_id=<bean:write name="Media_Detail" property="id" />" title="<bean:write name="Media_Detail" property="highlight" />"><img width="80px" height="100px" alt="" src="<%=smallImagePath%><bean:write name="Media_Detail" property="photo" />" border="0" align="left" style="padding-top:3px;padding-right:6px;"><span style="color:#ff9900;text-decoration: underline;"><bean:write name="Media_Detail" property="name"/></span></a><br /><bean:write name="Media_Detail" property="highlight" />
</div>
<div style="clear:both;padding-top:5px;">
	<%@ include file="../common/media_link.jsp" %>
</div>
