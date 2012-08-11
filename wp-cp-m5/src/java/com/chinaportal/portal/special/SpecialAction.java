/*
 * Created on 2005-7-19
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.special;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.chinaportal.portal.base.BaseAction;
import com.chinaportal.portal.category.CategoryDAO;
import com.chinaportal.portal.category.CategoryForm;
import com.chinaportal.portal.category.CategoryView;
import com.chinaportal.portal.category.CategoryBD;
import com.chinaportal.portal.util.PageContent;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class SpecialAction extends BaseAction {

	/* (non-Javadoc)
	 * @see com.chinaportal.portal.base.BaseAction#doExecute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ActionForward doExecute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String target = "";	//
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");
		CategoryForm cf=(CategoryForm)form;				
		String category_id_str = cf.getCategory_id();
		Integer category_id = null;
		if (null != category_id_str)
			category_id = Integer.valueOf(category_id_str);		
		cf.setCategory_id(category_id_str);
		//CategoryDAO csd = new CategoryDAO();
		//csd.setContextPath(request.getContextPath());
		//try {
			//CategoryView cv = csd.getCategoryInfo(category_id, lang);
			CategoryView cv = CategoryBD.getCategoryInfo(category_id, lang, request.getContextPath());
			request.setAttribute("Category_INFO", cv);
			//MediaView mv = csd.getBlock(category_id, lang);	//copy from xugeng 
			//request.setAttribute("Category_Block", mv);
		//} finally {
		//	csd.closeSession();
		//}				
		
		String tar = request.getParameter("tar");	
		if(tar!=null && tar.equalsIgnoreCase("smg")){			
			target = "smgsample";	//go to smg page "smg.jsp"	
			//try{
				//List categorys = csd.getChildren(category_id_str, lang);
				List categorys = CategoryBD.getChildren(category_id_str, lang);
				if(categorys!=null){
					request.setAttribute("categorys", categorys);
				}
			//}finally{
			//	csd.closeSession();
			//}			
		}else if(tar!=null && tar.equalsIgnoreCase("tomedia")){			
			target = "smgtomedia";	//go to smg media page "smg_media.jsp"
			//try {
				String curpage=cf.getCurpage();
				if(null==curpage)
					curpage="1";
				//List medias = csd.getCategoryMedias(category_id, lang, curpage);
				PageContent pc = CategoryBD.getCategoryMedias(category_id, lang, curpage);
				CategoryDAO csd = (CategoryDAO)pc.page;
				List medias = pc.content;
				if (null != medias){
					request.setAttribute("Category_Medias", medias);
					cf.setTolpage(csd.getTotalPage()+"");
					cf.setCurpage(csd.getPageNo()+"");
					cf.setTolrow(csd.getTotalRow()+"");
					if(curpage.equals("1"))
						cf.setPrepage("1");
					else
						cf.setPrepage((csd.getPageNo()-1)+"");
					
					if(csd.getTotalPage()==1)
						cf.setNextpage(cf.getTolpage());
					else
						cf.setNextpage((csd.getPageNo()+1)+"");
				}
				//List commingSoonMedias = csd.getCommingSoonMedias(category_id, lang);
				List commingSoonMedias = CategoryBD.getCommingSoonMedias(category_id, lang);
				if (null != commingSoonMedias)
					request.setAttribute("Comming_Soon_Medias", commingSoonMedias);
			//} finally {
			//	csd.closeSession();
			//}
		}else if(tar!=null && tar.equalsIgnoreCase("cny")){	
			target = "cnysample";	//go to cny page "cny.jsp"
			//List medias_nopage = csd.getMedias(category_id, lang);
			List medias_nopage = CategoryBD.getMedias(category_id, lang);
			if(medias_nopage!=null){
				request.setAttribute("medias_np", medias_nopage);
			}
		}else if(tar!=null && tar.equalsIgnoreCase("freemedia")){
			target = "freemedia";
		}else{
			target = "cnysample";	//go to cny page "cny.jsp"
			//List medias_nopage = csd.getMedias(category_id, lang);
			List medias_nopage = CategoryBD.getMedias(category_id, lang);
			if(medias_nopage!=null){
				request.setAttribute("medias_np", medias_nopage);
			}
		}
		
		return mapping.findForward(target);
	}

	/* (non-Javadoc)
	 * @see com.chinaportal.portal.base.BaseAction#getFunctionName()
	 */
	public String getFunctionName() {
		// TODO Auto-generated method stub
		return null;
	}

}
