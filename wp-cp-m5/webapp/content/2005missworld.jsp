<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="common/parameter.jsp" %>

<%
String t  = "目录";
String t1 = "节目名称";
String t2 = "持续时间";
String t3 = "日期";
String t4 = "观看";

if( lang_id.equals(new Integer(1)) ) 
{
	t  = "Titles";
	t1 = "Clip";
	t2 = "Duration";
	t3 = "Date";
	t4 = "Status";
}
else if( lang_id.equals(new Integer(3)) )
{
	t  = "目錄";
	t1 = "節目名稱";
	t2 = "持續時間";
	t3 = "日期";
	t4 = "觀看";
}
%>

<jsp:include page="common/header.jsp" />

<style>
table { font-size:14px; }
caption { letter-spacing:5px;background:#AC92E0;padding:8px 8px 8px 15px;text-align:left; }
th { font-weight:normal; color:#A677B9; background:#F5F1F8;text-align:left; }
.tr1 {  }
.tr2 { background:#BDA3F1; }
</style>

<div class="message_box">

   	<script language="javascript">
<% if( lang_id.equals(new Integer(1)) ) { %>
   		boxTitle         = "2005 Miss World";
<% } else if( lang_id.equals(new Integer(2)) ) { %>   		
   		boxTitle         = "2005 世界小姐";
<% } else if( lang_id.equals(new Integer(3)) ) { %>
   		boxTitle         = "2005 世界小姐";
<% } else {%>
   		boxTitle         = "";
<% } %>
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>

	<%@ include file="common/box_header_yellow.jsp" %>

	<div class="content" style="padding:0;">
	    <map name="m0">
<% if( currentSiteName.equals("japan") ) { %>
		    <area href="javascript:void(0)" onclick="jpPopup('http://www.keitainet.jp/MailIndex.html', 'keitainet')" shape="rect" coords="250, 215, 425, 250">
<% } else { %>
		    <area href="<%=basePath%>/static.jsp?fn=purchase" shape="rect" coords="250, 215, 425, 250">
<% } %>
	    </map>
		<img src="<%=langImagePath%>home_missworld.jpg" border="0" usemap="#m0"/><br/><br/>
		<table bgcolor="#AC92E0" border="0" cellspacing="0" cellpadding="8">
			<caption><%=t%></caption>
			<tr bgcolor="#FFF">
				<th><%=t1%></th>
				<th><%=t2%></th>
				<th><%=t3%></th>
				<th><%=t4%></th>
			</tr>
			<tr class="tr1">
	            <td>Miss World Final</td>
	            <td>120 mins</td>
	            <td>Dec 12 2005</td>
	            <td>
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://mfile.akamai.com/14079/wmv/mediazone.download.akamai.com/14079/mediazone/missworld/2005/e-TheFinal-LongForm_9191042_384k.wmv');">Watch Online</a><br />
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://download1.mediazone.com/mzdownload.php?ItemUrl=http://download.mediazone.com/media/downloads/missworld/2005/e-TheFinal-LongForm_9191042_700k.wmv');">Download</a>
	            </td>
			</tr>
			<tr class="tr2">
	            <td>Africa Show</td>
				<td>&nbsp;</td>
	            <td>Dec 12 2005</td>
	            <td>
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://mfile.akamai.com/14079/wmv/mediazone.download.akamai.com/14079/mediazone/missworld/2005/e-Africa_9179767_384k.wmv');">Watch Online</a><br />
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://download1.mediazone.com/mzdownload.php?ItemUrl=http://download.mediazone.com/media/downloads/missworld/2005/e-Africa_9179767_2Mbps.wmv');">Download</a>
	            </td>
			</tr>
			<tr class="tr1">
	            <td>Americas Show</td>
				<td>&nbsp;</td>
	            <td>Dec 12 2005</td>
	            <td>
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://mfile.akamai.com/14079/wmv/mediazone.download.akamai.com/14079/mediazone/missworld/2005/e-Americas_9179939_384k.wmv');">Watch Online</a><br />
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://download1.mediazone.com/mzdownload.php?ItemUrl=http://download.mediazone.com/media/downloads/missworld/2005/e-Americas_9179939_2Mbps.wmv');">Download</a>
	            </td>
			</tr>
			<tr class="tr2">
	            <td>Asia Pacific Show</td>
				<td>&nbsp;</td>
	            <td>Dec 12 2005</td>
	            <td>
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://mfile.akamai.com/14079/wmv/mediazone.download.akamai.com/14079/mediazone/missworld/2005/e-AsiaPacific_9173789_384k.wmv');">Watch Online</a><br />
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://download1.mediazone.com/mzdownload.php?ItemUrl=http://download.mediazone.com/media/downloads/missworld/2005/e-AsiaPacific_9173789_2Mbps.wmv');">Download</a>
	            </td>
			</tr>
			<tr class="tr1">
	            <td>Carribean Show</td>
				<td>&nbsp;</td>
	            <td>Dec 12 2005</td>
	            <td>
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://mfile.akamai.com/14079/wmv/mediazone.download.akamai.com/14079/mediazone/missworld/2005/e-Caribbean_9179773_384k.wmv');">Watch Online</a><br />
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://download1.mediazone.com/mzdownload.php?ItemUrl=http://download.mediazone.com/media/downloads/missworld/2005/e-Caribbean_9179773_2Mbps.wmv');">Download</a>
	            </td>
			</tr>
			<tr class="tr2">
	            <td>Northern Europe Show</td>
				<td>&nbsp;</td>
	            <td>Dec 12 2005</td>
	            <td>
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://mfile.akamai.com/14079/wmv/mediazone.download.akamai.com/14079/mediazone/missworld/2005/e-NorthernEurope_9173809_384k.wmv');">Watch Online</a><br />
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://download1.mediazone.com/mzdownload.php?ItemUrl=http://download.mediazone.com/media/downloads/missworld/2005/e-NorthernEurope_9173809_2Mbps.wmv');">Download</a>
	            </td>
			</tr>
			<tr class="tr1">
	            <td>Southern Europe Show</td>
				<td>&nbsp;</td>
	            <td>Dec 12 2005</td>
	            <td>
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://mfile.akamai.com/14079/wmv/mediazone.download.akamai.com/14079/mediazone/missworld/2005/e-SouthernEurope_9173793_384k.wmv');">Watch Online</a><br />
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://download1.mediazone.com/mzdownload.php?ItemUrl=http://download.mediazone.com/media/downloads/missworld/2005/e-SouthernEurope_9173793_2Mbps.wmv');">Download</a>
	            </td>
			</tr>
			<tr class="tr2">
	            <td>Miss USA</td>
				<td>&nbsp;</td>
	            <td>Dec 12 2005</td>
	            <td>
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://mfile.akamai.com/14079/wmv/mediazone.download.akamai.com/14079/mediazone/missworld/2005/e-MissUSA_9179676_384k.wmv');">Watch Online</a><br />
	            	<a href="#" onclick="miniPopup('http://secure.chinaportal.com/common/index.asp?crmid=chinaportal&action=authorize&aid=missworld&iid=TheFinal_9189507_2Mbps&cid=download&ReturnUrl=http://download1.mediazone.com/mzdownload.php?ItemUrl=http://download.mediazone.com/media/downloads/missworld/2005/e-MissUSA_9179676_2Mbps.wmv');">Download</a>
	            </td>
			</tr>
		</table>
	</div>
		
	<%@ include file="common/box_footer_blue.jsp" %>
	
</div>

<div style="clear:both;">&nbsp;</div>

<jsp:include page="common/footer.jsp" />
