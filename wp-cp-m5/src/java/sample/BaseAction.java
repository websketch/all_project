/*
 * Created on 2005-6-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package sample;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 * @author Administrator
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public abstract class BaseAction extends Action {
	//every sub class must implements the method
	public abstract ActionForward excuteAction(
		ActionMapping actionmapping,
		ActionForm actionform,
		HttpServletRequest httpservletrequest,
		HttpServletResponse httpservletresponse)
		throws Exception;

	public final ActionForward execute(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
		ActionForward forward;
		HttpSession session;
		forward = new ActionForward();
		session = getSession(request);
/*		User user = getUser(getSession(request));
		if (user == null)
			return mapping.findForward("logon");*/
		forward = excuteAction(mapping, form, request, response);
		return forward;
	}

	//get session from request
	protected HttpSession getSession(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null)
			session = request.getSession(true);
		return session;
	}


	//save error info to request
	protected void saveError2Request(
		HttpServletRequest request,
		String error) {
		ActionMessages errors = new ActionMessages();
		errors.add(
			"org.apache.struts.action.GLOBAL_MESSAGE",
			new ActionMessage(error));
		saveErrors(request, errors);
	}
}
