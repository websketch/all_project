package com.chinaportal.portal.base;

import java.util.Enumeration;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.mediazone.util.CookieUtil;


/**
 * @author gxu
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public abstract class BaseAction extends Action {
	public void saveError(HttpServletRequest request, String errorInfo) {
		ActionMessages errors = new ActionMessages();
		errors.add(
			"org.apache.struts.action.GLOBAL_MESSAGE",
			new ActionMessage(errorInfo));
		saveErrors(request, errors);
	}

	public ActionForward execute(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
		ActionForward forwarder=new ActionForward();		
		/**
		 * add login validation
		 */
		if (authorize(request, response) == false) {			
			forwarder.setPath( "/content/auth/login.jsp?error=1");
			return  forwarder;
		}
		String reqLang=request.getParameter("LANG");
		if(reqLang!=null){
			request.getSession().setAttribute("chinaportal.local", Integer.valueOf(reqLang));
			request.getSession().removeAttribute("chinaportal.style");
			com.mediazone.util.CookieUtil.setCookie(response,"LANG",reqLang);
		}
		Integer lang_id=(Integer)request.getSession().getAttribute("chinaportal.local");
		if(request.getRequestURL().indexOf("/sports/")!=-1){
			if(lang_id==null || (lang_id.intValue()!=2 && lang_id.intValue()!=3)){
				lang_id=new Integer(2);
				request.getSession().removeAttribute("chinaportal.style");
				com.mediazone.util.CookieUtil.setCookie(response,"langCookie","zh_CN");
			}
		}
	
		if (lang_id == null) {
			reqLang=CookieUtil.getCookie(request,"langCookie");
			if(reqLang!=null){
				if(reqLang.equals("zh_TW"))
					saveLangToSession( request,  3);
				else if(reqLang.equals("en_US"))
					saveLangToSession( request,  1);
				else if(reqLang.equals("th_TH"))
					saveLangToSession( request,  4);
				else
					saveLangToSession( request,  2);
			}else{
				String style=null;
				String langCookie=null;
	
				if(request.getServerName().toLowerCase().indexOf("thaiportal")!=-1){
					langCookie="th_TH";
					lang_id=new Integer(4);
					style="style.th_th.css";
					setLocale(request,new Locale("th","TH",""));
				}else{
					langCookie="zh_CN";
					lang_id=new Integer(2);
					style="style.zh_cn.css";
					setLocale(request,Locale.SIMPLIFIED_CHINESE);
				}
				request.getSession().setAttribute(	"chinaportal.local",lang_id);
				
				request.getSession().setAttribute(	"chinaportal.style",style);
				com.mediazone.util.CookieUtil.setCookie(response,"langCookie",langCookie);
			}
		}else  if(request.getSession().getAttribute("chinaportal.style")==null){
			saveLangToSession( request,  lang_id.intValue());			
		}
		
		try {
			forwarder = doExecute(mapping, form, request, response);
		} catch (Exception e) {	
			e.printStackTrace();
			saveError(request, e.toString());
		}
		       
		return forwarder;
	}
	public void saveLangToSession(HttpServletRequest request, int lang){
		switch (lang){
		case 1:
			setLocale(request,new Locale("en","US"));
			request.getSession().setAttribute(	"chinaportal.style","style.css");
			break;
		case 2:
			setLocale(request,Locale.SIMPLIFIED_CHINESE);
			request.getSession().setAttribute(	"chinaportal.style","style.zh_cn.css");
			break;
		case 3:
			setLocale(request,Locale.TRADITIONAL_CHINESE);
			request.getSession().setAttribute(	"chinaportal.style","style.zh_tw.css");
			break;
		case 4:
			setLocale(request,new Locale("th","TH",""));
			request.getSession().setAttribute(	"chinaportal.style","style.th_th.css");
			break;
		default:
			setLocale(request,new Locale("en","US"));
			request.getSession().setAttribute(	"chinaportal.style","style.css");
			break;
		}
		request.getSession().setAttribute("chinaportal.local",new Integer(lang));
	}
	public String getLangFromCookie(HttpServletRequest request){		
		 Cookie[] cookies = request.getCookies();
		 for(int i=0; cookies!=null && i<cookies.length; i++){
		 	Cookie cookie = cookies[i];
		 	if(cookie.getName()!=null && cookie.getName().trim().equals("langCookie")){
				return cookie.getValue();
		 	}
		 }
		 return null;
	}
	public abstract ActionForward doExecute(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception;
		
	public abstract String getFunctionName();
	
	public boolean authorize(HttpServletRequest request, HttpServletResponse response) throws Exception {
	   return true;
	}

}