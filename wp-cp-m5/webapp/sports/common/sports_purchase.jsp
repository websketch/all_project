<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../content/common/parameter.jsp" %>

<div style="line-height:20px;">
	<span style="font-size:14px;"><b><bean:message key="title.sports" bundle="sports"/><bean:message key="label.member"/>: </b></span>
	<li><bean:message key="purchase.two_computer" bundle="sports"/></li>
</div>

<div class="sbox"><!-- 月度会员 -->

	<div class="block_header" style="height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao02.jpg"></div>
		<div style="float:left;padding-top:4px;"><bean:message key="purchase.month" bundle="sports"/><bean:message key="label.member" bundle="sports"/></div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao03.jpg" border="0"></div>
	</div>

	<div class="sbox_content">
		<div class="price" style="height:110px;">
			<img src="<%=themesPath%>images/tybai29.99.gif" />
			<div style="width:100%;text-align:center;margin-top:10px;"><bean:message key="purchase.per_month" bundle="sports"/></div>
		</div>
		<div style="padding-top:5px;">
			<li><bean:message key="purchase.unlimited_view" bundle="sports"/><bean:message key="title.sports" bundle="sports"/><bean:message key="table.title.match" bundle="sports"/>(<bean:message key="purchase.exception_match" bundle="sports"/>)</li>
			<li><bean:message key="purchase.time_limit" bundle="sports"/>1<bean:message key="purchase.apiece_month" bundle="sports"/></li>
		</div>
		<div style="clear:both;text-align:right;"><button onclick="subscribePack('7')"><bean:message key="label.immediately"/><bean:message key="button.subscribe"/></button></div>
	</div>

	<%@ include file="sports_purchase_footer.jsp" %>

</div>

<div class="sbox"><!-- 年度会员 -->

	<div class="block_header" style="height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao02.jpg"></div>
		<div style="float:left;padding-top:4px;"><bean:message key="purchase.year" bundle="sports"/><bean:message key="label.member" bundle="sports"/></div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao03.jpg" border="0"></div>
	</div>

	<div class="sbox_content">
		<div class="price" style="height:110px;">
			<img src="<%=themesPath%>images/tybai299.99.gif" />
			<div style="width:100%;text-align:center;margin-top:10px;"><bean:message key="label.all_match" bundle="sports"/></div>
		</div>
		<div style="padding-top:5px;">
			<li><bean:message key="purchase.unlimited_view" bundle="sports"/><bean:message key="title.sports" bundle="sports"/><bean:message key="table.title.match" bundle="sports"/>(<bean:message key="purchase.exception_match" bundle="sports"/>)</li>
			<li><bean:message key="purchase.time_limit" bundle="sports"/>12<bean:message key="purchase.apiece_month" bundle="sports"/></li>
			<!-- li style="color:red;"><bean:message key="purchase.best_deal" bundle="sports"/></li-->
		</div>
		<div style="clear:both;text-align:right;"><button onclick="subscribePack('8')"><bean:message key="label.immediately"/><bean:message key="button.subscribe"/></button></div>
	</div>

	<%@ include file="sports_purchase_footer.jsp" %>

</div>

<div class="sbox"><!-- 按场或赛事收费 -->

	<div class="block_header" style="height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao02.jpg"></div>
		<div style="float:left;padding-top:4px;"><bean:message key="purchase.per_field_title" bundle="sports"/></div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao03.jpg" border="0"></div>
	</div>

	<div class="sbox_content">
		<div style="padding:5px 10px 0 10px;line-height:20px;">
			<li><bean:message key="purchase.per_match" bundle="sports"/>: <img border="0" src="<%=langImagePath%>typddcsf_4.99.gif"/></li>
			<li><bean:message key="purchase.set_match" bundle="sports"/>: <img border="0" src="<%=langImagePath%>typdsstc_9.99.gif"/></li>
			<br/><br/>
			<div style="clear:both;"><bean:message key="purchase.see_games" bundle="sports"/></div>
		</div>
	</div>

	<%@ include file="sports_purchase_footer.jsp" %>

</div>

<div style="clear: both;">&nbsp;</div>

