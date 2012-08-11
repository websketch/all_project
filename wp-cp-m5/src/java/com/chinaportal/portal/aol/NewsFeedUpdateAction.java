package com.chinaportal.portal.aol;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 * 
 * 
 * @author Rick Sun
 * 
 * $Id: NewsFeedUpdateAction.java,v 1.1.2.2 2006/01/13 00:48:58 rick Exp $
 */
public class NewsFeedUpdateAction extends com.chinaportal.portal.base.BaseAction
{

    public ActionForward doExecute( ActionMapping actionmapping, ActionForm actionform,
            HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse ) throws Exception
    {
    	String feed  = httpservletrequest.getParameter("feed");
    	String local = httpservletrequest.getParameter("local");

        if (feed != null && local != null) {
        	NewsCPFeedFetcher nff = new NewsCPFeedFetcher(feed, local);
            org.jdom.Document doc = nff.pullFeed("utf8");
            nff.parseDocument(doc);
        }

        return null;
    }

	/* (non-Javadoc)
	 * @see com.chinaportal.portal.base.BaseAction#getFunctionName()
	 */
	public String getFunctionName() {
		return null;
	}

}
