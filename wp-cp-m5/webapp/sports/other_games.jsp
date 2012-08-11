<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>
<%@ include file="../content/common/parameter.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<div class="special_offer_smg" style="float:left;background-color:#003366;">

		<%@ include file="common/sports_banner.jsp" %>

	</div>

	<div style="clear:both;">&nbsp;</div>

	<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
	    <div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
        <div style="float:left;padding-top:2px;">&nbsp;<bean:message key="header.other_games" bundle="sports"/></div>
	    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
	</div>

	<div class="content">
		
		<table border="1" cellpadding="5" cellspacing="0" width="610" style="border-collapse: collapse;color: #000000;" bordercolor="gray">

		<%
		OtherGameDAO ogd=new OtherGameDAO();
		
		List subs=ogd.getSubCategorys("204,205,209,211,212,213,214,215,216", lang_id);
		
		for(int i=0;i<subs.size();i++)
		{
			SubCategoryView scv=(SubCategoryView)subs.get(i);
			//out.println(scv.getName()+"<br>");
		%>

		<tr bgcolor="#23AEF1">
			<td colspan="6">
				<div style="float:left"><a name="item_<%=scv.getId()%>"><%=scv.getName()%></a></div>
				<div style="float:right"><a href="#top"><bean:message key="label.return" bundle="sports"/></a></div>
			</td>
		</tr>

		<tr bgcolor="D3DCE3">
			<td width="20%" align="center"><bean:message key="table.title.fixture" bundle="sports"/></td>
			<td width="60%" align="center"><bean:message key="table.title.match" bundle="sports"/></td>
			<td width="10%" align="center"><bean:message key="media.download"/></td>
			<td width="10%" align="center"><bean:message key="media.online"/></td>
		</tr>

		<%
			List matchs=scv.getMatchs();
			for(int j=0;j<matchs.size();j++)
			{
				MatchView mv =(MatchView)matchs.get(j);
				//out.println(mv.getName());
				//out.println(mv.getStarttime());
		%>

		<tr bgcolor="<% if((j+1)%2==0) { %>#D5D5D5<% } else { %>#E5E5E5<% } %>">
			<td align="center"><%=mv.getStarttime()%></td>
			<td align="center"><a href="<%=basePath%>/sports/MatchDetail.do?match_id=<%=mv.getId()%>" style="color: #000;text-decoration: underline;"><%=mv.getName()%></a></td>
            <td align="center"><%@ include file="common/media_download.jsp" %></td>
            <td align="center"><%@ include file="common/media_online.jsp" %></td>
		</tr>

		<%
			}
		}
		%>

		</table>

		<div style="clear: both;">&nbsp;</div>
		
		<div style="padding:10px;">* <bean:message key="notice.other_games" bundle="sports"/></div>

	</div>

	<%@ include file="../content/common/box_footer_blue.jsp" %>

</div>

<div style="clear: both;">&nbsp;</div>

<jsp:include page="../content/common/footer.jsp" />
