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
import net.sf.hibernate.ObjectNotFoundException;

/**
 * @author xu geng
 * provide read one record function
 */
public final class ReadDAO extends BaseDAO {

	protected Object doExecute(Class c, Serializable pk)
		throws ObjectNotFoundException,HibernateException, SQLException {
			try {
				Object obj = session.load(c, pk);
				return obj;
			}catch(ObjectNotFoundException onfe){
				throw onfe;
			} catch (HibernateException he) {
				throw he;
			}
	}

}
