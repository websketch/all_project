/*
 * File   : $Source: /cvsroot/xpatrinet/wp-cp/src/test/java/com/chinaportal/portal/test/Attic/AllTests.java,v $
 * Date   : $Date: 2005/07/14 01:59:45 $
 * Version: $Revision: 1.1.2.2 $
 * Author : $Author: hujf $
 */
package com.chinaportal.portal.test;


import junit.extensions.TestSetup;
import junit.framework.Test;
import junit.framework.TestSuite;

/**
 * Chinaportal main test suite, executes the individual test suites of all core packages.<p>
 * 
 * @author Jifeng hu
 * @version 
 * 
 */
public final class AllTests {
    /** Day constant. */
    private static final long C_DAYS = 1000 * 60 * 60 * 24;

    /** Hour constant. */
    private static final long C_HOURS = 1000 * 60 * 60;

    /** Minute constant. */
    private static final long C_MINUTES = 1000 * 60;

    /** Second constant. */
    private static final long C_SECONDS = 1000;
    
     /** Stopwatch for the time the test run. */
    private static long m_startTime;

    /**
     * Hide constructor to prevent generation of class instances.<p>
     */
    private AllTests() {
    }

    /**
     * One-time initialization code.<p>
     */
    public static void oneTimeSetUp() {

        m_startTime = System.currentTimeMillis();
        System.out.println("Starting Chinaportal test run...");
    }

    /** 
     * One-time cleanup code.<p>
     */
    public static void oneTimeTearDown() {

        long runTime = System.currentTimeMillis() - m_startTime;
        System.out.println("... Chinaportal test run finished! (Total runtime: "
            + formatRuntime(runTime)
            + ")");
    }

    /**
     * Creates the Chinaportal JUnit test suite.<p>
     * 
     * @return the Chinaportal JUnit test suite
     */
    public static Test suite() {

        TestSuite suite = new TestSuite("Chinaportal complete tests");

		//add child container to top container here.  
        suite.addTest(com.chinaportal.portal.comment.AllTests.suite());

        TestSetup wrapper = new TestSetup(suite) {

            protected void setUp() {

                oneTimeSetUp();
            }

            protected void tearDown() {

                oneTimeTearDown();
            }
        };

        return wrapper;
    }
    
    private static String formatRuntime(long runtime) {

        long seconds = (runtime / C_SECONDS) % 60;
        long minutes = (runtime / C_MINUTES) % 60;
        long hours = (runtime / C_HOURS) % 24;
        long days = runtime / C_DAYS;
        StringBuffer strBuf = new StringBuffer();

        if (days > 0) {
            if (days < 10) {
                strBuf.append('0');
            }
            strBuf.append(days);
            strBuf.append(':');
        }

        if (hours < 10) {
            strBuf.append('0');
        }
        strBuf.append(hours);
        strBuf.append(':');

        if (minutes < 10) {
            strBuf.append('0');
        }
        strBuf.append(minutes);
        strBuf.append(':');

        if (seconds < 10) {
            strBuf.append('0');
        }
        strBuf.append(seconds);

        return strBuf.toString();
    }
}