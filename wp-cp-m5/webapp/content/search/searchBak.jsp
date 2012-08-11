<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,com.mediazone.bean.*" %>
<%@ include file="../common/parameter.jsp" %>
<jsp:include page="../common/header.jsp" />

<div class="search_box">

<!--{assign var="block_title" value=#box_title#}-->
<!--{include file="block_block_header_yellow.tpl"}-->
<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
	<div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
	<div style="float:left;padding-top:4px;">&nbsp;<bean:message key="title.search.result"/></div>
	<div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
</div>
<%try{%>

<%
	String strkey = request.getParameter("key");
	strkey = new String(strkey.getBytes("ISO-8859-1"),"UTF-8");
	Integer langId=(Integer)request.getSession().getAttribute("chinaportal.local");	
	//String key = request.getParameter("key");
  Collection medias = (Collection)request.getAttribute("medias");
  Iterator it = medias.iterator();
%>
	<div class="content">

<logic:empty name="medias">
<bean:message key="search.noresult"/>
</logic:empty>
<%
	while(it.hasNext()){
		Media media = (Media)it.next();
		String media_id = media.getMedia_id().toString();
		String name = "";
		if(media.getCaption(langId)!=null) name = media.getCaption(langId).getName();
		if(name!=null) name = name.trim().replaceAll(strkey,"<span style='color:red;'>"+strkey+"</span>");
		String description = "";
		if(media.getCaption(langId)!=null) description = media.getCaption(langId).getDescription();
		if(description!=null&&description.length()>150) description = description.trim().substring(0,150)+"...";
		if(description!=null) description = description.trim().replaceAll(strkey,"<span style='color:red;'>"+strkey+"</span>");
		String photo = media.getPhoto();
		List items = media.getItems();
		List actors = media.getActors();
		String actor = "";
		String director = "";
		if(actors!=null && actors.size()!=0){
			Actor_caption actor_caption = ((Actor)actors.get(0)).getCaption(langId);
			if(actor_caption!=null && actor_caption.getName()!=null){
				actor = actor_caption.getName().replaceAll(strkey,"<span style='color:red;'>"+strkey+"</span>");
			}
		}
		List directors = media.getDirectors();
		if(directors!=null && directors.size()!=0){
			Actor_caption actor_caption = ((Actor)directors.get(0)).getCaption(langId);
			if(actor_caption!=null && actor_caption.getName()!=null){
				director = actor_caption.getName().replaceAll(strkey,"<span style='color:red;'>"+strkey+"</span>");
			}
		}
%>	

		<a href="<%=request.getContextPath()%>/getDetail.do?media_id=<%=media_id%>"><img src="<%=request.getContextPath()%>/images/photo/small/<%=photo%>" border="0" width="80" height="120" align="left" style="padding-right:15px;"></a>
		<b><bean:message key="media.title"/>:</b>&nbsp;&nbsp;<%=name%><br>
		<b><bean:message key="media.director"/>:</b>&nbsp;&nbsp;<%=director%><br>
		<b><bean:message key="media.actor"/>:</b>&nbsp;&nbsp;<%=actor%><br>
		<b><bean:message key="media.description"/>:</b>&nbsp;&nbsp;<%=description%><br>
		<div style="text-align:right;padding-top:10px;">
		<%
		for(int kk=0; items!=null && kk<items.size(); kk++){
			Item item = (Item)items.get(kk);
			String distribute_id = item.getDistribute_id().toString();
			String url = item.getUrl();
		%>	
		<%if(distribute_id.equals("1")){%>
			<a href="<%=url%>"><span style="color: #ff9900;text-decoration: underline;"><bean:message key="media.online"/></span></a>
		<%}%>
		&nbsp;
		<%if(distribute_id.equals("2")){%>
			<a href="<%=url%>"><span style="color: #ff9900;text-decoration: underline;"><bean:message key="media.download"/></span></a>
		<%}%>	
		<%}%>
		
		</div>
		<div style="clear:both;">&nbsp;</div>
<%}%>
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