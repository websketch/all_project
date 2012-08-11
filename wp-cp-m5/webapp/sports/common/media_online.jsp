<% if(mv.getOnlineURL()!=null && ! mv.getOnlineURL().equals("")) { %>
	<a href="<%=mv.getOnlineURL()%>"  style="color: #000;text-decoration: underline;"><bean:message key="media.online"/></a>
<% } else { %> - <% } %>