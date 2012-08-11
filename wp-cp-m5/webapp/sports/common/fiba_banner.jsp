	<div class="content">

		<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		    <div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao.jpg"></div>
		    <div style="float:left;padding-top:4px;">
		    	<a href="<%=basePath%>/getHomePage.do"><bean:message key="header.homepage"/></a><span style="font-family:'宋体'">->
		    	<a href="<%=basePath%>/getHomePage.do">
		    	<bean:message key="title.sports" bundle="sports"/></a><span style="font-family:'宋体'">->
		    	<bean:message key="label.di" bundle="sports"/>23<bean:message key="label.jie" bundle="sports"/><bean:message key="item.basketball.man" bundle="sports"/><bean:message key="match.basketball.aisa" bundle="sports"/>
		    </div>
		    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao01.jpg" border="0"></div>
		</div>
 	
		<div class="content" style="background: url(<%=langImagePath%>banner_23jnlyjs_l.jpg);width:610px;height:257px;">
			<div style="float:left;text-align:left;padding-top:215px;padding-left:30px;">
<% if( ! currentSiteName.equals("japan") ) { %>
				<a href="#"><img onclick="subscribePack( '16' )" src="<%=langImagePath%>banner_dysctc.jpg" border="0" alt=""></a>  
<% } %>
				<!--button onclick="subscribePack('16')"><{#lang_all_subscribe#|ctruncate:4:false}><{#lang_match_series#}></button-->&nbsp;&nbsp;
				<a href="<%=basePath%>/sports/fiba_limit_area.jsp" style="color: yellow;text-decoration: underline;"><bean:message key="label.area_limit" bundle="sports"/></a>&nbsp;&nbsp;<a href="<%=basePath%>/sports/eb2005.jsp" style="color: yellow;text-decoration: underline;"><bean:message key="label.watch" bundle="sports"/><bean:message key="item.basketball.man" bundle="sports"/><bean:message key="match.basketball.euro" bundle="sports"/></a>
			</div>
			<div style="float:right;text-align:right;padding-top:215px;padding-right:10px;">
<% if( ! currentSiteName.equals("japan") ) { %>
				<button onclick="subscribePack('16')"><bean:message key="button.subscribe" bundle="sports"/><bean:message key="label.all_match" bundle="sports"/></button>
<% } %>
				<button onclick="window.location.href='http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/chinaVSUZBK_050915.wmv'"><bean:message key="button.free_preview" bundle="sports"/></button>
			</div>
		</div>
		
<% if( ! currentSiteName.equals("japan") ) { %>
		<div class="content">
			<%@ include file="base_subscribe.jsp" %>
		</div>
<% } %>
		<%@ include file="../../content/common/box_footer_blue.jsp" %>

	</div>