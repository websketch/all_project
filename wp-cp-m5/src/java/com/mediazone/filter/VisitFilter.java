/*
 * Created on 2005-9-7
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.mediazone.filter;

import java.io.IOException;
import java.util.Enumeration;
import java.util.ResourceBundle;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.chinaportal.portal.login.LoginMAN;
import com.mediazone.util.Common;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class VisitFilter implements Filter {
	
	private static final Log log = LogFactory.getLog(VisitFilter.class);

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
		//special_server_name = filterConfig.getInitParameter("special_server_name");
		//special_server_name = special_server_name==null?"":special_server_name;
		
		//current_site_name = filterConfig.getInitParameter("current_site_name");
		//current_site_name = current_site_name==null?"":current_site_name;
		
	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest hRequest = (HttpServletRequest)request;
		HttpServletResponse hResponse = (HttpServletResponse)response;
		String uri = hRequest.getRequestURI();
		
		//IP Permission
		HttpSession session = hRequest.getSession();
		LoginMAN loginMANforIp = new LoginMAN();
		Boolean perm = (Boolean)session.getAttribute("isPermissionIp");
		if(perm==null)
		{
			boolean permission = true;
			
			try
			{
				permission = loginMANforIp.isPermissionAdress(hRequest.getRemoteAddr());
			}
			catch (Exception e)
			{
				log.error("LoginMAN isPermissionAdress error: " + e.getMessage());
			}
			
			session.setAttribute("isPermissionIp", new Boolean(permission));
			perm = (Boolean)session.getAttribute("isPermissionIp");
		}
		if(perm!=null && !perm.booleanValue()&&(hRequest.getServletPath().indexOf("/welcome.jsp", 0)==-1))
		{
			hResponse.sendRedirect(hRequest.getContextPath()+"/welcome.jsp");
			return;
		}
		
		//Redirect JP users to www.chinaportal.jp
		String countryCode = (String)session.getAttribute("countryCode");
		if(countryCode==null){
			try {
//				countryCode = loginMANforIp.getCountryCode("219.163.145.72");
				countryCode = loginMANforIp.getCountryCode(hRequest.getRemoteAddr());
//				System.out.println(countryCode);
			} catch (Exception e) {
				log.error("LoginMAN getCountryCode error: " + e.getMessage());
			}
			session.setAttribute("countryCode",countryCode);
		}
		
		String currentSiteName = (String)session.getAttribute("currentSiteName");
		if( currentSiteName==null || currentSiteName.equals(""))
		{
			if( countryCode.equalsIgnoreCase("JP") || hRequest.getServerName().equals("www.chinaportal.jp") )
			{
				currentSiteName = "japan";
			}
			else
			{
				String requestServerName = hRequest.getServerName();
				ResourceBundle siteResourceBundle = Common.siteResourceBundle;
				Enumeration sites = siteResourceBundle.getKeys();
				while(sites.hasMoreElements()){
					String site = (String)sites.nextElement();
					if(site.equalsIgnoreCase(requestServerName)){
						currentSiteName = siteResourceBundle.getString(site).trim();
					}
				}
			}
			session.setAttribute("currentSiteName",currentSiteName);
		}
		
		if( "japan".equals(currentSiteName) && ! hRequest.getServerName().equals("www.chinaportal.jp") )
		{
			hResponse.sendRedirect("http://www.chinaportal.jp");
			return;
		}
		
		//No adult access for thaiportal
		if( "thaiportal".equalsIgnoreCase(currentSiteName) )
		{
			if(uri.indexOf("/adult") != -1 || uri.indexOf("/sports") != -1){
				hResponse.sendRedirect(hRequest.getContextPath() + "/getHomePage.do");
				return;
			}
		}

		chain.doFilter(request, response);

	}

	/* (non-Javadoc)
	 * @see javax.servlet.Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
