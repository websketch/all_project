<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../content/common/parameter.jsp" %>

<style>
.sbc { padding:10px 10px 0 15px;width:567px; }
.sbc li { line-height: 20px; }
.sbc img { border: 0; }
</style>

<div class="sbc">

	<h3>Purchase Options</h3>
	
	<li>We’ve changed our subscription packages since December 8, 2008 to simplify our offers and provide better value to our customers. The previous subscriptions will no longer be available. Any subscription to previous subscriptions purchased before December 8, 2008 will be kept till cancellation. </li><br/><br/>
	
	<div style="background:url(<%=themesPath%>images/icons_newsubscibe_zlt.jpg) repeat-y">
		<div style="float:left;"><img src="<%=themesPath%>images/icons_newsubscibe_slt.jpg"/></div>
		<div style="height:470px;padding:0 30px 0 30px;">
			<img src="<%=langImagePath%>banner_newsubscibe_njdhy.jpg"/>
			<ul>
				<li>Unlimited viewing of more than 8,000 hours of programs (except the Adult Channel):</li>
				<ul>
					<li>More than 5,000 episodes of movies, TV series, cartoon, etc.</li>
					<li>More that 500 sports matches including soccer, basketball, table-tennis, badminton, swimming, diving, gymnastics and more sports</li>
					<li>Almost 1,000 TV programs covering in-depth news report, finance, sports review, interviews, fashion and more.</li>
					<li>More than 200 pieces of music programs - MTV, popular songs and more</li>
				</ul>
				<li>Four live satellite TV Channels, available 24/7</li>
				<li>Live broadcast of sports event, concerns and other events</li>
				<li>New releases every week: at least five movies, 1 TV series, more than ten TV programs, music, documentaries and other programs.  Sport matches are updated near-live after the play. </li>
				<li>High quality and convenience: sharp image, consistent streaming and fast delivery; watch favorite programs whenever and wherever you’d decide</li>
				<li>Viewing at maximum 2 PCs per account </li>
			</ul>
			<div style="padding:10px 0 0 30px;">
			<% if( currentSiteName.equals("thaiportal") ) { %>
				<a href="javascript:popup('102')"><img src="<%=langImagePath%>banner_newsubscibe_dyndhy.jpg"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:popup('103')"><img src="<%=langImagePath%>banner_newsubscibe_dyjdhy.jpg"/></a>
			<% } else { %>
				<a href="javascript:subscribePack('1')"><img src="<%=langImagePath%>banner_newsubscibe_dyndhy.jpg"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:subscribePack('21')"><img src="<%=langImagePath%>banner_newsubscibe_dyjdhy.jpg"/></a>
			<% } %>
			</div>
		</div>
		<div style="float:left;"><img src="<%=themesPath%>images/icons_newsubscibe_xlt.jpg"/></div>
	</div>

	<h3 style="padding-top:20px;">Want to know more about our service and quality? </h3>
	<ul>
		<li>Visit <a class="yline" href="<%=basePath%>/specialAction.do?tar=freemedia&category_id=28">Free Preview page</a> to watch free TV series, TV programs and sports matches. </li>
		<li>Or visit the individual page of our all-time most popular top 5 TV series : <a class="yline" href="<%=basePath%>/getDetail.do?media_id=836">De Zhang Kim</a>(70 episodes, $14.99), <a class="yline" href="<%=basePath%>/getDetail.do?media_id=1042">Emperor Wu Di of the Han Dynasty</a>(70 episodes, $14.99), <a class="yline" href="<%=basePath%>/getDetail.do?media_id=1087">Romantic Life</a>(32 episodes, $9.99), <a class="yline" href="<%=basePath%>/getDetail.do?media_id=1088">No. 1 Under the Sky</a>(40 episodes, $9.99), <a class="yline" href="<%=basePath%>/getDetail.do?media_id=738">The Sky of History</a>(32 episodes, $9.99), buy the TV series package.</li>
		<li>Or visit any sports match, pay per view.</li>
	</ul>

	<div style="padding-top:20px;line-height:20px;">
		<b>Subscription Upgrade</b>: 
		Please subscribe to the new package you want first, then email  
		<a href="mailto:support@chinaportal.com" style="color: #FF9900;text-decoration: underline;">support@chinaportal.com</a> 
		to cancel your old package. We will refund your remaining balance of old subscription on prorate basis. This refund policy only applied to upgrade, not ordinary cancellation. Subscription upgrade refers to the change of membership to one with higher fee, i.e. the Basic Package to Premium or Annual Package, or Premium Package to Annual Package. 
	</div>
	
</div>

<br />
<br />
<br />
<br />
