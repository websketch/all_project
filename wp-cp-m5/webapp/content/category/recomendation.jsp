<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.chinaportal.portal.category.CategoryView" %>
<%@ page import="java.util.*,com.mediazone.bean.*" %>

<%@ include file="../common/parameter.jsp" %>
<%
com.chinaportal.portal.category.CategoryForm cf=(com.chinaportal.portal.category.CategoryForm)request.getAttribute("categoryForm");
%>
<table bgcolor="#003366" border="0" cellpadding="0" cellspacing="0" width="100%">
<form name="categoryForm" action="<%=basePath%>/getCategory.do">
<tr>
	<td colspan="5" background="<%=themesPath%>icons/icon_neihuangdi.jpg" width="100%">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td align="left"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></td>
			<td align="left"><div style="padding-top:3px;"><bean:message key="title.recomendation"/></div></td>
			<td width="90%" align="right" class="unnamed1">
				<bean:message key="record.total"/> <bean:write name="categoryForm" property="tolrow"/> <bean:message key="page.unit"/>&nbsp;&nbsp;
				<bean:message key="page.total"/> <bean:write name="categoryForm" property="tolpage"/> <bean:message key="page.page"/>&nbsp;&nbsp;
				<bean:message key="page.index"/> <bean:write name="categoryForm" property="curpage"/> <bean:message key="page.page"/>&nbsp;&nbsp;
				<%if("1".equals(cf.getCurpage())){%>
				<span  style="color:#FFFFFF"><bean:message key="page.first"/></span>
				<span  style="color:#FFFFFF"><bean:message key="page.pre"/></span>
				<%}else{%>
				<a href="<%=basePath%>/getCategory.do?category_id=<bean:write name="categoryForm" property="category_id"/>&curpage=1"  style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.first"/></a>
  				<a href="<%=basePath%>/getCategory.do?category_id=<bean:write name="categoryForm" property="category_id"/>&curpage=<bean:write name="categoryForm" property="prepage"/>"  style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.pre"/></a>
  				<%}%>
  				<%if(cf.getTolpage().equals(cf.getCurpage())){%>
				<span  style="color:#FFFFFF"><bean:message key="page.next"/></span>
				<span  style="color:#FFFFFF"><bean:message key="page.last"/></span>
				<%}else{%>
				<a href="<%=basePath%>/getCategory.do?category_id=<bean:write name="categoryForm" property="category_id"/>&curpage=<bean:write name="categoryForm" property="nextpage"/>"  style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.next"/></a>
				<a href="<%=basePath%>/getCategory.do?category_id=<bean:write name="categoryForm" property="category_id"/>&curpage=<bean:write name="categoryForm" property="tolpage"/>"  style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.last"/></a>
				<%}%>
			</td>
			<td align="right"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></td>
		</tr>
		</table>
	</td>
</tr>
<tr>

<% index=1; %>  

<logic:iterate id="m"  name="Category_Medias">

	<td align="center" valign="top"><br />
		<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td align="left"><a href="<%=basePath%>/getDetail.do?media_id=<bean:write name="m" property="id" />"><img src="<%=smallImagePath%><bean:write name="m" property="photo" />" border="0" height="120" width="80" style="margin-bottom:3px;"></a></td>
		</tr>
		<tr>
			<td width="100" align="left"><bean:write name="m" property="name"/></td>
		</tr>
		<tr>
			<td width="100" align="left"><%@ include file="media_link.jsp" %></td>
		</tr>
        </table>
	</td>
	
<% if((index%5)==0){ %>          
</tr>
<tr>
<% }
   index++;
%>

</logic:iterate>  
</tr>
<tr>
	<td><br /></td>
</tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" background="<%=themesPath%>icons/icon_neihuangdi01.jpg" bgcolor="#003366">
<tr>
	<td width="4"><img src="<%=themesPath%>icons/icon_neihuangjiao04.jpg"></td>
	<td width="100%" align="right">
		<bean:message key="record.total"/> <bean:write name="categoryForm" property="tolrow"/> <bean:message key="page.unit"/>&nbsp;&nbsp;
	    <bean:message key="page.total"/> <bean:write name="categoryForm" property="tolpage"/> <bean:message key="page.page"/>&nbsp;&nbsp;
	    <bean:message key="page.index"/> <bean:write name="categoryForm" property="curpage"/> <bean:message key="page.page"/>&nbsp;&nbsp;
				<%if("1".equals(cf.getCurpage())){%>
				<span  style="color:#FFFFFF"><bean:message key="page.first"/></span>
				<span  style="color:#FFFFFF"><bean:message key="page.pre"/></span>
				<%}else{%>
				<a href="<%=basePath%>/getCategory.do?category_id=<bean:write name="categoryForm" property="category_id"/>&curpage=1"  style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.first"/></a>
  				<a href="<%=basePath%>/getCategory.do?category_id=<bean:write name="categoryForm" property="category_id"/>&curpage=<bean:write name="categoryForm" property="prepage"/>"  style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.pre"/></a>
  				<%}%>
  				<%if(cf.getTolpage().equals(cf.getCurpage())){%>
				<span  style="color:#FFFFFF"><bean:message key="page.next"/></span>
				<span  style="color:#FFFFFF"><bean:message key="page.last"/></span>
				<%}else{%>
				<a href="<%=basePath%>/getCategory.do?category_id=<bean:write name="categoryForm" property="category_id"/>&curpage=<bean:write name="categoryForm" property="nextpage"/>"  style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.next"/></a>
				<a href="<%=basePath%>/getCategory.do?category_id=<bean:write name="categoryForm" property="category_id"/>&curpage=<bean:write name="categoryForm" property="tolpage"/>"  style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.last"/></a>
				<%}%>				
    </td>
	<td width="7" align="right"><img src="<%=themesPath%>icons/icon_neihuangjiao05.jpg"></td>
</tr>
</form>
</table>


<script language="JavaScript">
  function clickPage(value,frm){
	frm.curpage.value=value;
	frm.submit()
	return true;			
  }
  
    
  function goto(frm){
  	
  	var gotopage=frm.gotopage.value;
	var a=gotopage.match(/^\d{1,6}$/);
	if(!a){
		alert("please input integer");
		return false;
	}	
	if(gotopage=='NaN')
		gotopage=parseInt(frm.curpage.value);
	if(gotopage<1){
		gotopage=1;
	}
	frm.curpage.value=gotopage;
	frm.submit();
	return true;		
  }
  
</script>
