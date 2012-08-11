	<div>
<logic:notEmpty name="mediaview" property="onlineURL">
		<a href="<bean:write name="mediaview" property="onlineURL"/>" title="<bean:write name="mediaview" property="highlight"/>" style="color: #FF9900;text-decoration: underline;"><bean:message key="media.online"/></a>
</logic:notEmpty>
	</div>
	<div>
<logic:notEmpty name="mediaview" property="downloadURL">
		<a href="<%=DownloadServer%>?path=<bean:write name="mediaview" property="dir"/>&file=<bean:write name="mediaview" property="downloadURL"/>" title="<bean:write name="mediaview" property="highlight"/>" style="color: #FF9900;text-decoration: underline;"><bean:message key="media.download"/></a>
</logic:notEmpty>
	</div>