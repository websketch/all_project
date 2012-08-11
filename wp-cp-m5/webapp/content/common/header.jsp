<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.chinaportal.portal.login.*" %>
<%@ include file="parameter.jsp" %>
<%@ include file="../../trans.jsp" %>
<%
	LoginCookie.readCookieToSession(request, response);
	loginUserName = (String)session.getAttribute("user_name");
%>	

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><bean:message key="header.title" /> ChinaPortal</title>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="keywords" content="china, high quality, high speed, Chinese, Chinese movie, movies, TV series, sports, news, entertainment, cartoon, education, documentary, Music, adult, video on demand, movie download, 2046, low price, convenience, chinaportal, chinaportal.com" />
	<meta name="description" content="The best Chinese video on demand service with largest and most-updated collection of Chinese movies, TV series, and other programs" />
	<meta name="rating" content="General" />
	<meta name="robots" content="ALL" />

	<link rev="made" href="mailto:info@chinaportal.com" />

	<link href="<%=themesPath%>style/style.<%=lang%>.css" rel="stylesheet" type="text/css">
	<link href="<%=themesPath%>style/style.css" rel="stylesheet" type="text/css">

	<script language="javascript" src="http://man.entriq.net/scripts/utils.js"></script>
	<script Language="javascript" src="<%=basePath%>/scripts/main.js"></script>
	<script Language="javascript" src="<%=basePath%>/scripts/man_<%=currentSiteName%>.js"></script>
	<script language="javascript" src="<%=basePath%>/scripts/jsconst_<%=lang%>.js"></script>
	<script Language="javascript" src="<%=basePath%>/scripts/functions.js"></script>

	<script langugae="javascript">
	    var expDays = 365; //set cookies time
	    var exp = new Date(); 
	    exp.setTime(exp.getTime() + (expDays*24*60*60*1000));
	    function setCookie (name, value) { 
	        var argv = setCookie.arguments; 
	        var argc = setCookie.arguments.length; 
	        var expires = exp; 
	        var path = (argc > 3) ? argv[3] : null; 
	        var domain = (argc > 4) ? argv[4] : null; 
	        var secure = (argc > 5) ? argv[5] : false; 
	        document.cookie = name + "=" + escape (value) + 
	        ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) + 
	        ((path == null) ? "" : ("; path=" + path)) + 
	        ((domain == null) ? "" : ("; domain=" + domain)) + 
	        ((secure == true) ? "; secure" : "");
	    }
	</script>

	<script language="javascript">
	boxTitle = "";
	boxTitleUrl = "";
	boxRightTitle = "";
	boxRightTitleUrl = "";
	
	function callSelfCare(url){
		miniPopup(url);
	}
	function miniPopup(hostname, query)
	{
		var url;
		if (typeof(query) == "undefined") {
			url = hostname;
		} else {
			url = "http://" + hostname + "/miniConsole.html?" + query;
		}
		var popupWin = open(url, 'entriq', 'toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbar=no,resizable=no,copyhistory=no,width=480,height=292,left=' + ((window.screen.width - 480) / 2) + ',top=' + ((window.screen.height - 292) / 2));
		try {
			popupWin.focus();
		} catch (err) {
			alert('If you have installed a popup-blocker, turn it off, or hold down the Ctrl-key, and try again.');
		}
	}
	function jpPopup(url)
	{
		var popupWin = open(url, 'jp', 'toolbar=no,location=no,directories=no,status=yes,menubar=no,resizable=yes,scrollbars=yes,copyhistory=no,width=770,height=492,left=' + ((window.screen.width - 770) / 2) + ',top=' + ((window.screen.height - 492) / 2));
		try {
			popupWin.focus();
		} catch (err) {
			alert('If you have installed a popup-blocker, turn it off, or hold down the Ctrl-key, and try again.');
		}
	}
	</script>

</head>

<body>

<%

