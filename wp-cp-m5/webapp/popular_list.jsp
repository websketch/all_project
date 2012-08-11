<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="content/common/parameter.jsp" %>
<%@ page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.popular.*"%>

<%
	int strLength;
	String type = request.getParameter("type");
	String name;
	String highlight;
	String tableName;
	String title;
	String urlTitle;
	String urlType;

	if( type.equals("weekly") )
	{
		tableName = "ContentItemHitsWeekly";
		title = "本周排行";
		urlTitle = "总排行";
		urlType = "total";
	}
	else
	{
		tableName = "ContentItemHits";
		title = "总排行";
		urlTitle = "本周排行";
		urlType = "weekly";
	}
%>

<jsp:include page="content/common/header.jsp" />

<div class="popular_list">

	<div class="block_header" style="width:100%;height:20px;background: url(<%=themesPath%>icons/icon_neihuangdi.jpg);">
	    <div style="float:left;"><img src="<%=themesPath%>icons/icon_neihuangjiao.jpg"></div>
        <div style="float:left;padding-top:2px;">&nbsp;<%=title%></div>
	    <div style="float:right;"><img src="<%=themesPath%>icons/icon_neihuangjiao01.jpg" border="0"></div>
	</div>

	<div class="content">

		<div class="type">
			[ <a href="<%=basePath%>/popular_list.jsp?type=<%=urlType%>" style="text-decoration: underline;"><%=urlTitle%></a> ]
		</div>

		<ol>
		<%
			PopularDAO pd=new PopularDAO();
			List medias=pd.getPopularMedias(tableName, lang_id, 80,true);
			for(int i=0;i<medias.size();i++)
			{
				com.chinaportal.portal.popular.MediaView mv =(com.chinaportal.portal.popular.MediaView)medias.get(i);
				name = mv.getName();
				strLength = 46 - name.length();
				highlight = mv.getHighlight();
				if( highlight.length() > strLength )
					highlight = highlight.substring(0,strLength);
				out.print("<li><a href=\""
				+basePath
				+"/getDetail.do?media_id="+mv.getId()+"\" title=\""
				+mv.getName()
				+": "
				+mv.getHighlight()
				+"\" style=\"line-height:16px;\"><span>"
				+name+
				":</span>&nbsp;&nbsp;"
				+highlight
				+"</a>"
				+"<script language=\"javascript\">var average_rating="
				+mv.getLevel()
				+";</script>"
				);
				%>
				<%@ include file="content/common/stargrade.jsp" %>
				<%
				out.println("</li>");
				if( (i+1)%5==0)
					out.println("<hr />");
			}
		%>
		</ol>
	</div>

	<%@ include file="content/common/box_footer_blue.jsp" %>

</div>

<div style="clear: both;">&nbsp;</div>

<jsp:include page="content/common/footer.jsp" />