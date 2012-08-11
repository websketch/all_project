/*
 * Created on 2005-8-25
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.email;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.chinaportal.portal.base.BaseAction;
import com.mediazone.bean.MailList;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class EmailAction extends BaseAction {

	/* (non-Javadoc)
	 * @see com.chinaportal.portal.base.BaseAction#doExecute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ActionForward doExecute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String target = "success";
		String command = request.getParameter("command");
		if(command!=null && command.equalsIgnoreCase("unsubscribe")){
			target = processUnsubscribe(request);
			return mapping.findForward(target);
		}
		//Integer lang_id=(Integer)request.getSession().getAttribute("chinaportal.local");
		Integer lang_id = new Integer(0); //暂时设为0
		EmailForm emailForm = (EmailForm)form;
		String email = null;
		if(emailForm.getEmail()!=null && !emailForm.getEmail().equals("")) 
			email=emailForm.getEmail().trim();
		MailList mail_list = new MailList();
		mail_list.setEmail(email);
		mail_list.setLangId(lang_id);
		mail_list.setStatus("1");
		EmailDAO emailDAO = new EmailDAO();
		List list = emailDAO.queryById(email,lang_id);
		if(list!=null && list.size()>0){
			mail_list.setUpdateTime(new Date());
			emailDAO.update(mail_list);
		}else{
			mail_list.setCreateTime(new Date());
			emailDAO.create(mail_list);
		}
		request.setAttribute("email",email);
		
		return mapping.findForward(target);
	}
	
	private String processUnsubscribe(HttpServletRequest request)throws Exception {
		String email = request.getParameter("email");
		Integer lang_id = new Integer(0); //暂时设为0
		if(email!=null)
			email = email.trim();
		EmailDAO emailDAO = new EmailDAO();
		emailDAO.updateForUnsubscribe(email, lang_id);
		return "unsubscribe";
	}
	
	

	/* (non-Javadoc)
	 * @see com.chinaportal.portal.base.BaseAction#getFunctionName()
	 */
	public String getFunctionName() {
		// TODO Auto-generated method stub
		return null;
	}

}
