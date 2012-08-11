package com.mediazone.man;

import java.util.List;

import org.apache.commons.httpclient.NameValuePair;
import org.jdom.Document;

import com.mediazone.man.bean.ManResponseBean;

/**
 * @author Hanson Wong $Id: UserForgotPassword.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class UserForgotPassword extends BaseManTransaction {

    public boolean retrievePassword(String email, String question, String answer) throws Exception {
        String url = "/services/EmailPassword";
        NameValuePair[] params = { new NameValuePair("ReturnUrl", "0"), new NameValuePair("Email", email), new NameValuePair("Answer", answer), new NameValuePair("Question", question) };
        ManResponseBean responseBean = handlePOSTRequest(url, params, null);
        return responseBean.getBody().matches("(.)*(Result=True)(.)*");
    }

    public static void main(String[] args) {
        try {
            UserForgotPassword ufp = new UserForgotPassword();
            if (ufp.retrievePassword("hwong@mediazone.com", "4", "san francisco"))
                System.out.println("true");
            else
                System.out.println("false");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.mediazone.man.BaseManTransaction#mapResponseToBean(org.jdom.Document)
     */

    protected List mapResponseToBean(Document doc) {
        // TODO Auto-generated method stub
        return null;
    }

}