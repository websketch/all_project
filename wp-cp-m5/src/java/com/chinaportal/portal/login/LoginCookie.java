/*
 * Created on 2005-9-21
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.login;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class LoginCookie {
	
	private static final Log log = LogFactory.getLog(LoginCookie.class);
	public static void readCookieToSession(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//read cookie
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
		 if(MANSessionID!=null && !MANSessionID.equals("")){
		 	log.info("Read MAN SessionID from Cookie: "+MANSessionID);
		 	LoginMAN loginMAN = new LoginMAN();
		 	boolean MANSessionAvailable = loginMAN.getMANSessionAvailable(MANSessionID);
		 	log.info("MANSessionAvailable: "+MANSessionAvailable);
		 	if(MANSessionAvailable){
		 		request.getSession().setAttribute("man_session_id", MANSessionID);
		 		request.getSession().setAttribute("user_id", userId_temp);
		 		request.getSession().setAttribute("user_name", loginUserName_temp);
		 	}else{
		 		//System.out.println("set cookie");
		 		com.mediazone.util.CookieUtil.setCookie(response, "MAN", "");
				com.mediazone.util.CookieUtil.setCookie(response, "MANUser", "");
		 	}
		 }else{
		 	request.getSession().setAttribute("man_session_id", null);
	 		request.getSession().setAttribute("user_id", null);
	 		request.getSession().setAttribute("user_name", null);
		 }
		//end read cookie
	}

	public static void main(String[] args) {
	}
}
