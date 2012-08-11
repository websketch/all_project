/*
 * Created on 2005-8-9
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.adult;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.chinaportal.portal.base.BaseAction;
import com.chinaportal.portal.category.CategoryForm;
import com.chinaportal.portal.util.PageContent;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class AdultAction extends BaseAction {

	/* (non-Javadoc)
	 * @see com.chinaportal.portal.base.BaseAction#doExecute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ActionForward doExecute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		Boolean iswarned = (Boolean)request.getSession().getAttribute("warned");
		if(iswarned==null || (iswarned!=null&&!iswarned.booleanValue())){
			return mapping.findForward("warning");
		}
		String target = "adult_list";
		String tar = "";
		if(request.getParameter("tar")!=null){
			tar = request.getParameter("tar");
		}
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");
		CategoryForm cf = (CategoryForm)form;
		String category_id_str = cf.getCategory_id();
		if(category_id_str==null || "".equals(category_id_str)){
			category_id_str = request.getParameter("category_id");
			if(category_id_str==null || "".equals(category_id_str)){
				category_id_str = "20";
			}
		}
		Integer category_id = Integer.valueOf(category_id_str);
		cf.setCategory_id(category_id_str);
		cf.setTar(tar);
		String curpage=cf.getCurpage();
		if(null==curpage)	curpage="1";
		Integer pageSize = new Integer(25);
		//AdultDAO adultDAO = new AdultDAO();
		AdultDAO adultDAO = null;
		
		//go to adult homepage
		if(tar.equalsIgnoreCase("home")) {
			target = "adult_home";
			//List newoffers = adultDAO.queryNewOffer(category_id, lang, "1", new Integer(6));
			List newoffers = AdultBD.queryNewOffer(category_id, lang, "1", new Integer(6)).content;
			//List recommends = adultDAO.queryRecommend(category_id, lang, "1", new Integer(9));
			List recommends = AdultBD.queryRecommend(category_id, lang, "1", new Integer(9)).content;
			//List comingsoons = adultDAO.queryComingSoon(category_id, lang, "1", new Integer(6));
			List comingsoons = AdultBD.queryComingSoon(category_id, lang, "1", new Integer(6)).content;
			//List popmedias = adultDAO.popListWeek(category_id, lang, "1", new Integer(25));
			List popmedias = AdultBD.popListWeek(category_id, lang, "1", new Integer(25));
			request.setAttribute("newoffers", newoffers);
			request.setAttribute("recommends", recommends);
			request.setAttribute("comingsoons", comingsoons);
			request.setAttribute("popmedias", popmedias);
		}
		
		//go to poplist
		if(tar.equalsIgnoreCase("weeklypop")) {
			target = "adult_poplist";
			//List popmedias = adultDAO.popListWeek(category_id, lang, "1", new Integer(50));
			List popmedias = AdultBD.popListWeek(category_id, lang, "1", new Integer(50));
			request.setAttribute("popmedias", popmedias);
		}
		if(tar.equalsIgnoreCase("totalpop")) {
			target = "adult_poplist";
			//List popmedias = adultDAO.popListAll(category_id, lang, "1", new Integer(50));
			List popmedias = AdultBD.popListAll(category_id, lang, "1", new Integer(50));
			request.setAttribute("popmedias", popmedias);
		}
		
		
		
		//go to Japanese Korea E&US All
		if(tar.equalsIgnoreCase("catalog")) {
			target = "adult_catalog";
			//List recommends = adultDAO.queryRecommend(category_id, lang, curpage, new Integer(12));
			PageContent pc = AdultBD.queryRecommend(category_id, lang, curpage, new Integer(12));
			adultDAO = (AdultDAO)pc.page;
			List recommends = pc.content;
			if (null != recommends){
				request.setAttribute("recommends", recommends);
				cf.setTolpage(adultDAO.getTotalPage()+"");
				cf.setCurpage(adultDAO.getPageNo()+"");
				cf.setTolrow(adultDAO.getTotalRow()+"");
				if(curpage.equals("1"))
					cf.setPrepage("1");
				else
					cf.setPrepage((adultDAO.getPageNo()-1)+"");
				if(adultDAO.getTotalPage()==1)
					cf.setNextpage(cf.getTolpage());
				else
					cf.setNextpage((adultDAO.getPageNo()+1)+"");
			}
			//List comingsoons = adultDAO.queryComingSoon(category_id, lang, "1", null);
			List comingsoons = AdultBD.queryComingSoon(category_id, lang, "1", null).content;
			request.setAttribute("comingsoons", comingsoons);
			//List popmedias = adultDAO.popListWeek(category_id, lang, "1", new Integer(30));
			List popmedias = AdultBD.popListWeek(category_id, lang, "1", new Integer(30));
			request.setAttribute("popmedias", popmedias);
		}
		
		//go to more
		List medias = null;
		if(tar.equalsIgnoreCase("newoffer")){
			//medias = adultDAO.queryNewOffer(category_id, lang, curpage, pageSize);
			PageContent pc = AdultBD.queryNewOffer(category_id, lang, curpage, pageSize);
			adultDAO = (AdultDAO)pc.page;
			medias = pc.content;
		}
		if(tar.equalsIgnoreCase("recommend")){
			//medias = adultDAO.queryRecommend(category_id, lang, curpage, pageSize);
			PageContent pc = AdultBD.queryRecommend(category_id, lang, curpage, pageSize);
			adultDAO = (AdultDAO)pc.page;
			medias = pc.content;
		}
		if(tar.equalsIgnoreCase("comingsoon")){
			//medias = adultDAO.queryComingSoon(category_id, lang, curpage, pageSize);
			PageContent pc = AdultBD.queryComingSoon(category_id, lang, curpage, pageSize);
			adultDAO = (AdultDAO)pc.page;
			medias = pc.content;
		}
		if (null != medias && null != adultDAO){
			request.setAttribute("adultmedias", medias);
			cf.setTolpage(adultDAO.getTotalPage()+"");
			cf.setCurpage(adultDAO.getPageNo()+"");
			cf.setTolrow(adultDAO.getTotalRow()+"");
			if(curpage.equals("1"))
				cf.setPrepage("1");
			else
				cf.setPrepage((adultDAO.getPageNo()-1)+"");
			if(adultDAO.getTotalPage()==1)
				cf.setNextpage(cf.getTolpage());
			else
				cf.setNextpage((adultDAO.getPageNo()+1)+"");
		}
		
		AdultBD.closeSession();
		
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
