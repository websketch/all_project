/*
 * Created on 2005-9-20
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.login;

import java.io.IOException;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.util.Enumeration;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jdom.Document;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import com.mediazone.bean.User;
import com.mediazone.dao.DAOException;
import com.mediazone.exception.ServiceException;
import com.mediazone.man.UserInfoTransaction;
import com.mediazone.man.bean.ManResponseBean;
import com.mediazone.util.Common;
import com.mediazone.util.DBUtil;
import com.mediazone.util.TimeUtil;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class LoginMAN {
	
	private static final Log log = LogFactory.getLog(LoginMAN.class);
	
	
	public User getMANUserInfo(String userId) throws Exception {
		User user = new User();
		UserInfoTransaction userInfoTransaction = new UserInfoTransaction();
		String userInfo = userInfoTransaction.getUserInfo(userId);
		SAXBuilder parser = new SAXBuilder();
		Document document = null;
		try {
			document = parser.build(new StringReader(userInfo));
		} catch (JDOMException e) {
			log.error("getMANUserInfo jdom document parse error! " + e.getMessage());
		} catch (IOException e) {
			log.error("getMANUserInfo jdom document parse io error! " + e.getMessage());
		}
		String MANCrmId = document.getRootElement().getAttributeValue("CrmId");
		String MANEmail = document.getRootElement().getAttributeValue("Email");
		String MANUserId = document.getRootElement().getAttributeValue("UserId");
		String MANName = document.getRootElement().getAttributeValue("Name");
		String MANEmailNotify = document.getRootElement().getAttributeValue("EmailNotify");
		user.setLoginName(MANEmail);
		user.setManUserId(MANUserId);
		user.setName(MANName);
		if(MANEmailNotify.equals("on")){
			user.setStatus(new Integer(1));
		}else{
			user.setStatus(new Integer(0));
		}
		return user;
		
	}
	
	public void synchronizeUserInfo(String userId) throws Exception{
		User user = this.getMANUserInfo(userId);
		Connection conn = null;
		PreparedStatement pstmt_user = null;
		PreparedStatement pstmt_mail_list = null;
		String sql_user = "update user set login_name=?, name=?, status=? where MAN_USER_ID=?";
		String sql_mail_list = "update mail_list set status=? where email=?";
		try{
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			pstmt_user = conn.prepareStatement(sql_user);
			pstmt_user.setString(1, user.getLoginName());
			pstmt_user.setString(2, user.getName());
			pstmt_user.setInt(3, user.getStatus().intValue());
			pstmt_user.setString(4, user.getManUserId());
			if(pstmt_user.executeUpdate()==0){
				pstmt_user.close();
				sql_user="insert into user(login_name,name,status,MAN_USER_ID) values(?,?,?,?)";
				pstmt_user = conn.prepareStatement(sql_user);
				pstmt_user.setString(1, user.getLoginName());
				pstmt_user.setString(2, user.getName());
				pstmt_user.setInt(3, user.getStatus().intValue());
				pstmt_user.setString(4, user.getManUserId());
				pstmt_user.executeUpdate();
			}			
			pstmt_mail_list = conn.prepareStatement(sql_mail_list);
			pstmt_mail_list.setString(1, user.getStatus().toString());
			pstmt_mail_list.setString(2, user.getLoginName());
			if(pstmt_mail_list.executeUpdate()==0){
				pstmt_mail_list.close();
				sql_mail_list = "insert into mail_list(status, email) values(?,?)";
				pstmt_mail_list = conn.prepareStatement(sql_mail_list);
				pstmt_mail_list.setString(1, user.getStatus().toString());
				pstmt_mail_list.setString(2, user.getLoginName());
				pstmt_mail_list.executeUpdate();
			}
		}catch(ServiceException se){
			log.error("synchronizeUserInfo, JDBC connection exception! "+se.getErrorCode());
		}catch(SQLException se){
			log.error("synchronizeUserInfo error!" + se);
			//conn.rollback();
			throw new DAOException(se);
		}finally{
			DBUtil.close(pstmt_user);
			DBUtil.close(pstmt_mail_list);
			conn.setAutoCommit(true);
			DBUtil.closeConnection(conn);
		}
	}
	
	public boolean getMANSessionAvailable(String sessionId) throws Exception{
		boolean MANSessionAvailable = false;
		//int timeDiffer = -8;
		String timeDiffer_str = Common.manResources.getString("timeDiffer").trim();
		int timeDiffer = Integer.parseInt(timeDiffer_str);
		UserInfoTransaction userInfoTransaction = new UserInfoTransaction();
		String sessionInfo = userInfoTransaction.getUserSession(sessionId);
		if(sessionInfo==null || (sessionInfo!=null&&sessionInfo.equals(""))){
			//System.out.println("man sessionInfo is space");
			return MANSessionAvailable = false;
		}
		//log.info("MANsessionInfo: "+sessionInfo);
		SAXBuilder parser = new SAXBuilder();
		Document document = null;
		try {
			document = parser.build(new StringReader(sessionInfo));
		} catch (JDOMException e) {
			log.error("getMANSessionAvailable jdom document parse error! " + e.getMessage());
		} catch (IOException e) {
			log.error("getMANSessionAvailable jdom document parse io error! " + e.getMessage());
		}
		String createTime = document.getRootElement().getAttributeValue("CreateTime");
		String expTime = document.getRootElement().getAttributeValue("ExpTime");
		Date createTime_date = null;
		try {
			createTime_date = TimeUtil.MANDateWithTime.parse(createTime);
		} catch (ParseException e1) {
			log.error("createTime_date parse error! " + createTime);
		}
		Date expTime_date = null;
		try {
			expTime_date = TimeUtil.MANDateWithTime.parse(expTime);
		} catch (ParseException e2) {
			log.error("expTime_date parse error! " + expTime);
		}
		Date now = new Timestamp(System.currentTimeMillis() - timeDiffer*60*60*1000 + 60*1000);
		log.info("now - timediffer  " + now);
		log.info("MAN session createTime_date " + createTime_date);
		log.info("MAN session expTime_date " + expTime_date);
		if(!createTime_date.after(now) && expTime_date.after(now)){
			MANSessionAvailable = true;
		}
		return MANSessionAvailable;
	//	return true;
	}
	
	
	public boolean isPermissionAdress(String ip) throws Exception{
		boolean permission = false;
		Enumeration enumeration = Common.ipResourceBundle.getKeys();
		while(enumeration.hasMoreElements()){
			String key = (String)enumeration.nextElement();
			if(ip.equals(key)){
				return permission = true;
			}
		}
		UserInfoTransaction userInfoTransaction = new UserInfoTransaction();
		String userIpinfo = userInfoTransaction.getUserIpInfo(ip);
		log.info("userIpinfo: " + userIpinfo);
		SAXBuilder parser = new SAXBuilder();
		Document document = null;
		try {
			document = parser.build(new StringReader(userIpinfo));
		} catch (JDOMException e) {
			log.error("getMANUserInfo jdom document parse error! " + e.getMessage());
		} catch (IOException e) {
			log.error("getMANUserInfo jdom document parse io error! " + e.getMessage());
		}
		String countryCode = document.getRootElement().getAttributeValue("CountryCode");
		log.info("countryCode: " + countryCode);
		if("CN".equalsIgnoreCase(countryCode)){
			permission = false;
		}else{
			permission = true;
		}
		return permission;
	}
	
	
	public String getCountryCode(String ip) throws Exception{
		String countryCode = null;
		UserInfoTransaction userInfoTransaction = new UserInfoTransaction();
		String userIpinfo = userInfoTransaction.getUserIpInfo(ip);
		log.info("userIpinfo: " + userIpinfo);
		SAXBuilder parser = new SAXBuilder();
		Document document = null;
		try {
			document = parser.build(new StringReader(userIpinfo));
		} catch (JDOMException e) {
			log.error("getMANUserInfo jdom document parse error! " + e.getMessage());
		} catch (IOException e) {
			log.error("getMANUserInfo jdom document parse io error! " + e.getMessage());
		}
		countryCode = document.getRootElement().getAttributeValue("CountryCode");
		log.info("countryCode: " + countryCode);
		return countryCode;
	}
	
	
	
	public static void main(String[] args) {
		System.currentTimeMillis();
		System.out.println(System.currentTimeMillis());
		System.out.println(new Date());
		System.out.println(new Timestamp(System.currentTimeMillis()));
		System.out.println(new Timestamp(System.currentTimeMillis() + 8*60*60*1000));
		Date now = new Timestamp(System.currentTimeMillis() + 8*60*60*1000);
		System.out.println(now);
	}

}
