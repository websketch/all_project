<%@ page contentType="text/html; charset=utf-8" %>

<%@ page import="com.chinaportal.portal.sports.*" %>
<%@ page import="java.util.List" %>

<%@ include file="../content/common/parameter.jsp" %>
<%@ include file="../trans.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<%@ include file="common/fiba_banner.jsp" %>

	<div style="clear:both;">&nbsp;<a name="top"></a></div>

   	<script language="javascript">
   		boxTitle         = "<bean:message key="label.di" bundle="sports"/>23<bean:message key="label.jie" bundle="sports"/><bean:message key="item.basketball.man" bundle="sports"/><bean:message key="match.basketball.aisa" bundle="sports"/>";
   		boxTitleUrl      = "";
   		boxRightTitle    = "<bean:message key="label.time" bundle="sports"/><bean:message key="label.is" bundle="sports"/><bean:message key="area.beijing"/><bean:message key="label.time" bundle="sports"/>";
   		boxRightTitleUrl = "";
   	</script>
   	
	<%@ include file="../content/common/box_header_yellow.jsp" %>

	<div class="content">

		<jsp:include page="common/match_list_1.jsp"/>
		
		<%@ include file="../content/common/box_footer_blue.jsp" %>

	</div>

	<div style="clear:both;">&nbsp;</div>

	* <bean:message key="notice.sports" bundle="sports"/><br />
	* <bean:message key="item.message.fiba_1" bundle="sports"/>

	<div style="clear:both;">&nbsp;</div>
	
	<div class="block_footer" style="background: #003366;width:100%;">
		<img align="left" src="<%=themesPath%>icons/icon_lanjiao05.jpg" height="7" width="7">
		<img align="right" src="<%=themesPath%>icons/icon_lanjiao06.jpg" height="7" width="7">
	</div>
	
	<div class="content" style="clear:both;height:560px;">
		<div style="padding: 0 10px 0 10px;">
			<p style="font-size: 15px;text-align: center;font-weight: bold;"><bean:message key="item.message.fiba_2" bundle="sports"/><br /><bean:message key="item.message.fiba_3" bundle="sports"/></p>

			<p><bean:message key="item.message.fiba_4" bundle="sports"/></p>

			<p><bean:message key="item.message.fiba_5" bundle="sports"/><a href="fiba_limit_area.php" style="color:#FF9900;text-decoration: underline;"><bean:message key="label.area_limit" bundle="sports"/></a><bean:message key="item.message.fiba_6" bundle="sports"/></p>
		</div>
		<div style="padding: 0 10px 10px 10px;">
			<p style="font-size: 15px;text-align: center;font-weight: bold;">ChinaPortal and FIBA Asia present<br />Exclusive Near-live Coverage of 23rd FIBA Asia Men Championship</p>

			<p>Played every two years, the Asian Championship is FIBA Asia's top national team competition. The 23rd FIBA Asia Men Championship hosted in Doha, Qatar just kicked off on Sept. 8. Team China who has claimed the championship 13 times out of the total 15 faces great challenge from Team Korea and other rising teams from West Asia. Will Team China, led by Yao Ming, defend the title?  And who will be the top 3 teams who will earn a spot at next year's FIBA World Championship in Japan? The near-live coverage of the Asian Championship including all Semi-finals and finals will lead you to the answer.  Please join us to witness the great performance from top Asian teams!</p>

			<p>The internet broadcast will be available in Chinese commentary.  The All Access Pass costs only $9.99.  Each game costs $4.99 and all individual games can be purchased by clicking the video link.  Please click <a href="<%=basePath%>/sports/fiba_limit_area.jsp" style="color:#FF9900;text-decoration: underline;">here</a> to check country unavailability. For any purchase assistance, please use our Live Support on top right corner or email <a href="mailto:support@chinaportal.com" style="color:#FF9900;text-decoration: underline;">support@chinaportal.com</a>.</p>

			<p style="text-align:center;"><a href="#" onclick="subscribePack( '16' )" style="color:red;text-decoration: underline;">Order the All Access Pass now and Watch the 23rd FIBA Asia Men Championship! (purchase page in Chinese)</a></p>

			<p style="text-align:center;"><a href="<%=basePath%>/changeLang.do?LANG=1&refer=<%=tranEncode("static.jsp?fn=purchase")%>" style="color:red;text-decoration: underline;">For Purchase pages in English, please visit our English “Purchase Options” page.</a></p>

			<p style="text-align:center;"><a href="http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/chinaVSUZBK_050915.wmv" style="color:#FF9900;text-decoration: underline;">Free Preview</a></p>
		</div>
		
		<div style="text-align:center;">
			<a href="http://www.challenge.fiba.com"><img src="<%=themesPath%>images/banner_inside.jpg" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="javascript:void(0);" onclick="window.open('http://www.fiba.com/pages/misc/subscribe.asp','newwindow', 'height=480, width=413, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')"><img src="<%=themesPath%>images/fiba_dail.jpg" border="0" /></a>
		</div>

		<br /><br />

	</div>

	<%@ include file="../content/common/box_footer_blue.jsp" %>

</div>

<jsp:include page="../content/common/footer.jsp" />