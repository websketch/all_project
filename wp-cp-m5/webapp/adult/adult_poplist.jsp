<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../content/common/parameter.jsp" %>
<%@ include file="adult_iswarned.jsp" %>
<jsp:include page="../content/common/header.jsp" />
		<jsp:include page="adult_head.jsp" />

	<!-- content start -->

		<div class="box120">
			<!--{include file="adult/block_adult_hebdomad_poplist_body.tpl"}-->
			
			<!--{include file="block_block_header_yellow.tpl"}-->
<%
 boolean isWeeklyPop = request.getParameter("tar").equals("weeklypop");
%> 			
<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
	<div style="float:left;padding-top:4px;">&nbsp;
		<%if(isWeeklyPop){%><bean:message key="title.weekly.popular"/><%}else{%><bean:message key="title.total.popular"/><%}%>
	</div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
</div>			
			

<div class="content">
		<div class="type" style="text-align:right;padding-top:5px;padding-right:5px;">
<%if(isWeeklyPop){%>
			[ <a href="<%=basePath%>/adult/adultAction.do?tar=totalpop&category_id=<%=request.getParameter("category_id")%>" style="text-decoration: underline;"><bean:message key="title.total.popular"/></a> ]
<%}else{%>
			[ <a href="<%=basePath%>/adult/adultAction.do?tar=weeklypop&category_id=<%=request.getParameter("category_id")%>" style="text-decoration: underline;"><bean:message key="title.weekly.popular"/></a> ]
<%}%>
			 
		</div>
		<ol>
	<logic:notEmpty name="popmedias">	
		<%int i=0;%>
		<logic:iterate id="mediaview" name="popmedias">
			<%i++;%>	
			<li><a href="<%=basePath%>/adult/getDetail.do?media_id=<bean:write name="mediaview" property="id"/>" title="<bean:write name="mediaview" property="highlight"/>"><span><bean:write name="mediaview" property="name"/></span></a>
			<!--{$ContentAvgGradeStar}-->
				<script language="javascript">
					var average_rating=<bean:write name="mediaview" property="level"/>;
				</script>
				<%@ include file="../content/common/stargrade.jsp" %>
			</li>
			<%if(i%5==0){%>
			<hr />
			<%}%>
		</logic:iterate>
		</logic:notEmpty>

		</ol>
</div>

<%@ include file="../content/common/box_footer_blue.jsp" %>


			
		</div>

	<!-- content end -->

<jsp:include page="../content/common/footer.jsp" />
