<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../content/common/parameter.jsp" %>
<%@ include file="adult_iswarned.jsp" %>
<jsp:include page="../content/common/header.jsp" />
		<jsp:include page="adult_head.jsp" />
		<!-- new offer -->
		<div class="box113">
			<%@ include file="adult_home_newoffer.jsp" %>
		</div>
		<!-- pop list -->
		<div class="box114">
			<%@ include file="adult_home_poplist.jsp" %>
		</div>
		<div class="space_line"></div>

<!--{assign var="isShowComingSoon" value="yes"}-->
<!--{assign var="itemWidth" value="115px"}-->
<% String itemWidth="115px"; 
	String re_width="";
%>
<!--{if count($comingSoon) == 0 }-->
<logic:empty name="comingsoons">
	<!--{assign var="re_width" value='style="width: 98%;"'}-->
	<% 
		re_width = "style='width: 98%;'"; 
		itemWidth = "120px"; 
	%>
	<!--{assign var="isShowComingSoon" value="no"}-->
	<!--{assign var="itemWidth" value="120px"}-->
	
<!--{/if}-->
</logic:empty>
		<!-- recommendation -->
		<div class="box115" <%=re_width%>>
			<%@ include file="adult_home_recommend.jsp" %>
		</div>

		<!-- coming soon -->
<logic:notEmpty name="comingsoons">
		<div class="box116">
			<%@ include file="adult_home_comingsoon.jsp" %>
		</div>
		<div class="space_line"></div>
</logic:notEmpty>

<!-- use guide -->
<div class="box8"><!-- 使用指南  -->

    <div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
        <div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao.jpg"></div>
        <div style="float:left;padding-top:2px;">&nbsp;<bean:message key="title.howitwork"/></div>
        <div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao01.jpg" border="0"></div>
    </div>
   
	<div class="content">
		<p><bean:message key="help.step_title"/></p>
		<p align="center">
			<a href="<%=basePath%>/static.jsp?fn=howitworks" style="text-decoration: none;"><img src="<%=themesPath%>icons/icon_zhinan01.jpg" border="0"> 1. <bean:message key="help.choice"/> <img src="<%=themesPath%>icons/icon_zhinan02.jpg" border="0"> 2. <bean:message key="help.download"/> <img src="<%=themesPath%>icons/icon_zhinan03.jpg" border="0"> 3. <bean:message key="help.watch"/></a>
		</p>
		<p align="right">
			<a href="<%=basePath%>/static.jsp?fn=howitworks" style="text-decoration: underline;"><bean:message key="help.moreinfo"/>&gt;&gt;</a>
			<a href="<%=basePath%>/getCategory.do?category_id=28" style="text-decoration: underline;"><bean:message key="help.free_view"/>&gt;&gt;</a>
		</p>
	</div>
	
	<%@ include file="../content/common/box_footer_blue.jsp" %>

</div>
		
<jsp:include page="../content/common/footer.jsp" />		