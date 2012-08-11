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
List cm = new ArrayList();

String conventionalMatch = "243"; // 常规赛
String seasonLastMatch = "451"; // 季后赛

%>

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<%@ include file="common/cba06_banner.jsp" %>

	<div style="clear:both;">&nbsp;<a name="top"></a></div>

	<script language="javascript">
   		boxTitle         = "CBA<bean:message key="label.cgmatch" bundle="sports"/>";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>

	<a name="cg"></a>

   	<div style=""><!-- CBA常规赛 -->
   	
		<%@ include file="../content/common/box_header_blue.jsp" %>
	
		<div class="content">
			<% request.setAttribute("Match_List", sd.getCategoriesMedias(conventionalMatch, lang_id)); %>
			<jsp:include page="common/match_list_2.jsp"></jsp:include>
		</div>
	
		<%@ include file="../content/common/box_footer_blue.jsp" %>
		
	</div>

	<div style="clear:both;">&nbsp;</div>

	<script language="javascript">
   		boxTitle         = "CBA季后赛";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>

	<a name="jh"></a>
	
   	<div style=""><!-- CBA季后赛 -->
   	
		<%@ include file="../content/common/box_header_blue.jsp" %>
	
		<div class="content">
			<% request.setAttribute("Match_List", sd.getCategoriesMedias(seasonLastMatch, lang_id)); %>
			<jsp:include page="common/match_list_2.jsp"></jsp:include>
		</div>
	
		<%@ include file="../content/common/box_footer_blue.jsp" %>
		
	</div>

	<div style="clear:both;">&nbsp;</div>

</div>

<jsp:include page="../content/common/footer.jsp" />