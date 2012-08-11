<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../content/common/parameter.jsp" %>
<%@ include file="adult_iswarned.jsp" %>
<jsp:include page="../content/common/header.jsp" />
<jsp:include page="adult_head.jsp" />
	<!-- content start -->
		<!-- catalog -->
		<div class="box118">
			<!--{include file="adult/block_adult_channel_catalog_catalog.tpl"}-->
			<%@ include file="adult_catalog_catalog.jsp" %>
		</div>
		<!-- pop list -->
		<div class="box119">
			<!--{include file="adult/block_adult_channel_catalog_poplist.tpl"}-->
			<%@ include file="adult_catalog_poplist.jsp" %>
		</div>
		<div class="space_line"></div>

		<!-- comingsoon -->
		<!--{include file="adult/block_adult_channel_catalog_comingsoon.tpl"}-->
		<%@ include file="adult_catalog_comingsoon.jsp" %>
	<!-- content end -->

<jsp:include page="../content/common/footer.jsp" />