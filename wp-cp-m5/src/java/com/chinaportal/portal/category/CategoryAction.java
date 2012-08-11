package com.chinaportal.portal.category;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.chinaportal.portal.base.BaseAction;
import com.chinaportal.portal.util.PageContent;

public class CategoryAction extends BaseAction {

	public ActionForward doExecute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String target = "success";
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");

		CategoryForm cf=(CategoryForm)form;
		
		// TODO Auto-generated method stub
		String category_id_str = cf.getCategory_id();
		Integer category_id = null;
		if (null != category_id_str)
			category_id = Integer.valueOf(category_id_str);		
		cf.setCategory_id(category_id_str);
		
		//CategoryDAO csd = new CategoryDAO();
		//csd.setContextPath(request.getContextPath());
		//try {
			//request.setAttribute("Popular", csd.getPopular(category_id,lang));
			request.setAttribute("Popular", CategoryBD.getPopular(category_id,lang));
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
			//List commingSoonMedias = csd
			//		.getCommingSoonMedias(category_id, lang);
			List commingSoonMedias = CategoryBD
					.getCommingSoonMedias(category_id, lang);
			if (null != commingSoonMedias)
				request.setAttribute("Comming_Soon_Medias", commingSoonMedias);
			//CategoryView cv = csd.getCategoryInfo(category_id, lang);
			CategoryView cv = CategoryBD.getCategoryInfo(category_id, lang, request.getContextPath());
			request.setAttribute("Category_INFO", cv);
			//MediaView mv = csd.getBlock(category_id, lang);
			MediaView mv = CategoryBD.getBlock(category_id, lang);
			request.setAttribute("Category_Block", mv);
		//} finally {					
		//	csd.closeSession();
		//}
		
		return mapping.findForward(target);
	}

	public String getFunctionName() {
		// TODO Auto-generated method stub
		return null;
	}

}
