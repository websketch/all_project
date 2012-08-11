<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../content/common/parameter.jsp" %>

<style>
.sbc { padding:10px 10px 0 15px;width:567px; }
.sbc li { line-height: 20px; }
.sbc img { border: 0; }
</style>

<div class="sbc">

	<h3>訂閱方式</h3>
	
	<li>自2005年12月8日起, 我們將對會員制進行調整, 部分所列的會員制將不再提供. 在12月8日前加入的會員制將不會改變, 直到取消. </li><br/><br/>
	
	<div style="background:url(<%=themesPath%>images/icons_newsubscibe_zlt.jpg) repeat-y">
		<div style="float:left;"><img src="<%=themesPath%>images/icons_newsubscibe_slt.jpg"/></div>
		<div style="height:500px;padding:0 30px 0 30px;">
			<img src="<%=langImagePath%>banner_newsubscibe_njdhy.jpg"/>
			<ul>
				<li>無限量收看所有八千多小時精彩節目(成人頻道除外):</li>
				<ul>
					<li>五千多部/集精彩影視劇作,經典作品, 影視專輯, 卡通作品等</li>
					<li>五百多場頂級體育賽事, 包括足球, 籃球, 乒乓球, 羽毛球, 遊泳, 跳水, 體操, 極限運動等項目</li>
					<li>近千部電視專題節目,涵蓋深度新聞報道, 財經評論, 體育聚焦, 人物訪談等.</li>
					<li>兩百多部/首音樂節目包括音樂會, MTV, 流行歌曲等</li>
				</ul>
				<li>四個衛視頻道每天24小時任意收看</li>
				<li>現場直播節目如體育賽事,大型演出等</li>
				<li>周周新節目上演: 至少五部電影,一部電視劇,近十集電視專題節目,音樂等節目.體育賽事隨時更新</li>
				<li>高質量畫面,即時在線收看,隨時下載收看</li>
				<li>每個帳戶限兩台電腦收看</li>
			</ul>
			<div style="padding:10px 0 0 20px;">
			<% if( currentSiteName.equals("thaiportal") ) { %>
				<a href="javascript:popup('102')"><img src="<%=langImagePath%>banner_newsubscibe_dyndhy_001.gif"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:popup('103')"><img src="<%=langImagePath%>banner_newsubscibe_dyjdhy.jpg"/></a>
			<% } else { %>
				<a href="javascript:subscribePack('1')"><img src="<%=langImagePath%>banner_newsubscibe_dyndhy_001.gif"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:subscribePack('21')"><img src="<%=langImagePath%>banner_newsubscibe_dyjdhy.jpg"/></a>
			<% } %>
			</div>
		</div>
		<div style="float:left;"><img src="<%=themesPath%>images/icons_newsubscibe_xlt.jpg"/></div>
	</div>

	<h3 style="padding-top:20px;">想了解更多我們的服務和質量? </h3>
	<ul>
		<li>請訪問<a class="yline" href="<%=basePath%>/specialAction.do?tar=freemedia&category_id=28">免費收看區</a>親身體驗我們的服務, 欣賞熱門影視, 電視專題, 體育賽事. </li>
		<li>或訪問我們開站以來最受歡迎的五部電視劇: <a class="yline" href="<%=basePath%>/getDetail.do?media_id=836">大長今</a> (70集, $14.99), <a class="yline" href="<%=basePath%>/getDetail.do?media_id=1042">漢武大帝</a>(70集, $14.99), <a class="yline" href="<%=basePath%>/getDetail.do?media_id=1087">血色爛漫</a>(32集, $9.99), <a class="yline" href="<%=basePath%>/getDetail.do?media_id=1088">天下第一</a>(40集, $9.99), <a class="yline" href="<%=basePath%>/getDetail.do?media_id=738">曆史的天空</a>(32集, $9.99), 購買單劇,親身體驗我們的服務.</li>
		<li>或購買體育賽事, 按場或賽事繳費, 親身體驗我們的服務.</li>
	</ul>

<% if( ! currentSiteName.equals("thaiportal") ) { %>

	<div style="background:url(<%=themesPath%>images/icons_newsubscibe_zlt.jpg) repeat-y">
		<div style="float:left;"><img src="<%=themesPath%>images/icons_newsubscibe_slt.jpg"/></div>
		<div style="height:220px;_height:160px;padding:0 30px 0 30px;">
			<img src="<%=langImagePath%>banner_newsubscibe_crpdhy.jpg"/>
			<div style="float:left;width:250px;">
				<ul>
					<li>三百多部日韓歐美火辣影片</li>
					<li>高質量畫面,即時在線收看,隨時下載收看</li>
					<li>每個帳戶限兩台電腦收看</li>
					<li>只對中國大陸以外地區開放 </li>
				</ul>
			</div>
			<div style="float:right;padding:0 0 0 30px;">
				<a href="javascript:subscribePack('5')"><img src="<%=langImagePath%>banner_newsubscibe_dycrnd.jpg"/></a>
			</div>
		</div>
		<div style="float:left;"><img src="<%=themesPath%>images/icons_newsubscibe_xlt.jpg"/></div>
	</div>

<% } %>

	<div style="padding-top:20px;line-height:20px;">
		<b>會員升級</b>: 
		請先訂閱您想要的新會員, 再發電子郵件到 
		<a href="mailto:support@chinaportal.com" style="color: #FF9900;text-decoration: underline;">support@chinaportal.com</a> 
		取消舊會員.  對于升級的會員, 如果您的舊會員在前半月內, 將得到月會員費的全部退款;如果您的舊會員在後半月內, 將得到月會員費的一半退款. 這項退款只適用于會員升級, 不適用于其他會員取消.  會員升級是指在同一會員訂閱由低會費的會員升至高會費的會員, 如普通會員到高級會員或年度會員, 或高級會員到年度會員.
	</div>
	
</div>

<br />
<br />
<br />
<br />
