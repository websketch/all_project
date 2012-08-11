<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.sports.*"%>

<%@ include file="../content/common/parameter.jsp" %>

<jsp:include page="../content/common/header.jsp" />

<%
//out.println(request.getParameter("match_id"));
MatchDetailDAO mdd=new MatchDetailDAO();
MatchView mv=mdd.getMatchDetail(null, request.getParameter("match_id"), lang_id);
com.chinaportal.portal.comment.CommentDAO commentDAO = new com.chinaportal.portal.comment.CommentDAO();
List reviews = commentDAO.query(request.getParameter("match_id"), lang_id.toString());
if(reviews!=null){	
	request.setAttribute("reviews", reviews);
}
%>

<div class="sports_box">

	<jsp:include page="common/header.jsp"/>

	<div class="special_offer_smg" style="float:left;background-color:#003366;">

		<%@ include file="common/sports_banner.jsp" %>

	</div>

	<div style="clear:both;">&nbsp;</div>

	<div class="special_offer_smg" style="float:left;background-color:#003366;">

		<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
		    <div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
            <div style="float:left;padding-top:2px;">&nbsp;<bean:message key="label.match_detail" bundle="sports"/></div>
		    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
		</div>

		<div class="content">
			<div class="left" style="float:left;width:200px;padding:10px;">
				<img src="<%=largeImagePath%><%=mv.getPhoto()%>" width="200" align="left">
				<div align="center" style="margin-top:12px;clear:both;">
					<a href="<%=mv.getOnlineURL()%>"  style="color: #FF9900;text-decoration: underline;">
					<bean:message key="media.online"/></a>
					<a href="<%=DownloadServer%>?path=<%=mv.getDir()%>&file=<%=mv.getDownloadURL()%>"  style="color: #FF9900;text-decoration: underline;">
					<bean:message key="media.download"/></a>
				</div>
			</div>
			<div class="right" style="float:left;padding-left:10px;padding-top:10px;padding-right:10px;">
				<b><%=mv.getHighlight()%></b><br /><br />
				<!-- b><bean:message key="label.match_item" bundle="sports"/>:</b> <%//=mv.getChannel_name()%><br /><br /-->
				<b><bean:message key="label.match_fixture" bundle="sports"/>:</b> <%=mv.getStarttime()%><br /><br />
				<b><bean:message key="label.match_teams" bundle="sports"/>:</b> 

				<%
				List hosts=mv.getHost();
				if(hosts!=null)
				{
					for(int i=0;i<hosts.size();i++)
					{
						IdName in=(IdName)hosts.get(i);
						out.println("<a href=\""+basePath+"/sports/TeamDetail.do?team_id="+in.getId()+"\" style=\"color: #FFF;text-decoration: underline;\">"+in.getName()+"</a>&nbsp;");
					}
				}
				out.println(" vs ");
				List guests=mv.getGuest();
				if(guests!=null)
				{
					for(int i=0;i<guests.size();i++)
					{
						IdName in=(IdName)guests.get(i);
						out.println("<a href=\""+basePath+"/sports/TeamDetail.do?team_id="+in.getId()+"\" style=\"color: #FFF;text-decoration: underline;\">"+in.getName()+"</a>&nbsp;");
					}
				}

				%>
				<br /><br />

				<% int i=0;%>
				<logic:notEmpty name="reviews">	
				<logic:iterate id="review" name="reviews">
					<% i++; %>
				</logic:iterate>	
				</logic:notEmpty>

				<b><bean:message key="comment.reviews"/></b>: (<%=i%>) 	<a href="<%=basePath%>/comment/CommentAction.do?command=PREADD&media_id=<%=request.getParameter("match_id")%>" style="text-decoration: underline"><bean:message key="comment.write_reviews"/></a><br /><br />
				<b><bean:message key="comment.average_rating"/></b>:<logic:greaterThan name="average" value="0">
				<script language="javascript">
					var average_rating=<bean:write name="average"/>;
				</script>
				<%@ include file="../content/common/stargrade.jsp" %>
			</logic:greaterThan><br><br>
				<%=mv.getDescription().replaceAll("\n","<br>")%>
			</div>

		</div>

		<div class="rating" style="clear:both;padding-left:10px;">
			<br />
			<b><bean:message key="comment.reviews"/></b>: <br>
			<b><bean:message key="comment.reviews_count"/></b>: <%=i%> <a href="<%=basePath%>/comment/CommentAction.do?command=PREADD&media_id=<%=request.getParameter("match_id")%>" style="text-decoration: underline"><bean:message key="comment.write_reviews"/></a><br><br>
			<logic:notEmpty name="reviews">			
			<logic:iterate id="review" name="reviews">
			<bean:write name="review" property="review_time"/>
			<br>
			<bean:write name="review" property="title"/>
			<br>
			<bean:write name="review" property="content"/>
			<br><br>			
			</logic:iterate>
			</logic:notEmpty>
		</div>

		<%@ include file="../content/common/box_footer_blue.jsp" %>

	</div>

</div>

<div style="clear:both;">&nbsp;</div>

<jsp:include page="../content/common/footer.jsp" />