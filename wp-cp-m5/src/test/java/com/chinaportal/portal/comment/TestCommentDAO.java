/*
 * File   : $Source: /cvsroot/xpatrinet/wp-cp/src/test/java/com/chinaportal/portal/comment/Attic/TestCommentDAO.java,v $
 * Date   : $Date: 2005/11/16 22:48:17 $
 * Version: $Revision: 1.1.2.5 $
 * Author : $Author: hhhuang $
 */
package com.chinaportal.portal.comment;

import junit.extensions.TestSetup;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import com.chinaportal.portal.comment.CommentDAO;
import com.mediazone.bean.Review;


/**
 * @author Jason
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class TestCommentDAO extends TestCase {
	
	private static CommentDAO cdao;
	private static Review review;
	
    public TestCommentDAO(String arg0) {
        super(arg0);
    }
    
    /*
     * Test suite for this test class.<p>
     * 
     * @return the test suite
     */
    public static Test suite() {
        
        TestSuite suite = new TestSuite();
        suite.setName(TestCommentDAO.class.getName());
             
        suite.addTest(new TestCommentDAO("test comment data access object....starting"));
         
        TestSetup wrapper = new TestSetup(suite) {
            
            protected void setUp() {
            	cdao = new CommentDAO();
            	review = new Review();
             	review.setLangId(new Integer(2));
            	review.setMediaId(new Integer(2));
            	review.setCategoryId(new Integer(2));
            	review.setTitle("GOOD");
            	review.setContent("THIS IS A GOOG MEADIA!");
            	review.setRating("5");
            }
            
            protected void tearDown() {
            	if ( cdao == null) cdao = null;
            	if ( review == null ) review = null; 
            }
        };
        
        return wrapper;
    }
    
    /*
    public void testCreate()
    {
    	cdao.create( review );    	
    }
    */
    
   // add by Bily 
	protected void setUp() {

	}

	public void testCreate() {

		

		try {
			Review review = new Review();
			CommentDAO commentDAO = new CommentDAO();	
			commentDAO.create(review);
			//boolean b = false;
			//assertTrue(b);
			//throw new Exception("This is a test.");
			// Assert.fail( "Unable point."); //不可能到达
		} catch (Exception e) {
			fail("Yes, I catch u"); //应该到达点
		}

	}

	protected void tearDown() {

	}

	public static void main(String[] args) {
	}    
}
