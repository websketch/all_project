<%@ include file="../common/header.jsp" %>

<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<%

int index;
String boxTitle;
String lang           = "zh_cn";

String isThaiPortal   = "no";
String isLogin        = "no";
String isAdultPage    = "no";
String isDisplaySports= "yes";

String basePath       = request.getContextPath();
if(basePath.equals("/")) basePath = "";
String themesPath     = basePath + "/themes/200501/";
String largeImagePath = basePath + "/images/photo/large/";
String smallImagePath = basePath + "/images/photo/small/";

String loginUserName  = "";

String media_id    = (String)request.getAttribute("media_id");
String category_id = (String)request.getAttribute("category_id");
String user_id     = (String)request.getAttribute("user_id");
%>
		<html:form action="/comment/CommentAction.do" method="post" onsubmit="return SubmitFrm();">
			<html:hidden property="lang_id" value="2" />
			<html:hidden property="media_id" value="2"/>
			<html:hidden property="category_id" value="2"/>
			<html:hidden property="user_id" value="hujifeng"/>
			<html:hidden property="actionType" value=""/>
			<div class="category">
				<div style="clear:both;">&nbsp;</div>
				<%@ include file="CommentContent.jsp" %>
				<div style="clear:both;">&nbsp;</div>		
			</div>
		
		</html:form>	
	</body>
</html>

<script language="javascript">
<!--
	function SubmitFrm() 
	{
	    var objFrm = document.CommentForm;
	    var titlevalue = objFrm.title.value;
	    var contentvalue = objFrm.content.value;
	    
	    if ( titlevalue.length ==0 )
	    {
	    	return ;
	    }
	    
		if ( contentvalue.length ==0 )
	    {
	    	return ;
	    }
	    
		objFrm.submit();
	}
//-->
</script>