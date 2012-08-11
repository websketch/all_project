/*
 * Created on 2005-1-14
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.mediazone.dao;

import java.io.Serializable;
import java.sql.SQLException;

import com.mediazone.util.HibernateUtil;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.ObjectNotFoundException;
import net.sf.hibernate.Session;
/**
 * @author Administrator
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public abstract class BaseDAO {
	protected Session session;


	public Object execute(Class c, Serializable pk) throws DAOException {
		Object result = null;
		try {
			session = HibernateUtil.currentSession();
			result = doExecute(c, pk);
		}catch(ObjectNotFoundException onfe){
			return null;
		} catch (HibernateException he) {
			rollback();
			throw new DAOException(he);
		} catch (SQLException se) {
			rollback();
			throw new DAOException(se);
		}
		return result;
	}

	protected abstract Object doExecute(Class c, Serializable pk)
		throws ObjectNotFoundException, HibernateException, SQLException;

	public void closeSession() throws DAOException {
		if (session != null) {
			try {
				session.close();
			} catch (HibernateException he) {
				throw new DAOException(he);
			}
		}
	}

	protected void rollback() throws DAOException {
		try {
			if (session != null) {
				session.connection().rollback();
			}
		} catch (HibernateException he) {
			he.printStackTrace();
			throw new DAOException(he);
		} catch (SQLException sqle) {
			throw new DAOException(sqle);
		}
	}

}
