/*
 * Created on 2005-6-24
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package sample;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/**
 * @author Administrator
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class SampleAction extends BaseAction {
	
	/* (non-Javadoc)
	 * @see com.mediazone.action.BaseAction#excuteAction(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ActionForward excuteAction(
		ActionMapping mapping,
		ActionForm actionform,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {
			//get index directory content
			SampleDAO md=new SampleDAO();		
			request.setAttribute("Directory_Media",md.getMediaList("1","4"));
		return mapping.findForward("success");
	}

}
