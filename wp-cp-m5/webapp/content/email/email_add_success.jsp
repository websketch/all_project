<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../common/parameter.jsp" %>
<jsp:include page="../common/header.jsp" />

<div class="message_box">
    	<script language="javascript">
    		boxTitle         = "";
    		boxTitleUrl      = "";
    		boxRightTitle    = "";
    		boxRightTitleUrl = "";
    	</script>
<%@ include file="../common/box_header_yellow.jsp"%>
<div class="content">
		<center>Email <bean:write name="email"/> was added.</center>
</div>
<%@ include file="../common/box_footer_blue.jsp"%>
</div>
<jsp:include page="../common/footer.jsp" />