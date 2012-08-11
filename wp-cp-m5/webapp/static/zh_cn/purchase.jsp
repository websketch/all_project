<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../../content/common/parameter.jsp" %>

<style>
.sbc { padding:10px 10px 0 15px;width:567px; }
.sbc li { line-height: 20px; }
.sbc img { border: 0; }
</style>

<div class="sbc">

	<h3>订阅方式</h3>
	
	<li>自2005年12月8日起, 我们将对会员制进行调整, 部分所列的会员制将不再提供. 在12月8日前加入的会员制将不会改变, 直到取消. </li><br/><br/>
	
	<div style="background:url(<%=themesPath%>images/icons_newsubscibe_zlt.jpg) repeat-y">
		<div style="float:left;"><img src="<%=themesPath%>images/icons_newsubscibe_slt.jpg"/></div>
		<div style="height:550px;padding:0 30px 0 30px;">
			<img src="<%=langImagePath%>banner_newsubscibe_njdhy.jpg"/>
			<ul>
				<li>无限量收看所有八千多小时精彩节目(成人频道除外):</li>
				<ul>
					<li>五千多部/集精彩影视剧作,经典作品, 影视专辑, 卡通作品等</li>
					<li>五百多场顶级体育赛事, 包括足球, 篮球, 乒乓球, 羽毛球, 游泳, 跳水, 体操, 极限运动等项目</li>
					<li>近千部电视专题节目,涵盖深度新闻报道, 财经评论, 体育聚焦, 人物访谈等.</li>
					<li>两百多部/首音乐节目包括音乐会, MTV, 流行歌曲等</li>
				</ul>
				<li>四个卫视频道每天24小时任意收看</li>
				<li>现场直播节目如体育赛事,大型演出等</li>
				<li>周周新节目上演: 至少五部电影,一部电视剧,近十集电视专题节目,音乐等节目.体育赛事随时更新</li>
				<li>高质量画面,即时在线收看,随时下载收看</li>
				<li>每个帐户限两台电脑收看</li>
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

	<h3 style="padding-top:20px;">想了解更多我们的服务和质量? </h3>
	<ul>
		<li>请访问<a class="yline" href="<%=basePath%>/specialAction.do?tar=freemedia&category_id=28">免费收看区</a>亲身体验我们的服务, 欣赏热门影视, 电视专题, 体育赛事. </li>
		<li>或访问我们开站以来最受欢迎的五部电视剧: <a class="yline" href="<%=basePath%>/getDetail.do?media_id=836">大长今</a> (70集, $14.99), <a class="yline" href="<%=basePath%>/getDetail.do?media_id=1042">汉武大帝</a>(70集, $14.99), <a class="yline" href="<%=basePath%>/getDetail.do?media_id=1087">血色烂漫</a>(32集, $9.99), <a class="yline" href="<%=basePath%>/getDetail.do?media_id=1088">天下第一</a>(40集, $9.99), <a class="yline" href="<%=basePath%>/getDetail.do?media_id=738">历史的天空</a>(32集, $9.99), 购买单剧,亲身体验我们的服务.</li>
		<li>或购买体育赛事, 按场或赛事缴费, 亲身体验我们的服务.</li>
	</ul>

<% if( ! currentSiteName.equals("thaiportal") ) { %>

	<div style="background:url(<%=themesPath%>images/icons_newsubscibe_zlt.jpg) repeat-y">
		<div style="float:left;"><img src="<%=themesPath%>images/icons_newsubscibe_slt.jpg"/></div>
		<div style="height:220px;_height:160px;padding:0 30px 0 30px;">
			<img src="<%=langImagePath%>banner_newsubscibe_crpdhy.jpg"/>
			<div style="float:left;width:250px;">
				<ul>
					<li>三百多部日韩欧美火辣影片</li>
					<li>高质量画面,即时在线收看,随时下载收看</li>
					<li>每个帐户限两台电脑收看</li>
					<li>只对中国大陆以外地区开放 </li>
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
		<b>会员升级</b>: 
		请先订阅您想要的新会员, 再发电子邮件到 
		<a href="mailto:support@chinaportal.com" style="color: #FF9900;text-decoration: underline;">support@chinaportal.com</a> 
		取消旧会员.  对于升级的会员, 如果您的旧会员在前半月内, 将得到月会员费的全部退款;如果您的旧会员在后半月内, 将得到月会员费的一半退款. 这项退款只适用于会员升级, 不适用于其他会员取消.  会员升级是指在同一会员订阅由低会费的会员升至高会费的会员, 如普通会员到高级会员或年度会员, 或高级会员到年度会员.
	</div>
	
</div>

<br />
<br />
<br />
<br />
