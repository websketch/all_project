<%@ page contentType="text/html; charset=utf-8" %>

<%@ page import="com.chinaportal.portal.sports.*" %>
<%@ page import="java.util.List" %>

<%@ include file="../content/common/parameter.jsp" %>
<%@ include file="../trans.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<%@ include file="common/ng10_banner.jsp" %>

	<div style="clear:both;">&nbsp;<a name="top"></a></div>

   	<script language="javascript">
   		boxTitle         = "<bean:message key="national_games" bundle="sports"/>";
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
	* <bean:message key="item.message.ng10_1" bundle="sports"/>

	<div style="clear:both;">&nbsp;</div>
	
	<div class="block_footer" style="background: #003366;width:100%;">
		<img align="left" src="<%=themesPath%>icons/icon_lanjiao05.jpg" height="7" width="7">
		<img align="right" src="<%=themesPath%>icons/icon_lanjiao06.jpg" height="7" width="7">
	</div>
	
	<div class="content" style="clear:both;height:260px;">
		<div style="padding: 0 10px 0 10px;">
			<p style="font-size: 15px;text-align: center;font-weight: bold;"><bean:message key="item.message.ng10_2" bundle="sports"/></p>
			<p><bean:message key="item.message.ng10_3" bundle="sports"/></p>
			<p><bean:message key="item.message.ng10_4" bundle="sports"/></p>
		</div>
	</div>

	<%@ include file="../content/common/box_footer_blue.jsp" %>

</div>

<jsp:include page="../content/common/footer.jsp" />