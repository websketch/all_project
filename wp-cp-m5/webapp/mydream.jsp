<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="content/common/parameter.jsp" %>

<jsp:include page="content/common/header.jsp" />

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%!
    public Date parseDate( String date )
    {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
        try
        {
            return sdf.parse(date);
        }
        catch ( Exception e )
        {
            return null;
        }
    }

%>

<div class="message_box">

   	<script language="javascript">
   		boxTitle         = "My Dream";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>

	<%@ include file="../content/common/box_header_yellow.jsp" %>

	<div class="content" style="padding:0;">
		<div style="width:610px;height:420px;background-image: url(<%=langImagePath%>banner_home_mydream.jpg);">
			<div style="width:610px;height:340px;"></div>
<%
    String startDateString = "2005-12-04 02:45:00";
	String endDateString   = "2005-12-04 05:30:00";
	String streamLive      = "mms://a594.l2068444037.c20684.a.lm.akamaistream.net/D/594/20684/v0001/reflector:44037";
	String streamArchive   = "mms://a1845.l2068444319.c20684.a.lm.akamaistream.net/D/1845/20684/v0001/reflector:44319";
    String watchLiveString = "<img style=\"margin-right:20px;\" src=\"" + langImagePath + "banner_home_mydream_zzzb.jpg\" border=\"0\" align=\"right\" />";
    String archiveString   = "<img style=\"margin-right:20px;\" src=\"" + langImagePath + "banner_home_mydream_zxsk.jpg\" border=\"0\" align=\"right\" />";
    String comingString    = "<img style=\"margin-right:20px;\" src=\"" + langImagePath + "banner_home_mydream_jjzb.jpg\" border=\"0\" align=\"right\" />";

	Date startDate = parseDate(startDateString);
	Date endDate = parseDate(endDateString);
	
	if ( startDate == null || endDate == null )
	    out.println(comingString);
	
	if ( startDate.compareTo(endDate) >= 0 )
		out.println(comingString);
	
	Date currentDate = new Date();
	
	if ( currentDate.compareTo(startDate) >= 0 && currentDate.compareTo(endDate) < 0 )
	{
	    String returnURL = watchLiveString;
	    returnURL = "<a href=\"" + streamLive +  "\"><b>"+ returnURL + "</b></a>";
	    out.println(returnURL);
	}
	else if ( currentDate.compareTo(startDate) >= 0 && currentDate.compareTo(endDate) >= 0 )
	{
	    String returnURL = archiveString;
	    returnURL = "<a href=\"" + streamArchive +  "\"><b>"+ returnURL + "</b></a>";
	    out.println(returnURL);
	}
	else
		out.println(""+comingString+"");

%>
		</div>
	</div>
		
	<%@ include file="content/common/box_footer_blue.jsp" %>
	
</div>

<div style="clear:both;">&nbsp;</div>

<div style="padding:0 10px 10px 10px;line-height:20px;">“我的梦”大型演出的网络传送由中国网通提供, 不代表ChinaPortal节目的传送和画面质量.  免费试看我们的节目, 了解我们的质量, 请访问”<a href="<%=basePath%>/specialAction.do?tar=freemedia&category_id=28" class="yline">免费试看</a>”页面.</div>

<div style="padding:0 10px 10px 10px;line-height:20px;">“我的夢”大型演出的網絡傳送由中國網通提供, 不代表ChinaPortal節目的傳送和畫面質量.  免費試看我們的節目, 了解我們的質量, 請訪問”<a href="<%=basePath%>/specialAction.do?tar=freemedia&category_id=28" class="yline">免費試看</a>”頁面.</div>

<div style="padding:0 10px 10px 10px;line-height:20px;">“My Dream” broadcast is provided by CNC. The quality of this broadcast couldn’t represent the quality of video programs on ChinaPortal.  For free trial of our programs, please visit our <a href="<%=basePath%>/specialAction.do?tar=freemedia&category_id=28" class="yline">Free Preview</a> page. </div>

<jsp:include page="content/common/footer.jsp" />
