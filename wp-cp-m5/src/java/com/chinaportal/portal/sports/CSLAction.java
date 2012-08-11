package com.chinaportal.portal.sports;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.chinaportal.portal.base.BaseAction;

public class CSLAction extends BaseAction {


	public ActionForward doExecute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String target = "success";
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");
		String id=request.getParameter("category_id");
		
		CSLDAO sd=new CSLDAO();
		try{
			request.setAttribute("Category_Block", sd.getWeekReferMatch(id, lang));
			if(!id.equals("129")){					
				List subcategorys=sd.getSubCategorys(id,lang);
				if(subcategorys==null)
					target="error";
				else{
					request.setAttribute("Match_List",subcategorys);
				}
			}else{
				request.setAttribute("Match_List",sd.getCWGC("129",lang));
			}
				
		}finally{
			sd.closeSession();
		}
		if(id.equals("129"))
			target="wttc";
		else if(id.equals("201"))
			target="csl";
		else if(id.equals("202"))
			target="cba";
		else if(id.equals("203"))
			target="csll";
		else if(id.equals("212"))
			target="swc";
		else if(id.equals("215"))
			target="fiba";
		else if(id.equals("218"))
			target="ng10";
		else if(id.equals("243"))
			target="cba06";
		
		return mapping.findForward(target);
	}

	public String getFunctionName() {
		// TODO Auto-generated method stub
		return null;
	}

}
