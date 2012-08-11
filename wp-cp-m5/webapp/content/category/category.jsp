<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../common/parameter.jsp" %>
<%@ include file="../../trans.jsp" %>
<%
 String category_id = request.getParameter("category_id");
 String parent_id = request.getParameter("parent_id");
 if(category_id!=null && category_id.equals("103")){
 	//isAdultPage = true;
	Boolean iswarned = (Boolean)session.getAttribute("warned");
	if(iswarned==null || (iswarned!=null&&!iswarned.booleanValue())){
	//<!--jsp:forward page="../../static.jsp?fn=adultwarning"/-->
		String dispatcherURL = "/static.jsp?fn=adultwarning&para="+tranEncode(returnUrl);
		response.sendRedirect(request.getContextPath()+dispatcherURL);
	}	
 }	
%>

<jsp:include page="../common/header.jsp" />

<div class="category">

		<!-- Begin of Special Offer -->
            <jsp:include page="special_offer_category.jsp" />
		<!-- End of Special Offer -->

		<div style="clear:both;">&nbsp;</div>
		
		<!-- Begin of Recomendation -->
            <jsp:include page="recomendation.jsp" />
		<!-- End of Recomendation -->
		
		<div style="clear:both;">&nbsp;</div>

		<!-- Begin of Coming Soon -->
		<logic:notEmpty name="Comming_Soon_Medias">	
            <jsp:include page="coming_soon.jsp" />
        </logic:notEmpty>
		<!-- End of Coming Soon -->

		<div style="clear:both;">&nbsp;</div>
		
</div>


<jsp:include page="../common/footer.jsp" />