/*
 * Created on 2005-1-14
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.chinaportal.portal.aol;

import java.io.Serializable;
import java.sql.SQLException;

import com.mediazone.util.HibernateUtil;

import net.sf.hibernate.HibernateException;

/**
 * @author Administrator
 * 
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class InsertDAO extends BaseDAO
{
    protected Object doExecute( Class c, Serializable pk ) throws HibernateException, SQLException
    {
        Object result;
        try
        {
            // ;
            // System.out.println("result:"+(result=session.save(pk)));
            result = session.save(pk);
            session.flush();
            if ( !session.connection().getAutoCommit() )
                session.connection().commit();
        }
        catch ( HibernateException he )
        {
            throw he;
        }
        catch ( SQLException se )
        {
            throw se;
        }
        return result;//new Boolean(true);
    }

    public Object doExecuteValue( Class c, Serializable pk ) throws HibernateException, SQLException
    {
        Object result;
        try
        {
            // ;
            session = HibernateUtil.currentSession();
            result = session.save(pk);
            // System.out.println("result:"+(result=session.save(pk)));

            session.flush();
            if ( !session.connection().getAutoCommit() )
                session.connection().commit();
        }
        catch ( HibernateException he )
        {
            throw he;
        }
        catch ( SQLException se )
        {
            throw se;
        }
        return result;
    }
}
