<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../common/parameter.jsp" %>
<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao.jpg"></div>
	<div style="float:left;padding-top:4px;">
		<bean:write name="Category_INFO" property="location" filter="false"/>
	</div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao01.jpg" border="0"></div>
</div>

<%if(request.getAttribute("Category_Block")!=null){%>

<div class="special_offer_category" style="float:left;background-color:#003366;">
	<div class="content" style="padding:5px;">
		<div style="float:left;width:480px;padding-top:3px;">
			<a href="<%=basePath%>/getDetail.do?media_id=<bean:write name="Category_Block" property="id" />"><img src="<%=largeImagePath%><bean:write name="Category_Block" property="photo"/>" border="0" height="200" width="140" align="left" style="padding-right:8px;"></a>
			
			<b><bean:write name="Category_Block" property="highlight"/></b><br/>
		
			<b><bean:message key="media.title"/></b>: <bean:write name="Category_Block" property="name"/><br/>
			<b><bean:message key="media.director"/></b>: <bean:write name="Category_Block" property="directors"/><br/>
			<b><bean:message key="media.actor"/></b>: <bean:write name="Category_Block" property="actors"/><br/>
			<b><bean:message key="media.description"/></b>: <bean:write name="Category_Block" property="description"/><br/>
		</div>
		<div style="float:right;width:114px;">
			<jsp:include page="popular.jsp"/>
		</div>
		<div style="clear:both;text-align:center;">
		<logic:notEmpty name="Category_Block" property="onlineURL">
			<button onclick="window.open('<bean:write name="Category_Block" property="onlineURL" filter="false"/>')"><bean:message key="media.online"/></button>							
		</logic:notEmpty>
		<logic:notEmpty name="Category_Block" property="downloadURL">
			<button onclick="window.open('<%=DownloadServer%>?path=<bean:write name="Category_Block" property="dir" filter="false"/>&file=<bean:write name="Category_Block" property="downloadURL" filter="false"/>','','left=5000,top=5000,height=10, width=10')"><bean:message key="media.download"/></button>
		</logic:notEmpty>
			<%@ include file="../common/button_purchase.jsp" %>
		</div>
	</div>
</div>
<%}else{%>

<div class="special_offer_category" style="float:left;background-color:#003366;">
	<div class="content" style="padding:5px;">
		<div style="float:left;width:480px;padding-top:3px;">
			<img src="<%=largeImagePath%><bean:write name="Category_INFO" property="photo"/>" 
			border="0" height="200" width="140" align="left" style="padding-right:8px;">

			<b><bean:message key="media.description"/></b>: <bean:write name="Category_INFO" property="description"/><br/>
		</div>
		<div style="float:right;width:114px;">
			<jsp:include page="popular.jsp"/>
		</div>
		<div style="clear:both;text-align:center;">
			<button onclick="window.location.href='<%=request.getContextPath()%>/static.jsp?fn=purchase'"><bean:message key="media.order"/></button>
		</div>
	</div>
</div>
<%}%>

<%@ include file="../common/box_footer_blue.jsp" %>