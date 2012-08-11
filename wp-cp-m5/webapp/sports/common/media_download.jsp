<% if(mv.getDownloadURL()!=null && ! mv.getDownloadURL().equals("")) { %>
	<a href="<%=DownloadServer%>?path=<%=mv.getDir()%>&file=<%=mv.getDownloadURL()%>"  style="color: #000;text-decoration: underline;"><bean:message key="media.download"/></a>	
<% } else { %> - <% } %>