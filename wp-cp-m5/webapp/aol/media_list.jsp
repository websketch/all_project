<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<%
String basePath = request.getContextPath();
if(basePath.equals("/")) 
	basePath = "";
%>
<jsp:useBean id="pageInfo" type="com.chinaportal.portal.search.SearchForm" scope="session" />
<jsp:useBean id="selection" type="java.util.Set"  scope="session" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Media List</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Pragma" content="no-cache">
</head>
<body>

<table bgcolor="#FFFFFF" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td>
		<form name="searchform" action="<%=basePath%>/aol/showMediaList.do" method="post">
			<a href="<%=basePath%>/aol.htm">MAIN</a> &nbsp;|&nbsp;
			Enter Keyword:
			<input type="text" id="keyword" name="key" size="10" />
			<button onclick="return checkeyword()">Search</button>
		</form>
	</td>
</tr>
<script Language="javascript">
function checkeyword()
{
	var key = document.searchform.key;
	searchform.submit();
}
</script>

<tr>
	<td width="100%">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td align="left"><div style="padding-top:3px;"><bean:message key="title.recomendation"/></div></td>
			<td width="90%" align="right" class="unnamed1">
				<bean:message key="record.total"/> <bean:write name="pageInfo" property="tolrow"/> <bean:message key="page.unit"/>&nbsp;&nbsp;
				<bean:message key="page.total"/> <bean:write name="pageInfo" property="tolpage"/> <bean:message key="page.page"/>&nbsp;&nbsp;
				<bean:message key="page.index"/> <bean:write name="pageInfo" property="curpage"/> <bean:message key="page.page"/>&nbsp;&nbsp;
				<% if ("1".equals(pageInfo.getCurpage()) || "0".equals(pageInfo.getCurpage())) { %>
				<span  style="color:#003366"><bean:message key="page.first"/></span>
				<span  style="color:#003366"><bean:message key="page.pre"/></span>
				<% } else { %>
				<a href="<%=basePath%>/aol/showMediaList.do?curpage=1"  style="text-decoration: underline;color:#003366"><bean:message key="page.first"/></a>
  				<a href="<%=basePath%>/aol/showMediaList.do?curpage=<bean:write name="pageInfo" property="prepage"/>"  style="text-decoration: underline;color:#003366"><bean:message key="page.pre"/></a>
  				<% } %>
  				<% if (pageInfo.getTolpage().equals(pageInfo.getCurpage())) {%>
				<span  style="color:#003366"><bean:message key="page.next"/></span>
				<span  style="color:#003366"><bean:message key="page.last"/></span>
				<% } else { %>
				<a href="<%=basePath%>/aol/showMediaList.do?curpage=<bean:write name="pageInfo" property="nextpage"/>"  style="text-decoration: underline;color:#003366"><bean:message key="page.next"/></a>
				<a href="<%=basePath%>/aol/showMediaList.do?curpage=<bean:write name="pageInfo" property="tolpage"/>"  style="text-decoration: underline;color:#003366"><bean:message key="page.last"/></a>
				<% } %>
			</td>
		</tr>
		</table>
	</td>
</tr>

<tr>
	<td width="100%">
		<table border="1" cellpadding="2" cellspacing="0" width="100%">
		<tr>
			<th width=70>PARENT ID</th>
			<th width=70>MEDIA ID</th>
			<th>NAME</th>
			<th>PARENT CAPTION</th>
			<th>CAPTION</th>
			<th width=50>selected</th>
			<th width=80>
				<a href="<%=basePath%>/aol/showMediaList.do?add=all"  style="text-decoration: underline;color:#003366">Add all</a><br />
				<a href="<%=basePath%>/aol/showMediaList.do?remove=all"  style="text-decoration: underline;color:#003366">Remove all</a>
			</th>
		</tr>
		<logic:iterate id="ml" name="mediaList">
		<tr>
			<td align="left"><bean:write name="ml" property="parent_id" /></td>
			<td align="left"><bean:write name="ml" property="id" /></td>
			<td align="left"><bean:write name="ml" property="name" /></td>
			<td align="left"><bean:write name="ml" property="parent_caption" /></td>
			<td align="left"><bean:write name="ml" property="caption" /></td>
			<logic:equal name="ml" property="selected" value="true"> 
			<td align="center">Y</td>
			<td align="center"><a href="<%=basePath%>/aol/showMediaList.do?remove=<bean:write name="ml" property="id"/>"  style="text-decoration: underline;color:#003366">Remove</a></td>
			</logic:equal>
			<logic:equal name="ml" property="selected" value="false"> 
			<td align="center"></td>
			<td align="center"><a href="<%=basePath%>/aol/showMediaList.do?add=<bean:write name="ml" property="id"/>"  style="text-decoration: underline;color:#003366">Add</a></td>
			</logic:equal>
		</tr>
		</logic:iterate>  
        </table>
	</td>
</tr>

<tr>
	<td width="100%">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td align="left">
				<b>SELECTION: <span style="color:red"><% out.print(selection.size()); %></span></b>
			</td>
			<td align="right">
				<a href="<%=basePath%>/aol/showMediaList.do?remove=selection"  style="text-decoration: underline;color:#003366"><b>Remove all SELECTION</b></a> &nbsp;
				<a href="<%=basePath%>/aol/exportMediaData.do"  style="text-decoration: underline;color:#003366"><b>Export media data</b></a>
			</td>
		</tr>
        </table>
	</td>
</tr>

</table>

</body>
</html>
