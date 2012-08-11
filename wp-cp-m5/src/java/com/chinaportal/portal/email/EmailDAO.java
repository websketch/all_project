/*
 * Created on 2005-8-25
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.email;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import net.sf.hibernate.HibernateException;
import net.sf.hibernate.Query;
import net.sf.hibernate.Session;
import net.sf.hibernate.Transaction;

import com.mediazone.bean.MailList;
import com.mediazone.dao.DAOException;
import com.mediazone.util.HibernateUtil;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class EmailDAO {
	
	public void create(MailList mail_list) throws DAOException {
		Session session = null;;
		Transaction transaction = null;
		try{
			session = HibernateUtil.currentSession();
			transaction = session.beginTransaction();
			session.save(mail_list);
			transaction.commit();
		}catch(HibernateException he){
			throw new DAOException(he);
		}finally{
			HibernateUtil.closeSession();
		}
	}
	
	public void update(MailList mail_list) throws DAOException {
		Session session = null;;
		Transaction transaction = null;
		try{
			session = HibernateUtil.currentSession();
			transaction = session.beginTransaction();
			MailList temp =new MailList();
			temp.setEmail(mail_list.getEmail());
			temp.setLangId(mail_list.getLangId());
			session.load(MailList.class, temp);
			temp.setStatus(mail_list.getStatus());
			temp.setUpdateTime(mail_list.getUpdateTime());
			session.update(temp);
			session.flush();
			transaction.commit();
		}catch(HibernateException he){
			throw new DAOException(he);
		}finally{
			HibernateUtil.closeSession();
		}
	}
	
	public void saveOrUpdate(MailList mail_list) throws DAOException {
		Session session = null;
		Transaction transaction = null;
		try{
			session = HibernateUtil.currentSession();
			transaction = session.beginTransaction();
			session.saveOrUpdate(mail_list);
			transaction.commit();
		}catch(HibernateException he){
			throw new DAOException(he);
		}finally{
			HibernateUtil.closeSession();
		}
	}
	
	public List queryById(String email, Integer lang_id) throws DAOException {
		List list = null;
		Session session = null;
		String hql = "select mail from MailList as mail where mail.email=:email and mail.langId=:lang_id ";
		try{
			session = HibernateUtil.currentSession();
			Query query = session.createQuery(hql);
			query.setString("email", email);
			query.setInteger("lang_id", lang_id.intValue());
			list = query.list();
		}catch (HibernateException he){
			throw new DAOException(he);
		}finally{
			HibernateUtil.closeSession();
		}
		return list;
	}
	
	
	/**
	 * Update the table of mail_list and user , make statuts be not available. This method use JDBC API.
	 * @param email
	 * @param lang_id
	 * @throws DAOException
	 */
	public void updateForUnsubscribe(String email, Integer lang_id) throws DAOException {
		String sql_mail_list="update  mail_list set status=0, update_time=? where email='"+email+"'";
		String sql_user="update user set status=0 where login_name='"+email+"'";
		Session session = null;
		Connection con = null;
		PreparedStatement stmt_mail_list = null;
		PreparedStatement stmt_user = null;
		try{
			session = HibernateUtil.currentSession();
			con = session.connection();
			con.setAutoCommit(false);
			stmt_mail_list = con.prepareStatement(sql_mail_list);
			stmt_mail_list.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
			stmt_mail_list.executeUpdate();
			stmt_user = con.prepareStatement(sql_user);
			stmt_user.executeUpdate();
			con.commit();
		}catch (HibernateException he){
			throw new DAOException(he);
		}catch (SQLException ex){
			try{
				con.rollback();
			}catch(SQLException rollEx){
				throw new DAOException(rollEx);
			}
			throw new DAOException(ex);
		}
		finally{
			try{
				session.disconnect();
			}catch(HibernateException he){
				throw new DAOException(he);
			}
			
		HibernateUtil.closeSession();
		}
		
		
		
	}

}
