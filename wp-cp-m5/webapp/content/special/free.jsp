<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.chinaportal.portal.category.CategoryDAO"%>
<%@ page import="com.chinaportal.portal.category.CategoryView"%>
<%@ page import="com.chinaportal.portal.category.MediaView"%>

<%@ include file="../common/parameter.jsp" %>
<jsp:include page="../common/header.jsp" />

<%
	String id;
	CategoryDAO cd = new CategoryDAO();
%>

<div class="category">

   	<script language="javascript">
   		boxTitle         = '<bean:write name="Category_INFO" property="location" filter="false"/>';
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   
    <%@ include file="../common/box_header_blue.jsp" %>

	<div class="content">
		<a href="#" onClick="window.location.href=url; return false;"><img src="" border="0" id="banner" width="320" height="210" style="filter:revealTrans(Transition=1,Duration=1.5)"></a>
		<img src="<%=langImagePath%>banner_preview.jpg" alt="" border="0"/>
		<div style="float:right;">
<% if(currentSiteName.equals("japan")) { %>
	        <a class="yline" href="javascript:void(0)" onclick="window.open('http://www.keitainet.jp/MailIndex.html','keitainet');"><bean:message key="free.join_now"/>&gt;&gt;</a>
<% } else { %>
			<a class="yline" href="<%=basePath%>/static.jsp?fn=purchase"><bean:message key="free.join_now"/>&gt;&gt;</a>
<% } %>
		</div>
	</div>
	
<script language="JavaScript" type="text/JavaScript">
	
    var num = "6";
    var imgWidth = 468;
    var imgHeight = 60;
    var urlArray = new Array(num); 
    var banArray = new Array(num); 
    var counter = 0;
	var i = 0;

