<%@ page contentType="text/html; charset=utf-8" %>

<%@ page import="com.chinaportal.portal.sports.*" %>
<%@ page import="java.util.List" %>

<%@ include file="../content/common/parameter.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<div class="content">

		<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		    <div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao.jpg"></div>
		    <div style="float:left;padding-top:4px;">
		    	<a href="<%=basePath%>/getHomePage.do"><bean:message key="header.homepage"/></a><span style="font-family:'宋体'">->
		    	<a href="<%=basePath%>/getHomePage.do">
		    	<bean:message key="title.sports" bundle="sports"/></a><span style="font-family:'宋体'">->
		    	<bean:message key="item.swim" bundle="sports"/><bean:message key="label.prize_match" bundle="sports"/>
		    </div>
		    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao01.jpg" border="0"></div>
		</div>
 	
		<div class="content" style="background: url(<%=langImagePath%>banner_2005sjyy_l.jpg);width:610px;height:257px;">
<% if( ! currentSiteName.equals("japan") ) { %>
			<div style="text-align:right;padding-top:215px;padding-right:130px;">
				<button onclick="subscribePack('13')"><bean:message key="button.subscribe" bundle="sports"/><bean:message key="label.all_match" bundle="sports"/></button>
			</div>
<% } %>
		</div>
		
<% if( ! currentSiteName.equals("japan") ) { %>

		<div class="content">
			<%@ include file="common/base_subscribe.jsp" %>
		</div>
<% } %>
		<%@ include file="../content/common/box_footer_blue.jsp" %>

	</div>

	<div style="clear:both;">&nbsp;<a name="top"></a></div>

	<div class="block_footer" style="background: #003366;width:100%;">
		<img align="left" src="<%=themesPath%>icons/icon_lanjiao05.jpg" height="7" width="7">
		<img align="right" src="<%=themesPath%>icons/icon_lanjiao06.jpg" height="7" width="7">
	</div>
	
	<div class="content" style="clear:both;height:160px;">
		<div style="padding:10px;">
			<div style="text-align:center;font-weight:bold;"><bean:message key="item.message.swc.1" bundle="sports"/></div>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="item.message.swc.2" bundle="sports"/></p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="item.message.swc.3" bundle="sports"/></p>
		</div>
	</div>

	<%@ include file="../content/common/box_footer_blue.jsp" %>

	<div style="clear:both;">&nbsp;</div>

   	<script language="javascript">
   		boxTitle         = "2005<bean:message key="label.world" bundle="sports"/><bean:message key="label.swim" bundle="sports"/><bean:message key="label.prize_match" bundle="sports"/><bean:message key="label.all_match" bundle="sports"/>*";
   		boxTitleUrl      = "";
   		boxRightTitle    = "<bean:message key="label.time" bundle="sports"/><bean:message key="label.is" bundle="sports"/>GMT (<bean:message key="label.GMT" bundle="sports"/>)";
   		boxRightTitleUrl = "";
   	</script>
   	
	<%@ include file="../content/common/box_header_yellow.jsp" %>

	<div class="content">

		<jsp:include page="common/match_list_1.jsp"/>
		
		<%@ include file="../content/common/box_footer_blue.jsp" %>

	</div>

	<div style="clear:both;">&nbsp;</div>

	* <bean:message key="notice.swc" bundle="sports"/><bean:message key="notice.sports" bundle="sports"/>

</div>

<jsp:include page="../content/common/footer.jsp" />