<% if( 1==0 ) { %>

<div style="line-height:20px;">
	<span style="font-size:14px;"><b><bean:message key="label.sports" bundle="sports"/><bean:message key="purchase.set_match" bundle="sports"/>: </b></span>
	<li><bean:message key="purchase.two_computer" bundle="sports"/></li>
</div>

<div class="sbox"><!-- 第十届全运会  -->

	<div class="block_header" style="height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao02.jpg"></div>
		<div style="float:left;padding-top:4px;">2005<bean:message key="national_games" bundle="sports"/></div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao03.jpg" border="0"></div>
	</div>

	<div class="sbox_content">
		<div class="price">
			<img src="<%=themesPath%>images/10yh_14.99.gif" />
			<div style="width:100%;text-align:center;margin-top:10px;"><bean:message key="label.all_match" bundle="sports"/></div>
		</div>
		<div style="padding-top:5px;">
			<li><bean:message key="purchase.unlimited_view" bundle="sports"/><bean:message key="national_games" bundle="sports"/><bean:message key="label.match" bundle="sports"/></li>
			<li><bean:message key="purchase.time_limit" bundle="sports"/>1<bean:message key="purchase.apiece_month" bundle="sports"/></li>
		</div>
		<div style="clear:both;text-align:right;"><button onclick="subscribePack('18')"><bean:message key="label.immediately"/><bean:message key="button.subscribe"/></button></div>
	</div>

	<%@ include file="sports_purchase_footer.jsp" %>

</div>

<div style="clear: both;">&nbsp;</div>

<div class="sbox"><!-- 2005中超联赛  -->

	<div class="block_header" style="height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao02.jpg"></div>
		<div style="float:left;padding-top:4px;">2005<bean:message key="header.csl" bundle="sports"/><bean:message key="label.league_matches" bundle="sports"/>(4.2-11.5)</div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao03.jpg" border="0"></div>
	</div>

	<div class="sbox_content">
		<div class="price">
			<img src="<%=themesPath%>images/ty74.99.gif" />
			<div style="width:100%;text-align:center;margin-top:10px;"><bean:message key="label.all_match" bundle="sports"/></div>
		</div>
		<div style="padding-top:5px;">
			<li><bean:message key="purchase.unlimited_view" bundle="sports"/><bean:message key="header.csl" bundle="sports"/>26<bean:message key="label.turn" bundle="sports"/><bean:message key="label.match" bundle="sports"/></li>
			<li><bean:message key="purchase.time_limit" bundle="sports"/>6<bean:message key="purchase.apiece_month" bundle="sports"/></li>
			<li><span style="color:red;"><bean:message key="purchase.half_match" bundle="sports"/></span></li>
		</div>
		<div style="clear:both;text-align:right;"><button onclick="subscribePack('9')"><bean:message key="label.immediately"/><bean:message key="button.subscribe"/></button></div>
	</div>

	<%@ include file="sports_purchase_footer.jsp" %>

</div>

<div class="sbox"><!-- 2005中超联赛杯  -->

	<div class="block_header" style="height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao02.jpg"></div>
		<div style="float:left;padding-top:4px;">2005<bean:message key="header.csl" bundle="sports"/><bean:message key="label.league_matches" bundle="sports"/><bean:message key="label.cup" bundle="sports"/>(5.17-11.12)</div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao03.jpg" border="0"></div>
	</div>

	<div class="sbox_content">
		<div class="price">
			<img src="<%=themesPath%>images/tybai24.99.gif" />
			<div style="width:100%;text-align:center;margin-top:10px;"><bean:message key="label.all_match" bundle="sports"/></div>
		</div>
		<div style="padding-top:5px;">
			<li><bean:message key="purchase.unlimited_view" bundle="sports"/><bean:message key="header.csl" bundle="sports"/><bean:message key="label.league_matches" bundle="sports"/>25<bean:message key="label.field" bundle="sports"/><bean:message key="label.match" bundle="sports"/></li>
			<li><bean:message key="purchase.time_limit" bundle="sports"/>6<bean:message key="purchase.apiece_month" bundle="sports"/></li>
		</div>
		<div style="clear:both;text-align:right;"><button onclick="subscribePack('10')"><bean:message key="label.immediately"/><bean:message key="button.subscribe"/></button></div>
	</div>

	<%@ include file="sports_purchase_footer.jsp" %>

</div>

<div style="clear: both;">&nbsp;</div>

<div class="sbox"><!-- 48届世乒赛  -->

	<div class="block_header" style="height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao02.jpg"></div>
		<div style="float:left;padding-top:4px;"><bean:message key="header.wttc" bundle="sports"/>(4.30-5.6)</div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao03.jpg" border="0"></div>
	</div>

	<div class="sbox_content">
		<div class="price">
			<img src="<%=themesPath%>images/ty24.99.gif" />
			<div style="width:100%;text-align:center;margin-top:10px;"><bean:message key="label.all_match" bundle="sports"/></div>
		</div>
		<div style="padding-top:5px;">
			<li><bean:message key="purchase.unlimited_view" bundle="sports"/><bean:message key="header.wttc" bundle="sports"/><bean:message key="label.all_match" bundle="sports"/>(50+<bean:message key="label.field" bundle="sports"/>)</li>
			<li><bean:message key="purchase.time_limit" bundle="sports"/>3<bean:message key="purchase.apiece_month" bundle="sports"/></li>
		</div>
		<div style="clear:both;text-align:right;"><button onclick="subscribePack('6')"><bean:message key="label.immediately"/><bean:message key="button.subscribe"/></button></div>
	</div>

	<%@ include file="sports_purchase_footer.jsp" %>

</div>

<div class="sbox"><!-- 04CBA季后赛  -->

	<div class="block_header" style="height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao02.jpg"></div>
		<div style="float:left;padding-top:4px;">04CBA<bean:message key="label.finally_match" bundle="sports"/>(3.6-4.24)</div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao03.jpg" border="0"></div>
	</div>

	<div class="sbox_content">
		<div class="price">
			<img src="<%=themesPath%>images/tybai19.99.gif" />
			<div style="width:100%;text-align:center;margin-top:10px;"><bean:message key="label.all_match" bundle="sports"/></div>
		</div>
		<div style="padding-top:5px;">
			<li><bean:message key="purchase.unlimited_view" bundle="sports"/>2004CBA<bean:message key="label.finally_match" bundle="sports"/>(40+<bean:message key="label.field" bundle="sports"/>)</li>
			<li><bean:message key="purchase.time_limit" bundle="sports"/>3<bean:message key="purchase.apiece_month" bundle="sports"/></li>
		</div>
		<div style="clear:both;text-align:right;"><button onclick="subscribePack('11')"><bean:message key="label.immediately"/><bean:message key="button.subscribe"/></button></div>
	</div>

	<%@ include file="sports_purchase_footer.jsp" %>

</div>

<div style="clear: both;">&nbsp;</div>

<div class="sbox"><!-- 世界游泳锦标赛  -->

	<div class="block_header" style="height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao02.jpg"></div>
		<div style="float:left;padding-top:4px;"><bean:message key="label.world" bundle="sports"/><bean:message key="label.swim" bundle="sports"/><bean:message key="label.prize_match" bundle="sports"/>(7.24-7.31)</div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao03.jpg" border="0"></div>
	</div>

	<div class="sbox_content">
		<div class="price">
			<img src="<%=themesPath%>images/tybai19.99.gif" />
			<div style="width:100%;text-align:center;margin-top:10px;"><bean:message key="purchase.set_match" bundle="sports"/></div>
		</div>
		<div style="padding-top:5px;">
			<li><bean:message key="purchase.unlimited_view" bundle="sports"/><bean:message key="label.world" bundle="sports"/><bean:message key="label.swim" bundle="sports"/><bean:message key="label.prize_match" bundle="sports"/></li>
			<li><bean:message key="purchase.time_limit" bundle="sports"/>1<bean:message key="purchase.apiece_month" bundle="sports"/></li>
		</div>
		<div style="clear:both;text-align:right;"><button onclick="subscribePack('13')"><bean:message key="label.immediately"/><bean:message key="button.subscribe"/></button></div>
	</div>

	<%@ include file="sports_purchase_footer.jsp" %>

</div>

<div class="sbox"><!-- 第23届亚洲男篮锦标赛  -->

	<div class="block_header" style="height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao02.jpg"></div>
		<div style="float:left;padding-top:4px;"><bean:message key="label.di" bundle="sports"/>23<bean:message key="label.jie" bundle="sports"/><bean:message key="item.basketball.man" bundle="sports"/><bean:message key="match.basketball.aisa" bundle="sports"/></div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao03.jpg" border="0"></div>
	</div>

	<div class="sbox_content">
		<div class="price">
			<img src="<%=themesPath%>images/tybai9.99.gif" />
			<div style="width:100%;text-align:center;margin-top:10px;"><bean:message key="purchase.set_match" bundle="sports"/></div>
		</div>
		<div style="padding-top:5px;">
			<li><bean:message key="purchase.unlimited_view" bundle="sports"/><bean:message key="label.di" bundle="sports"/>23<bean:message key="label.jie" bundle="sports"/><bean:message key="item.basketball.man" bundle="sports"/><bean:message key="match.basketball.aisa" bundle="sports"/></li>
			<li><bean:message key="purchase.time_limit" bundle="sports"/>1<bean:message key="purchase.apiece_month" bundle="sports"/></li>
		</div>
		<div style="clear:both;text-align:right;"><button onclick="subscribePack('16')"><bean:message key="label.immediately"/><bean:message key="button.subscribe"/></button></div>
	</div>

	<%@ include file="sports_purchase_footer.jsp" %>

</div>

<div style="clear: both;">&nbsp;</div>

<div class="sbox"><!-- 上海田径大奖赛  -->

	<div class="block_header" style="height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao02.jpg"></div>
		<div style="float:left;padding-top:4px;"><bean:message key="area.shanghai"/><bean:message key="item.track_and_field" bundle="sports"/><bean:message key="match.medallion" bundle="sports"/></div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao03.jpg" border="0"></div>
	</div>

	<div class="sbox_content">
		<div class="price">
			<img src="<%=themesPath%>images/7.99.gif" />
			<div style="width:100%;text-align:center;margin-top:10px;"><bean:message key="purchase.per_field" bundle="sports"/></div>
		</div>
		<div style="padding-top:5px;">
			<li><bean:message key="purchase.unlimited_view" bundle="sports"/><bean:message key="area.shanghai"/><bean:message key="item.track_and_field" bundle="sports"/><bean:message key="match.medallion" bundle="sports"/></li>
		</div>
		<div style="clear:both;text-align:right;"></div>
	</div>

	<%@ include file="sports_purchase_footer.jsp" %>

</div>

<div style="clear: both;">&nbsp;</div>

<div style="line-height:20px;">
	<span style="font-size:14px;"><b><bean:message key="label.sports" bundle="sports"/><bean:message key="purchase.base_field" bundle="sports"/><bean:message key="purchase.charge" bundle="sports"/>: </b></span>
</div>

<div class="sbox"><!-- 每场收费  -->

	<div class="block_header" style="height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao02.jpg"></div>
		<div style="float:left;padding-top:4px;"><bean:message key="purchase.base_field" bundle="sports"/><bean:message key="purchase.charge" bundle="sports"/></div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao03.jpg" border="0"></div>
	</div>

	<div class="sbox_content">
		<div class="price">
			<img src="<%=themesPath%>images/ty4.99.gif" />
			<div style="width:100%;text-align:center;margin-top:10px;"><bean:message key="purchase.per_field" bundle="sports"/></div>
		</div>
		<div style="padding-top:5px;">
			<li><bean:message key="purchase.time_limit" bundle="sports"/>1<bean:message key="label.day" bundle="sports"/></li>
			<li><bean:message key="purchase.per_field_price" bundle="sports"/></li>
		</div>
		<div style="clear:both;text-align:right;"><!--button onclick="<{$BasicUrl}>"><bean:message key="label.immediately"/><bean:message key="button.subscribe"/></button--></div>
	</div>

	<%@ include file="sports_purchase_footer.jsp" %>

</div>

<div style="clear: both;">&nbsp;</div>

<% } %>
