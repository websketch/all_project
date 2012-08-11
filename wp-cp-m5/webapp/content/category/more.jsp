<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.homepage.*,com.chinaportal.portal.category.*"%>

<%@ include file="../common/parameter.jsp" %>

<jsp:include page="../common/header.jsp" />

<%
	HomePageDAO pd=new HomePageDAO();
	List medias=pd.getMoreByName(lang_id, request.getParameter("type"));
	MediaView sp =(MediaView)medias.get(0);
	request.setAttribute("sp", sp);
%>

<div class="category">

		<!-- Begin of Special Offer -->
		
			<jsp:include page="more_special.jsp"/>
		
		<!-- End of Special Offer -->

		<div style="clear:both;">&nbsp;</div>
		
		<!-- Begin of Recomendation -->

		<table bgcolor="#003366" border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td colspan="5" background="<%=themesPath%>icons/icon_neihuangdi.jpg" width="100%">
				<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td align="left" width="5"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></td>
					<td align="left"><div style="padding-top:3px;"><bean:message key="title.recomendation"/></div></td>
					<td align="right"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></td>
				</tr>
				</table>
			</td>
		</tr>
		<tr>
				
		<%
			for(int i=0;i<medias.size();i++)
			{
				MediaView mv =(MediaView)medias.get(i);
				//out.println(mv.getId()+" "+mv.getName()+" <br> ");
				//out.println(mv.getHighlight()+"<br>");
		%>
	
			<td align="center" valign="top"><br />
				<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="left"><a href="<%=basePath%>/getDetail.do?media_id=<%=mv.getId()%>"><img src="<%=smallImagePath%><%=mv.getPhoto()%>" border="0" height="120" width="80" style="margin-bottom:3px;"></a></td>
				</tr>
				<tr>
					<td width="100" align="left"><%=mv.getName()%></td>
				</tr>
		        </table>
			</td>
			
		<% 		if(((i+1)%5)==0){ %>          
		</tr>
		<tr>
		<%
				}
			}
		%>
		</tr>
		<tr>
			<td><br /></td>
		</tr>
		</table>
		
		<table width="100%" border="0" cellpadding="0" cellspacing="0" background="<%=themesPath%>icons/icon_neihuangdi01.jpg" bgcolor="#003366">
		<tr>
			<td width="4"><img src="<%=themesPath%>icons/icon_neihuangjiao04.jpg"></td>
			<td width="100%"></td>
			<td width="7" align="right"><img src="<%=themesPath%>icons/icon_neihuangjiao05.jpg"></td>
		</tr>
		</table>

		<!-- End of Recomendation -->
		
		<div style="clear:both;">&nbsp;</div>
		
</div>


<jsp:include page="../common/footer.jsp" />


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
