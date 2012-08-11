<%@ page contentType="text/html; charset=utf-8" %>

<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
	<div style="float:left;padding-top:4px;">&nbsp;<a style="text-decoration: underline;color:white;" href="<%=request.getContextPath()%>/static.jsp?fn=purchase"><bean:message key="adult.home.subtitle.subscribe" bundle="adult"/></a></div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
</div>

<div class="content">
	<div>
			<div style="padding-top: 5px;padding-left:10px;padding-bottom:0px;" >
				<strong>1.<bean:message key="adult.home.subscribe.title" bundle="adult"/></strong>
			</div>

			<div style="float:left;text-align:center;margin-right: 0px;width: 49%;height:80px;">
				<div class="price">
					<img src="<%=langImagePath%>crpdhyjg.gif" />
					<!-- div style="width:100%;"><bean:message key="adult.home.subscribe.label.year" bundle="adult"/></div -->
				</div>
			</div>
			
			<div>
				<li><bean:message key="adult.home.subscribe.label_1_1" bundle="adult"/></li>
				<li><bean:message key="adult.home.subscribe.label_1_2" bundle="adult"/></li>
				<li><bean:message key="adult.home.subscribe.label_1_3" bundle="adult"/></li>
				<li style="color:red;"><bean:message key="adult.home.subscribe.label_1_4" bundle="adult"/>12/2/05</li>
				<button onclick="subscribePack('5')"><bean:message key="adult.subscribe" bundle="adult"/></button>
				<br/><br/>
			</div>
			
			<div style="clear:both;color:red;padding-left:10px;"><bean:message key="adult.notice" bundle="adult"/></div>

			<div style="clear:both;padding-top:0px;padding-left:10px;padding-bottom:5px;" >
				<strong>2.<bean:message key="adult.home.subscribe.title_2" bundle="adult"/>$2.99/<bean:message key="adult.home.subscribe.title_3" bundle="adult"/></strong>
			</div>
	</div>
	
	<!-- div class="detail" style="margin-top:0px;padding-top:0px;">
		<a href="<%=request.getContextPath()%>/static.jsp?fn=purchase" style="text-decoration: underline;">
			<bean:message key="adult.homepage.subscribe.label.detail" bundle="adult"/>&gt;&gt;
		</a>
	</div -->

</div>
<%@ include file="../content/common/box_footer_blue.jsp" %>
