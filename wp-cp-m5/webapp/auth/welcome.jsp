<%@ page contentType="text/html; charset=utf-8" %>

<%@ include file="../content/common/parameter.jsp" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="0">
	<style>
	body {
		background-color: #375e7b; /* #E0DFE3; */
		margin: 0px 0px 0px 0px;
		font-family: "宋体", arial, helvetica, sans-serif;
		font-size: 12px;
		color: white;		
	}
	table.body {
		font-family: "宋体", arial, helvetica, sans-serif;
		font-size: 12px;
		border:0;
		width:100%;
		height:100%;
	}
	td.header480 {
		margin: 10px;
		height: 50px;
		width:100%;
		padding-left: 15px;
		background-color:#003366;
	}
	td.footer480 {
		font-weight: bold;
		color: white;
		text-decoration: none;
		background-color:#003366;
		height: 20px;
		width:100%;
		text-align:right;
		margin: 10px;
	
	}
	a:link, a:visited, a:hover {
		font-weight: normal;
		color: white;
		text-decoration: underline;
	}
	td.main {
		vertical-align:middle;
		text-align:center;
	}
	</style>
</head>

<body class="small" scroll="no" onload="init();">

<table class="body" cellspacing="0">
	<tr>
		<td class="header480"><img class="img_logo" src="<%=themesPath%>images/logo_<%=currentSiteName%>.gif" border="0" alt="" /></td>
	</tr>
	<tr>
		<td class="main"><% pageContext.include("../static/"+lang+"/popup_welcome.jsp"); %></td>
	</tr>
	<tr>
		<td class="footer480">ChinaPortal.com: 
			<a href="<%=basePath%>/static.jsp?fn=termsofuse">使用条款</a> | 
			<a href="<%=basePath%>/static.jsp?fn=privatepolicy">隐私权政策</a> |
			<a href="<%=basePath%>/static.jsp?fn=aboutus">联系我们</a>
		</td>
	</tr>
</table>

</body>
</html>
