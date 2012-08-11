/*
 * Created on 2005-1-14
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.mediazone.dao;

import java.io.Serializable;
import java.sql.SQLException;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.ObjectNotFoundException;

/**
 * @author Administrator
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class ReadDAO extends BaseDAO {

	/* (non-Javadoc)
	 * @see com.mediazone.dao.BaseDAO#doExecute(java.lang.Class, java.io.Serializable)
	 */
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
