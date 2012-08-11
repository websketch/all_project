<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../content/common/parameter.jsp" %>
<%@ page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>
<%
SubCategoryView scv=(SubCategoryView)request.getAttribute("Sports_Index_CSL");
List matchs=scv.getMatchs();
%>

<jsp:include page="../content/common/header.jsp" />

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

    <div class="content">
    
    	<script language="javascript">
    		boxTitle         = "<bean:message key="title.sports" bundle="sports"/>";
    		boxTitleUrl      = "";
    		boxRightTitle    = "";
    		boxRightTitleUrl = "";
    	</script>

		<%@ include file="../content/common/box_header_blue.jsp" %>
		
        <div class="content" style="background: url(<%=langImagePath%>banner_typd_l.jpg);width:610px;height:257px;">
            <div class="introduction">
                <b>ChinaPortal<bean:message key="title.sports" bundle="sports"/>:</b>
                <li><bean:message key="label.introduction_1" bundle="sports"/><b><bean:message key="label.introduction_2" bundle="sports"/></b><bean:message key="label.introduction_3" bundle="sports"/></li>
                <li><bean:message key="label.introduction_4" bundle="sports"/></li>
                <li><bean:message key="label.introduction_5" bundle="sports"/></li>
                <li><bean:message key="label.introduction_6" bundle="sports"/></li>
                <div style="text-align:right;"><button onclick="window.location.href='http://mfile.akamai.com/12691/wmv/xpatrinet1.download.akamai.com/12691/chinaportal/movie/newgenetic_0530.wmv'"><bean:message key="button.free_preview" bundle="sports"/></button></div>
            </div>
            <div class="focus_match">
            	<!-- div style="background-color: #D96208;line-height:20px;">&nbsp;<b><bean:message key="label.focus_match" bundle="sports"/></b></div>
				<div style="padding:3px;">
					<a href="<%=basePath%>/sports/HomepageItem.do?category_id=218&parent_id=130"><img src="<%=themesPath%>images/focus-match.jpg" border="0" align="left" style="padding-right:5px;padding-bottom:5px;" width="100" height="110">
					<b><bean:message key="national_games" bundle="sports"/></b></a><br />
					<bean:message key="national_games_notice" bundle="sports"/><br /><br />
					<div align="right"><a href="<%=basePath%>/sports/HomepageItem.do?category_id=218&parent_id=130">更多>></a></div>
				</div -->
                <jsp:include page="common/focus_match.jsp"/>
            </div>
            <div class="main_match">
                <div style="display:block;width:100%;background-color: #D96208;line-height:20px;">
                    <div style="float:left;">&nbsp;<b><bean:message key="header.comming" bundle="sports"/></b></div>
                   
                </div>
                <table border="0" cellpadding="2" cellspacing="0" width="100%" style="border-collapse:collapse;" bordercolor="gray">
				<tr>
					<td>2006-02-08</td>
					<td><a href="<%=basePath%>/sports/AllMatchsCBA.do#433" style="text-decoration: underline;">05-06CBA常规赛第二十九轮</a></td>
				</tr>
				<tr>
					<td>2006-02-10</td>
					<td><a href="<%=basePath%>/sports/AllMatchsCBA.do#434" style="text-decoration: underline;">05-06CBA常规赛第三十轮</a></td>
				</tr>
				<tr>
					<td>2006-02-12</td>
					<td><a href="<%=basePath%>/sports/AllMatchsCBA.do#435" style="text-decoration: underline;">05-06CBA常规赛第三十一轮</a></td>
				</tr>
				<tr>
					<td>2006-02-15</td>
					<td><a href="<%=basePath%>/sports/AllMatchsCBA.do#436" style="text-decoration: underline;">05-06CBA常规赛第三十二轮</a></td>
				</tr>
				</table>
            </div>
        </div>

