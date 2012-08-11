/*
 * Created on 2005-8-26
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.chinaportal.portal.base.BaseAction;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class LoginAction extends BaseAction {

	/* (non-Javadoc)
	 * @see com.chinaportal.portal.base.BaseAction#doExecute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ActionForward doExecute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		 String forward = "login";
	     String command = request.getParameter("command");
		 if ("login".equalsIgnoreCase(command)) {
			 forward = processLogin(request);
	     }else if ("logout".equalsIgnoreCase(command)) {
	        forward = processLogout(request);
	     }
	     return mapping.findForward(forward);
	}
	
	private String processLogin(HttpServletRequest request) throws Exception {
		String url = request.getHeader("referer");
		request.setAttribute("returnUrl", url);
		return "login";
	}
	
	private String processLogout(HttpServletRequest request) throws Exception {
		String url = request.getHeader("referer");	
		request.setAttribute("returnUrl", url);
		return "logout";
	}

	/* (non-Javadoc)
	 * @see com.chinaportal.portal.base.BaseAction#getFunctionName()
	 */
	public String getFunctionName() {
		// TODO Auto-generated method stub
		return null;
	}

}
