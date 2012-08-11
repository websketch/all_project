<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.chinaportal.portal.comment.*,java.util.*" %>
<%@ include file="../common/parameter.jsp"%>

<jsp:include page="../common/header.jsp" />

<div class="movie_content">

	<% boxTitle = ""; %> 
	<%@ include file="../common/box_header_yellow.jsp"%>

    <div class="content">
	
	<logic:empty name="reviews">
	<html:form action="/comment/CommentAction.do?command=CREATE" method="post" onsubmit="return SubmitFrm();">          

		<table width="" border="0" cellpadding="0" cellspacing="12" bgcolor="#003366" >
			<tr>
				<td colspan=2 colspan="5"><bean:message key="comment.write_reviews"/></td>
			</tr>
			<tr>
			    <td  colspan=2 colspan="5"><b><bean:message key="media.title"/>:<bean:write name="media_name"/>&nbsp;&nbsp;</b></td>
			</tr>
		    <tr> 
				<td><bean:message key="comment.set_rating"/></td>
				<td>
					<html:select property="rating">
						<html:option value="5"><bean:message key="comments.grade.list5"/></html:option> 
						<html:option value="4"><bean:message key="comments.grade.list4"/></html:option> 
						<html:option value="3"><bean:message key="comments.grade.list3"/></html:option> 
						<html:option value="2"><bean:message key="comments.grade.list2"/></html:option> 
						<html:option value="1"><bean:message key="comments.grade.list1"/></html:option> 
					</html:select>
				</td>
			</tr>
			<tr> 
				<td><bean:message key="comments.review.title"/></td>
				<td><html:text property="title" value="" size="20" /></td>
			</tr>
			<tr>
				<td valign="top"><bean:message key="comments.review.content"/></td>  
				<td colspan="5"><html:textarea property="content" rows="6" cols="40" ></html:textarea></td>
			</tr>
			<!-- html:hidden property="citemid" value="ContItemId" /-->
			<!-- html:hidden property="SubmitFlg" value="" /--> 
		  	  
		  <input type="hidden" name="media_id" value='<%=request.getParameter("media_id")%>'>	
		</table>	
		<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="003366">
			<tr>
				<td width="31%"></td>
				<td><input type="button" value='<bean:message key="comments.submit"/>' onclick="return SubmitFrm();" style="height:20px;"/></td>
			</tr>
		</table>	
	</html:form>	
	</logic:empty>
	
	<logic:notEmpty name="reviews">
	<html:form action="/comment/CommentAction.do?command=UPDATE" method="post" onsubmit="return SubmitFrm();">			
	<input type="hidden" name="media_id" value='<%=request.getParameter("media_id")%>'> 

	    <table width="" border="0" cellpadding="0" cellspacing="12" bgcolor="#003366" >
		<tr>
			<td colspan="2"><bean:message key="comments.title"/></td>
		</tr>
		<tr>
		    <td  colspan="2"><b><bean:message key="comments.movie.name"/>:<bean:write name="media_name"/>&nbsp;&nbsp;</b></td>
		</tr>
	    <tr> 
			<td><bean:message key="comments.own.comment"/></td>
			<td>
				<html:select property="rating">
					<html:option value="5"><bean:message key="comments.grade.list5"/></html:option> 
					<html:option value="4"><bean:message key="comments.grade.list4"/></html:option> 
					<html:option value="3"><bean:message key="comments.grade.list3"/></html:option> 
					<html:option value="2"><bean:message key="comments.grade.list2"/></html:option> 
					<html:option value="1"><bean:message key="comments.grade.list1"/></html:option> 
				</html:select>
			</td>
		</tr>
		<tr> 
			<td><bean:message key="comments.review.title"/></td>
			<td><html:text property="title" size="20" /></td>
		</tr>
		<tr>
			<td valign="top"><bean:message key="comments.review.content"/></td>  
			<td><html:textarea property="content" rows="6" cols="40" ></html:textarea></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="button" value='<bean:message key="comments.submit"/>' onclick="return SubmitFrm();" style="height:20px;"/></td>
		</tr>
	</table>	
	
	</html:form>	
	</logic:notEmpty>

    </div>  

	<%@ include file="../common/box_footer_blue.jsp"%>

</div>

<jsp:include page="../common/footer.jsp" />

<script language="javascript">
<!--
	function SubmitFrm() 
	{
	    var objFrm = document.CommentForm;
	    var titlevalue = objFrm.title.value;
	    var contentvalue = objFrm.content.value;
	    
	    if ( titlevalue.length ==0 )
	    {	    	
	    	alert('<bean:message key="comments.review.title.mustinput"/>');
	    	return ;
	    }
	    
		if ( contentvalue.length ==0 )
	    {	    	
	    	alert('<bean:message key="comments.review.content.mustinput"/>');
	    	return ;
	    }
	    
		objFrm.submit();
	}
//-->
</script>

