<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="../common/parameter.jsp" %>
<%@ include file="../../trans.jsp" %>
<%@ page import="com.chinaportal.portal.category.*,com.chinaportal.portal.login.LoginMAN"%>
<%@ page import="java.util.*,com.mediazone.bean.*,com.chinaportal.portal.category.*,com.chinaportal.portal.popular.*"%>
<%
	loginUserName = (String)session.getAttribute("user_name");
	userId = (String)session.getAttribute("user_id");
    if(userId!=null && !userId.equals("")&&session.getAttribute("sync_user_info")==null){
      session.setAttribute("sync_user_info", new Boolean(true));
 	  LoginMAN loginMAN = new LoginMAN();
 	  loginMAN.synchronizeUserInfo(userId);
 	  //session.setAttribute("sync_user_info", new Boolean(true));
    }
%>
<script type="text/javascript">
<!--
function toLoginAction(){
  window.location.href = "<%=request.getContextPath()%>/login/loginAction.do?command=login";
}
//-->
</script>
<!-- left bar start -->
<div class="left_bar_box1">

	<div style="padding:10px;">
	<!-- 
		<span style="color:red;line-height:20px;"><b><bean:message key="notice.title"/></b></span><br />
		<script>
			re = /path/g;
	<% if(currentSiteName.equals("cmn")) { %>
			content = '<bean:message key="notice.content_cmn"/>';
			document.write(content.replace(re, "<%=basePath%>"));
	<% } else { %>	
			content = '<bean:message key="notice.content"/>';
			document.write(content.replace(re, "<%=basePath%>"));
	<% } %>
		</script> -->
	</div>

	<% if(loginUserName!=null && !loginUserName.equals("")) { %>
		<p><%=loginUserName%>, <bean:message key="notice.welcome"/></p>
		<button onclick="logout('<%=returnUrl%>')"><bean:message key="button.logout"/></button><br />			
	<% } else { %>
		<p><bean:message key="notice.welcome"/></p>
		<%if(currentSiteName.equals("thaiportal")){%>
			<button onclick="popup('1')"><bean:message key="button.login"/></button><br />
		<%}else{%>
			<button onclick="loginChinaportal('<%=returnUrl%>')"><bean:message key="button.login"/></button><br />
		<%}%>
	<% } %>
	<%@ include file="../common/button_purchase.jsp" %><br />
	<button onclick="window.location.href='<%=basePath%>/specialAction.do?tar=freemedia&category_id=28'"><bean:message key="button.preview"/></button><br />
	<button onclick="window.location.href='<%=basePath%>/static.jsp?fn=feedback'"><bean:message key="button.feedbacks"/></button><br /><br />
	<% if(isDisplaySports) { %>
		<a href="<%=basePath%>/specialAction.do?tar=cny&category_id=118"><img src="<%=langImagePath%>cctv06chunwan.gif" width="110" border="0" alt=""></a>
		<a href="<%=basePath%>/cny06/index.jsp"><img src="<%=langImagePath%>cny06_110_38.gif" width="110" border="0" alt=""></a>
		<a href="<%=basePath%>/changeLang.do?LANG=2&refer=<%=tranEncode("sports/Homepage.do?id=130")%>"><img src="<%=themesPath%>images/<%=lang%>/banner_typd_120x60.jpg" width="110" border="0" alt=""></a>
	<% } %>
</div>



