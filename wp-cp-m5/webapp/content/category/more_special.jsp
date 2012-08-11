<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../common/parameter.jsp" %>
<%@page import="com.chinaportal.portal.category.*"%>

<%
	MediaView sp = (MediaView)request.getAttribute("sp");
%>

<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao.jpg"></div>
	<div style="float:left;padding-top:4px;"></div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao01.jpg" border="0"></div>
</div>

<div class="special_offer_category" style="float:left;background-color:#003366;">
	<div class="content" style="padding:5px;">
		<div style="float:left;width:480px;padding-top:3px;">
			<a href="<%=basePath%>/getDetail.do?media_id=<%=sp.getId()%>"><img src="<%=largeImagePath%><%=sp.getPhoto()%>" border="0" height="200" width="140" align="left" style="padding-right:8px;"></a>
			<b><%=sp.getHighlight()%></b><br/>
			<b><bean:message key="media.title"/></b>: <%=sp.getName()%><br/>
			<b><bean:message key="media.director"/></b>: <%=sp.getDirectors()%><br/>
			<b><bean:message key="media.actor"/></b>: <%=sp.getActors()%><br/>
			<b><bean:message key="media.description"/></b>: <%=sp.getDescription()%><br/>
		</div>
		<div style="float:right;width:114px;">
			<jsp:include page="popular.jsp"/>
		</div>
		<div style="clear:both;text-align:center;">
			<button ><bean:message key="media.online"/></button>							
			<button ><bean:message key="media.download"/></button>
			<button onclick="window.location.href='<%=basePath%>/static.jsp?fn=purchase'"><bean:message key="media.order"/></button>
		</div>
	</div>
</div>

<%@ include file="../common/box_footer_blue.jsp" %>