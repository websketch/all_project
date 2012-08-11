/*
 * Created on 2005-1-14
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package sample;

import java.io.Serializable;
import java.sql.SQLException;

import sample.HibernateUtil;
import net.sf.hibernate.HibernateException;
import net.sf.hibernate.ObjectNotFoundException;
import net.sf.hibernate.Session;

/**
 * @author xu geng
 * the only public class for externer to execute  four 
 * database operation (read,update,insert,delete). 
 */

public abstract class BaseDAO {
	protected Session session;
	
	/**
	 * execute update operation
	 * input parameter: instantiated mapption class,
	 *                  primary key mustn't be null
	 * @return void
	 */
	public void execute(Serializable pk) throws DAOException {
		execute(null, pk);
	}
	
	/**
	 * execute read,insert,delete operation
	 * input parameter: pk(primary key) mustn't be null
	 *                  c :if the mappting class is Demo,
	 *                  c is Demo.class 
	 * @return void
	 */
	public Object execute(Class c, Serializable pk) throws DAOException {
		Object result = null;
		try {
			session = HibernateUtil.currentSession();
			result = doExecute(c, pk);
		}catch(ObjectNotFoundException onfe){
			onfe.printStackTrace();
			return null;
		} catch (HibernateException he) {
			he.printStackTrace();
			rollback();
			throw new DAOException(he);
		} catch (SQLException se) {
			se.printStackTrace();
			rollback();
			throw new DAOException(se);
			
		}
		return result;
	}

	protected abstract Object doExecute(Class c, Serializable pk)
		throws ObjectNotFoundException, HibernateException, SQLException;

	public void closeSession() throws DAOException {
			try {
				HibernateUtil.closeSession();
			} catch (DAOException he) {
				throw new DAOException(he);
			}
	}

	protected void rollback() throws DAOException {
		try {
			if (session != null) {
				session.connection().rollback();
			}
		} catch (HibernateException he) {			
			throw new DAOException(he);
		} catch (SQLException sqle) {
			throw new DAOException(sqle);
		}
	}

}
