<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../content/common/parameter.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<div class="content">

		<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		    <div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao.jpg"></div>
		    <div style="float:left;padding-top:4px;">
		    	<a href="<%=request.getContextPath()%>/getHomePage.do"><bean:message key="header.homepage"/></a><span style="font-family:'宋体'">->
		    	<a href="<%=request.getContextPath()%>/getHomePage.do">
		    	<bean:message key="title.sports" bundle="sports"/></a><span style="font-family:'宋体'">->
		    	<bean:message key="header.csl" bundle="sports"/>
		    </div>
		    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao01.jpg" border="0"></div>
		</div>
 	
		<div class="content" style="background: url(<%=langImagePath%>banner_tyzc_l.jpg);width:610px;height:257px;">
			<div class="introduction">
				<b>ChinaPortal<bean:message key="header.csl" bundle="sports"/><bean:message key="label.all_match" bundle="sports"/>:</b>
				<li><bean:message key="label.introduction_1" bundle="sports"/><b><bean:message key="label.introduction_2" bundle="sports"/></b></li>
				<li><bean:message key="label.introduction_7" bundle="sports"/></li>
				<li><bean:message key="label.introduction_5" bundle="sports"/></li>
				<li><bean:message key="label.introduction_6" bundle="sports"/></li>
				<div style="text-align:right;">
					<button onclick="window.location.href='http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/cslpreview384_0527.wmv '"><bean:message key="button.free_preview" bundle="sports"/></button>&nbsp;
<% if( ! currentSiteName.equals("japan") ) { %>
					<button onclick="subscribePack('9')"><bean:message key="button.subscribe" bundle="sports"/><bean:message key="label.all_match" bundle="sports"/></button>
<% } %>
				</div>
			</div>
			<div class="focus_match">
				<jsp:include page="common/focus_match.jsp"/>
			</div>
			<div style="float:right;text-align:right;width:40%;margin-top:20px;margin-right:5px;">
				<a href="<%=basePath%>/sports/TeamList.do?itemid=201" style="text-decoration: underline;"><bean:message key="label.teams_detail" bundle="sports"/></a>
			</div>
		</div>

<% if( ! currentSiteName.equals("japan") ) { %>

		<div class="content">
			<%@ include file="common/base_subscribe.jsp" %>
		</div>
<% } %>
		<%@ include file="../content/common/box_footer_blue.jsp" %>

	</div>

	<div style="clear:both;">&nbsp;<a name="top"></a></div>

	<div class="in_turn">
	<%
		String url="";
		for(int i=1; i<=26; i++) 
		{
			url = "<a href=\"#"+i+"\" style=\"text-decoration: underline;\">";
			
			if(i==26) 
				url += "<span class=\"curr_in_turn\">"+i+"</span>";
			else
				url += ""+i;

			url += "</a>";

			if(i==15) out.print("<br />");
			
			if(i==15 || i==1) 
				out.print(url);
			else
				out.print(" - "+url); 
		}
	%>
	</div>

	<div style="clear:both;">&nbsp;</div>
	<div class="content">

		<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
		    <div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
            <div style="float:left;padding-top:2px;">&nbsp;<bean:message key="header.csl" bundle="sports"/><bean:message key="label.all_match" bundle="sports"/></div>
		    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
		</div>

		<jsp:include page="common/match_list.jsp"/>

		<%@ include file="../content/common/box_footer_blue.jsp" %>

	</div>

	<div style="clear:both;">&nbsp;</div>

</div>

<jsp:include page="../content/common/footer.jsp" />