<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.category.MediaView" %>
<%@ include file="../common/parameter.jsp" %>
<jsp:include page="../common/header.jsp" />

<div class="search_box">
<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
	<div style="float:left;padding-top:4px;">&nbsp;<bean:message key="title.search.result"/></div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
</div>
<%try{%>

	<div class="content">

<logic:empty name="medias">
<bean:message key="search.noresult"/>
</logic:empty>

<%
	String strkey = request.getParameter("key");
	strkey = new String(strkey.getBytes("ISO-8859-1"),"UTF-8");
	Integer langId=(Integer)request.getSession().getAttribute("chinaportal.local");	
	//String key = request.getParameter("key");
  Collection medias = (Collection)request.getAttribute("medias");
  if(medias!=null && medias.size()>0){
  Iterator it = medias.iterator();
	while(it.hasNext()){
		MediaView media = (MediaView)it.next();
		String media_id = media.getId().toString();
		String name = "";
		if(media.getName()!=null) name = media.getName();
		if(name!=null) name = name.trim().replaceAll(strkey,"<span style='color:red;'>"+strkey+"</span>");
		String description = "";
		description = media.getDescription();
		if(description!=null&&description.length()>150) description = description.substring(0,150)+"...";
		if(description!=null) description = description.trim().replaceAll(strkey,"<span style='color:red;'>"+strkey+"</span>");
		String photo = media.getPhoto();
		String actor = "";
		String director = "";
		if(media.getActors()!=null){
			actor = media.getActors().replaceAll(strkey,"<span style='color:red;'>"+strkey+"</span>");
		}	
		if(media.getDirectors()!=null){
			director = media.getDirectors().replaceAll(strkey,"<span style='color:red;'>"+strkey+"</span>");
		}		
%>	
		<a href="<%=request.getContextPath()%>/getDetail.do?media_id=<%=media_id%>"><img src="<%=request.getContextPath()%>/images/photo/small/<%=photo%>" border="0" width="80" height="120" align="left" style="padding-right:15px;"></a>
		<b><bean:message key="media.title"/>:</b>&nbsp;&nbsp;<%=name%><br>
		<b><bean:message key="media.director"/>:</b>&nbsp;&nbsp;<%=director%><br>
		<b><bean:message key="media.actor"/>:</b>&nbsp;&nbsp;<%=actor%><br>
		<b><bean:message key="media.description"/>:</b>&nbsp;&nbsp;<%=description%><br>
		<div style="text-align:right;padding-top:10px;">
		<%if(media.getOnlineURL()!=null && !media.getOnlineURL().equals("")){%>
			<a href="<%=media.getOnlineURL()%>"><span style="color: #ff9900;text-decoration: underline;"><bean:message key="media.online"/></span></a>
		<%}%>
		&nbsp;
		<%if(media.getDownloadURL()!=null && !media.getDownloadURL().equals("")){%>
			<a href="<%=DownloadServer%>?path=<%=media.getDir()%>&file=<%=media.getDownloadURL()%>"><span style="color: #ff9900;text-decoration: underline;"><bean:message key="media.download"/></span></a>
		<%}%>	
		</div>
		<div style="clear:both;">&nbsp;</div>
<%}}%>
	</div>
	<div class="block_footer" style="background: #003366;width:100%;">
		<img align="left" src="<%=themesPath%>icons/icon_lanjiao1.jpg" height="7" width="7">
		<img align="right" src="<%=themesPath%>icons/icon_lanjiao2.jpg" height="7" width="7">
  </div>	
<%}catch(Exception e){
	e.printStackTrace();
}	
%> 
</div>
<div style="clear:both;"></div>
<jsp:include page="../common/footer.jsp" />