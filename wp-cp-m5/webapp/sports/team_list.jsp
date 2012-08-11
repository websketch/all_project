<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>

<%@ include file="../content/common/parameter.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<div class="special_offer_smg" style="float:left;background-color:#003366;">

		<%@ include file="common/sports_banner.jsp" %>

	</div>

	<div style="clear:both;">&nbsp;</div>

   	<script language="javascript">
   		boxTitle         = "球队列表";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>

	<%@ include file="../content/common/box_header_yellow.jsp" %>


	<div class="content">

		<table border="0" cellpadding="10" cellspacing="0" width="100%" style="border-collapse:collapse;" bordercolor="gray">

		<%
		TeamDetailDAO tdd=new TeamDetailDAO();
		List tvs=tdd.getTeamList(request.getParameter("itemid"),new Integer(2));
		for(int i=0;i<tvs.size();i++)
		{
			TeamView tv=(TeamView)tvs.get(i);
			
		%>
		<tr>
			<td valign="top" width="20%"><a href="<%=basePath%>/sports/TeamDetail.do?team_id=<%=tv.getId()%>"><img src="<%=largeImagePath%><%=tv.getPhoto()%>" border="0" /></a></td>
			<td valign="top">
				<a href="<%=basePath%>/sports/TeamDetail.do?team_id=<%=tv.getId()%>"><b><%=tv.getName()%></b></a>
				<p><%=tv.getBrief_introduction().replaceAll("\n","<br>")+"<br>"%></p>
				<p>
		<%
			//out.println(tv.getName()+"<br>");
			//out.println(tv.getPhoto()+"<br>");
			//out.println(tv.getBrief_introduction().replaceAll("\n","<br>")+"<br>");
			//out.println(tv.getDescription()+"<br>");
			List children=tv.getActors();
			for(int j=0;j<children.size();j++)
			{
				ActorView av=(ActorView)children.get(j);
		%>
					<%=av.getNum()%>&nbsp;<a href="<%=basePath%>/sports/PlayerDetail.do?player_id=<%=av.getId()%>"><%=av.getName()%></a>
		<%
			}
		%>				</p>
			</td>
		</tr>
		<tr>
			<td colspan="2"><hr /></td>
		</tr>
		<%
		}
		%>
		</table>
	</div>

	<%@ include file="../content/common/box_footer_blue.jsp" %>

</div>

<div style="clear:both;">&nbsp;</div>

<jsp:include page="../content/common/footer.jsp" />
