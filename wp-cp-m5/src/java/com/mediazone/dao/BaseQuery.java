/*
 * Created on 2005-1-14
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.mediazone.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Properties;

import javax.naming.InitialContext;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;

import com.mediazone.util.HibernateUtil;
/**
 * @author xu geng
 * provide query function, you can extends it 
 * to implements your query
 */

public class BaseQuery {
	protected static javax.sql.DataSource ds = null;
	static {
		try {
			InitialContext initCtx = new InitialContext();
				ds = (javax.sql.DataSource) initCtx.lookup("java:comp/env/jdbc/portal");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	protected Connection con=null;
	protected PreparedStatement ps;
	protected ResultSet rs;

	protected Session session;

	private int pageNo;
	private int pageSize;
	private int totalPage;
	private int totalRow;

	private void setParameters(PreparedStatement ps, List conditions)
		throws SQLException {
		for (int i = 0; i < conditions.size(); i++) {
			Object o = conditions.get(i);
			if (o instanceof Date)
				ps.setDate(i + 1, (Date) o);
			else
				ps.setString(i + 1, (String) conditions.get(i));
		}
	}
	public ResultSet executeJDBCQuery(String sql) throws DAOException {
		return executeJDBCQuery(sql, null, null);
	}

	public ResultSet executeJDBCQuery(String sql, List conditions)
		throws DAOException {
		return executeJDBCQuery(sql, null, conditions);
	}
	
	public ResultSet executeJDBCQuery(
		String sql,
		String pageno,
		List conditions)
		throws DAOException {
		try {
			if(con==null || con.isClosed())
				con=ds.getConnection();
			if (pageno != null) {
				String sqlcount =
					"select distinct count(*) as tolrecord "
						+ sql.substring(sql.indexOf("from "));
				ps = con.prepareStatement(sqlcount);
				if (null != conditions)
					setParameters(ps, conditions);
				rs = ps.executeQuery();
				if (rs.next())
					setTotalRow(rs.getInt("tolrecord"));

				int int_page = Integer.parseInt(pageno);
				if (int_page > getTotalPage())
					int_page = getTotalPage();
				setPageNo(int_page);
			}

			if (this.totalRow>0 && pageno != null) {
				sql += " limit " + (pageNo - 1) * pageSize + "," + pageSize;
			}
			ps = con.prepareStatement(sql);
			if (null != conditions)
				setParameters(ps, conditions);
			if (conditions != null) {
				setParameters(ps, conditions);
			}
			rs = ps.executeQuery();
		} catch (Exception se) {
			throw new DAOException(se);
		}
		return rs;
	}
	public void closeJDBCSession() throws DAOException {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();			
			if(con!=null && !con.isClosed())
				con.close();
		} catch (SQLException se) {
			throw new DAOException(se);
		}
	}
	
	public List executeQuery(String hql) throws DAOException {
		return executeQuery(hql, null, null);
	}
	public List executeQuery(String hql, String pageno) throws DAOException {
		return executeQuery(hql, pageno, null);
	}
	public List executeQuery(String hql, Properties conditions)
		throws DAOException {
		return executeQuery(hql, null, conditions);
	}

	public List executeQuery(String hql, String pageno, Properties conditions)
		throws DAOException {
		List resultList = new ArrayList();
		try {
			session = HibernateUtil.currentSession();
			if (pageno != null) {
				String hqlcount =
					"select distinct count(*) "
						+ hql.substring(hql.indexOf("from "));
				Query queryCount = session.createQuery(hqlcount);
				queryCount.setCacheable(true);
				setQueryPage(queryCount);
				if (conditions != null)
					setParameters(queryCount, conditions);

				List list = queryCount.list();
				if (list != null && list.size()!=0) {
					ListIterator liter = list.listIterator();
					setTotalRow(((Integer) liter.next()).intValue());
				}
				int int_page = Integer.parseInt(pageno);
				if (int_page > getTotalPage())
					int_page = getTotalPage();
				setPageNo(int_page);
			}

			Query query = session.createQuery(hql);
			query.setCacheable(true);
			if (pageno != null)
				setQueryPage(query);
			if (conditions != null) {
				setParameters(query, conditions);
			}
			Iterator iter = query.iterate();
			Object object = null;
			for (; iter.hasNext(); resultList.add(object))
				object = (Object) iter.next();
		} catch (HibernateException he) {
			he.printStackTrace();
			throw new DAOException(he);
		}
		if (0 == resultList.size())
			return null;
		return resultList;
	}

	public void executeJDBC(String sql)
	{
		try {
			if(con==null || con.isClosed())
				con=ds.getConnection();
			ps = con.prepareStatement(sql);
			ps.execute();
			ps.close();
		} catch (Exception se) {
			se.printStackTrace();
		}
	}
	
	public void closeSession() throws DAOException {
		try {
			HibernateUtil.closeSession();
			session = null;
		} catch (DAOException he) {
			throw new DAOException(he);
		}
	}

	public BaseQuery() {
		pageSize = 6;
		pageNo = 1;
		totalRow = 0;
		totalPage = 1;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getTotalPage() {
		return ((totalRow + pageSize) - 1) / pageSize;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setPageSize(int i) {
		pageSize = i;
	}

	protected void setQueryPage(Query query) {
		query.setFirstResult((pageNo - 1) * pageSize);
		query.setMaxResults(pageSize);
	}
	private void setParameters(Query query, Properties conditions) {
		if (conditions != null) {
			Enumeration names = conditions.propertyNames();
			String name = null;
			while (names.hasMoreElements()) {
				name = (String) names.nextElement();
				Object o = conditions.get(name);
				if (o instanceof Integer)
					query.setInteger(name, ((Integer) o).intValue());
				else if (o instanceof Date)
					query.setDate(name, (Date) o);
				else
					query.setString(name, conditions.getProperty(name));
			}
		}
	}

	protected void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	protected void setPageNo(int i) {
		pageNo = i;
	}

	protected void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public void execJDBCQuery(
		String sql,
		String pageno,
		List conditions)
		throws DAOException {
		try {
			if(con==null ||con.isClosed());
				con=ds.getConnection();
			if (pageno != null) {
				String sqlcount =
					"select distinct count(*) as tolrecord "
						+ sql.substring(sql.indexOf("from "));
				ps = con.prepareStatement(sqlcount);
				if (null != conditions)
					setParameters(ps, conditions);
				rs = ps.executeQuery();
				if (rs.next())
					setTotalRow(rs.getInt("tolrecord"));

				int int_page = Integer.parseInt(pageno);
				if (int_page > getTotalPage())
					int_page = getTotalPage();
				setPageNo(int_page);
			}

			if (this.totalRow>0 && pageno != null) {
				sql += " limit " + (pageNo - 1) * pageSize + "," + pageSize;
			}
			ps = con.prepareStatement(sql);
			if (null != conditions)
				setParameters(ps, conditions);
			if (conditions != null) {
				setParameters(ps, conditions);
			}
			rs = ps.executeQuery();
		} catch (Exception se) {
			throw new DAOException(se);
		}
	}
	
	public void close() throws DAOException {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();	
			if(con!=null && !con.isClosed())
				con.close();
		} catch (SQLException se) {
			throw new DAOException(se);
		}
	}

}
