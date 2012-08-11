package com.chinaportal.portal.base;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBUtil {
	private static DataSource portalDS;

	public static Connection getConnection() {
		try {
			if (portalDS == null) {
				Context initCtx = new InitialContext();
				portalDS = (javax.sql.DataSource) initCtx
						.lookup("java:comp/env/jdbc/portal");
			}
			return portalDS.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
