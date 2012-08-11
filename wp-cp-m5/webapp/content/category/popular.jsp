<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.category.*"%>

<%@ include file="../common/parameter.jsp" %>

<div style="float:left;width:100%;background: #154E78;">
	<div>
		<div style="float:left;"><img src="<%=themesPath%>icons/icon_neilanjiao06.jpg"></div>
		<div style="float:right;"><img src="<%=themesPath%>icons/icon_neilanjiao07.jpg" border="0"></div>
	</div>
	<div style="padding-top:4px;text-align: center;color: #FF9900;border-bottom: 1px solid gray;padding-bottom:2px;"><bean:message key="title.popular_subcategory"/></div>
	<div style="margin-top:5px;">
	<%
		int no;
		String sno;
		String name;
		List medias = (List)request.getAttribute("Popular");
		String category_id = request.getParameter("category_id");
		if( medias == null )
		{
			CategoryDAO csd = new CategoryDAO();
			Integer category_id_integer = null;
			if(category_id!=null){
				category_id_integer = Integer.valueOf(category_id);
			}else{
				category_id_integer= new Integer(1);
			}	
			medias = csd.getPopular(category_id_integer, lang_id);
		}
		for(int i=0;i<medias.size();i++)
		{
			MediaView mv =(MediaView)medias.get(i);
			name = mv.getName();
			if( name.length()>7 )
				name = name.substring(0,7);
			no = i+1;
			if( no<10 )
				sno = "&nbsp;"+no;
			else
				sno = ""+no;
			out.println("<li style=\"float:left;width:110px;display: inline;list-style-type: none;margin-left:3px;\">"+sno+". <a href=\""+basePath+"/getDetail.do?media_id="+mv.getId()+"\" title=\""+mv.getName()+"\" style=\"line-height:16px;\">"+name+"</a></li>");
		}
	%>

	</div>
	<div class="block_footer" style="">
		<img align="left" src="<%=themesPath%>icons/icon_neilanjiao04.jpg">
		<img align="right" src="<%=themesPath%>icons/icon_neilanjiao05.jpg">
	</div>
</div>
