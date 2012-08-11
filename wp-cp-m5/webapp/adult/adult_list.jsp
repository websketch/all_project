<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../content/common/parameter.jsp" %>
<%@ include file="adult_iswarned.jsp" %>

<jsp:include page="../content/common/header.jsp" />
<jsp:include page="adult_head.jsp" />

<div class="box117">

<%
	com.chinaportal.portal.category.CategoryForm cf=(com.chinaportal.portal.category.CategoryForm)request.getAttribute("categoryForm");
%>

	<html:form action="/adultAction.do">
	<html:hidden property="category_id"/>
	<html:hidden property="curpage"/>
	<html:hidden property="prepage"/>
	<html:hidden property="nextpage"/>
	<html:hidden property="tolpage"/>
	<html:hidden property="tar"/>
	
	<table border="0" cellpadding="0" cellspacing="0" width="100%" background="<%=themesPath%>icons/icon_neihuangdi.jpg">
	<tr>
		<td align="left"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></td>
		<td align="left"><div style="padding-top:3px;"><bean:message key="title.recomendation"/></div></td>
		<td width="90%" align="right" class="unnamed1">
			<bean:message key="page.total"/> <bean:write name="categoryForm" property="tolrow"/> <bean:message key="page.unit"/>&nbsp;&nbsp;
			<bean:message key="page.total"/> <bean:write name="categoryForm" property="tolpage"/> <bean:message key="page.page"/>&nbsp;&nbsp;
			<bean:message key="page.index"/> <bean:write name="categoryForm" property="curpage"/> <bean:message key="page.page"/>&nbsp;&nbsp;
			<logic:equal name="categoryForm" property="curpage" value="1">
				<bean:message key="page.first"/>
				<bean:message key="page.pre"/>
			</logic:equal>
			<logic:notEqual name="categoryForm" property="curpage" value="1">   
			<a href="#" onclick="clickPage(1,document.categoryForm)" style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.first"/></a>
 			<a href="#" onclick="clickPage(<bean:write name="categoryForm" property="prepage"/>,document.categoryForm)" style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.pre"/></a>
			</logic:notEqual>
			<%if(cf.getTolpage().equals(cf.getCurpage())){%>
				<bean:message key="page.next"/>
				<bean:message key="page.last"/>
			<%}else{%>	
				<a href="#" onclick="clickPage(<bean:write name="categoryForm" property="nextpage"/>,document.categoryForm)" style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.next"/></a>
				<a href="#" onclick="clickPage(<bean:write name="categoryForm" property="tolpage"/>,document.categoryForm)" style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.last"/></a>
		  <%}%>
		</td>
		<td align="right"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></td>
	</tr>
	</table>			
			

	<div class="content" style="padding-left:10px;padding-top:10px;">

		<logic:notEmpty name="adultmedias">
		<logic:iterate id="mediaview" name="adultmedias">

		<div class="adilt_list_box">
			<div style="margin-bottom:3px;"><a href="<%=basePath%>/adult/getDetail.do?media_id=<bean:write name="mediaview" property="id"/>"><img src="<%=smallImagePath%><bean:write name="mediaview" property="photo"/>" border="0" height="120" width="80" style=""></a></div>
			<div style="width:80px;"><bean:write name="mediaview" property="name"/></div>
			<%@ include file="media_link.jsp" %>
		</div>		

		</logic:iterate>	
		</logic:notEmpty>	
	
	</div>
	
	</html:form>

	<%@ include file="../content/common/box_footer_blue.jsp" %>

</div>

<jsp:include page="../content/common/footer.jsp" />

<script language="JavaScript">
  function clickPage(value,frm){
	frm.curpage.value=value;
	frm.submit()
	return true;			
  }
  
    
  function got(frm){
  	
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