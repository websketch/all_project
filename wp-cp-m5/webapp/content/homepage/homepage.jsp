<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.chinaportal.portal.category.CategoryView" %>
<%@ page import="java.util.*,com.mediazone.bean.*" %>
<jsp:useBean id="newsDAO" class="com.chinaportal.portal.news.NewsDAO" scope="page"/>
<%@ include file="../common/parameter.jsp" %>

<% CategoryView CategoryInfo = new CategoryView(); %>

<jsp:include page="../common/header.jsp" />

<div class="box1">

   	<script language="javascript">
   		boxTitle         = "ChinaPortal";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   	
	<%@ include file="../common/box_header_blue.jsp" %>

	<div class="content">
		<a href="#" onClick="window.location.href=url; return false;"><img src="" border="0" id="banner" width="320" height="210" style="filter:revealTrans(Transition=1,Duration=1.5)"></a>
	</div>
	
	<%@ include file="../common/box_footer_blue.jsp" %>

</div>

<script language="JavaScript" type="text/JavaScript">
	<%
	com.chinaportal.portal.homepage.HomePageDAO hpd=new com.chinaportal.portal.homepage.HomePageDAO();	
	List promotions=hpd.getBanners(new Integer(2));
	for(int i=0;i<promotions.size();i++){
		com.mediazone.bean.Banners b=(com.mediazone.bean.Banners)promotions.get(i);
		String imgUrl=b.getBannerGotoUrl();
		String pic=b.getBannerLocation();
		//if(!currentSiteName.equals("cmn") && (pic.equals("new_banner_99.99year.jpg"))){	
		//	promotions.remove(b);	
   		// 	break;
   		//}
	}
	%>
    var num = "<%=promotions.size()%>";
    var imgWidth = 468;
    var imgHeight = 60;
    var urlArray = new Array(num); 
    var banArray = new Array(num); 
    var counter = 0;
	<%
	for(int i=0;i<promotions.size();i++){
		com.mediazone.bean.Banners b=(com.mediazone.bean.Banners)promotions.get(i);
		String imgUrl=b.getBannerGotoUrl();
		String pic=b.getBannerLocation();
	%>
    urlArray[<%=i%>]     = "<%=basePath%>/<%=imgUrl%>";
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

<div class="box2"><!-- 卫视频道 -->

<% 
	CategoryInfo = (CategoryView)request.getAttribute("tv_info");
	boxTitle     = CategoryInfo.getCategory_name();
%>

   	<script language="javascript">
   		boxTitle         = "<%=boxTitle%>";
   		boxTitleUrl      = "<%=basePath%>/specialAction.do?tar=satellite&category_id=120";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   	
	<%@ include file="../common/box_header_yellow.jsp" %>

	<div class="content">

	<% index=1; %>  

	<logic:iterate id="Media_Detail"  name="tv_medias">

		<div class="MovieList120">

			<a href="<%=basePath%>/getDetail.do?media_id=<bean:write name="Media_Detail" property="id" />" title="<bean:write name="Media_Detail" property="highlight" />"><img width="80px" height="90px" alt="" src="<%=smallImagePath%><bean:write name="Media_Detail" property="photo" />" border="0" style="padding-top:3px;"><!-- span style="color:#ff9900;text-decoration: underline;"><bean:write name="Media_Detail" property="name"/></span --></a>

			<br />

			<%@ include file="../common/media_link.jsp" %>

		</div>

	<% if((index%2)==0){ %>          
        <br /><!--div style="clear:both;">&nbsp;</div-->
	<% }
       index++;
    %>

	</logic:iterate>

    </div>

	<%@ include file="../common/box_footer_blue.jsp" %>
		
</div>
		
<div class="space_line"></div>
		
<div class="box3"><!-- 首页强力推荐 -->

   	<script language="javascript">
   		boxTitle         = "<bean:message key="title.recommdation"/>";
   		boxTitleUrl      = "<%=basePath%>/More.do?type=RECOMMEND&category_id=1";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   	
   	<%@ include file="../common/box_header_yellow.jsp" %>

    <div class="content">

	<% index=1; %>  
	<logic:iterate id="Media_Detail"  name="recommed_top">

		<div class="list"><%@ include file="../common/media_block.jsp" %></div>
		
	<% if((index%2)==0){ %>          
        <div style="clear:both;">&nbsp;</div>
	<% }
       index++; %>

	</logic:iterate>

		<div style="padding-left: 5px;">

	<logic:iterate id="Media_Detail"  name="recommed_bottom">

			<a class="MovieList3" style="background: url(<%=themesPath%>icons/icon_dot.gif) no-repeat left;text-decoration: underline;" href="<%=basePath%>/getDetail.do?media_id=<bean:write name="Media_Detail" property="id" />" title="<bean:write name="Media_Detail" property="highlight" />"><span style="color:#ff9900;text-decoration: underline;"><bean:write name="Media_Detail" property="name"/></span></a>

	</logic:iterate>
		
		</div>

	</div>
    
    <div class="more"><a href="<%=basePath%>/More.do?type=RECOMMEND&category_id=1" style="text-decoration: underline;"><bean:message key="title.more"/>&gt;&gt;</a></div>
	
	<%@ include file="../common/box_footer_blue.jsp" %>

</div>

<div class="box4"><!-- 首页新片上演 -->

   	<script language="javascript">
   		boxTitle         = "<bean:message key="title.new_release"/>";
   		boxTitleUrl      = "<%=basePath%>/More.do?type=NEW";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   	
   	<%@ include file="../common/box_header_yellow.jsp" %>

	<div class="content">

<logic:iterate id="Media_Detail"  name="new_top">

        <div class="list"><%@ include file="../common/media_block.jsp" %></div>
		<div style="clear:both;">&nbsp;</div>

</logic:iterate>

		<div style="padding-left: 5px;">

<logic:iterate id="Media_Detail"  name="new_bottom">

            <a class="MovieList2" style="background: url(<%=themesPath%>icons/icon_dot.gif) no-repeat left;text-decoration: underline;" href="<%=basePath%>/getDetail.do?media_id=<bean:write name="Media_Detail" property="id" />" title="<bean:write name="Media_Detail" property="highlight" />"><span style="color:#ff9900;text-decoration: underline;"><bean:write name="Media_Detail" property="name"/></span></a>

</logic:iterate>
        </div>

    </div>

    <div class="more"><a href="<%=basePath%>/More.do?type=NEW" style="text-decoration: underline;"><bean:message key="title.more"/>&gt;&gt;</a></div>

	<%@ include file="../common/box_footer_blue.jsp" %>

</div>

<div class="space_line"></div>

<div class="box5"><!-- 节目预告 -->

   	<script language="javascript">
   		boxTitle         = "<bean:message key="title.coming_soon"/>";
   		boxTitleUrl      = "<%=basePath%>/More.do?type=COMMING_SOON";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   	
   	<%@ include file="../common/box_header_yellow.jsp" %>

	<div class="content">

<% index=1; %>  

<logic:iterate id="Media_Detail"  name="comming_soon">

<% if(index==1){ %>          
        <div class="list"><%@ include file="../common/media_block.jsp" %></div>
        <div style="clear:both;">&nbsp;</div>
<% } else { %>
        <li style="background: url(<%=themesPath%>icons/icon_dot.gif) no-repeat left;"><a href="<%=basePath%>/getDetail.do?media_id=<bean:write name="Media_Detail" property="id" />" title="<bean:write name="Media_Detail" property="highlight" />"><span style="color:#ff9900;text-decoration: underline;"><bean:write name="Media_Detail" property="name"/></span>
        <logic:notEmpty  name="Media_Detail" property="actors">
         ( <bean:write name="Media_Detail" property="actors" /> )
        </logic:notEmpty>
        </a>     
<% }
   index++; %>

</logic:iterate>
		<div class="more"><a href="<%=basePath%>/More.do?type=COMMING_SOON" style="text-decoration: underline;"><bean:message key="title.more"/>&gt;&gt;</a></div>
	</div>
	<%@ include file="../common/box_footer_blue.jsp" %>
</div>

<div class="box6"><!-- 专题一 -->
	
<% 
    CategoryInfo = (CategoryView)request.getAttribute("spe1_info");
    boxTitle     = CategoryInfo.getCategory_name();
%>

   	<script language="javascript">
   		boxTitle         = "<%=boxTitle%>";
   		boxTitleUrl      = "<%=basePath%>/specialAction.do?category_id=<%=CategoryInfo.getCategory_id()%>";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   	
	<%@ include file="../common/box_header_yellow.jsp" %>

	<div class="content">

	<% index=1; %>  

	<logic:iterate id="Media_Detail"  name="spe1_medias">

	<% if(index==1){ %> 
        <div class="list"><%@ include file="../common/media_block.jsp" %></div>
        <div style="clear:both;">&nbsp;</div>
	<% } else { %>
            <a class="MovieList2" style="background: url(<%=themesPath%>icons/icon_dot.gif) no-repeat left;text-decoration: underline;" href="<%=basePath%>/getDetail.do?media_id=<bean:write name="Media_Detail" property="id" />" title="<bean:write name="Media_Detail" property="highlight" />"><span style="color:#ff9900;text-decoration: underline;"><bean:write name="Media_Detail" property="name"/></span></a>
	<% }
       index++; %>
	</logic:iterate>
		
		<div class="more"><a href="<%=basePath%>/specialAction.do?category_id=<%=CategoryInfo.getCategory_id()%>" style="text-decoration: underline;"><bean:message key="title.more"/>&gt;&gt;</a></div>
	</div>
	
	<%@ include file="../common/box_footer_blue.jsp" %>

</div>

<div class="box7"><!-- 专题二 -->

<% 
    CategoryInfo = (CategoryView)request.getAttribute("spe2_info");
    boxTitle     = CategoryInfo.getCategory_name();
%>

   	<script language="javascript">
   		boxTitle         = "<%=boxTitle%>";
   		boxTitleUrl      = "<%=basePath%>/specialAction.do?category_id=<%=CategoryInfo.getCategory_id()%>";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   
    <%@ include file="../common/box_header_yellow.jsp" %>

    <div class="content">

    <% index=1; %>  

    <logic:iterate id="Media_Detail"  name="spe2_medias">

    <% if(index==1){ %> 
        <div class="list"><%@ include file="../common/media_block.jsp" %></div>
        <div style="clear:both;">&nbsp;</div>
    <% } else { %>
            <a class="MovieList2" style="background: url(<%=themesPath%>icons/icon_dot.gif) no-repeat left;text-decoration: underline;" href="<%=basePath%>/getDetail.do?media_id=<bean:write name="Media_Detail" property="id" />" title="<bean:write name="Media_Detail" property="highlight" />"><span style="color:#ff9900;text-decoration: underline;"><bean:write name="Media_Detail" property="name"/></span></a>
    <% }
       index++; %>
    </logic:iterate>
        
        <div class="more"><a href="<%=request.getContextPath()%>/specialAction.do?category_id=<%=CategoryInfo.getCategory_id()%>" style="text-decoration: underline;"><bean:message key="title.more"/>&gt;&gt;</a></div>
    </div>
    
    <%@ include file="../common/box_footer_blue.jsp" %>

</div>

<div class="space_line"></div>
<%Integer langId=(Integer)request.getSession().getAttribute("chinaportal.local");	
if(langId!=null && langId.intValue()!=1 && langId.intValue()!=4){
%>
<div class="box8"><!-- News list -->

   	<script language="javascript">
   		boxTitle         = "<bean:message key="title.news_entertainment"/>";
   		boxTitleUrl      = "<%=basePath%>/news/newsAction.do";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   
    <%@ include file="../common/box_header_yellow.jsp" %>

	<div class="content1">
		<%
  		List newsList =(List)request.getAttribute("Homepage_News");
  		for(int i=0;i<newsList.size();i++)
  		{
  			com.chinaportal.portal.sports.IdName news = (com.chinaportal.portal.sports.IdName)newsList.get(i);
  			String news_id = news.getId();
  			String title = news.getName();
  			if(title.length()>25)
  			{
  				title = title.substring(0,24);
  			}
  	%>
  	<a href="<%=request.getContextPath()%>/content/news/news_view.jsp?news_id=<%=news_id%>" class="news_li" style="background: url(<%=themesPath%>icons/icon_dot.gif) no-repeat left;text-decoration: underline;"><%=title%></a>
  	<%}%>
	   <div class="more"><a href="<%=basePath%>/news/newsAction.do" style="text-decoration: underline;"><bean:message key="title.more"/>&gt;&gt;</a></div>

	</div>

	<%@ include file="../common/box_footer_blue.jsp" %>

</div>
<%}else{%>
<div class="box8"><!-- News list -->

   	<script language="javascript">
   		boxTitle         = "Member Freebacks";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   
    <%@ include file="../common/box_header_yellow.jsp" %>

	<div class="content1">
		<p style="padding:5px;line-height:18px;font-size:12px;">I've been one of the earliest subscribers of ChinaPortal. So far the experience has been great. I especially like the service quality when I watch a movie online. It is as smooth as offline. I feel like this is a new life style for me. I essentially won't need to purchase any Chinese videos for as long as I'm a member of ChinaPortal.com.<br />
				- Alan, Sunnyvale, CA, USA</p>
		<div style="text-align:right"><a href="<%=basePath%>/static.jsp?fn=feedback" style="text-decoration: underline;"><bean:message key="title.more"/>&gt;&gt;</a></div>
	</div>

	<%@ include file="../common/box_footer_blue.jsp" %>

</div>
<%}%>


<div class="space_line"></div>

<div class="box8"><!-- 使用指南  -->

    <div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neilandi.jpg);">
        <div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao.jpg"></div>
        <div style="float:left;padding-top:2px;">&nbsp;<bean:message key="title.howitwork"/></div>
        <div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao01.jpg" border="0"></div>
    </div>
   
	<div class="content">
		<p><bean:message key="help.step_title"/></p>
		<p align="center">
			<a href="<%=basePath%>/static.jsp?fn=howitworks" style="text-decoration: none;"><img src="<%=themesPath%>icons/icon_zhinan01.jpg" border="0"> 1. <bean:message key="help.choice"/> <img src="<%=themesPath%>icons/icon_zhinan02.jpg" border="0"> 2. <bean:message key="help.download"/> <img src="<%=themesPath%>icons/icon_zhinan03.jpg" border="0"> 3. <bean:message key="help.watch"/></a>
		</p>
		<p align="right">
			<a href="<%=basePath%>/static.jsp?fn=howitworks" style="text-decoration: underline;"><bean:message key="help.moreinfo"/>&gt;&gt;</a>
			<a href="<%=basePath%>/getCategory.do?category_id=28" style="text-decoration: underline;"><bean:message key="help.free_view"/>&gt;&gt;</a>
		</p>
	</div>
	
	<%@ include file="../common/box_footer_blue.jsp" %>

</div>

<div style="clear:both;">&nbsp;</div>

<jsp:include page="../common/footer.jsp" />
