/*
 * Created on 2005-1-30
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.mediazone.man.form;

import org.apache.struts.action.*;
import javax.servlet.http.*;
/**
 * @author Wang Jiexin
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class MailListForm  extends ActionForm {
	private String email;
	private Integer lang_id;
	public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {
	/**@todo: finish this method, this is just the skeleton.*/
			return null;
	}
	public static void main(String[] args) {
	}
	/**
	 * @return
	 */
	/**
	 * @return
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @return
	 */
	public Integer getLang_id() {
		return lang_id;
	}

	/**
	 * @param string
	 */
	/**
	 * @param string
	 */
	public void setEmail(String string) {
		email = string;
	}

	/**
	 * @param string
	 */
	public void setLang_id(Integer string) {
		lang_id = string;
	}

}