<% if( ! currentSiteName.equals("japan") ) { %>
    urlArray[i]     = "<%=basePath%>/static.jsp?fn=purchase";
    banArray[i]     = new Image();
    banArray[i].src = "<%=bannerPath%>banner_129.99year.jpg";
	i++;
<% } %>
    urlArray[i]     = "<%=basePath%>/getDetail.do?media_id=2676";
    banArray[i]     = new Image();
    banArray[i].src = "<%=bannerPath%>banner_qijian.jpg";
	i++;
    urlArray[i]     = "<%=basePath%>/getDetail.do?media_id=2677";
    banArray[i]     = new Image();
    banArray[i].src = "<%=bannerPath%>banner_tdlr.jpg";
	i++;
	urlArray[i]     = "<%=basePath%>/specialAction.do?tar=cny&category_id=122";
    banArray[i]     = new Image();
    banArray[i].src = "<%=bannerPath%>banner_specials_122.gif";
	i++;
    urlArray[i]     = "<%=basePath%>/specialAction.do?tar=cny&category_id=141";
    banArray[i]     = new Image();
    banArray[i].src = "<%=bannerPath%>banner_specials_141.gif";
	i++;
    urlArray[i]     = "<%=basePath%>/sports/HomepageItem.do?category_id=129&parent_id=130";
    banArray[i]     = new Image();
    banArray[i].src = "<%=bannerPath%>banner_sps.jpg";

    var url     = urlArray[counter];
    var imgInit = document.getElementById("banner");
    imgInit.src = banArray[counter].src;

    function changeBanner() 
    {
        if(counter > banArray.length - 1)
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
	
	<%@ include file="../common/box_footer_blue.jsp" %>

	<div style="clear:both;">&nbsp;</div>

	<!-- 影视精选 开始 -->

   	<script language="javascript">
   		boxTitle         = "<%=cd.getCategoryInfo(new Integer(400), lang_id).getCategory_name()%>";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   
    <%@ include file="../common/box_header_yellow.jsp" %>

	<div class="content">

<%
	List ys = cd.getFreeMedias(new Integer(400), lang_id, "1", 4);
	
	for( int i=0; i<ys.size(); i++ )
	{
		MediaView mv = (MediaView)ys.get(i);
%>

		<div style="float:left;width:135px;padding:0 5px 0 5px;">
			<img src="<%=smallImagePath+mv.getPhoto()%>" width="80px" height="90px" border="0"/>
			<div style="line-height:20px;">
				<%=mv.getName()%><br/>
			<% if(mv.getFreeUrl()!=null && !mv.getFreeUrl().equals("")) { %>
				<a class="yline" href="<%=mv.getFreeUrl()%>"><bean:message key="media.online"/></a>&nbsp;&nbsp;
			<% } %>
			<% if(mv.getParent_id()==null) { id = mv.getId(); } else { id = mv.getParent_id(); } %>
				<a class="yline" href="<%=basePath%>/getDetail.do?media_id=<%=id%>"><bean:message key="media.watch_all"/></a>
			</div>
		</div>
<%
	}
%>
		<div class="more">
			<bean:message key="free.watch_more"/><bean:message key="free.hot"/><a href="<%=basePath%>/getCategory.do?category_id=2" style="text-decoration:underline;" class="yline"><bean:message key="free.movice"/></a>,
			<a href="<%=basePath%>/getCategory.do?category_id=3" class="yline"><bean:message key="free.tv_Series"/></a>	
		</div>
		
	</div>
	
	<%@ include file="../common/box_footer_blue.jsp" %>
	
	<!-- 影视精选 结束 -->

	<div style="clear:both;">&nbsp;</div>

	<!-- 电视专题 (上海文广北美独家播放) 开始 -->

   	<script language="javascript">
   		boxTitle         = "<%=cd.getCategoryInfo(new Integer(401), lang_id).getCategory_name()%>";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   
    <%@ include file="../common/box_header_yellow.jsp" %>

	<div class="content">
	
<%
	List tv = cd.getFreeMedias(new Integer(401), lang_id, "1", 4);
	
	for( int i=0; i<tv.size(); i++ )
	{
		MediaView mv = (MediaView)tv.get(i);
%>

		<div style="float:left;width:135px;padding:0 5px 0 5px;">
			<img src="<%=smallImagePath+mv.getPhoto()%>" width="80px" height="90px" border="0"/>
			<div style="line-height:20px;">
				<%=mv.getName()%><br/>
			<% if(mv.getFreeUrl()!=null && !mv.getFreeUrl().equals("")) { %>
				<a class="yline" href="<%=mv.getFreeUrl()%>"><bean:message key="media.online"/></a>&nbsp;&nbsp;
			<% } %>
			<% if(mv.getParent_id()==null) { id = mv.getId(); } else { id = mv.getParent_id(); } %>
				<a class="yline" href="<%=basePath%>/getDetail.do?media_id=<%=id%>"><bean:message key="media.watch_all"/></a>
			</div>
		</div>
<%
	}
%>
		
		<div class="more">
			<bean:message key="free.watch_more"/><a href="<%=basePath%>/getCategory.do?category_id=80" class="yline"><bean:message key="free.news"/></a>,
			<a href="<%=basePath%>/getCategory.do?category_id=42" class="yline"><bean:message key="free.finance"/></a>,
			<a href="<%=basePath%>/getCategory.do?category_id=7" class="yline"><bean:message key="free.entertainment"/></a>,
			<a href="<%=basePath%>/getCategory.do?category_id=6" class="yline"><bean:message key="free.documentary"/></a><bean:message key="free.et"/><a href="<%=basePath%>/specialAction.do?tar=smg&category_id=37" class="yline"><bean:message key="free.shwg"/></a><bean:message key="free.item"/>
		</div>
		
	</div>
	
	<%@ include file="../common/box_footer_blue.jsp" %>
	
	<!-- 电视专题 (上海文广北美独家播放) 结束 -->

	<div style="clear:both;">&nbsp;</div>

	<!-- 赛事节选 开始 -->
<%
	List sp = cd.getFreeMedias(new Integer(402), lang_id, "1", 4);

	if( sp.size()!=0 )
	{
%>
   	<script language="javascript">
   		boxTitle         = "<%=cd.getCategoryInfo(new Integer(402), lang_id).getCategory_name()%>";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   
    <%@ include file="../common/box_header_yellow.jsp" %>

	<div class="content">
	
<%
		for( int i=0; i<sp.size(); i++ )
		{
			MediaView mv = (MediaView)sp.get(i);		
%>

		<div style="float:left;width:135px;padding:0 5px 0 5px;">
			<img src="<%=smallImagePath+mv.getPhoto()%>" width="80px" height="90px" border="0"/>
			<div style="line-height:20px;">
				<%=mv.getName()%><br/>
			<% if(mv.getFreeUrl()!=null && !mv.getFreeUrl().equals("")) { %>
				<a class="yline" href="<%=mv.getFreeUrl()%>"><bean:message key="media.online"/></a>&nbsp;&nbsp;
			<% } %>
			<% if(mv.getParent_id()==null) { id = mv.getId(); } else { id = mv.getParent_id(); } %>
				<a class="yline" href="<%=basePath%>/getDetail.do?media_id=<%=id%>"><bean:message key="media.watch_all"/></a>
			</div>
		</div>
<%
		}
%>		
		<div class="more">
			<bean:message key="free.watch_more"/><a href="<%=basePath%>/sports/Homepage.do?id=130" class="yline"><bean:message key="free.sports"/></a>
		</div>
		
	</div>
	
	<%@ include file="../common/box_footer_blue.jsp" %>
<%	
	}
%>
	
	<!-- 赛事节选 结束 -->

	<div style="clear:both;">&nbsp;</div>
	
</div>

<jsp:include page="../common/footer.jsp" />	