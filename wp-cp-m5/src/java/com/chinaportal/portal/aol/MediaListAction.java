package com.chinaportal.portal.aol;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.chinaportal.portal.search.SearchForm;

public class MediaListAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Integer lang = (Integer) request.getSession().getAttribute("chinaportal.local");
		if (null == lang) {
			lang = new Integer(2);
		}// Default lang = ZH_CN

		//Initialize
		String key     = request.getParameter("key");
		String curpage = request.getParameter("curpage");
		String add     = request.getParameter("add");
		String remove  = request.getParameter("remove");
		Set  selection = (Set) request.getSession().getAttribute("selection");
		if (null == selection) {
			selection = new HashSet();
			request.getSession().setAttribute("selection", selection);
		}
		List mediaList = (List)request.getSession().getAttribute("mediaList");
		if (null == mediaList) {
			mediaList = new ArrayList();
			request.getSession().setAttribute("mediaList", mediaList);
		}
		SearchForm pageInfo = (SearchForm)request.getSession().getAttribute("pageInfo");;
		if (null == pageInfo) {
			pageInfo = new SearchForm();
			request.getSession().setAttribute("pageInfo", pageInfo);
			pageInfo.setTolpage("0");
			pageInfo.setCurpage("0");
			pageInfo.setTolrow("0");
			pageInfo.setPrepage("0");
			pageInfo.setNextpage("0");
		}

		//Action
		if (null != key) {//Key [& Page]
			if (null == curpage)
				curpage = "1";
			getListPage(lang, curpage, key, request);
			mediaList = (List)request.getSession().getAttribute("mediaList");
		} else if (null != curpage) {//Page
			if (null != pageInfo) {
				key = pageInfo.getKey();
				getListPage(lang, curpage, key, request);
				mediaList = (List)request.getSession().getAttribute("mediaList");
			}
		} else if (null != add) {//Add to selection
			if ("all".equalsIgnoreCase(add)) {//Add all
				for (Iterator iter = mediaList.iterator(); iter.hasNext();) {
					ChildMedia mv = (ChildMedia) iter.next();
					selection.add(mv.getId());
				}
			} else {//Add media
				selection.add(add);
			}
		} else if (null != remove) {//Remove from selection
			if ("all".equalsIgnoreCase(remove)) {//Remove all
				for (Iterator iter = mediaList.iterator(); iter.hasNext();) {
					ChildMedia mv = (ChildMedia) iter.next();
					selection.remove(mv.getId());
				}
			} else if ("selection".equalsIgnoreCase(remove)) {//Remove all selection
				selection.clear();
			} else {//Remove media
				selection.remove(remove);
			}
		}
		
		//Mark selection
		for (int i = 0; i < mediaList.size(); ++i) {
			ChildMedia mv = (ChildMedia)mediaList.get(i);
			mv.setSelected(selection.contains(mv.getId()));
		}

		return mapping.findForward("success");
	}
	
	private void getListPage(Integer lang, String curpage, String key, HttpServletRequest request) {
		MediaListDAO md = new MediaListDAO();
		List mediaList = md.getMediaList(lang, curpage, key);
		if (null != mediaList) {
			request.getSession().setAttribute("mediaList", mediaList);
			SearchForm pageInfo = (SearchForm)request.getSession().getAttribute("pageInfo");;
			pageInfo.setKey(key);
			pageInfo.setTolpage(md.getTotalPage() + "");
			pageInfo.setCurpage(md.getPageNo() + "");
			pageInfo.setTolrow(md.getTotalRow() + "");
			if (curpage.equals("1"))
				pageInfo.setPrepage("1");
			else
				pageInfo.setPrepage((md.getPageNo() - 1) + "");

			if (md.getTotalPage() == 1)
				pageInfo.setNextpage(pageInfo.getTolpage());
			else
				pageInfo.setNextpage((md.getPageNo() + 1) + "");
		}
	}

}
