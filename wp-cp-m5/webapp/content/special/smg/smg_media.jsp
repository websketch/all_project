<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../common/parameter.jsp" %>

<jsp:include page="../../common/header.jsp" />

<div class="category">

		<!-- Begin of Special Offer -->
            <jsp:include page="special_offer_smg.jsp" />
		<!-- End of Special Offer -->

		<div style="clear:both;">&nbsp;</div>
		
		<!-- Begin of Recomendation -->
            <jsp:include page="../../category/recomendation.jsp" />
		<!-- End of Recomendation -->
		
		<div style="clear:both;">&nbsp;</div>

		<!-- Begin of Coming Soon -->
            <jsp:include page="../../category/coming_soon.jsp" />
		<!-- End of Coming Soon -->

		<div style="clear:both;">&nbsp;</div>
		
</div>


<jsp:include page="../../common/footer.jsp" />