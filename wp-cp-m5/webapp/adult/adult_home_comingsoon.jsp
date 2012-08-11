<%@ page contentType="text/html; charset=utf-8" %>
<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
	<div style="float:left;padding-top:4px;">&nbsp;<a style="text-decoration: underline;color:white;" href="<%=basePath%>/adult/adultAction.do?tar=comingsoon&category_id=20"><bean:message key="title.coming_soon"/></a></div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
</div>

<div class="content" style="padding-left:10px;padding-top:10px;">

<logic:notEmpty name="comingsoons">
<logic:iterate id="mediaview" name="comingsoons">
<div class="adilt_list_box">
	<div style="margin-bottom:3px;"><a href="<%=basePath%>/adult/getDetail.do?media_id=<bean:write name="mediaview" property="id"/>"><img src="<%=smallImagePath%><bean:write name="mediaview" property="photo"/>" border="0" height="120" width="80" style=""></a></div>
	<div style="width:80px;"><bean:write name="mediaview" property="name"/></div>
</div>		
</logic:iterate>	
</logic:notEmpty>	

	<div style="clear:both;text-align:right"><a href="<%=basePath%>/adult/adultAction.do?tar=comingsoon&category_id=20" style="text-decoration: underline;"><bean:message key="title.more"/>&gt;&gt;</a></div>

	</div>


	<%@ include file="../content/common/box_footer_blue.jsp" %>

</div>