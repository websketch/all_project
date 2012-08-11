<%@ page contentType="text/html; charset=utf-8" %>
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
        <div style="float:left;padding-top:2px;">&nbsp;主要赛事表</div>
	    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
	</div>

	<div class="content">
		<table border="1" cellpadding="5" cellspacing="0" width="100%" style="border-collapse:collapse;color:#000000;" bordercolor="gray">
		<tr bgcolor="D3DCE3">
			<td align="center">赛事时间</td>
			<td align="center">赛事</td>
			<td align="center">播放时间</td>
		</tr>
		<tr bgcolor="#D5D5D5">
			<td align="center">4月30日-5月7日</td>
			<td align="center"><a href="<%=basePath%>/sports/HomepageItem.do?category_id=129" style="text-decoration: underline;color:#000;"><bean:message key="header.wttc" bundle="sports"/></a></td>
			<td align="center">4月30日</td>
		</tr>
		<tr bgcolor="#E5E5E5">
			<td align="center">2005-2006</td>
			<td align="center"><a href="<%=basePath%>/sports/HomepageItem.do?category_id=202" style="text-decoration: underline;color:#000;">CBA</a></td>
			<td align="center">6月1日</td>
		</tr>
		<tr bgcolor="#D5D5D5">
			<td align="center">4月-11月</td>
			<td align="center"><a href="<%=basePath%>/sports/HomepageItem.do?category_id=201" style="text-decoration: underline;color:#000;"><bean:message key="header.csl" bundle="sports"/></a></td>
			<td align="center">6月1日</td>
		</tr>
		<tr bgcolor="#E5E5E5">
			<td align="center">5月17日-11月12日</td>
			<td align="center"><a href="<%=basePath%>/sports/HomepageItem.do?category_id=203" style="text-decoration: underline;color:#000;"><bean:message key="header.csll" bundle="sports"/></a></td>
			<td align="center"></td>
		</tr>
		<tr bgcolor="#D5D5D5">
			<td align="center">6月-10月</td>
			<td align="center">足协杯</td>
			<td align="center"></td>
		</tr>
		<tr bgcolor="#E5E5E5">
			<td align="center">6月11日-6月12日</td>
			<td align="center">V8 超级房车邀请赛 上海站（第5轮）</td>
			<td align="center"></td>
		</tr>
		<tr bgcolor="#D5D5D5">
			<td align="center">10月9日</td>
			<td align="center">十运会</td>
			<td align="center"></td>
		</tr>
		<tr bgcolor="#E5E5E5">
			<td align="center">9月17日</td>
			<td align="center">上海田径大奖赛</td>
			<td align="center"></td>
		</tr>
				<tr bgcolor="#D5D5D5">
			<td align="center">2005-2006</td>
			<td align="center">排球联赛</td>
			<td align="center"></td>
		</tr>
				<tr bgcolor="#E5E5E5">
			<td align="center">2005-2006</td>
			<td align="center">围甲</td>
			<td align="center"></td>
		</tr>
				<tr bgcolor="#D5D5D5">
			<td align="center">2005-2006</td>
			<td align="center">象棋</td>
			<td align="center"></td>
		</tr>
				<tr bgcolor="#E5E5E5">
			<td align="center">2005-5-12</td>
			<td align="center">中美天后花式9球邀请赛</td>
			<td align="center">2005-05-30</td>
		</tr>
		</table>

		<div style="clear: both;">&nbsp;</div>
		
		<div style="padding:10px;">* 2005主要赛事表随着赛事的接近会调整, 我们也有可能播放更多赛事, 请随时查看. 我们尽力播放所列赛事, 但我们保留变动赛事的权利.</div>

	</div>

	<%@ include file="../content/common/box_footer_blue.jsp" %>

</div>

<div style="clear: both;">&nbsp;</div>

<jsp:include page="../content/common/footer.jsp" />
