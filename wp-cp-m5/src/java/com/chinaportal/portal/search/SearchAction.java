/*
 * Created on 2005-8-1
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.search;

import java.net.URLDecoder;
import java.util.Collection;

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
public class SearchAction extends BaseAction {
	
	public ActionForward doExecute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String target = "";	
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");
		SearchDAO searchDAO = new SearchDAO();
		SearchForm searchForm = (SearchForm)form;
		String key = null;
		key = searchForm.getKey();
		if(key!=null){
			key = searchForm.getKey().trim();
		}
		key = new String(key.getBytes("ISO-8859-1"),"UTF-8");
		//System.out.println(key);
		Collection medias = searchDAO.queryMedia(key,lang);
		if(medias!=null){
			request.setAttribute("medias", medias);
		}
		target = "querysuccess";
		return mapping.findForward(target);
	}

	public String getFunctionName() {
		return null;
	}

}
