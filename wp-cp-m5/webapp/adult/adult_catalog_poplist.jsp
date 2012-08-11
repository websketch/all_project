<%@ page contentType="text/html; charset=utf-8" %>
<!--{include file="block_block_header_yellow.tpl"}-->
<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
	<div style="float:left;padding-top:4px;">&nbsp;<bean:message key="title.weekly.popular"/></div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
</div>
<div class="content" style="height:719px;">
	<ol style="margin-top:1px;margin-bottom:1px;">
		<logic:notEmpty name="popmedias">	
		<logic:iterate id="mediaview" name="popmedias">	
				<script language="javascript">
					var mediaview_name='<bean:write name="mediaview" property="name"/>';
					if(mediaview_name.length>8)
					  mediaview_name = mediaview_name.substring(0,8);
				</script>
			<li><a href="<%=basePath%>/adult/getDetail.do?media_id=<bean:write name="mediaview" property="id"/>" title="<bean:write name="mediaview" property="highlight"/>"><span><script language="javascript">document.write(mediaview_name);</script></span></a></li>
		</logic:iterate>
		</logic:notEmpty>
	</ol>
</div>

<div style="text-align:right;"><a href="<%=basePath%>/adult/adultAction.do?tar=weeklypop&category_id=<%=request.getParameter("category_id")%>" style="text-decoration: underline;"><bean:message key="title.more"/>&gt;&gt;</a></div>
<%@ include file="../content/common/box_footer_blue.jsp" %>