package com.chinaportal.portal.sports;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.chinaportal.portal.base.BaseAction;

public class SportsAction extends BaseAction {


	public ActionForward doExecute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String target = "success";
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");
		String sports_id=request.getParameter("id");
		if(sports_id==null)
			sports_id="130";
		
		//SportsDAO sd=new SportsDAO();
		try{			
            request.setAttribute("Category_Block",SportsBD.getWeekReferMatch(sports_id, lang));
            request.setAttribute("Sports_Index_CSL",SportsBD.getCategoryBlock("Sports_Index_CSL",lang));
            request.setAttribute("Sports_Index_CSLL",SportsBD.getCategoryBlock("Sports_Index_CSLL",lang));
            request.setAttribute("Sports_Other_Main_Game",SportsBD.getNewMaths(lang));
            request.setAttribute("Sports_Index_CBA",SportsBD.getMediaBlock("Sports_Index_CBA",lang));
            request.setAttribute("Sports_Index_Table_Tennis",SportsBD.getMediaBlock("Sports_Index_Table_Tennis",lang));
            request.setAttribute("Sports_Comming_List",SportsBD.getCommingGame("Sports_Comming_List",lang));
			request.setAttribute("Sports_News",SportsBD.getNews(new Integer(2),lang));

            /*
             * request.setAttribute("Category_Block",sd.getWeekReferMatch(sports_id, lang));
             * 
             * request.setAttribute("Sports_Index_CSL",sd.getCategoryBlock("Sports_Index_CSL",lang));
             * 
             * request.setAttribute("Sports_Index_CSLL",sd.getCategoryBlock("Sports_Index_CSLL",lang));
             * 
             * //request.setAttribute("Sports_Other_Main_Game",sd.getMediaBlock("Sports_Other_Main_Game",lang));
             * request.setAttribute("Sports_Other_Main_Game",sd.getNewMaths(lang));
             * 
             * request.setAttribute("Sports_Index_CBA",sd.getMediaBlock("Sports_Index_CBA",lang));
             * 
             * request.setAttribute("Sports_Index_Table_Tennis",sd.getMediaBlock("Sports_Index_Table_Tennis",lang));
             * 
             * request.setAttribute("Sports_Comming_List",sd.getCommingGame("Sports_Comming_List",lang));
             */
		}finally{
			//sd.closeSession();
			SportsBD.closeSession();
		}

		return mapping.findForward(target);
	}

	public String getFunctionName() {
		// TODO Auto-generated method stub
		return null;
	}

}
