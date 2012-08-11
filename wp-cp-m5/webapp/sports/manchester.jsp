<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>

<%@ include file="../content/common/parameter.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<link href="<%=themesPath%>style/sports.css" rel="stylesheet" type="text/css" />

<div class="sports_box">

	<div style="padding-top:10px;"></div>

	<div class="content">
	
    	<script language="javascript">
    		boxTitle         = "<bean:message key="title.manchester" bundle="sports"/>";
    		boxTitleUrl      = "";
    		boxRightTitle    = "";
    		boxRightTitleUrl = "";
    	</script>

		<%@ include file="../content/common/box_header_blue.jsp" %>
		
		<div class="content">
			<iframe id="Manchester" frameborder="0" scrolling="no" height="1000" width="100%" src="http://www.mediazone.com/channel/soccer/jsp/manchesterunitedcp/index.jsp"></iframe>
		</div>

	</div>

	<%@ include file="../content/common/box_footer_blue.jsp" %>

	<div class="space_line"></div>

</div>

<div style="clear:both;">&nbsp;</div>

<jsp:include page="../content/common/footer.jsp" />