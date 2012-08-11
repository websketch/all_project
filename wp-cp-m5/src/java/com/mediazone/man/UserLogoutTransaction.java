package com.mediazone.man;

import java.util.List;

import javax.servlet.http.Cookie;

import org.jdom.Document;

import com.mediazone.man.bean.ManResponseBean;

/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: UserLogoutTransaction.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class UserLogoutTransaction extends BaseManTransaction
{

    public void logout( Cookie[] cookies ) throws Exception
    {
        String url = "/services/logoutUser";

        ManResponseBean responseBean = handlePOSTRequest(url, null, null, cookies);

    }

    /*
     * (non-Javadoc)
     * 
     * @see com.mediazone.man.BaseManTransaction#mapResponseToBean(org.jdom.Document)
     */
    protected List mapResponseToBean( Document doc )
    {
        // TODO Auto-generated method stub
        return null;
    }

}
