<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mediazone.bean.Category,com.chinaportal.portal.category.CategoryDAO"%>
<jsp:useBean id="category_childDAO" class="com.chinaportal.portal.category.CategoryDAO" scope="page"/>
<%@ include file="../../common/parameter.jsp" %>

<jsp:include page="../../common/header.jsp" />

<div class="category_stars">

	<!-- Begin of Special Offer -->
		<jsp:include page="special_offer_cny.jsp" />
	<!-- End of Special Offer -->

	<div style="clear:both;">&nbsp;</div>

	<!-- Begin Stars List -->
	<%
	   index = 1;
		List mediasList = (List)request.getAttribute("medias_np");
	%>
	<logic:present name="medias_np">
	<logic:iterate id="media" name="medias_np">

	<div class="stars_list" style="float:left;width:32.5%;margin-left:2px;margin-right:2px;background: #003366;">

	<!--{assign var="block_title" value=$ContentOrigin}-->
		<!--{include file="block_block_header_blue_1.tpl"}-->
		<div class="block_footer" style="background: #003366;width:100%;">
		<img align="left" src="<%=themesPath%>icons/icon_lanjiao05.jpg" height="7" width="7">
		<img align="right" src="<%=themesPath%>icons/icon_lanjiao06.jpg" height="7" width="7">
		</div>

		<div class="content" style="clear:both;height:150px;padding:4px;">
			<a href="<%=request.getContextPath()%>/getDetail.do?media_id=<bean:write name="media" property="id"/>" style="color: #FF9900;text-decoration: underline;"><img src="<%=request.getContextPath()%>/images/photo/small/<bean:write name="media" property="photo"/>" width="80" height="120" style="margin-right:5px;" align="left" border="0" /><bean:write name="media" property="name"/></a><br />
			<bean:write name="media" property="highlight"/>

			<div style="clear:both;padding-top:5px;">
				<logic:notEmpty name="media" property="onlineURL">
					<a href="<bean:write name="media" property="onlineURL"/>"><span style="color: #FF9900;text-decoration: underline;"><bean:message key="media.online"/></span></a>&nbsp;&nbsp;&nbsp;
				</logic:notEmpty>
				<logic:notEmpty name="media" property="downloadURL">
					<a href="<%=DownloadServer%>?path=<bean:write name="media" property="dir"/>&file=<bean:write name="media" property="downloadURL"/>"><span style="color: #FF9900;text-decoration: underline;"><bean:message key="media.download"/></span></a>
				</logic:notEmpty>
			</div>
		</div>

		<!--start fileblock_block_footer_blue.tpl-->
		<div class="block_footer" style="background: #003366;width:100%;">
		<img align="left" src="<%=themesPath%>icons/icon_lanjiao1.jpg" height="7" width="7">
		<img align="right" src="<%=themesPath%>icons/icon_lanjiao2.jpg" height="7" width="7">
  	</div>	
  	<!--end block_block_footer_blue.tpl-->

	</div>

		<% if(index % 3 ==0) { %>
			<div style="clear:both;">&nbsp;</div>
		<% } index++; %>
	
	</logic:iterate>
	</logic:present>

	<!-- End Stars List -->
	
	<% if( request.getParameter("category_id").equals("455") ) { %>
	
	<style>
		.stars_list .content ul {
			list-style: none;
			margin: 0;
			padding-left: 10px;
		}
		.stars_list .content ul li {
			float: left;
			width: 300px;
			line-height: 20px;
			padding-left: 20px;
			background: url(<%=themesPath%>icons/icon_souting.gif) no-repeat left;
		}
		.stars_list .content ul li a {
			color: #FF9900;text-decoration: underline;
		}
		.stars_list .content ul li .t1 {
			float:left;
			width: 180px;
		}
		.stars_list .content ul li .t2 {
			float:left;
			width: 120px;
		}
	</style>
	
	<%
		String t1 = "侯耀文、石富宽--爱优点";
		String t2 = "侯耀文、石富宽--学裘派";
		String t3 = "侯耀文、石富宽--姿三四郎";
		String t4 = "马季、赵炎--吹牛";
		String t5 = "马季、赵炎--儿女赞";
		String t6 = "马季、赵炎--行业术语";
		
		if( lang.equals("zh_tw") )
		{
			t1 = "侯耀文、石富寬--愛優點";
			t2 = "侯耀文、石富寬--學裘派";
			t3 = "侯耀文、石富寬--姿三四郎";
			t4 = "馬季、趙炎--吹牛";
			t5 = "馬季、趙炎--兒女贊";
			t6 = "馬季、趙炎--行業術語";
		}
	%>
	
	<div style="clear:both;">&nbsp;</div>
	
	<div class="stars_list" style="float:left;width:350px;margin-left:2px;margin-right:2px;background: #003366;">

		<div class="block_footer" style="background: #003366;width:100%;">
			<img align="left" src="<%=themesPath%>icons/icon_lanjiao05.jpg" height="7" width="7">
			<img align="right" src="<%=themesPath%>icons/icon_lanjiao06.jpg" height="7" width="7">
		</div>
		<div class="content" style="clear:both;height:120px;padding:4px;">
			<ul>
				<li>
					<span class="t1"><%=t1%></span>
					<span class="t2">
						<a href="http://mfile.akamai.com/12691/WMA/xpatrinet1.download.akamai.com/12691/chinaportal/movie/ENTRIQ-CHINAPORTAL-streaming_medium-aiyoudian_hou.asx"><bean:message key="media.online"/></a>
						<a href="<%=DownloadServer%>?path=movie7&file=ENTRIQ-CHINAPORTAL-download_channel-aiyoudian_hou.WMA"><bean:message key="media.download"/></a>
					</span>
				</li>
				<li>
					<span class="t1"><%=t2%></span>
					<span class="t2">
						<a href="http://mfile.akamai.com/12691/WMA/xpatrinet1.download.akamai.com/12691/chinaportal/movie/ENTRIQ-CHINAPORTAL-streaming_medium-xueqiupai_hou.asx"><bean:message key="media.online"/></a>
						<a href="<%=DownloadServer%>?path=movie7&file=ENTRIQ-CHINAPORTAL-download_channel-xueqiupai_hou.WMA"><bean:message key="media.download"/></a>
					</span>
				</li>
				<li>
					<span class="t1"><%=t3%></span>
					<span class="t2">
						<a href="http://mfile.akamai.com/12691/WMA/xpatrinet1.download.akamai.com/12691/chinaportal/movie/ENTRIQ-CHINAPORTAL-streaming_medium-zisansilang_hou.asx"><bean:message key="media.online"/></a>
						<a href="<%=DownloadServer%>?path=movie7&file=ENTRIQ-CHINAPORTAL-download_channel-zisansilang_hou.WMA"><bean:message key="media.download"/></a>
					</span>
				</li>
				<li>
					<span class="t1"><%=t4%></span>
					<span class="t2">
						<a href="http://mfile.akamai.com/12691/WMA/xpatrinet1.download.akamai.com/12691/chinaportal/movie/ENTRIQ-CHINAPORTAL-streaming_medium-chuiniu_ma.asx"><bean:message key="media.online"/></a>
						<a href="<%=DownloadServer%>?path=movie7&file=ENTRIQ-CHINAPORTAL-download_channel-chuiniu_ma.WMA"><bean:message key="media.download"/></a>
					</span>
				</li>
				<li>
					<span class="t1"><%=t5%></span>
					<span class="t2">
						<a href="http://mfile.akamai.com/12691/WMA/xpatrinet1.download.akamai.com/12691/chinaportal/movie/ENTRIQ-CHINAPORTAL-streaming_medium-ernvzan_ma.asx"><bean:message key="media.online"/></a>
						<a href="<%=DownloadServer%>?path=movie7&file=ENTRIQ-CHINAPORTAL-download_channel-ernvzan_ma.WMA"><bean:message key="media.download"/></a>
					</span>
				</li>
				<li>
					<span class="t1"><%=t6%></span>
					<span class="t2">
						<a href="http://mfile.akamai.com/12691/wma/xpatrinet1.download.akamai.com/12691/chinaportal/movie/ENTRIQ-CHINAPORTAL-streaming_medium-hangyeshuyu_ma.asx"><bean:message key="media.online"/></a>
						<a href="<%=DownloadServer%>?path=movie7&file=ENTRIQ-CHINAPORTAL-download_channel-hangyeshuyu_ma.WMA"><bean:message key="media.download"/></a>
					</span>
				</li>
			</ul>
		</div>		
		<div class="block_footer" style="background: #003366;width:100%;">
			<img align="left" src="<%=themesPath%>icons/icon_lanjiao1.jpg" height="7" width="7">
			<img align="right" src="<%=themesPath%>icons/icon_lanjiao2.jpg" height="7" width="7">
  		</div>	
	</div>
	
	<% } %>
	
</div>
<div style="clear:both;">&nbsp;</div>

<jsp:include page="../../common/footer.jsp" />