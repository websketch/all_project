<a href="<bean:write name="Category_Block" property="onlineURL" filter="false"/>"  style="color: #FF9900;text-decoration: underline;"><bean:message key="media.online"/></a>
<a href="<%=DownloadServer%>?path=<bean:write name="Category_Block" property="dir" filter="false"/>&file=<bean:write name="Category_Block" property="downloadURL" filter="false"/>"  style="color: #FF9900;text-decoration: underline;">
<bean:message key="media.download"/></a>
