<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,com.mediazone.bean.*,java.net.URLEncoder" %>

<%@ include file="../common/parameter.jsp" %>

<jsp:useBean id="newsDAO" class="com.chinaportal.portal.news.NewsDAO" scope="page"/>
<jsp:include page="../common/header.jsp" />

<%@ include file="../../trans.jsp"%>


<div class="sports_box">

	<jsp:include page="../../sports/common/header.jsp"/>

	<div class="special_offer_smg" style="float:left;background-color:#003366;">

		<%@ include file="../../sports/common/sports_banner.jsp" %>

	</div>
</div>

		<%
		try{
			request.setCharacterEncoding("UTF-8");
  		Integer langId=(Integer)session.getAttribute("chinaportal.local");	
  		String news_id = request.getParameter("news_id").trim();
  		Integer newsId = Integer.valueOf(news_id);
  		String title = "";
  		String body = "";
  		String strDate = "";
  		String keyword = "";
  		String image = null;
  		String origin = "";
  		String author = "";
  		List newsList = newsDAO.query(newsId,langId,"1",12);
  		if(newsList!=null && newsList.size()>0){
  			News news = (News)newsList.get(0);
  			//News_caption nc = news.getCaption(langId);
  			
  			NewsCaption nc=null;
  		    Set set = news.getCaptions();
  		    Iterator iterator = set.iterator();
  		    while (iterator.hasNext()) {
  		    	NewsCaption cat = (NewsCaption)iterator.next();
  		       if (langId.equals(cat.getLangId())) 
  		         nc=cat; 
  		   }
  			
  			if(nc!=null){
  			title = nc.getTitle();
  			body = nc.getBody();
  			body = body.replaceAll("\n","<br>");
  			if(nc.getImage()!=null) image = nc.getImage();
  			if(nc.getOrigin()!=null) origin = nc.getOrigin();
  			if(nc.getAuthor()!=null) author = nc.getAuthor();
  			Date date = news.getCreateTime();
  			strDate = getNormalDate(date);
  			keyword = nc.getKeyword();
  			if(keyword!=null && !keyword.equals("")){
  			String[] keys = keyword.trim().split(",");
  			String replacement = null;
  			for(int i=0; i<keys.length; i++){
  				String tempkey = URLEncoder.encode(keys[i].trim(),"UTF-8");
  				String tempurl = request.getContextPath()+"/search/searchAction.do?key="+tempkey;
  				replacement = "<a href='"+tempurl+"' style='text-decoration: underline;line-height:16px;'>" + keys[i]+"</a>";
  				body = body.replaceAll(keys[i], replacement);
  			}}}
  		}	
  	%>
<div class="news_view">
<!--{assign var="block_title" value=#lang_news_view_title#}-->
	<!--{include file="block_block_header_yellow.tpl"}-->
<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
	<div style="float:left;padding-top:4px;">&nbsp;<bean:message key="header.sports_news" bundle="sports"/></div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
</div>
				
	<div class="content" style="background: url(<%=themesPath%>icons/icon_landi.gif) repeat-y right;">
		<div class="left">
		<%if(langId!=null && (langId.intValue()==2 || langId.intValue()==3)){%>	
			<center>
				<h3><%=title%></h3>
				<span><%=strDate%>&nbsp;&nbsp;<%=origin%>&nbsp;&nbsp;<%=author%></span>
			</center>
			<p><%if(image!=null&&!image.equals("")){%><img src="<%=request.getContextPath()%>/images/news/<%=image%>" onload="resize_me(this);" align="right"><%}%> <%=body%></p>
			<p align="right">[ <a href="#" onclick="window.print();return false"><bean:message key="page.print"/></a> ] [ <a href="javascript:history.go(-1)"><bean:message key="page.back"/></a> ] </p>
		<%}else{%>	
			<center>Sorry, English version is not available for Entertainment News.</center>
		<%}%>
		</div>
		<div class="right">
			<center>
				<p>
				<bean:message key="title.keyword"/>
				<form name="searchformtwo" action="<%=basePath%>/search/searchAction.do" method="get">
				<input type="text" id="keyword1" name="key" size="10"><br />
				<button onclick="return checkeyword1()" style="height:20px;vertical-align: middle;"><bean:message key="button.search"/></button>
				</form>
				</p>
			</center>

			<div style="clear: both;">&nbsp;</div>

			<!--{assign var="left_bar_title" value=#lang_box_title_2#}-->
			<div class="title" style="background-image: url(<%=themesPath%>icons/icon_huangditou.gif);"><bean:message key="title.new_match" bundle="sports"/></div>
			<ul>
	<%
		List newMedias = newsDAO.querySoprtsNewMedias(new Integer(130));
		for(int k=0; k<newMedias.size() && k<10; k++){
			Media newMedia = (Media)newMedias.get(k);
			String newmedia_id = newMedia.getMediaId().toString();
			String newname = "";
			
			MediaCaption mc=null;
			Set set1 =newMedia.getCaptions();
			Iterator iterator1 = set1.iterator();
			while (iterator1.hasNext()) {
				MediaCaption cat1 = (MediaCaption) iterator1.next();
				if (langId.equals(cat1.getLangId())) 
					mc = cat1 ;
				}
			if(null!=mc){
				newname=mc.getName();
			
			//if(null!=newMedia.getCaption(langId)){
			//	newname = newMedia.getCaption(langId).getName();
	%>			
				<li><a href="<%=request.getContextPath()%>/getDetail.do?media_id=<%=newmedia_id%>" title="" style="text-decoration: underline;"><%=newname%></a>
	<%}}%>
			</ul>

			<div style="clear: both;">&nbsp;</div>
		</div>
	</div>
	<!--{include file="block_block_footer_blue.tpl"}-->
	<div class="block_footer" style="background: #003366;width:100%;">
		<img align="left" src="<%=themesPath%>icons/icon_lanjiao1.jpg" height="7" width="7">
		<img align="right" src="<%=themesPath%>icons/icon_lanjiao2.jpg" height="7" width="7">
  </div>	
</div>
<div style="clear: both;">&nbsp;</div>

<%}catch(Exception e){
  e.printStackTrace();
}
%>
<script Language="javascript">
function checkeyword1()
{
	var key = document.getElementById("keyword1");
	//var key = document.searchForm.key;
	if ( isEmpty(key.value) )
	{
		//cmAlert(CM_MSG_ERR_002);
		alert('<bean:message key="search.key.mustinput"/>');
		key.focus();
		return false;
	}
	searchformtwo.submit();
	//searchForm.submit();
	//var str = LTrim(RTrim(key.value));
	//window.location.href="<{$PathModulesHttp}>search/search.php?keyword="+escape(str);
	//return;
	//alert(key.value);
	//return;
}

// 重新調圖片大小
max_img_w = 370; // 圖片的最大寬
max_img_h = 555; // 圖片的最大高
function resize_me(img) {
	if (img.width > max_img_w) {
		img.height = parseInt(img.height/img.width*max_img_w);
		img.width  = max_img_w;
	}
	if (img.height > max_img_h)  {
		img.width  = parseInt(img.width/img.height*max_img_h);
		img.height = max_img_h;
	}
}
</script>

<jsp:include page="../common/footer.jsp" />
