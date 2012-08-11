/*
 * Created on 2005-9-13
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.mediazone.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.mediazone.exception.ServiceException;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class DBUtil {
	
	private static final Log log = LogFactory.getLog(DBUtil.class);
	
	public static Connection getConnection() throws ServiceException {
		Connection con = null;
		try{
			Context initCtx = new InitialContext();
			DataSource ds =  (DataSource)initCtx.lookup("java:comp/env/jdbc/portal");
			con = ds.getConnection();
			if(con==null || con.isClosed()){
				log.error("$$$$$$Connection out of time, connection hava already called back!");
			}
		}catch(NamingException ne){
			log.error("$$$$$$Datasource Naming error!" + ne);
			throw new ServiceException("err.service.jndi");
		}catch(SQLException se){
			log.error("$$$$$$Connection out of time, can not get a connection! " + se);
			throw new ServiceException("err.service.connection");
		}
		return con;
	}
	
	public static void closeConnection(Connection con) {
		try {
			if (con != null && con.isClosed() == false) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			log.error("$$$$$$Close Connection Error：" + e);
		} finally {
			con = null;
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException se) {
			log.error(" $$$$$$ Close Statement Error : " + se.getMessage());
			se.printStackTrace();
		}
	}
	
	public static void close(PreparedStatement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException se) {
			log.error("$$$$$$ Close PreparedStatement Error : "
					+ se.getMessage());
			se.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException se) {
			se.printStackTrace();
			log.error(" $$$$$$Close ResultSet Error : " + se.getMessage());
		}

	}

	
	
	

}
