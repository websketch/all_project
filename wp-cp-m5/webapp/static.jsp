<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="content/common/parameter.jsp" %>

<% String fn = request.getParameter("fn").trim(); %>

<jsp:include page="content/common/header.jsp" />

<div class="message_box">

   	<script language="javascript">
   	
   		tArr = new Array();
   		
   		tArr["aboutus"]       = "<bean:message key="footer.aboutus"/>";
   		tArr["adultwarning"]  = "<bean:message key="title.warning" bundle="adult"/>";
   		tArr["affiliate"]     = "<bean:message key="footer.affiliate"/>";
   		tArr["compliance"]    = "<bean:message key="adult.compliance" bundle="adult"/>";
   		tArr["copyright"]     = "<bean:message key="footer.copyright"/>";
   		tArr["FAQs"]          = "<bean:message key="header.FAQs"/>";
   		tArr["feedback"]      = "<bean:message key="header.feedbacks"/>";
   		tArr["howitworks"]    = "<bean:message key="header.howitworks"/>";
   		tArr["privatepolicy"] = "<bean:message key="footer.privatepolicy"/>";
   		tArr["purchase"]      = "<bean:message key="header.purchase"/>";
   		tArr["termsofuse"]    = "<bean:message key="footer.termsofuse"/>";
   	
   		boxTitle         = tArr["<%=fn%>"];
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>

	<%@ include file="../content/common/box_header_yellow.jsp" %>

	<div class="content">
		<% pageContext.include("static/"+lang+"/"+fn+".jsp"); %>
	</div>
		
	<%@ include file="content/common/box_footer_blue.jsp" %>
	
</div>

<div style="clear:both;">&nbsp;</div>

<jsp:include page="content/common/footer.jsp" />
