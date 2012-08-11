<% if( ! onlineUrl.equals("") ) { %>
	<a href="<%=onlineUrl%>" class="yline"><bean:message key="media.online"/></a>
<% } %>
<% if( ! downloadUrl.equals("") ) { %>
	<a href="<%=downloadUrl%>" class="yline"><bean:message key="media.download"/></a>
<% } %>
