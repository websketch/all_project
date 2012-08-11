	<div class="content">

		<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		    <div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao.jpg"></div>
		    <div style="float:left;padding-top:3px;font-family:'宋体';">
		    	<a href="<%=basePath%>/getHomePage.do"><bean:message key="header.homepage"/></a> ->
		    	<a href="<%=basePath%>/getHomePage.do">
		    	<bean:message key="title.sports" bundle="sports"/></a> -> 06'CBA
		    </div>
		    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao01.jpg" border="0"></div>
		</div>
 	
		<div class="content" style="background: url(<%=langImagePath%>banner_tycba06_l.jpg);width:610px;height:257px;">

<% if( ! currentSiteName.equals("japan") ) { %>

			<div style="float:right;text-align:right;padding-top:220px;padding-right:10px;">
				<a href="#"><img onclick="subscribePack( '20' )" src="<%=langImagePath%>banner_wttc_diyue.jpg" border="0" alt=""></a>  
			</div>
<% } %>
		</div>
		
<% if( ! currentSiteName.equals("japan") ) { %>

		<div class="content">
			<%@ include file="base_subscribe.jsp" %>
		</div>
<% } %>
		<%@ include file="../../content/common/box_footer_blue.jsp" %>

	</div>