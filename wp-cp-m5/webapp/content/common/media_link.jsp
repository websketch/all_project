<logic:notEmpty name="Media_Detail" property="onlineURL">
	<a href="<bean:write name="Media_Detail" property="onlineURL" filter="false"/>"  style="color: #FF9900;text-decoration: underline;"><bean:message key="media.online"/></a>
</logic:notEmpty>
<logic:notEmpty name="Media_Detail" property="downloadURL">
	<a href="<%=DownloadServer%>?path=<bean:write name="Media_Detail" property="dir" filter="false"/>&file=<bean:write name="Media_Detail" property="downloadURL" filter="false"/>"  style="color: #FF9900;text-decoration: underline;">
	<bean:message key="media.download"/></a>
</logic:notEmpty>