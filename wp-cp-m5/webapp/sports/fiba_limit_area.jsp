<%@ page contentType="text/html; charset=utf-8" %>

<%@ page import="com.chinaportal.portal.sports.*" %>
<%@ page import="java.util.List" %>

<%@ include file="../content/common/parameter.jsp" %>
<%@ include file="../trans.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<%@ include file="common/fiba_banner.jsp" %>

	<div style="clear:both;">&nbsp;</div>
	
	<div class="block_footer" style="background: #003366;width:100%;">
		<img align="left" src="<%=themesPath%>icons/icon_lanjiao05.jpg" height="7" width="7">
		<img align="right" src="<%=themesPath%>icons/icon_lanjiao06.jpg" height="7" width="7">
	</div>

	<div class="content" style="clear:both;height:360px;">
		<div style="padding: 0px 10px 10px 10px;">
			<p style="font-size:14px;text-align:center;"><bean:message key="label.area_limit" bundle="sports"/></p>
			<p><bean:message key="item.message.fiba_7" bundle="sports"/></p>
			<p><bean:message key="item.message.fiba_8" bundle="sports"/></p>
			<p style="text-align:right;"><a style="color:#FF9900;text-decoration: underline;" href="<%=basePath%>/sports/HomepageItem.do?category_id=215&parent_id=130"><bean:message key="page.back"/><bean:message key="item.basketball.man" bundle="sports"/><bean:message key="match.basketball.aisa" bundle="sports"/><bean:message key="label.mainpage"/></a></p>

			<p style="font-size:14px;text-align:center;">Country Unavailability</p>
			<p>The coverage of 23rd FIBA Asia Men Championship is NOT available in the following country and areas:</p>
			<p>China, Chinese Taipei, Philippines, Korea (semi finals and Final if the Korean team is playing, Lebanon, Algeria, Chad, Djibouti, Egypt, Libya, Tunisia, Morocco, Jordan, Mauritania, Bahrain, Saudi Arabia, Oman, Qatar, Somalia, Syria, United Arab Emirates, Yemen, Sudan, Iraq, Iran, Kuwait, Palestine including Gaza Strip, Japan.</p>
			<p style="text-align:right;"><a style="color:#FF9900;text-decoration: underline;" href="<%=basePath%>/sports/HomepageItem.do?category_id=215&parent_id=130">Back to Asia Championship</a></p>
		</div>
	</div>

	<%@ include file="../content/common/box_footer_blue.jsp" %>

</div>

<jsp:include page="../content/common/footer.jsp" />