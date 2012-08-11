<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=utf-8" %>
<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao.jpg"></div>
	<div style="float:left;padding-top:4px;">&nbsp;<bean:message key="adult.home.ad.title" bundle="adult"/></div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao01.jpg" border="0"></div>
</div>
<div class="content">
	<a href="<%=basePath%>/adult/adultAction.do?tar=home&category_id=20">
	<img src="images/<{$lang}>/banner_adult_ad.gif" border="0" id="banner" width="350" height="210" style="filter:revealTrans(Transition=1,Duration=1.5)">
	</a>
</div>
<%@ include file="../content/common/box_footer_blue.jsp" %>

		<script language="JavaScript" type="text/JavaScript">
		<%
		com.chinaportal.portal.homepage.HomePageDAO hpd=new com.chinaportal.portal.homepage.HomePageDAO();	
		List promotions=hpd.getBanners(new Integer(4));
		%>
			var num = "<%=promotions.size()%>";
			var urlArray = new Array(num); 
			var banArray = new Array(num); 
			var counter = 0;

		<%
		
		for(int i=0;i<promotions.size();i++){
			com.mediazone.bean.Banners b=(com.mediazone.bean.Banners)promotions.get(i);
			String url=b.getBannerGotoUrl();
			String pic=b.getBannerLocation();
		%>
    		urlArray[<%=i%>]     = "<%=url%>";
    		banArray[<%=i%>]     = new Image();
    		banArray[<%=i%>].src = "<%=basePath%>/images/banner/<%=lang%>/<%=pic%>";
		<%
		}
		%>

			var url     = urlArray[counter];
			var imgInit = document.getElementById("banner");
			imgInit.src = banArray[counter].src;

			function changeBanner() 
			{
				if(counter > num-1)
					counter = 0;

				obj=document.getElementById("banner");

				if (document.all)
				{
					if (obj.filters.revealTrans.Transition==23) 
						obj.filters.revealTrans.Transition=1;
					else
						obj.filters.revealTrans.Transition++;
					obj.filters.revealTrans.apply();
					obj.filters.revealTrans.play();
				}

				obj.src = banArray[counter].src; 

				url = urlArray[counter]; 
				counter++; 
			}

			var timer = window.setInterval("changeBanner()", 5000);
		</script>