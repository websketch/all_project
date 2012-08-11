package com.mediazone.man.form;


import org.apache.struts.action.ActionForm;

/**
 * @author Hanson Wong $Id: UserLoginForm.java,v 1.1.2.1 2005/09/20 11:19:56 liushengbin Exp $
 */
public class UserLoginForm extends ActionForm {
    private String userId = null;
    private String email = null;
    private String securePassword = null;
    private String returnURL = null;

    /**
     * @return
     */
    public final String getUserId() {
        return userId;
    }
    /**
     * @param userId
     */
    public final void setUserId(String userId) {
        this.userId = userId;
    }
    
    /**
     * @return Returns the returnURL.
     */
    public String getReturnURL() {
        return returnURL;
    }

    /**
     * @param returnURL
     *            The returnURL to set.
     */
    public void setReturnURL(String returnURL) {
        this.returnURL = returnURL;
    }

    /**
     * @return Returns the email.
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email
     *            The email to set.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return Returns the securePassword.
     */
    public String getSecurePassword() {
        return securePassword;
    }

    /**
     * @param securePassword
     *            The securePassword to set.
     */
    public void setSecurePassword(String securePassword) {
        this.securePassword = securePassword;
    }

}