String referer=request.getRequestURL().toString();
Enumeration paras=request.getParameterNames();
boolean hasPara=false;
if(paras.hasMoreElements()){
	referer+="?";
	hasPara=true;
}
while(paras.hasMoreElements()){
	String paraName=(String)paras.nextElement();
	String value=request.getParameter(paraName);
	referer+=paraName+"="+value+"&";
}
if(hasPara)
	referer=referer.substring(0,referer.length()-1);
%>
 
  
<!-- top banner start -->
<div class="top_banner width_760">
    <div class="left_box">
    <% if(currentSiteName.equals("thaiportal")) { %>
        &nbsp;<img class="img_logo" src="<%=themesPath%>images/logo_thaiportal.gif" border="0" alt="" style="padding-top:3px;" /><a href="<%=basePath%>/changeLang.do?LANG=2&refer=<%=tranEncode(referer)%>"><img src="<%=themesPath%>icons/icon_jian01.jpg" width="42" height="18" border="0" alt="" /></a> <a href="<%=basePath%>/changeLang.do?LANG=3&refer=<%=tranEncode(referer)%>"><img src="<%=themesPath%>icons/icon_fan01.jpg" width="39" height="18" border="0" alt="" /></a> <a href="<%=basePath%>/changeLang.do?LANG=1&refer=<%=tranEncode(referer)%>"><img src="<%=themesPath%>icons/icon_ying01.jpg" width="51" height="18" border="0" alt="" /></a> <a href="<%=basePath%>/changeLang.do?LANG=4&refer=<%=tranEncode(referer)%>"><img src="<%=themesPath%>icons/icon_thai.jpg" width="51" height="18" border="0" alt="" /></a>
    <% } else { %>
        &nbsp;<img class="img_logo" src="<%=themesPath%>images/logo_<%=currentSiteName%>.gif" border="0" alt="" /><a href="<%=basePath%>/changeLang.do?LANG=2&refer=<%=tranEncode(referer)%>"><img src="<%=themesPath%>icons/icon_jian01.jpg" width="42" height="18" border="0" alt="" /></a><img src="<%=themesPath%>icons/icon_baishu.jpg" width="10" height="18" border="0" alt="" /><a href="<%=basePath%>/changeLang.do?LANG=3&refer=<%=tranEncode(referer)%>"><img src="<%=themesPath%>icons/icon_fan01.jpg" width="39" height="18" border="0" alt="" /></a><img src="<%=themesPath%>icons/icon_baishu.jpg" width="10" height="18" border="0" alt="" /><a href="<%=basePath%>/changeLang.do?LANG=1&refer=<%=tranEncode(referer)%>"><img src="<%=themesPath%>icons/icon_ying01.jpg" width="51" height="18" border="0" alt="" /></a><img src="<%=themesPath%>icons/icon_baishu.jpg" width="10" height="18" border="0" alt="" />
        <% if(loginUserName!=null && !loginUserName.equals("")) { %>
            <a href="#" onclick="logout('<%=returnUrl%>')"><img src="<%=themesPath%>images/<%=lang%>/button_tuichu.jpg" width="39" height="18" border="0" alt="" /></a>
        <% } else { %>
            <a href="#" onclick="loginChinaportal('<%=returnUrl%>')"><img src="<%=themesPath%>images/<%=lang%>/button_denglu.jpg" width="39" height="18" border="0" alt="" /></a>
        <% } %>
    <% } %>
    </div>
    <div class="left_box1" style="padding-top:4px;"> 
        <a href="#" onClick="window.location.href=topBannerUrl; return false;"><img width="430" height="60" src="" border="0" id="banner_top" alt="" style="filter:revealTrans(Transition=1,Duration=1.5)" /></a>

        <script language="javascript">
            var topBannerNum = 1;
            var topBannerimgWidth = 430;
            var topBannerimgHeight = 60;
            var topBannerUrlArray = new Array(topBannerNum); 
            var topBannerImgArray = new Array(topBannerNum); 
            var topBannerCounter = 0;
			<%
			com.chinaportal.portal.homepage.HomePageDAO hpd=new com.chinaportal.portal.homepage.HomePageDAO();
			Integer activeid=new Integer(1);
			if(!currentSiteName.equals("thaiportal")){
				if(isAdultPage)
					activeid=new Integer(3);
				if(request.getParameter("category_id")!=null){
					if("103".equals(request.getParameter("category_id")) || "20".equals(request.getParameter("category_id")) )
						activeid=new Integer(3);
				}
			}
			java.util.List top_banners=hpd.getBanners(activeid);
			if(top_banners!=null && top_banners.size()>0){
				int random=(int)(Math.random()*100)%top_banners.size();			
			
			%>
						topBannerUrlArray[0] = "";
			<%
		
				com.mediazone.bean.Banners banner=(com.mediazone.bean.Banners)top_banners.get(random);
				String bannerGotoUrl=banner.getBannerGotoUrl();
				if(bannerGotoUrl.indexOf("http://")==-1)
					bannerGotoUrl=basePath+"/"+bannerGotoUrl;
				String bannerLocation=banner.getBannerLocation();
			%>
            topBannerUrlArray[0]     = "<%=bannerGotoUrl%>";
            topBannerImgArray[0]     = new Image();
            topBannerImgArray[0].src = "";
            topBannerImgArray[0].src = "<%=basePath%>/images/banner/<%=lang%>/<%=bannerLocation%>";
			<%
			}
			%>			
            var topBannerUrl     = topBannerUrlArray[topBannerCounter];
            var topBannerImgInit = document.getElementById("banner_top");
            topBannerImgInit.src = topBannerImgArray[topBannerCounter].src;

            function changeTopBanner() 
            {
                if(topBannerCounter > topBannerNum-1)
                    topBannerCounter = 0;

                topBannerObj=document.getElementById("banner_top");

                if (document.all)
                {
                    topBannerObj.filters.revealTrans.Transition=5;
                    topBannerObj.filters.revealTrans.apply();
                    topBannerObj.filters.revealTrans.play();
                }

                topBannerObj.src = topBannerImgArray[topBannerCounter].src; 

                topBannerUrl = topBannerUrlArray[topBannerCounter]; 
                topBannerCounter++; 
            }
            var tt = window.setInterval("changeTopBanner()", 6520);
        </script>
    </div>
    <div id="chatTD" class="right_box"></div>
