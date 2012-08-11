<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../content/common/parameter.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<div class="message_box">

	<style>
		img.cw { border: 0; width: 70px; height: 70px; margin: 3px; }
	</style>

	<div style="width:610px;height:651px;background-image: url(images/<%=lang%>/06cw.jpg);">
		<div style="width:235px;height:180px;padding: 180px 65px 0 310px;color:#000;">
		<% if( lang.equals("zh_cn") ) { %>
			&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;一个精心打造的网络盛宴，一场网友关注的喜庆联欢。一张张图片记录了难忘的画面，一段段DV定格了欢乐与祝福。其内容丰富、涵盖面广，安排了一系列丰富的节目内容，包括网络直播《2006春节联欢晚会》、相声《欢笑送一天》、话剧《老茶馆新茶馆》、音乐《好歌点一天》、动画片《卡通地带》等等，娱乐性及参与性强，其新颖、独特的方式将为老百姓打造一个新的文化娱乐平台。网络春节专辑是我们在春节期间推出的特色节目，需要单独购买, 会员只能免费收看06央视春节联欢晚会. 订阅只需$9.99。
		<% } else if( lang.equals("zh_tw") ) { %>
			&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;一個精心打造的網絡盛宴，一場網友關注的喜慶聯歡。一張張圖片記錄了難忘的畫面，一段段DV定格了歡樂與祝福。其內容豐富、涵蓋面廣，安排了一系列豐富的節目內容，包括網絡直播《2006春節聯歡晚會》、相聲《歡笑送一天》、話劇《老茶館新茶館》、音樂《好歌點一天》、動畫片《卡通地帶》等等，娛樂性及參與性強，其新穎、獨特的方式將爲老百姓打造一個新的文化娛樂平台。網絡春節專輯是我們在春節期間推出的特色節目，需要單獨購買, 會員只能免費收看06央視春節聯歡晚會. 訂閱只需$9.99。
		<% } else { %>
			ChinaPortal has prepared a Spring Festival Special for the coming new year. The wonderful programs include 2006 Spring Festival Evening Show, Cartoon Zone, Charming Lady, 2005 Chinese Sport Events, etc. Individual purchase is needed to watch the Internet Spring Festival Speical, and memebers could only watch 06 CCTV Spring Festival Evening Show live and on-demand without addiitonal fee. Only $9.99, you could enloy all the special Internet shows for three months!
		<% } %>
		</div>
   		<a href="javascript:subscribePack('22')"><img style="margin-right:60px;" src="images/<%=lang%>/btn_subscribe.jpg" border="0" align="right"/></a>
		<div style="width:490px;height:180px;padding: 70px 60px 0 60px;color:#000; text-align: center;">
			<a href="<%=basePath%>/getDetail.do?media_id=1072059"><img class="cw" src="images/gou_10.gif"/></a>
			<a href="<%=basePath%>/getDetail.do?media_id=1072039"><img class="cw" src="images/gou_12.gif"/></a>
			<a href="<%=basePath%>/getDetail.do?media_id=1072061"><img class="cw" src="images/gou_14.gif"/></a>
			<a href="<%=basePath%>/getDetail.do?media_id=1072062"><img class="cw" src="images/gou_16.gif"/></a>
			<a href="<%=basePath%>/getDetail.do?media_id=1072063"><img class="cw" src="images/gou_18.gif"/></a>
			<a href="<%=basePath%>/getDetail.do?media_id=1072064"><img class="cw" src="images/gou_31.gif"/></a>
			<a href="<%=basePath%>/getDetail.do?media_id=1072065"><img class="cw" src="images/gou_33.gif"/></a>
			<a href="<%=basePath%>/getDetail.do?media_id=1072066"><img class="cw" src="images/gou_35.gif"/></a>
			<a href="<%=basePath%>/getDetail.do?media_id=1072067"><img class="cw" src="images/gou_37.gif"/></a>
			<a href="<%=basePath%>/getDetail.do?media_id=1072068"><img class="cw" src="images/gou_39.gif"/></a>
			<a href="<%=basePath%>/getDetail.do?media_id=1072069"><img class="cw" src="images/gou_49.gif"/></a>
		</div>
	</div>
		
</div>

<div style="clear:both;">&nbsp;</div>

<jsp:include page="../content/common/footer.jsp" />
