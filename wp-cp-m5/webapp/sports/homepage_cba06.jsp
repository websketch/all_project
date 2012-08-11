<%@ page contentType="text/html; charset=utf-8" %>

<%@ page import="com.chinaportal.portal.sports.*" %>
<%@ page import="com.chinaportal.portal.category.CategoryView" %>
<%@ page import="java.util.List" %>

<%@ include file="../content/common/parameter.jsp" %>
<%@ include file="../trans.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<%
SportsDAO sd = new SportsDAO();
CSLDAO cd = new CSLDAO();

String currTurn = "433"; // 本轮比赛
String nextTurn = "434"; // 下轮对阵
String conventionalMatch = "243"; // 常规赛
String seasonLastMatch = "451"; // 季后赛

%>

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<%@ include file="common/cba06_banner.jsp" %>

	<div style="clear:both;">&nbsp;<a name="top"></a></div>

   	<script language="javascript">
   		boxTitle         = "<bean:message key="cba06.curr_turn" bundle="sports"/>";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   	
   	<div style="float:left;width:450px;"><!-- 本轮比赛 -->
   	
		<%@ include file="../content/common/box_header_yellow.jsp" %>
	
		<div class="content">
<%
List cm = sd.getCategoryMedias(currTurn, lang_id);
int len;
if( cm.size() > 6 )
	len = 6;
else
	len = cm.size();

for( int i=0; i<len; i++ )
{
	String onlineUrl;
	String downloadUrl;
	
	MatchView mv = (MatchView)cm.get(i);
	
	if( mv.getOnlineURL() == null || mv.getOnlineURL().equals("") )
		onlineUrl = "";
	else
		onlineUrl = mv.getOnlineURL();
	
	if( mv.getDownloadURL()==null || mv.getDownloadURL().equals("") )
		downloadUrl = "";
	else
		downloadUrl = DownloadServer + "?path=" + mv.getDir() + "&file=" + mv.getDownloadURL();
%>		
			<div class="cba6_c">
				<div class="t"><a class="yline" href="<%=basePath%>/sports/MatchDetail.do?match_id=<%=mv.getId()%>"><%=mv.getName()%></a></div>
				<div class="c">
					<a href="<%=basePath%>/sports/MatchDetail.do?match_id=<%=mv.getId()%>"><img src="<%=basePath%>/images/sports/cba/team_logo_<%=mv.getHost_id()%>.jpg" width="60" height="50" border="0"/><img src="<%=basePath%>/images/sports/cba/team_logo_<%=mv.getVisiting_id()%>.jpg" width="60" height="50" border="0"/></a>
				</div>
				<div class="d"><%=mv.getStarttime()%></div>
				<div class="l"><%@ include file="common/media_link_1.jsp" %></div>
			</div>
<% } %>		
		</div>
	
		<%@ include file="../content/common/box_footer_blue.jsp" %>
		
	</div>

   	<script language="javascript">
   		boxTitle         = "<bean:message key="cba06.next_turn" bundle="sports"/><bean:message key="label.match2" bundle="sports"/>";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>

   	<div style="float:right;width:150px;"><!-- 下轮对阵 -->
   	
		<%@ include file="../content/common/box_header_blue.jsp" %>
	
		<div class="content">
		
			<div class="cba6_n">
				<div class="tl"><bean:message key="label.time" bundle="sports"/></div>
				<div class="tr"><bean:message key="label.match2" bundle="sports"/></div>
<%
int bg;
cm = sd.getCategoryMedias(nextTurn, lang_id);

for( int i=0; i<cm.size(); i++ )
{
	MatchView mv = (MatchView)cm.get(i);
	
	bg = i % 2 + 1;
%>		
				<div class="l bg<%=bg%>"><%=mv.getStarttime().substring(11,16)%></div>
				<div class="r bg<%=bg%>"><a class="yline" href="<%=basePath%>/sports/MatchDetail.do?match_id=<%=mv.getId()%>"><%=mv.getName()%></a><br/><%=mv.getStarttime().substring(0,10)%></div>
<% } %>
			</div>
	
		</div>
	
		<%@ include file="../content/common/box_footer_blue.jsp" %>
		
	</div>

	<div style="clear:both;">&nbsp;</div>

	<script language="javascript">
   		boxTitle         = "CBA<bean:message key="label.cgmatch" bundle="sports"/>";
   		boxTitleUrl      = "";
   		boxRightTitle    = "<bean:message key="label.all_match" bundle="sports"/>";
   		boxRightTitleUrl = "<%=basePath%>/sports/AllMatchsCBA.do#cg";
   	</script>

   	<div style=""><!-- CBA常规赛 -->
   	
		<%@ include file="../content/common/box_header_blue.jsp" %>
	
		<div class="content">
