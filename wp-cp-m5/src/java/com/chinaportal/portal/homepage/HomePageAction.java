package com.chinaportal.portal.homepage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.chinaportal.portal.base.BaseAction;
import com.chinaportal.portal.category.CategoryBD;
import com.chinaportal.portal.sports.SportsBD;

public class HomePageAction extends BaseAction {

	public ActionForward doExecute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String target = "success";
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");
		//HomePageDAO hpd=new HomePageDAO();
		//CategoryDAO cd=new CategoryDAO();
		//try{
            //get tv channel
			//request.setAttribute("tv_info",cd.getCategoryInfo(new Integer(120),lang));
			request.setAttribute("tv_info",CategoryBD.getCategoryInfo(new Integer(120),lang,request.getContextPath()));
			//request.setAttribute("tv_medias",hpd.getSpecial(new Integer(120),4,lang));
			request.setAttribute("tv_medias",HomePageBD.getSpecial(new Integer(120),4,lang));
			
			//get recommend and new
			//List medias =hpd.getRecommend(lang);
			List medias =HomePageBD.getRecommend(lang);
			request.setAttribute("new_top",medias.subList(0,2));
			request.setAttribute("recommed_top",medias.subList(2,6));
			request.setAttribute("recommed_bottom",medias.subList(6,18));
			request.setAttribute("new_bottom",medias.subList(18,24));
			
			//get comming_soon
			//request.setAttribute("comming_soon",hpd.getCommingSoonMedias(lang,6));
			request.setAttribute("comming_soon",HomePageBD.getCommingSoonMedias(lang,6));
			
			//get special
			//request.setAttribute("spe1_info",cd.getCategoryInfo(new Integer(141),lang));
			request.setAttribute("spe1_info",CategoryBD.getCategoryInfo(new Integer(404),lang,request.getContextPath()));
			//request.setAttribute("spe1_medias",hpd.getSpecial(new Integer(141),7,lang));
			request.setAttribute("spe1_medias",HomePageBD.getSpecial(new Integer(404),7,lang));
			//request.setAttribute("spe2_info",cd.getCategoryInfo(new Integer(146),lang));
			request.setAttribute("spe2_info",CategoryBD.getCategoryInfo(new Integer(151),lang,request.getContextPath()));
			//request.setAttribute("spe2_medias",hpd.getSpecial(new Integer(146),7,lang));
			request.setAttribute("spe2_medias",HomePageBD.getSpecial(new Integer(151),7,lang));
			request.setAttribute("Homepage_News",HomePageBD.getNews(new Integer(1),lang));
		//}finally {
		//	hpd.closeSession();
		//}
		return mapping.findForward(target);
	}

	public String getFunctionName() {
		// TODO Auto-generated method stub
		return null;
	}

}
