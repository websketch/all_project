<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../content/common/parameter.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<div class="special_offer_smg" style="float:left;background-color:#003366;">

		<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		    <div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao.jpg"></div>
		    <div style="float:left;padding-top:4px;"><bean:message key="title.sports" bundle="sports"/></div>
		    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao01.jpg" border="0"></div>
		</div>

		<div class="content" style="background: url(<%=langImagePath%>banner_typd_s.jpg);width:610px;height:74px;">

			<div style="float:right;padding-top:10px;padding-right:20px;text-align:center;">
				<b>ChinaPortal</b><br /><bean:message key="label.introduction_1" bundle="sports"/><b><bean:message key="label.introduction_2" bundle="sports"/></b><bean:message key="label.introduction_3" bundle="sports"/>
				<div style="text-align:center;"><button onclick="window.location.href='http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/newgenetic_0530.wmv'"><bean:message key="button.free_preview" bundle="sports"/></button></div>
			</div>

		</div>

		<%@ include file="../content/common/box_footer_blue.jsp" %>

	</div>

	<div style="clear:both;">&nbsp;</div>

	<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
	    <div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
        <div style="float:left;padding-top:2px;">&nbsp;<bean:message key="header.purchase" bundle="sports"/></div>
	    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
	</div>

	<div class="content">
		<div style="padding:10px;"><jsp:include page="common/sports_purchase.jsp"/></div>
	</div>

	<div class="content">
		<div style="clear:both;padding-left:10px;">
			<li><bean:message key="purchase.notice" bundle="sports"/><a href="<%=basePath%>/static.jsp?fn=purchase" style="color:#FF9900;text-decoration: underline;"><strong><bean:message key="header.purchase" /></strong></a><bean:message key="purchase.notice.page" bundle="sports"/></li>
		</div>
		<br />
	</div>

	<%@ include file="../content/common/box_footer_blue.jsp" %>

</div>

<div style="clear: both;">&nbsp;</div>

<jsp:include page="../content/common/footer.jsp" />
