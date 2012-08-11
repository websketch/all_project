<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,com.chinaportal.portal.category.MediaView,com.mediazone.bean.Review" %>

<%@ include file="../common/parameter.jsp" %>

<jsp:include page="../common/header.jsp" />
<%@ include file="../../trans.jsp" %>
<div class="movie_content">

    <%@ include file="../common/box_header_yellow.jsp" %>
    
	<div class="content">
		<div class="left">
			<img src="<%=largeImagePath%><bean:write name="Media_Detail" property="photo"/>" width="200" align="left">
			<div align="center" style="margin-top:12px;clear:both;">
				<%@ include file="../common/media_link.jsp" %>
            </div>
		</div>
		<% int i=0;%>
		<logic:notEmpty name="reviews">	
		<logic:iterate id="review" name="reviews">
			<% i++; %>
		</logic:iterate>	
		</logic:notEmpty>
		<div class="right">
			<b><bean:write name="Media_Detail" property="highlight"/></b><br><br>
			<b><bean:message key="media.title"/></b>: <bean:write name="Media_Detail" property="name"/><br><br>
			<b><bean:message key="media.director"/></b>: <bean:write name="Media_Detail" property="directors"/><br><br>
			<b><bean:message key="media.actor"/></b>: <bean:write name="Media_Detail" property="actors"/><br><br>
			<b><bean:message key="media.start_date"/></b>: <bean:write name="Media_Detail" property="starttime"/><br><br>
			
			<b><bean:message key="comment.reviews"/></b>: (<%=i%>) &nbsp;	<a href="<%=request.getContextPath()%>/comment/CommentAction.do?command=PREADD&media_id=<%=request.getParameter("media_id")%>" style="text-decoration: underline"><bean:message key="comment.write_reviews"/></a><br><br>
			<b><bean:message key="comment.average_rating"/></b>: 
			<logic:greaterThan name="Media_Detail" property="level" value="0">
				<script language="javascript">
					var average_rating=<bean:write name="Media_Detail" property="level"/>;
				</script>
				<%@ include file="../common/stargrade.jsp" %>
			</logic:greaterThan><br><br>
			<!--b><{#lang_comment_cust_rating_curr#}></b>: <{$getReviewGradeList}>&nbsp;<button onclick="document.StarGradeFrm.submit();"><{#lang_rating#}></button-->
			<logic:notEqual name="Media_Detail" property="price" value="">
				<b><bean:message key="media.price"/></b>: $<bean:write name="Media_Detail" property="price"/>
				<logic:notEqual name="Media_Detail" property="manPackageId" value="">
					<button onclick="subscribePack('<bean:write name="Media_Detail" property="id"/>')"><bean:message key="button.subscribe1"/></button>
				</logic:notEqual>
				<br><br>
			</logic:notEqual>
			<bean:message key="media.notice"/>
		</div>    
		<div class="desc">
			<b><bean:message key="media.description"/></b>: <br /><bean:write name="Media_Detail" property="description" filter="false" />
		</div>

		<div class="rating">
			<b><bean:message key="comment.reviews"/></b>:<br>			
			
			<b><bean:message key="comment.reviews_count"/></b>: <%=i%>&nbsp; <a href="<%=request.getContextPath()%>/comment/CommentAction.do?command=PREADD&media_id=<%=request.getParameter("media_id")%>" style="text-decoration: underline"><bean:message key="comment.write_reviews"/></a><br>
			<br>			
			<% 
				//List reviews = (List)request.getAttribute("reviews");
				//for(int k=0; reviews!=null && k<reviews.size(); k++){
				//	Review review = (Review)reviews.get(k);
				//	String user_name, review_time, title, content; int rating;
				//	user_name=review.getUser_name()==null?"":review.getUser_name();
				//	review_time=review.getReview_time()==null?"":getUSDateWithoutTime(review.getReview_time());
				//	rating=review.getRating()==null?0:Integer.parseInt(review.getRating());
				//	title=review.getTitle()==null?"":review.getTitle();
				//	content=review.getContent()==null?"":review.getContent();
 
	                List reviews = (List)request.getAttribute("reviews");
	                for(int k=0; reviews!=null && k<reviews.size(); k++){
					Review review1 = (Review)reviews.get(k);
					String user_name, title,review_time, content;int rating;
					com.mediazone.bean.User user=(com.mediazone.bean.User)review1.getUser();
					if(user!=null)				
					     user_name=user.getName()==null?"":user.getName();
					else 
					     user_name="";
					review_time=review1.getReviewTime()==null?"":getUSDateWithoutTime(review1.getReviewTime());
					rating=review1.getRating()==null?0:Integer.parseInt(review1.getRating());
					title=review1.getTitle()==null?"":review1.getTitle();
					content=review1.getContent()==null?"":review1.getContent();


			%>
					<%=user_name%>&nbsp;<%=review_time%>&nbsp;
					<script language="javascript">
						var average_rating=<%=rating%>*10;
					</script>
					<%@ include file="../common/stargrade.jsp" %>	
					<br>
					<%=title%>
					<br>
					<%=content%>
					<br><br>		
			<%}%>		
		</div>
	</div>
	
    <%@ include file="../common/box_footer_blue.jsp" %>
    
</div>


<% 
	boolean isDisp = false;

	MediaView online = (MediaView)request.getAttribute("Media_Detail");
	List childrens = online.getChildren();

	for(int j=0; childrens!=null && j<childrens.size(); j++)
	{
		MediaView part = (MediaView)childrens.get(j);
		if(part.getOnlineURL()!=null && !part.getOnlineURL().equals(""))
		{
			isDisp = true;
			break;
		}
	}
	if(isDisp) 
	{	
%>
<!-- content parts online list start -->
<div class="online_list">

   	<script language="javascript">
   		boxTitle         = "<bean:message key="media.online"/>";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   	
   	<%@ include file="../common/box_header_blue.jsp" %>

	<div class="content">

<% 
	for(int j=0; childrens!=null && j<childrens.size(); j++)
	{
		MediaView part = (MediaView)childrens.get(j);
%>
		<a href="<%=part.getOnlineURL()%>" title="" class="contenturl"><%=part.getName()%></a>
<%		
	}
%>
	</div>
	
	<%@ include file="../common/box_footer_blue.jsp" %>
	
</div>
<!-- content parts online list end -->
<% } %>

<!-- content parts download list start -->
<% 
	isDisp = false;

	MediaView download = (MediaView)request.getAttribute("Media_Detail");
	List dChildrens = download.getChildren();
	
	for(int j=0; dChildrens!=null && j<dChildrens.size(); j++)
	{
		MediaView part = (MediaView)dChildrens.get(j);
		if(part.getDownloadURL()!=null && !part.getDownloadURL().equals(""))
		{
			isDisp = true;
			break;
		}
	}
	if(isDisp) 
	{
%>
<div class="download_list">

   	<script language="javascript">
   		boxTitle         = "<bean:message key="media.download"/>";
   		boxTitleUrl      = "";
   		boxRightTitle    = "";
   		boxRightTitleUrl = "";
   	</script>
   	
   	<%@ include file="../common/box_header_blue.jsp" %>

	<div class="content">

<% 
	for(int j=0; dChildrens!=null && j<dChildrens.size(); j++)
	{
		MediaView part = (MediaView)dChildrens.get(j);

%>
		<a href="<%=DownloadServer%>?path=<%=part.getDir()%>&file=<%=part.getDownloadURL()%>" title="" class="contenturl" ><%=part.getName()%></a>
<%		
	}
%>
	</div>
	
	<%@ include file="../common/box_footer_blue.jsp" %>
	
</div>
<!-- content parts download list end -->
<% } %>

<div style="clear:both;">&nbsp;</div>

<jsp:include page="../common/footer.jsp" />