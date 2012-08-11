/*
 * File   : $Source: /cvsroot/xpatrinet/wp-cp/src/java/com/chinaportal/portal/comment/CommentAction.java,v $
 * Date   : $Date: 2005/11/16 22:32:58 $
 * Version: $Revision: 1.1.2.19 $
 * Author : $Author: hhhuang $
 */
package com.chinaportal.portal.comment;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.chinaportal.portal.base.BaseAction;
import com.chinaportal.portal.login.LoginCookie;
import com.chinaportal.portal.login.LoginMAN;
import com.mediazone.bean.Review;

/**
 * @author Jason
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class CommentAction extends BaseAction 
{
	/* (non-Javadoc)
	 * @see com.chinaportal.portal.base.BaseAction#doExecute(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public ActionForward doExecute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//read cookie
		/*
		 Cookie[] cookies = request.getCookies();
		 String MAN = null;
		 String MANValue = null;
		 String MANUser = null;
		 String MANUserValue = null;
		 String loginUserName  = null;
		 String loginUserName_temp = null;
		 String userId = null;
		 String userId_temp = null;
		 String MANSessionID = null;
		 for(int i=0; cookies!=null && i<cookies.length; i++){
		 		Cookie cookie = cookies[i];
		 		if(cookie.getName()!=null && cookie.getName().trim().equals("MAN")){
		 		  MAN = cookie.getName();
		 		  MANValue = cookie.getValue();
		 		}
		 		if(cookie.getName()!=null && cookie.getName().trim().equals("MANUser")){
		 		  MANUser = cookie.getName();
		 		  MANUserValue = cookie.getValue();
		 		}
		 } 		
		 String[] MANValues = null;
		 if(MANValue!=null) MANValues = MANValue.split("&");
		 for(int i=0; MANValues!=null && i<MANValues.length; i++){
		 		String[] idValues = MANValues[i].split("=");
		 		for(int j=0; idValues!=null && j<idValues.length; j++){
		 			if(idValues[j].equals("SessionId")){
		 				MANSessionID = idValues[j+1];
		 			}
		 			if(idValues[j].equals("UserId")){
		 			  userId_temp = idValues[j+1];
		 			}
		 		}
		 }
		 String[] userValues = null;
		 if(MANUserValue!=null) userValues = MANUserValue.split("&");
		 for(int i=0; userValues!=null && i<userValues.length; i++){
		 		String[] nameValues = userValues[i].split("=");
		 		for(int j=0; nameValues!=null && j<nameValues.length; j++){
		 			if(nameValues[j].equals("Name")){
		 			  loginUserName_temp = nameValues[j+1];
		 			}
		 		}
		 }
		 if(MANSessionID!=null){
		 	boolean MANSessionAvailable = LoginMAN.getMANSessionAvailable(MANSessionID);
		 	if(MANSessionAvailable){
		 		request.getSession().setAttribute("user_id", userId_temp);
		 		request.getSession().setAttribute("user_name", loginUserName_temp);
		 	}
		 }
		 */
		//end read cookie
		
		//read Cookie use LoginCookie
		LoginCookie.readCookieToSession(request, response);
		 
		
		String actionType = request.getParameter("command");
		String roadMark = null;
		CommentForm commentForm = (CommentForm)form;		
		if(actionType!=null && actionType.equalsIgnoreCase("QUERY")){
			roadMark = this.queryProcess(request);
		}else if(actionType!=null && actionType.equalsIgnoreCase("CREATE")){
			return createProcess(mapping, request, commentForm);			
		}else if(actionType!=null && actionType.equalsIgnoreCase("PREADD")){
			roadMark = queryProcessBy(request, commentForm);			
		}else if(actionType!=null && actionType.equalsIgnoreCase("UPDATE")){
			return updateProcess(mapping, request, commentForm);			
		}
		return mapping.findForward(roadMark);
	}	
	
	
	private String queryProcess(HttpServletRequest request) throws Exception{
		String flag = null;
		String media_id = request.getParameter("media_id");		
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");
		String lang_id = lang.toString();
		List reviews = null;		
		reviews = this.getCommentDAO().query(media_id, lang_id);	
		if(reviews!=null){
			request.setAttribute("reviews", reviews);
		}
		return "query";
	}
	
	
	private String queryProcessBy(HttpServletRequest request, CommentForm commentForm) throws Exception{
		String flag = "login_forward";
		String user_id = (String)request.getSession().getAttribute("user_id");	
		if(user_id!=null && !user_id.equals("")){
			flag = "preadd";
		}else{
			return flag;
		}
		String media_id = request.getParameter("media_id");		
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");
		String lang_id = lang.toString();
		List reviews = null;		
		reviews = this.getCommentDAO().query(media_id, lang_id, user_id);	
		if(reviews!=null  && reviews.size()!=0){
			request.setAttribute("reviews", reviews);
			Review review = (Review) reviews.get(0);
			commentForm.setContent(review.getContent());
			commentForm.setTitle(review.getTitle());
			commentForm.setRating(review.getRating());
		}
		Integer mediaInt = Integer.valueOf(media_id);
		String media_name = getCommentDAO().getMediaName(mediaInt, lang);	
		request.setAttribute("media_name",media_name);
		request.setAttribute("media_id",media_id);			
		return flag;
	}
	
	
	private ActionForward createProcess(ActionMapping mapping, HttpServletRequest request, CommentForm form) throws Exception{
		String flag = null;
		ActionForward af = new ActionForward();
		String user_id = (String)request.getSession().getAttribute("user_id");	
		if(user_id==null || (user_id!=null && user_id.equals(""))){
			flag = "login_forward";
			af.setPath(mapping.findForward(flag).getPath());
			return af;
		}
		String media_id = form.getMedia_id().toString();		
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");			
		//user_id = "123456";		
		Review review = new Review();		
		review.setLangId(lang);
		review.setContent(form.getContent());
		review.setUserId(user_id);
		review.setRating(form.getRating());
		review.setMediaId(form.getMedia_id());
		//System.out.print(form.getMedia_id());
		review.setReviewTime(new Date());
		review.setTitle(form.getTitle());		
		this.getCommentDAO().create(review);	
		af.setPath(mapping.findForward("success").getPath()+ "?media_id="	+ media_id);
		af.setRedirect(true);		
		return af;		
		//request.setAttribute("mediaIdComment", media_id);
		//return flag="success";
	}
	
	
	private ActionForward updateProcess(ActionMapping mapping, HttpServletRequest request, CommentForm form) throws Exception{
		String flag = null;
		ActionForward af = new ActionForward();
		String user_id = (String)request.getSession().getAttribute("user_id");	
		if(user_id==null || (user_id!=null && user_id.equals(""))){
			flag = "login_forward";
			af.setPath(mapping.findForward(flag).getPath());
			return af;
		}
		String media_id = form.getMedia_id().toString();		
		Integer lang=(Integer)request.getSession().getAttribute("chinaportal.local");	
		String lang_id = lang.toString();
		//String user_id = "123456";		
		Review review = null;
		List reviews = null;		
		reviews = this.getCommentDAO().query(media_id, lang_id, user_id);	
		if(reviews!=null && reviews.size()!=0){
			review = (Review) reviews.get(0);
		}						
		review.setContent(form.getContent());
		//review.setUser_id(user_id);
		review.setRating(form.getRating());
		//review.setMedia_id(form.getMedia_id());
		//System.out.print(form.getMedia_id());
		review.setReviewTime(new Date());
		review.setTitle(form.getTitle());		
		this.getCommentDAO().update(review);	
		af.setPath(mapping.findForward("success").getPath()+ "?media_id="	+ media_id);
		af.setRedirect(true);		
		return af;		
		//request.setAttribute("mediaIdComment", media_id);
		//return flag="success";
	}		
			
	
	private CommentDAO getCommentDAO(){
		CommentDAO commentDAO = null;
		if(commentDAO==null){
			commentDAO = new CommentDAO();
		}
		return commentDAO;
	}
	
	public String getFunctionName() {
		// TODO Auto-generated method stub
		return null;
	}
}
