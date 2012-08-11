<%
String MediaName   = (String)request.getAttribute("MediaName");
%>
<div class="search_box">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" background="../../themes/200501/images/icon_neihuangdi.jpg" bgcolor="003366">
		<tr>
			<td><img src="../../themes/200501/images/icon_neihuangjiao.jpg" width="9" height="19"></td>
			<td align="right"><img src="../../themes/200501/images/icon_neihuangjiao01.jpg"width="9" height="19"></td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="12" bgcolor="#003366" >
		<tr>
			<td colspan=2 class="unnamed3" colspan="5"><bean:message key="comments.title"/> </td>
		</tr>
		<tr>
		    <td  colspan=2 class="unnamed4" colspan="5"><b><bean:message key="comments.movie.name"/>&nbsp;&nbsp;<%=MediaName%></b></td>
		</tr>
	    <tr> 
			<td class="unnamed4"><bean:message key="comments.own.comment"/></td>
			<td class="unnamed4">
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
			<td class="unnamed4"><bean:message key="comments.review.title"/></td>
			<td class="unnamed4"><html:text property="title" value="" size="20" /></td>
		</tr>
		<tr>
			<td valign="top" class="unnamed4"><bean:message key="comments.review.content"/></td>  
			<td colspan="5" class="unnamed4"><html:textarea property="content" rows="6" cols="40" ></html:textarea></td>
		</tr>
		<!-- html:hidden property="citemid" value="ContItemId" /-->
		<!-- html:hidden property="SubmitFlg" value="" /-->  
	
	</table>
	
	<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="003366">
		<tr>
			<td width="31%"></td>
			<td><input type="button" value='<bean:message key="comments.submit"/>' onclick="return SubmitFrm();" style="height:20px;"/></td>
		</tr>
	</table>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="003366">
		<tr>
			<td><img src="../../themes/200501/images/icon_lanjiao1.jpg"></td>
			<td align="right"><img src="../../themes/200501/images/icon_lanjiao2.jpg"></td>
		</tr>
	</table>
</div>