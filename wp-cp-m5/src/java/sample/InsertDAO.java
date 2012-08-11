/*
 * Created on 2005-1-14
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package sample;

import java.io.Serializable;
import java.sql.SQLException;

import net.sf.hibernate.HibernateException;
/**
 * @author xu geng
 * provied insert function
 */
public class InsertDAO extends BaseDAO{
	protected Object doExecute(Class c, Serializable pk)
		throws HibernateException, SQLException {
			try {
				session.save(pk);
				session.flush();
				session.connection().commit();
			} catch (HibernateException he) {
				throw he;
			} catch (SQLException se) {
				throw se;
			}
			return new Boolean(true);
	}
}