</div>
<!-- top banner end -->

<!-- top app start -->
<div class="top_app width_760" style="background: url(<%=themesPath%>icons/icon_huangdi.jpg);">
    <div class="left">
        <bean:message key="title.keyword" />
        <form name="searchform" action="<%=basePath%>/search/searchAction.do" method="get">
        <input id="keyword" name="key" size="10" type="text" />
        <button onclick="return checkeyword()" style="height:20px;vertical-align: middle;font-size:11px;"><bean:message key="button.search" /></button>
    	</form>
    </div>
    <div class="right">
        <a href="<%=basePath%>/getHomePage.do"><bean:message key="header.homepage" /></a> | 
        <a href="#" onclick="popup('8')"><bean:message key="header.myaccount" /></a> | 
<% if(currentSiteName.equals("japan")) { %>
        <a href="javascript:void(0)" onclick="jpPopup('http://www.keitainet.jp/shuoming.html');"><bean:message key="header.howitworks" /></a> | 
<% } else { %>
        <a href="<%=basePath%>/static.jsp?fn=howitworks"><bean:message key="header.howitworks" /></a> | 
<% } %>
        <a href="<%=basePath%>/static.jsp?fn=feedback"><bean:message key="header.feedbacks" /></a> | 
<% if(currentSiteName.equals("japan")) { %>
        <a href="javascript:void(0)" onclick="jpPopup('http://www.keitainet.jp/MailIndex.html');"><bean:message key="header.purchase" /></a> | 
        <a href="javascript:void(0)" onclick="jpPopup('http://www.keitainet.jp/question.html');"><bean:message key="header.FAQs" /></a> |
        <a href="javascript:void(0)" onclick="jpPopup('http://www.keitainet.jp/contactus.html');"><bean:message key="header.support" /></a>
<% } else { %>
        <a href="<%=basePath%>/static.jsp?fn=purchase"><bean:message key="header.purchase" /></a> | 
        <a href="<%=basePath%>/static.jsp?fn=FAQs"><bean:message key="header.FAQs" /></a> | 
        <a href="#" onclick="popup('9')"><bean:message key="header.support" /></a>
<% } %>
    </div>
