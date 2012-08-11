package com.chinaportal.portal.detail;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.chinaportal.portal.base.BaseAction;
import com.chinaportal.portal.category.MediaView;
import com.chinaportal.portal.comment.CommentDAO;

public class DetailAction extends BaseAction {

	public ActionForward doExecute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String target = "success";
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");
		DetailDAO dd = new DetailDAO();
		String media_id=request.getParameter("media_id");				
		try {						
			MediaView mv = dd.getMediaDetail(media_id,lang);
			request.setAttribute("Media_Detail", mv);
			request.setAttribute("category_id", mv.getCategory_id());
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			dd.closeJDBCSession();
		}
		
		CommentDAO commentDAO = new CommentDAO();
		//String media_id = request.getParameter("media_id");		
		String lang_id = null;		
		lang_id = lang.toString();
		List reviews = null;		
		reviews = commentDAO.query(media_id, lang_id);
		if(reviews!=null){			
			request.setAttribute("reviews", reviews);
		}
		/*
		int ave;
		ave = CommentDAO.getAverageRateJDBC(media_id,lang_id);	
		request.setAttribute("average",Integer.toString(ave));
		*/
		return mapping.findForward(target);
	}

	public String getFunctionName() {
		// TODO Auto-generated method stub
		return null;
	}

}