<% if( ! currentSiteName.equals("japan") ) { %>
        <div class="content">
			<%@ include file="common/base_subscribe.jsp" %>
        </div>
<% } %>

        <%@ include file="../content/common/box_footer_blue.jsp" %>

    </div>

    <div style="clear:both;">&nbsp;</div>

    <div class="content"><!-- 最新赛事 -->

    	<script language="javascript">
    		boxTitle         = "<bean:message key="title.new_match" bundle="sports"/>";
    		boxTitleUrl      = "";
    		boxRightTitle    = "";
    		boxRightTitleUrl = "";
    	</script>

		<%@ include file="../content/common/box_header_yellow.jsp" %>
		
		<div class="zxss">
			<a href="<%=basePath%>/sports/HomepageItem.do?category_id=243&parent_id=130"><img src="<%=themesPath%>images/banner_zxss_06cba.jpg" /><br/><br/>
			05-06 CBA</a>
		</div>
		<div class="zxss">
			<a href="<%=basePath%>/sports/HomepageItem.do?category_id=218&parent_id=130">
			<img src="<%=themesPath%>images/banner_zxss_syh.jpg" /><br/><br/>
			<bean:message key="national_games" bundle="sports"/></a>
		</div>		
		<div class="zxss">
			<a href="<%=basePath%>/sports/HomepageItem.do?category_id=215&parent_id=130">
			<img src="<%=themesPath%>images/banner_zxss_nlyjs.jpg" /><br/><br/>
			<bean:message key="item.basketball.man" bundle="sports"/><bean:message key="match.basketball.aisa" bundle="sports"/></a>
		</div>		
		<div class="zxss">
			<a href="<%=basePath%>/sports/OtherGames.do#item_214"><img src="<%=themesPath%>images/banner_zxss_yjs.jpg" /><br/><br/>
			羽毛球世锦赛</a>
		</div>		
		
