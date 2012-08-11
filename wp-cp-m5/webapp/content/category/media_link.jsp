<logic:empty name="m" property="children">
<logic:notEmpty name="m" property="onlineURL">
	<a href="<bean:write name="m" property="onlineURL" filter="false"/>"  style="color: #FF9900;text-decoration: underline;"><bean:message key="media.online"/></a><br>
</logic:notEmpty>
<logic:notEmpty name="m" property="downloadURL">
<a href="<%=DownloadServer%>?path=<bean:write name="m" property="dir" filter="false"/>&file=<bean:write name="m" property="downloadURL" filter="false"/>"  style="color: #FF9900;text-decoration: underline;"><bean:message key="media.download"/></a>
</logic:notEmpty>
</logic:empty>