<div class="left_bar_box2">
	<div class="title" style="background-image: url(<%=themesPath%>icons/icon_huangditou.gif);"><bean:message key="title.category"/></div>

	<%
	Integer langId=(Integer)request.getSession().getAttribute("chinaportal.local");
	
	if(lang==null)
	    langId=new Integer(2);
	    
	com.chinaportal.portal.base.Context ctx=new com.chinaportal.portal.base.Context();
	String id=request.getParameter("category_id");
	if(id==null)
		id=(String)request.getAttribute("category_id");
		
	String parent_id=request.getParameter("parent_id");
	if(parent_id==null)
		parent_id=(String)request.getAttribute("parent_id");
		
	id=id!=null?id:"1";
	List categorys=null;
	if(id.equals("1"))
		categorys=ctx.getChildren(id);
	else{
		List ids=new ArrayList();
		if(parent_id!=null && parent_id.equals("130")){
			ids.add(parent_id);
		}else{
			if(!id.equals("120")||!id.equals("121"))
				ids.add(id);
		}
		
		ids.add("121");
		ids.add("112");
		categorys=ctx.getCategory(ids, langId);
	}
	for(int i=0;i<categorys.size();i++)
	{
	    CategoryView cv=(CategoryView)categorys.get(i);
	    parent_id=cv.getCategory_id();
	    if(parent_id.equals("130") && langId.equals(new Integer(1)))
	    	continue;
	    List children=ctx.getChildren(parent_id);
	    if(children.size()==0){
	    	cv=ctx.getParent(parent_id);
	    	parent_id=cv.getCategory_id();
	    	if(parent_id.equals("121") || parent_id.equals("112"))
	    		continue;
	    	children=ctx.getChildren(parent_id);
	    }	    
	    
	    CategoryCaption cc=cv.getCaption(langId);
	    String parent_name=cv.getCategory_name();
	    if(cc!=null && cc.getName()!=null)
	    	parent_name=cc.getName();
    %>
    
<%
		if(currentSiteName.equals("japan") && parent_id.equals("20"))
		{
			continue;
	 	}
		
		if(currentSiteName.equals("thaiportal")&&(parent_id.equals("130")||parent_id.equals("20")))
		{
		}
		else
		{
%>
    <div class="cat_title">
    	<%=parent_name%>
    </div>
    
    <ul>
    <%
	    //sub_category
	   // List children=c.getChildren();  
	    for(int j=0;j<children.size();j++)
	    {
	        CategoryView child=(CategoryView)children.get(j);
	        String child_id=child.getCategory_id();
		    if(child_id.equals("457"))
		    	continue;
	        if(child_id.equals("103") && currentSiteName.equals("thaiportal")){
	        	continue;
	        }
	        String child_name=child.getCategory_name();
	        CategoryCaption childcc=child.getCaption(langId);
	        if(childcc!=null && childcc.getName()!=null)
	        	child_name=childcc.getName();
    		 if(parent_id.equalsIgnoreCase("130") && !ctx.isLeftSport(child_id)){
	        		continue;
	        	}
            if(child_name!=null && child_name.length()>=5) 
            {

	%>
        <li style="width: 110px;">
    <%      } else { %>    
        <li>
    <%      } %>
    <%
    if(parent_id.equalsIgnoreCase("130")){
    	if(child_id.equals("217")){
    %>
    	<a href="<%=basePath%>/sports/eb2005.jsp" style="text-decoration: underline;"><%=child_name%></a>
    <%
    	continue;
    }
    %>
    	<a href="<%=basePath%>/sports/HomepageItem.do?category_id=<%=child_id%>&parent_id=<%=parent_id%>" style="text-decoration: underline;"><%=child_name%></a></li>
    <%}else if(child_id.equals("120")){%>
    		<a href="<%=basePath%>/specialAction.do?tar=satellite&category_id=<%=child_id%>" style="text-decoration: underline;"><%=child_name%></a></li>
    <%}else if(parent_id.equals("20")){%>
    		<a href="<%=basePath%>/adult/adultAction.do?tar=catalog&category_id=<%=child_id%>" style="text-decoration: underline;"><%=child_name%></a></li>
    <%}else if(parent_id.equals("112") && !child_id.equals("105")){%>
    		<a href="<%=basePath%>/specialAction.do?tar=cny&category_id=<%=child_id%>" style="text-decoration: underline;"><%=child_name%></a></li>
    <%}else if(parent_id.equals("37")){%>
    		<a href="<%=basePath%>/specialAction.do?tar=tomedia&category_id=<%=child_id%>" style="text-decoration: underline;"><%=child_name%></a></li>	
    <%}else if(parent_id.equals("28") || child_id.equals("28")){%>
    		<a href="<%=basePath%>/specialAction.do?tar=freemedia&category_id=<%=child_id%>" style="text-decoration: underline;"><%=child_name%></a></li>	
    <%}else{%>		
        <a href="<%=basePath%>/getCategory.do?category_id=<%=child_id%>&parent_id=<%=parent_id%>" style="text-decoration: underline;"><%=child_name%></a></li>
    <%}%>
    <%
	    }
	    if(parent_id.equalsIgnoreCase("130")){
	%>    	
	 	<li style="width: 110px;"><a href="<%=basePath%>/sports/OtherGames.do?parent_id=<%=parent_id%>" style="text-decoration: underline;">
	 	<bean:message key="header.other_games"/></li>
	 <%
	    }
	%>
    </ul>
    <%}%>	
    <%
	}
	%>

	</ul>
	<!-- /logic:iterate --> 
</div>
		
<div class="left_bar_box3">
	<div class="title" style="background-image: url(<%=themesPath%>icons/icon_huangditou.gif);"><bean:message key="title.popular"/></div>
	<ul>
	<%
		int no;
		String sno;
		String name;
		PopularDAO pd=new PopularDAO();
		List medias=pd.getPopularMedias("ContentItemHitsWeekly", lang_id, 15,false);
		for(int i=0;i<medias.size();i++)
		{
			com.chinaportal.portal.popular.MediaView mv =(com.chinaportal.portal.popular.MediaView)medias.get(i);
			name = mv.getName();
			if( name.length()>7 )
				name = name.substring(0,7);
			no = i+1;
			if( no<10 )
				sno = "&nbsp;&nbsp;"+no;
			else
				sno = ""+no;
			out.println("<li>"+sno+". <a href=\""+basePath+"/getDetail.do?media_id="+mv.getId()+"\" title=\""+mv.getName()+"\" style=\"text-decoration: underline;line-height:16px;\">"+name+"</a></li>");
		}
	%>
	</ul>
	<p align="right" style="margin-top:5px;margin-right:10px;"><a href="<%=basePath%>/popular_list.jsp?type=weekly" style="text-decoration: underline;"><bean:message key="title.more"/>&gt;&gt;</a></p>
</div>

<div class="left_bar_box4">
	<div class="title" style="background-image: url(<%=themesPath%>icons/icon_huangditou.gif);"><bean:message key="title.other"/></div>
	<p><a href="mailto:content@chinaportal.com" style="text-decoration: underline;"><bean:message key="notice.contact_us"/></a></p>
	<form id="emailForm" name="emailForm" action="<%=basePath%>/email/emailAction.do" method="post">
		<bean:message key="notice.free_subscribe"/><br /><input name="email" size="8" type="text"><br />
		<button onclick="checkemail()"><bean:message key="button.subscribe"/></button>
	</form>
	<p><a href="http://www.microsoft.com/windows/windowsmedia/download/default.asp" target="_blank" class="unnamed1"><img src="<%=themesPath%>images/logo_MediaPlayer.gif" border="0"><br />Windows<br>Media Player 9</a></p>
</div>

<script langauge="javascript">
<!--
function checkemail()
{
	EmailList = document.emailForm.email.value ;

	if ( ( ! isEmpty(EmailList) ) &&  isEmail(EmailList) ) 
	{
		document.emailForm.submit();
	} 
	else 
	{
		alert("<bean:message key='email.mustinput'/>");
		document.emailForm.email.focus();
		return;
	}
}
//-->
</script>
<!-- left bar end -->