</div>

<script Language="javascript">
function checkeyword()
{
    var key = document.getElementById("keyword");
    // var key = document.searchForm.key;
    if ( isEmpty(key.value) )
    {
       // cmAlert(CM_MSG_ERR_002);
       	alert('<bean:message key="search.key.mustinput"/>');
        key.focus();
        return false;
    }
    searchform.submit();
    //window.location.href="search/search.php?keyword="+escape(key.value);
    //window.location.href="<%=request.getContextPath()%>/search/searchAction.do?key="+escape(key.value);
    // return;

}
</script>
<!-- top app end -->


<%
try{
Integer langId=(Integer)request.getSession().getAttribute("chinaportal.local");

java.util.List menus=hpd.getTopMenu(langId);
//pageContext.setAttribute("Top_Menu",hpd.getTopMenu(langId));
%>
<!-- top Navigator  start -->
<div class="top_nav width_760" style="background: url(<%=themesPath%>icons/icon_yingedi.jpg);">
    <div class="TopCategory" style="clear:both;">
<%
	index=1;
	for(int i=0;i<menus.size();i++)
	{
   		com.mediazone.bean.Category c=(com.mediazone.bean.Category)menus.get(i);
   		String category_id=c.getCategoryId().toString();
   		
  		if(currentSiteName.equals("thaiportal") && (category_id.equals("130") || category_id.equals("20")))
  		{
			continue;
     	}
  		
   		if(category_id.equals("130"))
   		{
    		if(!(langId.intValue()==2||langId.intValue()==3))
    			continue;
    	}
   		
  		if(currentSiteName.equals("japan") && category_id.equals("20"))
  		{
			continue;
     	}
  		   		
   		String name=c.getName();
   %>
		
    <% if(index!=1) { %>
       |&nbsp;
    <% } index++; %>
    <%if(category_id.equals("37")){%>
    	<a href="<%=basePath%>/specialAction.do?tar=smg&category_id=<%=category_id%>"><%=name%></a>
    <%
    	continue;
    	}
    %>
    <%if(category_id.equals("120")){%>
    	<a href="<%=basePath%>/specialAction.do?tar=satellite&category_id=<%=category_id%>"><%=name%></a>
    <%
    	continue;
    	}
    %>
    <%if(category_id.equals("20")){%>
    	<a href="<%=basePath%>/adult/adultAction.do?tar=home&category_id=<%=category_id%>"><%=name%></a>
    <%
    	continue;
    	}
    %>

    <%if(category_id.equals("130")){%>
   		 <a href="<%=basePath%>/sports/Homepage.do?id=130"><%=name%></a>
    <%
    	continue;
    	}
    %>
		<a href="<%=basePath%>/getCategory.do?category_id=<%=category_id%>"><%=name%></a>
    <%}%>
    </div>
</div>
<!-- top Navigator  end -->



<table id="body_box" class="width_760" cellpadding="0px" cellspacing="0px">
<tr>
    <td width="120px" background="<%=themesPath%>icons/icon_landi.gif" valign="top">
        <jsp:include page="../common/leftbar.jsp" />
    </td>

    <!-- content start -->
    <td width="640px" valign="top">
 <%
 }catch(Exception e){
			e.printStackTrace();
 }
 %>
 