<% if( 1==0 ) { %>
        <table border="1" cellpadding="5" cellspacing="0" width="610" style="border-collapse: collapse;color: #000000;" bordercolor="gray">
        <tr bgcolor="D3DCE3">
            <td width="20%" align="center"><bean:message key="table.title.fixture" bundle="sports"/></td>
            <td width="60%" align="center"><bean:message key="table.title.match" bundle="sports"/></td>
            <td width="10%" align="center"><bean:message key="media.download"/></td>
            <td width="10%" align="center"><bean:message key="media.online"/></td>
        </tr>

		<%
		matchs=(List)request.getAttribute("Sports_Other_Main_Game");
		for(int i=0;i<matchs.size();i++)
		{
			MatchView mv =(MatchView)matchs.get(i);
		%>

        <tr bgcolor="<% if((i+1)%2==0) { %>#D5D5D5<% } else { %>#E5E5E5<% } %>">
            <td align="center"><%=mv.getStarttime()%></td>
            <td align="center"><a href="<%=basePath%>/sports/MatchDetail.do?match_id=<%=mv.getId()%>" style="color: #000;text-decoration: underline;"><%=mv.getName()%></a></td>
            <td align="center"><%@ include file="common/media_download.jsp" %></td>
            <td align="center"><%@ include file="common/media_online.jsp" %></td>
        </tr>

        <% } %>

        </table>
<% } %>
        <%@ include file="../content/common/box_footer_blue.jsp" %>

    </div>

    <div style="clear:both;">&nbsp;</div>
	<%scv=(SubCategoryView)request.getAttribute("Sports_Index_CSL");;%>
    <div class="content"><!-- 中超 -->

    	<script language="javascript">
    		boxTitle         = "<bean:message key="header.csl" bundle="sports"/> <span style=\"font-family:'宋体'\">- <%=scv.getName()%>";
    		boxTitleUrl      = "";
    		boxRightTitle    = "<bean:message key="title.enter" bundle="sports"/><bean:message key="header.csl" bundle="sports"/>";
    		boxRightTitleUrl = "<%=basePath%>/sports/HomepageItem.do?category_id=201";
    	</script>

		<%@ include file="../content/common/box_header_yellow.jsp" %>

        <table border="1" cellpadding="5" cellspacing="0" width="610" style="border-collapse: collapse;color: #000000;" bordercolor="gray">
        <tr bgcolor="D3DCE3">
            <td width="20%" align="center"><bean:message key="table.title.fixture" bundle="sports"/></td>
            <td width="20%" align="center"><bean:message key="table.title.home" bundle="sports"/></td>
            <td width="20%" align="center"><bean:message key="table.title.guest" bundle="sports"/></td>
            <td width="20%" align="center"><bean:message key="table.title.match" bundle="sports"/></td>
            <td width="10%" align="center"><bean:message key="media.download"/></td>
            <td width="10%" align="center"><bean:message key="media.online"/></td>
        </tr>

		<%
		matchs=scv.getMatchs();
		for(int i=0;i<matchs.size();i++)
		{
			MatchView mv =(MatchView)matchs.get(i);
		%>

        <tr bgcolor="<% if((i+1)%2==0) { %>#D5D5D5<% } else { %>#E5E5E5<% } %>">
            <td align="center"><%=mv.getStarttime()%></td>
            <%@ include file="common/match_teams.jsp" %>
            <td align="center"><a href="<%=basePath%>/sports/MatchDetail.do?match_id=<%=mv.getId()%>" style="color: #000;text-decoration: underline;"><%=mv.getName()%></a></td>
            <td align="center"><%@ include file="common/media_download.jsp" %></td>
            <td align="center"><%@ include file="common/media_online.jsp" %></td>
        </tr>

		<% } %>

        </table>

        <%@ include file="../content/common/box_footer_blue.jsp" %>

    </div>

    <div style="clear:both;">&nbsp;</div>

    <!--div style="padding-top:10px;padding-bottom:10px;">** <{#lang_u20_notice#}></div-->
	<%scv=(SubCategoryView)request.getAttribute("Sports_Index_CSLL");%>
    <div class="content"><!-- 中超联赛杯 -->

    	<script language="javascript">
    		boxTitle         = "<bean:message key="header.csll" bundle="sports"/> <span style=\"font-family:'宋体'\">- <%=scv.getName()%>";
    		boxTitleUrl      = "";
    		boxRightTitle    = "<bean:message key="title.enter" bundle="sports"/><bean:message key="header.csll" bundle="sports"/>";
    		boxRightTitleUrl = "<%=basePath%>/sports/HomepageItem.do?category_id=203";
    	</script>

		<%@ include file="../content/common/box_header_yellow.jsp" %>

        <table border="1" cellpadding="5" cellspacing="0" width="610" style="border-collapse: collapse;color: #000000;" bordercolor="gray">
        <tr bgcolor="D3DCE3">
            <td width="20%" align="center"><bean:message key="table.title.fixture" bundle="sports"/></td>
            <td width="20%" align="center"><bean:message key="table.title.home" bundle="sports"/></td>
            <td width="20%" align="center"><bean:message key="table.title.guest" bundle="sports"/></td>
            <td width="20%" align="center"><bean:message key="table.title.match" bundle="sports"/></td>
            <td width="10%" align="center"><bean:message key="media.download"/></td>
            <td width="10%" align="center"><bean:message key="media.online"/></td>
        </tr>

		<%
		//out.println("中超杯<br>");
		
		matchs=scv.getMatchs();
		for(int i=0;i<matchs.size();i++)
		{
			MatchView mv =(MatchView)matchs.get(i);
		%>

        <tr bgcolor="<% if((i+1)%2==0) { %>#D5D5D5<% } else { %>#E5E5E5<% } %>">
            <td align="center"><%=mv.getStarttime()%></td>
            <%@ include file="common/match_teams.jsp" %>
            <td align="center"><a href="<%=basePath%>/sports/MatchDetail.do?match_id=<%=mv.getId()%>" style="color: #000;text-decoration: underline;"><%=mv.getName()%></a></td>
            <td align="center"><%@ include file="common/media_download.jsp" %></td>
            <td align="center"><%@ include file="common/media_online.jsp" %></td>
        </tr>

		<% } %>

        </table>

        <%@ include file="../content/common/box_footer_blue.jsp" %>

    </div>

    <div style="clear:both;">&nbsp;</div><!-- CBA -->

    <div class="special_offer_smg" style="float:left;background-color:#003366;width:49%;">

    	<script language="javascript">
    		boxTitle         = "CBA<bean:message key="table.title.match" bundle="sports"/>";
    		boxTitleUrl      = "";
    		boxRightTitle    = "<bean:message key="title.enter" bundle="sports"/>CBA";
    		boxRightTitleUrl = "<%=basePath%>/sports/HomepageItem.do?category_id=202";
    	</script>

		<%@ include file="../content/common/box_header_yellow.jsp" %>

        <table border="1" cellpadding="5" cellspacing="0" width="100%" style="border-collapse: collapse;color:#000;" bordercolor="gray">

		<%
		//out.println("CBA<br>");
		matchs=(List)request.getAttribute("Sports_Index_CBA");
		for(int i=0;i<matchs.size();i++)
		{
			MatchView mv =(MatchView)matchs.get(i);
		%>

        <tr bgcolor="<% if((i+1)%2==0) { %>#D5D5D5<% } else { %>#E5E5E5<% } %>">
            <td align="left" width="80%"><a href="<%=basePath%>/sports/MatchDetail.do?match_id=<%=mv.getId()%>" style="color: #000;text-decoration: underline;"><%=mv.getName()%></a></td>
            <td align="center" width="20%"><%@ include file="common/media_download.jsp" %></td>
        </tr>

        <% } %>

        </table>

        <%@ include file="../content/common/box_footer_blue.jsp" %>

    </div>
    
    <div style="float:left;">&nbsp;&nbsp;</div><!-- WTTC48 -->

    <div class="special_offer_smg" style="float:left;background-color:#003366;width:49%;">

    	<script language="javascript">
    		boxTitle         = "<bean:message key="header.wttc" bundle="sports"/>";
    		boxTitleUrl      = "";
    		boxRightTitle    = "<bean:message key="title.enter" bundle="sports"/><bean:message key="header.wttc" bundle="sports"/>";
    		boxRightTitleUrl = "<%=basePath%>/sports/HomepageItem.do?category_id=129";
    	</script>

		<%@ include file="../content/common/box_header_yellow.jsp" %>

        <table border="1" cellpadding="5" cellspacing="0" width="100%" style="border-collapse: collapse;color:#000000;" bordercolor="gray">
 
		<%
		matchs=(List)request.getAttribute("Sports_Index_Table_Tennis");
		for(int i=0;i<matchs.size();i++)
		{
			MatchView mv =(MatchView)matchs.get(i);
		%>


        <tr bgcolor="<% if((i+1)%2==0) { %>#D5D5D5<% } else { %>#E5E5E5<% } %>">
            <td align="left" width="60%"><a href="<%=basePath%>/sports/MatchDetail.do?match_id=<%=mv.getId()%>" style="color: #000;text-decoration: underline;"><%=mv.getName()%></a></td>
            <td align="center"><%@ include file="common/media_download.jsp" %></td>
            <td align="center"><%@ include file="common/media_online.jsp" %></td>
        </tr>

        <% } %>

        </table>

        <%@ include file="../content/common/box_footer_blue.jsp" %>

    </div>

    <div style="clear:both;">&nbsp;</div><!-- 体育新闻 -->
	<%
	Integer langId=(Integer)request.getSession().getAttribute("chinaportal.local");	
	if(langId!=null && langId.intValue()!=1)
	{
	%>
    	<div class="special_offer_smg" style="float:right;background-color:#003366;">
	    	<script language="javascript">
	    		boxTitle         = "<bean:message key="label.sports" bundle="sports"/><bean:message key="label.news" bundle="sports"/>";
	    		boxTitleUrl      = "";
	    		boxRightTitle    = "";
	    		boxRightTitleUrl = "";
	    	</script>
			<%@ include file="../content/common/box_header_yellow.jsp" %>
		</div>
        <div class="content">
        <div style="padding:10px;">
	<%
  		//List newsList = newsDAO.queryNewsByType(new Integer(2),langId,"1",12);
  		List newsList =(List)request.getAttribute("Sports_News");
  		for(int i=0;i<newsList.size();i++)
  		{
  			com.chinaportal.portal.sports.IdName news = (com.chinaportal.portal.sports.IdName)newsList.get(i);
  			String news_id = news.getId();
  			String title = news.getName();
  			if(title.length()>25)
  			{
  				title = title.substring(0,24);
  			}	
  	%>
  			<a href="<%=request.getContextPath()%>/content/news/news_view_sports.jsp?news_id=<%=news_id%>" class="news_a" style="background: url(<%=themesPath%>icons/icon_dot.gif) no-repeat left;text-decoration: underline;"><%=title%></a>
  	<%
  		}
  	%>
			<div class="more"><a href="<%=request.getContextPath()%>/news/newsAction.do?tar=sports" style="text-decoration: underline;"><bean:message key="title.more"/>&gt;&gt;</a></div>

     	</div>
     	</div>
        <%@ include file="../content/common/box_footer_blue.jsp" %>
    </div>
	<%}%>
    <div style="clear:both;">&nbsp;</div>

</div>

<jsp:include page="../content/common/footer.jsp" />