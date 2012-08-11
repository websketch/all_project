<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.chinaportal.portal.sports.*" %>
<%@ page import="java.util.List" %>

<%
try
{
%>

<%@ include file="../../content/common/parameter.jsp" %>

<table border="1" cellpadding="5" cellspacing="0" width="610" style="border-collapse: collapse;color: #000000;" bordercolor="gray">

<tr bgcolor="D3DCE3">
    <td width="20%" align="center"><bean:message key="table.title.fixture" bundle="sports"/></td>
    <td width="60%" align="center"><bean:message key="table.title.match" bundle="sports"/></td>
    <td width="20%" align="center" colspan="2">收看方式</td>
</tr>


<%
	index = 1;
	String category_id_url = request.getParameter("category_id");
	List categorysList = (List)request.getAttribute("Match_List");
	for(int i=0; i<categorysList.size(); i++)
	{
		SubCategoryView category=(SubCategoryView)categorysList.get(i);
		List matchList = (List)category.getMatchs();
		for(int j=0; j<matchList.size(); j++)
		{
			MatchView mv=(MatchView)matchList.get(j);
%>

<tr bgcolor="<% if((index+1)%2==0) { %>#D5D5D5<% } else { %>#E5E5E5<% } %>">
	<td align="center"><%=mv.getStarttime()%></td>
	<td align="center"><a href="<%=basePath%>/sports/MatchDetail.do?match_id=<%=mv.getId()%>" style="color: #000;text-decoration: underline;"><%=mv.getName()%></a></td>
    <td align="center"><%@ include file="media_download.jsp" %></td>
    <td align="center"><%@ include file="media_online.jsp" %></td>
</tr>

<% 
			index++;
		}
	}
%>

</table>

<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
