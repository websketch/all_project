/*
 * File   : $Source: /cvsroot/xpatrinet/wp-cp/src/test/java/com/chinaportal/portal/comment/Attic/AllTests.java,v $
 * Date   : $Date: 2005/07/14 03:23:00 $
 * Version: $Revision: 1.1.2.2 $
 * Author : $Author: hujf $
 */

package com.chinaportal.portal.comment;

import junit.framework.Test;
import junit.framework.TestSuite;


public final class AllTests {

    /**
     * Hide constructor to prevent generation of class instances.<p>
     */
    private AllTests() {

    }

    /**
     * Returns the JUnit test suite for this package.<p>
     * 
     * @return the JUnit test suite for this package
     */
    public static Test suite() {

        TestSuite suite = new TestSuite("Tests for package " + AllTests.class.getPackage().getName());
        //$JUnit-BEGIN$
        //suite.addTest(new TestSuite(TestBaseAction.class));
        suite.addTest(TestCommentDAO.suite());
        //$JUnit-END$
        return suite;
    }
}