package com.chinaportal.portal.base;

import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ChangeLangAction extends Action {
	public ActionForward execute(
			ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response)
			throws Exception {

			String refer=request.getParameter("refer");
			if(refer!=null )
				refer=new String(refer.getBytes("iso8859-1"),"utf-8");
			else
				refer=request.getHeader("referer");
			if(refer==null )
				refer="/getHomePage.do";
			//if( refer.indexOf("LANG=")!=-1)
			//	return new ActionForward(refer, true);			
				
			int lang=Integer.parseInt(request.getParameter("LANG"));
			
			if(refer.indexOf("/sports/")!=-1 && lang!=2 && lang!=3)
				lang=2;
			
			String langCookie="";
			request.getSession().setAttribute(	"chinaportal.local",new Integer(lang));
			switch (lang){
			case 1:
				langCookie="en_US";
				setLocale(request,new Locale("en","US"));				
				request.getSession().setAttribute(	"chinaportal.style","style.en_us.css");
				break;
			case 2:
				langCookie="zh_CN";
				setLocale(request,Locale.SIMPLIFIED_CHINESE);
				request.getSession().setAttribute(	"chinaportal.style","style.zh_cn.css");
				break;
			case 3:
				langCookie="zh_TW";
				setLocale(request,Locale.TRADITIONAL_CHINESE);
				request.getSession().setAttribute(	"chinaportal.style","style.zh_tw.css");
				break;
			case 4:
				langCookie="th_TH";
				setLocale(request,new Locale("th","TH",""));
				request.getSession().setAttribute(	"chinaportal.style","style.th_th.css");
				break;
			default:
				langCookie="en_US";
				setLocale(request,new Locale("en","US"));
				request.getSession().setAttribute(	"chinaportal.style","style.css");
				break;
			}
			
			request.getSession().setAttribute("chinaportal.local",new Integer(lang));
			
			/*
			Cookie[] cookies=request.getCookies();
			boolean hasLang=false;
			for(int i=0;cookies!=null && i<cookies.length;i++){
				Cookie cookie=cookies[i];
				if(cookie.getName().trim().indexOf("langCookie")!=-1){
					cookie.setValue(""+langCookie);
					hasLang=true;
					break;
				}
			}
			
			if(!hasLang){
				Cookie cookie =new Cookie("langCookie",langCookie);
				cookie.setDomain("/chinaportal");
				cookie.setMaxAge(1);
				response.addCookie(cookie);
			}
			
			//String cookieStr="<script langugae='javascript'>setCookie('langCookie','"+langCookie+"'，'','/chinaportal');</script>";
			//response.getWriter().write(cookieStr);
			if(refer.indexOf("?CHANGE=")!=-1)
				refer=refer.substring(0,refer.indexOf("?CHANGE"));
			if(refer.indexOf("&CHANGE=")!=-1)
				refer=refer.substring(0,refer.indexOf("&CHANGE"));
			if(refer.indexOf("?")!=-1){
				refer+="&CHANGE="+langCookie;
			}
			else
				refer+="?CHANGE="+langCookie;
			*/
			com.mediazone.util.CookieUtil.setCookie(response, "langCookie", langCookie);
			if(refer.indexOf("LANG=")!=-1)
				refer=refer.substring(0,refer.indexOf("LANG="));
			return new ActionForward(refer, true);
	}
}
