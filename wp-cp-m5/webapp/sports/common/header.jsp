<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../content/common/parameter.jsp" %>

<link href="<%=themesPath%>style/sports.css" rel="stylesheet" type="text/css" />

<div style="text-align:right;line-height:20px;">
	<a href="<%=basePath%>/sports/Homepage.do?id=130"><bean:message key="title.sports" bundle="sports"/><bean:message key="header.homepage" bundle="sports"/></a> | 
	<a href="<%=basePath%>/sports/HomepageItem.do?category_id=201&parent_id=130"><bean:message key="header.csl" bundle="sports"/></a> |  
	<a href="<%=basePath%>/sports/HomepageItem.do?category_id=203&parent_id=130"><bean:message key="header.csll" bundle="sports"/></a> |  
	<a href="<%=basePath%>/sports/HomepageItem.do?category_id=202&parent_id=130">05CBA</a> | 
	<a href="<%=basePath%>/sports/HomepageItem.do?category_id=243&parent_id=130">06CBA</a> | 
	<a href="<%=basePath%>/sports/HomepageItem.do?category_id=212&parent_id=130"><bean:message key="item.swim" bundle="sports"/><bean:message key="label.prize_match" bundle="sports"/></a> | 
	<a href="<%=basePath%>/sports/HomepageItem.do?category_id=129&parent_id=130"><bean:message key="header.wttc" bundle="sports"/></a> | 
	<a href="<%=basePath%>/sports/HomepageItem.do?category_id=215&parent_id=130"><bean:message key="item.basketball.man" bundle="sports"/><bean:message key="match.basketball.aisa" bundle="sports"/></a> | 
	<a href="<%=basePath%>/sports/eb2005.jsp"><bean:message key="item.basketball.man" bundle="sports"/><bean:message key="match.basketball.euro" bundle="sports"/></a><br /> 
	<a href="<%=basePath%>/sports/HomepageItem.do?category_id=218&parent_id=130"><bean:message key="national_games" bundle="sports"/></a> |
	<a href="<%=basePath%>/sports/OtherGames.do"><bean:message key="header.other_games" bundle="sports"/></a> | 
	<a href="<%=basePath%>/sports/MainGames.do"><bean:message key="header.main_games" bundle="sports"/></a> | 
	<a href="<%=basePath%>/news/newsAction.do?tar=sports"><bean:message key="header.sports_news" bundle="sports"/></a> | 
</div>

