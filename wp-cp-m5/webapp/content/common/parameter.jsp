<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<%

String currentSiteName = (String)request.getSession().getAttribute("currentSiteName");

if( currentSiteName==null || currentSiteName.equals("") ) currentSiteName = "chinaportal";
	
boolean isAdultPage = false;
String category_id_adult = request.getParameter("category_id")==null?"":request.getParameter("category_id");
String currentUri = request.getRequestURI();
if(currentUri.indexOf("/adult") != -1 || "103".equals(category_id_adult)){
	isAdultPage = true;
}	

int index;
String boxTitle;
String lang;
String langCookie;
String DownloadServer="http://download1.chinaportal.com/chinaportal/html/modules/downfiles.php";

String reqLang=request.getParameter("LANG");
if(reqLang!=null){
	request.getSession().setAttribute("chinaportal.local", Integer.valueOf(reqLang));
	request.getSession().removeAttribute("chinaportal.style");	
	//response.sendRedirect(request.getContextPath()+"/changeLang.do?LANG="+reqLang+"&refer="+request.getRequestURL().toString());
}
Integer lang_id=(Integer)request.getSession().getAttribute("chinaportal.local");	

boolean isDisplaySports= true;
if(currentSiteName.equals("thaiportal")){
	isDisplaySports= false;
}
if( lang_id==null ) 
{
	if(currentSiteName.equals("thaiportal")){
		lang_id=new Integer(4);
		request.getSession().setAttribute("chinaportal.local",lang_id);
		response.sendRedirect("changeLang.do?LANG=4");
%>
		<jsp:forward page= 'changeLang.do?LANG=4' />
<%
	}
	else{
		lang=com.mediazone.util.CookieUtil.getCookie(  request, "langCookie" );
		Locale locale=Locale.SIMPLIFIED_CHINESE;
		if(!lang.equals("")){
			if (lang.equals("en_US")) {
				lang_id = new Integer(1);
				locale = new Locale("en", "US");
			} else if (lang.equals("zh_CN")) {
				lang_id = new Integer(2);
			} else if (lang.equals("zh_TW")) {
				lang_id = new Integer(3);
				locale = Locale.TRADITIONAL_CHINESE;
			} else if (lang.equals("th_TH")) {
				locale = new Locale("th", "TH", "");
				lang_id = new Integer(4);
			}
		}else
			lang_id=new Integer(2);
		request.getSession().setAttribute("chinaportal.local",lang_id);
		request.getSession().setAttribute("org.apache.struts.action.LOCALE", locale);		
	}
}
switch (lang_id.intValue())
{
	case 1:
		lang = "en_us";
		break;
	case 2:
		lang = "zh_cn";
		break;
	case 3:
		lang = "zh_tw";
		break;
	case 4:
		lang = "th_th";
		break;
	default:
		lang = "en_us";
		break;
}
if(reqLang!=null)
	com.mediazone.util.CookieUtil.setCookie(response, "langCookie", lang);
String basePath       = request.getContextPath();
if(basePath.equals("/")) 
	basePath = "";
String themesPath     = basePath   + "/themes/200501/";
String largeImagePath = basePath   + "/images/photo/large/";
String smallImagePath = basePath   + "/images/photo/small/";
String langImagePath  = themesPath + "/images/" + lang + "/";
String bannerPath = basePath + "/images/banner/"+lang+"/";
%>

<% 
	//for login code start
 //String currentUrl = request.getRequestURL().toString();
 //String para = request.getQueryString();
 //String returnUrl = currentUrl;
 //if(para!=null && !para.equals("")) returnUrl = currentUrl+"?"+para;
StringBuffer urlBuffer = request.getRequestURL();
Enumeration enu = request.getParameterNames();
if(enu.hasMoreElements()) urlBuffer.append("?");
while(enu.hasMoreElements()){
	  String key = (String)enu.nextElement();
		String value = request.getParameter(key);
		urlBuffer.append(key+"="+value);
		if(enu.hasMoreElements()){
			urlBuffer.append("&");
		}
}		
String returnUrl = urlBuffer.toString().trim(); 	
String loginUserName  = null;
String userId = null;   	
 
%>