package com.mediazone.dao;

import java.io.InputStream;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class DataSource {

	private static javax.sql.DataSource ds = null;
	static {
		try {
			if (ds == null) {
				Context initCtx = new InitialContext();
				ds = (javax.sql.DataSource) initCtx.lookup("java:comp/env/jdbc/portal");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}


	protected Connection getConnection() throws NamingException, SQLException,
			InstantiationException, IllegalAccessException,
			ClassNotFoundException {
		return ds.getConnection();
	}

	public static DataSource getInstance() {
		return new DataSource();
	}

	public void execute(String sql, List args, Entity entity) throws Exception {
		String prefix = sql.substring(0, sql.indexOf(" "));
		if ("select".equalsIgnoreCase(prefix)
				|| "desc".equalsIgnoreCase(prefix)
				|| "show".equalsIgnoreCase(prefix)) {
			executeQuery(sql, args, entity);
		}
		if ("update".equalsIgnoreCase(prefix)
				|| "insert".equalsIgnoreCase(prefix)
				|| "delete".equalsIgnoreCase(prefix)) {
			executeUpdate(sql, args, entity);
		}
	}

	public void execute(List sqls, List argses, Entity entity) throws Exception {
		if (sqls.size() == 1) {
			execute((String) sqls.get(0), (List) argses.get(0), entity);
		} else {
			executeBatch(sqls, argses, entity);
		}
	}

	public void executeQuery(String sql, List args, Entity entity)
			throws Exception {
		Connection conn = getConnection();
		try {
			PreparedStatement statement = conn.prepareStatement(sql);
			if (args != null) {
				prepare(statement, args);
			}
			ResultSet result = statement.executeQuery();
			ResultSetMetaData md = result.getMetaData();
			int cursor = 0;
			while (result.next()) {
				for (int i = 0; i < md.getColumnCount(); i++) {
					Object obj = getResultValue(result, i + 1);
					if (obj != null) {
						entity.set(cursor, md.getColumnName(i + 1), obj);
					}
				}
				cursor++;
			}
			result.close();
			statement.close();
		} catch (Exception e) {
			throw e;
		} finally {
			conn.close();
		}
	}

	public void executeQuery(String sql, Entity entity) throws Exception {
		executeQuery(sql, null);
	}

	public void executeQuery(String sql, List args, int offset, int length,
			Entity entity) throws Exception {
		executeQuery(sql + " limit " + offset + ", " + length, args, entity);
	}

	public void executeUpdate(String sql, List args, Entity entity)
			throws Exception {
		Connection conn = getConnection();
		conn.setAutoCommit(false);
		List result = new ArrayList();
		PreparedStatement statement = null;
		int updateRows = 0;
		try {
			statement = conn.prepareStatement(sql);
			if(args!=null && args.size()>0)
				prepare(statement, args);
			updateRows = statement.executeUpdate();
			conn.commit();
			conn.setAutoCommit(true);
		} catch (Exception ex) {
			conn.rollback();
			throw ex;
		} finally {
			conn.close();
		}
	}

	public void executeBatch(List sqls, List args, Entity entity)
			throws Exception {
		Connection conn = getConnection();
		List result = new ArrayList();
		PreparedStatement statement = null;
		List updateRows = new ArrayList();
		try {
			conn.setAutoCommit(false);
			for (int i = 0; i < sqls.size(); i++) {
				statement = conn.prepareStatement((String) sqls.get(i));
				prepare(statement, (List) args.get(i));
				updateRows.add(new Integer(statement.executeUpdate()));
			}
			conn.commit();

			for (int i = 0; i < updateRows.size(); i++) {
				entity.set(i, "result", updateRows.get(i));
			}
		} catch (Exception ex) {
			conn.rollback();
			throw ex;
		} finally {
		    conn.setAutoCommit(true);
			conn.close();
		}

	}

	private void prepare(PreparedStatement statement, List args)
			throws Exception {
		for (int i = 0; i < args.size(); i++) {
			if (args.get(i) instanceof Integer) {
				Integer obj = (Integer) args.get(i);
				statement.setInt(i + 1, obj.intValue());
			} else {
				if (args.get(i) instanceof String) {
					String obj = (String) args.get(i);
					StringReader reader = new StringReader(obj);
					statement.setCharacterStream(i + 1, reader,
							obj.getBytes().length);
				} else {
					if (args.get(i) instanceof InputStream) {
						InputStream obj = (InputStream) args.get(i);
						statement.setBinaryStream(i + 1, obj, obj.available());
					} else {
						statement.setObject(i + 1, args.get(i));
					}
				}
			}
		}
	}

	private Object getResultValue(ResultSet res, int index) throws SQLException {
		ResultSetMetaData md = res.getMetaData();
		String type = md.getColumnTypeName(index);
		if (type.equalsIgnoreCase("LONG") || type.equalsIgnoreCase("LONGLONG")) {
			return new Integer(res.getInt(index));
		}else if (type.equalsIgnoreCase("VARCHAR")|| type.equalsIgnoreCase("CHAR")|| type.equalsIgnoreCase("TEXT")||type.equalsIgnoreCase("DOUBLE")) {
			return res.getString(index);
		}else if ( type.equalsIgnoreCase("DATETIME") ){
			return res.getString(index);
		}
		else {
			return res.getBinaryStream(index);
		}
	}

	public static void main(String[] args) {
	}
}
