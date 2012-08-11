<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../common/parameter.jsp" %>

<table background="<%=themesPath%>icons/icon_neihuangdi.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td align="left"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg" height="19" width="9"></td>
	<td align="left"><div style="padding-top:3px;"><bean:message key="title.coming_soon"/></div></td>
	<td align="right" width="80%" style="color:white"></td>
	<td width="9"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></td>
</tr>
</table>

<table bgcolor="#003366" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>

<% index=1; %>
 
<logic:iterate id="m"  name="Comming_Soon_Medias">

	<td align="center" valign="top"><br />
		<table>
		<tr>
			<td align="left">
			<a href="<%=basePath%>/getDetail.do?media_id=<bean:write name="m" property="id" />"><img src="<%=request.getContextPath()%>/images/photo/small/<bean:write name="m" property="photo"/>" border="0" height="120" width="80"></a>
			</td>
		</tr>
		<tr>
			<td width="100" align="left"><bean:write name="m" property="name"/></td>
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
</table>

<table bgcolor="#003366" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td><img src="<%=themesPath%>icons/icon_lanjiao1.jpg" height="7" width="7"></td>
	<td align="right"><img src="<%=themesPath%>icons/icon_lanjiao2.jpg" height="7" width="7"></td>
</tr>
</table>