package com.chinaportal.portal.sports;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.chinaportal.portal.base.BaseAction;
import com.chinaportal.portal.comment.CommentDAO;

public class MatchDetailAction extends BaseAction {

	public ActionForward doExecute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String target = "success";
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");
		String id=request.getParameter("id");
		String channel_id=request.getParameter("channel_id");
		MatchDetailDAO md=new MatchDetailDAO();
		try{
			MatchView mv= md.getMatchDetail(channel_id,id, lang);
			request.setAttribute("Media_Detail",mv);	
			List reviews = mv.getReviews();
			if(reviews!=null){			
				request.setAttribute("reviews", reviews);
			}
			request.setAttribute("average",mv.getLevel());
		}finally{
			md.closeSession();
		}
		
		CommentDAO commentDAO = new CommentDAO();
		String lang_id = null;		
		lang_id = lang.toString();
		List reviews = null;		
		reviews = commentDAO.query(id, lang_id);
		if(reviews!=null){			
			request.setAttribute("reviews", reviews);
		}
		
		return mapping.findForward(target);
	}

	public String getFunctionName() {
		// TODO Auto-generated method stub
		return null;
	}

}
