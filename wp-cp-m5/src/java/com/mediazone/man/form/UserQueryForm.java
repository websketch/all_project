/*
 * Created on 2005-1-11
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.mediazone.man.form;

import org.apache.struts.action.ActionForm;

/**
 * @author Administrator
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class UserQueryForm extends ActionForm {
	private String status=null;
	private String pageno=null;
	

	/**
	 * @return
	 */
	public String getPageno() {
		return pageno;
	}

	/**
	 * @return
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param string
	 */
	public void setPageno(String string) {
		pageno = string;
	}

	/**
	 * @param string
	 */
	public void setStatus(String string) {
		status = string;
	}

}
