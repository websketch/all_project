<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>

<%@ include file="../content/common/parameter.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<div class="special_offer_smg" style="float:left;background-color:#003366;">

		<%@ include file="common/sports_banner.jsp" %>

	</div>

	<div style="clear:both;">&nbsp;</div>

	<div class="content">
	
    	<script language="javascript">
    		boxTitle         = "2005 UCI <bean:message key="item.mbwc" bundle="sports"/><bean:message key="label.world" bundle="sports"/><bean:message key="label.prize_match" bundle="sports"/>";
    		boxTitleUrl      = "";
    		boxRightTitle    = "";
    		boxRightTitleUrl = "";
    	</script>

		<%@ include file="../content/common/box_header_yellow.jsp" %>
		
		<div class="content">
			<iframe id="bmx" frameborder="0" scrolling="no" height="1000" width="100%" src="http://www.mediazone.com/channel/mbwc/jsp/chinese/index.jsp"></iframe>
		</div>

	</div>

	<%@ include file="../content/common/box_footer_blue.jsp" %>

	<div class="space_line"></div>

</div>

<div style="clear:both;">&nbsp;</div>

<jsp:include page="../content/common/footer.jsp" />