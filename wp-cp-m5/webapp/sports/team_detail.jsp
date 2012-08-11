<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>

<%@ include file="../content/common/parameter.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<%
TeamDetailDAO tdd=new TeamDetailDAO();
TeamView tv=tdd.getDetail(request.getParameter("team_id"),lang_id);

List children=tv.getActors();

%>
<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<div class="special_offer_smg" style="float:left;background-color:#003366;">

		<%@ include file="common/sports_banner.jsp" %>

	</div>

	<div style="clear:both;">&nbsp;</div>

	<div class="special_offer_smg" style="float:left;background-color:#003366;">

		<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
		    <div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
            <div style="float:left;padding-top:2px;">&nbsp;<bean:message key="label.teams_detail" bundle="sports"/></div>
		    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
		</div>
		
		<div class="content">
			<div style="clear:both;float:left;padding:10px;"><img src="<%=largeImagePath%><%=tv.getPhoto()%>" border="0" alt=""></div>
			<div style="float:left;padding-left:10px;padding-top:10px;"><%=tv.getBrief_introduction()==null?"":tv.getBrief_introduction().replaceAll("\n","<br>")%></div>
			<div style="clear:both;padding:10px;"><%=tv.getDescription()==null?"":tv.getDescription().replaceAll("\n","<br>")%></div>
		</div>

		<div style="clear:both;margin-top:20px">
			<table border="1" cellpadding="5" cellspacing="0" width="100%" style="border-collapse:collapse;color:#000000;" bordercolor="gray">
			<tr bgcolor="D3DCE3">
				<td align="center"><bean:message key="table.title.name" bundle="sports"/></td>
				<td align="center"><bean:message key="table.title.num" bundle="sports"/></td>
				<td align="center"><bean:message key="table.title.born" bundle="sports"/></td>
				<td align="center"><bean:message key="table.title.height" bundle="sports"/>(cm)</td>
				<td align="center"><bean:message key="table.title.weight" bundle="sports"/>(Kg)</td>
				<td align="center"><bean:message key="table.title.position" bundle="sports"/></td>
				<td align="center"><bean:message key="table.title.country" bundle="sports"/>&U20</td>
				<td align="center"><bean:message key="table.title.certificate" bundle="sports"/></td>
			</tr>
			
			<% for(int i=0;i<children.size();i++) { ActorView av=(ActorView)children.get(i); %>
			
			<tr bgcolor="<% if((i+1)%2==0) { %>#D5D5D5<% } else { %>#E5E5E5<% } %>">
				<td align="center"><a href="<%=basePath%>/sports/PlayerDetail.do?player_id=<%=av.getId()%>" style="color:#000000;text-decoration:underline;"><%=av.getName()%></a></td>
				<td align="center"><%=av.getNum()%></td>
				<td align="center"><%=av.getBorn()%></td>
				<td align="center"><%=av.getHeight()%></td>
				<td align="center"><%=av.getWeight()%></td>
				<td align="center"><%=av.getPosition()%></td>
				<td align="center"><%=av.getCountry()%></td>
				<td align="center"><%=av.getCertificate()%></td>
			</tr>
			
			<% } %>
			
			</table>
		</div>

		<%@ include file="../content/common/box_footer_blue.jsp" %>

	</div>

</div>

<div style="clear:both;">&nbsp;</div>

<jsp:include page="../content/common/footer.jsp" />
