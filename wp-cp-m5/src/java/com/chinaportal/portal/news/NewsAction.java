/*
 * Created on 2005-7-26
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.news;

import java.util.List;

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
public class NewsAction extends BaseAction {

	/* (non-Javadoc)
	 * @see com.chinaportal.portal.base.BaseAction#doExecute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ActionForward doExecute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String target = "news_list";
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");
		String release = request.getParameter("release");
		int pageSize = 50;
		NewsForm newsForm = (NewsForm)form;
		String tar = newsForm.getTar();
		newsForm.setTar(tar);
		String curPage = newsForm.getCurpage();
		if(null==curPage)
			curPage="1";
		List newsList = null;
		NewsDAO newsDAO = new  NewsDAO();
		if(tar!=null && tar.equals("sports")){
			target="news_list_sports";
			if("0".equals(release)){
				newsList = newsDAO.queryNewsByTypeIncludeNoRelease(new Integer(2), lang, curPage, pageSize);
			}else{
				newsList = newsDAO.queryNewsByType(new Integer(2), lang, curPage, pageSize);
			}
		}else{
			if("0".equals(release)){
				newsList = newsDAO.queryNewsByTypeIncludeNoRelease(new Integer(1), lang, curPage, pageSize);
			}else{
				newsList = newsDAO.queryNewsByType(new Integer(1), lang, curPage, pageSize);
			}
		}
		if(newsList!=null){
			request.setAttribute("news_list", newsList);
			newsForm.setCurpage(Integer.toString(newsDAO.getPageNo()));
			newsForm.setTolpage(Integer.toString(newsDAO.getTotalPage()));
			newsForm.setTolrow(Integer.toString(newsDAO.getTotalRow()));
			if(curPage.equals("1")){
				newsForm.setPrepage("1");
			}else{
				newsForm.setPrepage(Integer.toString(newsDAO.getPageNo()-1));
			}
			if(newsDAO.getTotalPage()==1){
				newsForm.setNextpage(Integer.toString(newsDAO.getTotalPage()));
			}else{
				newsForm.setNextpage(Integer.toString(newsDAO.getPageNo()+1));
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
