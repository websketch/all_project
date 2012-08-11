<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.chinaportal.portal.sports.*" %>
<%@ page import="java.util.List" %>
<%try{%>
<%@ include file="../../content/common/parameter.jsp" %>

<table border="1" cellpadding="5" cellspacing="0" width="610" style="border-collapse: collapse;color: #000000;" bordercolor="gray">


<%
String category_id_url = request.getParameter("category_id");
List categorysList = (List)request.getAttribute("Match_List");
for(int i=0; i<categorysList.size(); i++)
{
	SubCategoryView category=(SubCategoryView)categorysList.get(i);
%>

<tr bgcolor="#23AEF1">
	<td colspan="6">
		<div style="float:left"><a name="<%=i+1%>"><%=category.getName()%></a></div>
		<div style="float:right"><a href="#top"><bean:message key="label.return" bundle="sports"/></a></div>
	</td>
</tr>

<tr bgcolor="D3DCE3">
    <td width="20%" align="center"><bean:message key="table.title.fixture" bundle="sports"/></td>
    <td width="20%" align="center"><bean:message key="table.title.home" bundle="sports"/></td>
    <td width="20%" align="center"><bean:message key="table.title.guest" bundle="sports"/></td>
    <td width="20%" align="center"><bean:message key="table.title.match" bundle="sports"/></td>
    <td width="10%" align="center"><bean:message key="media.download"/></td>
    <%if(category_id_url!=null && !category_id_url.equals("202")){%>
    <td width="10%" align="center"><bean:message key="media.online"/></td>
    <%}%>
</tr>

<%
	List matchList = (List)category.getMatchs();
	for(int j=0; j<matchList.size(); j++)
	{
		MatchView mv=(MatchView)matchList.get(j);
%>

<tr bgcolor="<% if((j+1)%2==0) { %>#D5D5D5<% } else { %>#E5E5E5<% } %>">
	<td align="center"><%=mv.getStarttime()%></td>
	<%@ include file="match_teams.jsp" %>
	<td align="center"><a href="<%=basePath%>/sports/MatchDetail.do?match_id=<%=mv.getId()%>" style="color: #000;text-decoration: underline;"><%=mv.getName()%></a></td>
    <td align="center"><%@ include file="media_download.jsp" %></td>
<% if(category_id_url!=null && !category_id_url.equals("202")) { %>
    <td align="center"><%@ include file="media_online.jsp" %></td>
<% } %>
</tr>

<% 
	}
}
%>

</table>
<%}catch(Exception e){
	e.printStackTrace();
}
%>
