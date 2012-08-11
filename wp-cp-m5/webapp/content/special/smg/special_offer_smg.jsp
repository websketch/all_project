<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../common/parameter.jsp" %>
<div class="special_offer_smg" style="float:left;background-color:#003366;">

<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao.jpg"></div>
	<div style="float:left;padding-top:4px;">
		<bean:write name="Category_INFO" property="location" filter="false"/>
	</div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao01.jpg" border="0"></div>
</div>

	<div class="content" style="padding:5px;">
		<div style="float:left;width:140px;padding-top:3px;">
			<img src="<%=largeImagePath%><bean:write name="Category_INFO" property="photo"/>" border="0" height="200" width="140" align="left" style="padding-right:10px;">
		</div>
		<div style="float:left;width:330px;padding-top:3px;">
			<bean:write name="Category_INFO" property="description"/>
		</div>
		<div style="float:right;width:114px;">
			<!--{include file="block_popular_list_subcat.tpl"}-->
			<jsp:include page="../../category/popular.jsp" />
		</div>
		<div style="clear:both;text-align:center;">
			<%@ include file="../../common/button_purchase.jsp" %>
		</div>
	</div>
	
	<div class="block_footer" style="background: #003366;width:100%;">
	<img align="left" src="<%=themesPath%>icons/icon_lanjiao1.jpg" height="7" width="7">
	<img align="right" src="<%=themesPath%>icons/icon_lanjiao2.jpg" height="7" width="7">
  </div>

</div>

