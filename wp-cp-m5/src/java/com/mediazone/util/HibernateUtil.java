/*
 * Created on 2005-1-5
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.mediazone.util;

/**
 * @author Administrator
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */

import com.mediazone.dao.DAOException;

import net.sf.hibernate.*;
import net.sf.hibernate.cfg.*;


public class HibernateUtil {
	private static final SessionFactory sessionFactory;

	 static {
		 try {
			 sessionFactory = new Configuration().configure().buildSessionFactory();
		 } catch (HibernateException ex) {
		 	ex.printStackTrace();
			 throw new RuntimeException("Exception building SessionFactory: " + ex.getMessage(), ex);
		 }
	 }

	 public static final ThreadLocal session = new ThreadLocal();

	 public static Session currentSession() throws HibernateException {
	 	 Session s = (Session) session.get();
		 // Open a new Session, if this Thread has none yet
		 if (s == null) {
			 s = sessionFactory.openSession();
			 session.set(s);
		 }
		 else if(!s.isConnected()){
		 	s.reconnect();
		 }
		 return s;
	 }

	 public static void closeSession() throws DAOException {
		 Session s = (Session) session.get();
		 session.set(null);
		 if(s != null) {
			try {
				s.close();
			}
			catch (HibernateException he) {
				throw new DAOException(he);
			}
			finally {
				s = null;				
			}
		}
	 }
 }