<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,com.mediazone.bean.News,com.mediazone.bean.NewsCaption" %>
<%@ include file="../common/parameter.jsp" %>
<jsp:include page="../common/header.jsp" />
<%
Integer langId=(Integer)request.getSession().getAttribute("chinaportal.local");	
if(langId!=null && (langId.intValue()==2 || langId.intValue()==3)){
com.chinaportal.portal.news.NewsForm cf=(com.chinaportal.portal.news.NewsForm)request.getAttribute("newsForm");
%>
<html:form action="/news/newsAction">
<html:hidden property="curpage"/>
<html:hidden property="prepage"/>
<html:hidden property="nextpage"/>
<html:hidden property="tolpage"/>
<html:hidden property="tar"/>

<div class="sports_box">

	<jsp:include page="../../sports/common/header.jsp"/>

	<div class="special_offer_smg" style="float:left;background-color:#003366;">

		<%@ include file="../../sports/common/sports_banner.jsp" %>

	</div>
</div>

<div class="news_list">
<table bgcolor="#003366" border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td colspan="5" background="<%=themesPath%>icons/icon_neihuangdi.jpg" width="100%">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td align="left"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></td>
			<td align="left"><div style="padding-top:3px;"><bean:message key="header.sports_news" bundle="sports"/></div></td>
			<td width="85%" align="right" class="unnamed1">
				[ <bean:message key="page.total"/> <bean:write name="newsForm" property="tolpage"/> <bean:message key="page.page"/> ]&nbsp;&nbsp;
				[ <bean:message key="page.index"/> <bean:write name="newsForm" property="curpage"/> <bean:message key="page.page"/> ]&nbsp;&nbsp;
				<%if(cf==null || cf.getCurpage()==null || cf.getCurpage().equals("1")){%>   
				[  <bean:message key="page.first"/> ]
				[	<bean:message key="page.pre"/> ]
				<%}else{%>	
				[ <a href="#" onclick="clickPage(1,document.newsForm)" style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.first"/></a> ]
  			[ <a href="#" onclick="clickPage(<bean:write name="newsForm" property="prepage"/>,document.newsForm)" style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.pre"/></a> ]
				<%}%>
				<%if(cf==null || cf.getCurpage()==null || cf.getTolpage().equals(cf.getCurpage())){%>
				[	<bean:message key="page.next"/> ]
				[	<bean:message key="page.last"/> ]
				<%}else{%>
				[ <a href="#" onclick="clickPage(<bean:write name="newsForm" property="nextpage"/>,document.newsForm)" style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.next"/></a> ]
				[ <a href="#" onclick="clickPage(<bean:write name="newsForm" property="tolpage"/>,document.newsForm)" style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.last"/></a> ]
				<%}%>
			</td>
			<td align="right"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></td>
		</tr>
		</table>
	</td>
</tr>
</table>
<!--{assign var="block_title" value=#lang_news_list_title#}-->
	<!--{include file="block_block_header_yellow.tpl"}-->
	<div class="content">
		<center><!--{$msgSorry}--></center>
		<ul>
<%
  List news_list = (List)request.getAttribute("news_list");
%>

<% for(int i=0; news_list!=null && i<news_list.size(); i++){
	News news=(News)news_list.get(i);
	 
	NewsCaption nc=null;
    Set set = news.getCaptions();
    Iterator iterator = set.iterator();
    while (iterator.hasNext()) {
    	NewsCaption cat = (NewsCaption)iterator.next();
       if (langId.equals(cat.getLangId())) 
         nc=cat; 
   }
	//NewsCaption nc = news.getCaption(langId);
	String news_id = news.getNewsId().toString();
	String title = "";
	Date create_time = null;
	if(nc!=null){
	 title = nc.getTitle();
	 create_time = news.getCreateTime();
	} 	
	if(title==null || title.equals(""))
		continue;
%>
	<%
		String linkURI=request.getContextPath()+"/content/news/news_view_sports.jsp?news_id="+news_id;
	%>  
	<li><a href="<%=linkURI%>"><%=title%></a>&nbsp;<span>(<%=create_time%>)</span>
	<%if((i+1) % 5 == 0){%>
			<hr/>
	<%}%>
<%}%>	

		</ul>
		<p align="right" style="margin-right:12px;">
		[ <bean:message key="page.total"/> <bean:write name="newsForm" property="tolpage"/> <bean:message key="page.page"/> ]&nbsp;&nbsp;
		[ <bean:message key="page.index"/> <bean:write name="newsForm" property="curpage"/> <bean:message key="page.page"/> ]&nbsp;&nbsp;
		<%if(cf==null || cf.getCurpage()==null || cf.getCurpage().equals("1")){%>   
				[  <bean:message key="page.first"/> ]
				[	<bean:message key="page.pre"/> ]
		<%}else{%>	
		[ <a href="#" onclick="clickPage(1,document.newsForm)" style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.first"/></a> ]
  	[ <a href="#" onclick="clickPage(<bean:write name="newsForm" property="prepage"/>,document.newsForm)" style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.pre"/></a> ]
		<%}%>
		<%if(cf==null || cf.getCurpage()==null || cf.getTolpage().equals(cf.getCurpage())){%>
				[	<bean:message key="page.next"/> ]
				[	<bean:message key="page.last"/> ]
		<%}else{%>		
		[ <a href="#" onclick="clickPage(<bean:write name="newsForm" property="nextpage"/>,document.newsForm)" style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.next"/></a> ]
		[ <a href="#" onclick="clickPage(<bean:write name="newsForm" property="tolpage"/>,document.newsForm)" style="text-decoration: underline;color:#FFFFFF"><bean:message key="page.last"/></a> ]		
		<%}%>
		</p>
	</div>
	<!--{include file="block_block_footer_blue.tpl"}-->
	<div class="block_footer" style="background: #003366;width:100%;">
		<img align="left" src="<%=themesPath%>icons/icon_lanjiao1.jpg" height="7" width="7">
		<img align="right" src="<%=themesPath%>icons/icon_lanjiao2.jpg" height="7" width="7">
  </div>	
</div>
</html:form>
<%}else{%>
 <div class="news_list">
	<script language="javascript">
	var boxTitle="";
	</script>
	<%@ include file="../common/box_header_yellow.jsp" %>
	<br><center>Sorry, English and Thai version is not available for Sports News.</center><br>
	<%@ include file="../common/box_footer_blue.jsp" %>
 </div>	
<%}%>
<jsp:include page="../common/footer.jsp" />
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