<%
cm = sd.getCategory(conventionalMatch, lang_id);
int i = 0;
int l = cm.size()/3+1;
String color = "";
for( int k=1; k<=3; k++ )
{
	int j = 0;
	int c = l*k;
	
	if( c > cm.size() ) c = cm.size();
	
	bg = 1;
	
%>		
			<div class="cba6_cg">
				<div class="tl"><bean:message key="label.time" bundle="sports"/></div>
				<div class="tr"><bean:message key="table.title.match" bundle="sports"/></div>
<%
	for( ; i<c; i++ )
	{
		CategoryView cv = (CategoryView)cm.get(i);
		
		String startTime = "-";
		
		bg = j % 2 + 1;
		
		if( bg == 1 ) 
			color = "#FFCC33";
		else
			color = "#FFFFFF";
		
		if( cv.getstartTime() != null && ! cv.getstartTime().equals("") )
		{
			startTime = cv.getstartTime().substring(0, 10);
		}
%>		
				<div class="l bg<%=bg%>"><%=startTime%></div>
				<div class="r bg<%=bg%>"><a href="<%=basePath%>/sports/AllMatchsCBA.do#<%=cv.getCategory_id()%>" style="text-decoration:underline;color:<%=color%>"><bean:message key="label.cgmatch" bundle="sports"/><%=cv.getCategory_name()%></a></div>
<%
		j++;
	}
%>
			</div>
<%
}
%>
		</div>
	<!-- href="//=basePath/sports/AllMatchsCBA.do" -->
		<%@ include file="../content/common/box_footer_blue.jsp" %>
		
	</div>

	<div style="clear:both;">&nbsp;</div>

	<script language="javascript">
   		boxTitle         = "CBA<bean:message key="label.finally_match" bundle="sports"/>";
   		boxTitleUrl      = "";
   		boxRightTitle    = "<bean:message key="label.all_match" bundle="sports"/>";
   		boxRightTitleUrl = "<%=basePath%>/sports/AllMatchsCBA.do#jh";
   	</script>

   	<div style=""><!-- CBA季后赛 -->
   	
		<%@ include file="../content/common/box_header_blue.jsp" %>
	
		<div class="content">
<%
cm = sd.getCategory(seasonLastMatch, lang_id);
i = 0;
l = cm.size()/3;
for( int k=1; k<=3; k++ )
{
	int j = 0;
	int c = l*k;
	
	if( c > cm.size() ) c = cm.size();
	
	bg = 1;
	
%>		
			<div class="cba6_cg">
				<div class="tl"><bean:message key="label.time" bundle="sports"/></div>
				<div class="tr"><bean:message key="table.title.match" bundle="sports"/></div>
<%
	for( ; i<c; i++ )
	{
		CategoryView cv = (CategoryView)cm.get(i);
		
		String startTime = "-";
		
		bg = j % 2 + 1;
		
		if( bg == 1 ) 
			color = "#FFCC33";
		else
			color = "#FFFFFF";
		
		if( cv.getstartTime() != null && ! cv.getstartTime().equals("") )
			startTime = cv.getstartTime().substring(0, 10);
%>		
				<div class="l bg<%=bg%>"><%=startTime%></div>
				<div class="r bg<%=bg%>"><a href="<%=basePath%>/sports/AllMatchsCBA.do#<%=cv.getCategory_id()%>" style="text-decoration:underline;color:<%=color%>"><bean:message key="label.finally_match" bundle="sports"/><%=cv.getCategory_name()%></a></div>
<%
		j++;
	}
%>
			</div>
<%
}
%>
		</div>
	
		<%@ include file="../content/common/box_footer_blue.jsp" %>
		
	</div>

	<div style="clear:both;">&nbsp;</div>

</div>

<jsp:include page="../content/common/footer.jsp" />