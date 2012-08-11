<%@ page contentType="text/html; charset=utf-8" %>
<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
	<div style="float:left;padding-top:4px;">&nbsp;<a style="text-decoration: underline;color:white;" href="<%=basePath%>/adult/adultAction.do?tar=weeklypop&category_id=20"><bean:message key="title.weekly.popular"/></a></div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
</div>

<div class="content" style="height:480px;">
	<ol style="margin-top:5px;margin-bottom:2px;">
		<logic:notEmpty name="popmedias">	
		<logic:iterate id="mediaview" name="popmedias">	
				<script language="javascript">
					var average_rating=<bean:write name="mediaview" property="level"/>;
					var mediaview_name='<bean:write name="mediaview" property="name"/>';
					if(mediaview_name.length>10)
					  mediaview_name = mediaview_name.substring(0,10);
				</script>
			<li><a href="<%=basePath%>/adult/getDetail.do?media_id=<bean:write name="mediaview" property="id"/>" title="<bean:write name="mediaview" property="highlight"/>"><span><script language="javascript">document.write(mediaview_name);</script></span></a>
			<!--{$ContentAvgGradeStar}-->
				<%@ include file="../content/common/stargrade.jsp" %>
			</li>
		</logic:iterate>
		</logic:notEmpty>
	</ol>
</div>

<div style="text-align:right;"><a href="<%=basePath%>/adult/adultAction.do?tar=weeklypop&category_id=20" style="text-decoration: underline;"><bean:message key="title.more"/>&gt;&gt;</a></div>

<%@ include file="../content/common/box_footer_blue.jsp" %>