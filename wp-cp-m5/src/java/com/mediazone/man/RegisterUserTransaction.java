package com.mediazone.man;

import java.util.List;
import org.apache.commons.httpclient.NameValuePair;
import org.jdom.Document;
import com.mediazone.man.form.UserLoginForm;
import com.mediazone.man.form.UserRegisterForm;
import com.mediazone.man.bean.ManResponseBean;

/**
 * @author Hanson Wong $Id: RegisterUserTransaction.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class RegisterUserTransaction extends BaseManTransaction {

    /*
     * (non-Javadoc)
     * 
     * @see com.mediazone.man.BaseManTransaction#mapResponseToBean(org.jdom.Document)
     */
    protected List mapResponseToBean(Document doc) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * Bean properties to set UserId SecurePassword SecurePin PinPayment PinAmount PinMenu PinPG PinPGRate Name LeadId EmailNotify etc ReturnUrl TermsAgree Email Language
     * 
     * @param bean
     * @param response
     *            code
     */
    public ManResponseBean registerUser(UserRegisterForm bean) throws Exception {
        String url = "/services/RegisterUser";
        /*
         * UserId SecurePassword SecurePin PinPayment PinAmount PinMenu PinPG PinPGRate Name LeadId EmailNotify etc ReturnUrl TermsAgree Email Language
         */
        NameValuePair[] params = { new NameValuePair("UserId", bean.getUserId()), new NameValuePair("SecurePassword", bean.getSecurePassword()), new NameValuePair("SecurePin", bean.getSecurePin()), new NameValuePair("PinPayment", bean.getPinPayment()), new NameValuePair("PinAmount", bean.getPinAmount()), new NameValuePair("PinMenu", bean.getPinMenu()), new NameValuePair("PinPG", bean.getPinPG()), new NameValuePair("PinPGRate", bean.getPinPGRate()), new NameValuePair("FirstName", bean.getFirstName()), new NameValuePair("LastName", bean.getLastName()), new NameValuePair("Name", bean.getFirstName() + " " + bean.getLastName()), new NameValuePair("LeadId", bean.getLeadId()), new NameValuePair("EmailNotify", bean.getEmailNotify()), new NameValuePair("etc", bean.getEtc()), new NameValuePair("ReturnUrl", bean.getReturnUrl()), new NameValuePair("TermsAgree", bean.getTermsAgree()), new NameValuePair("Question", bean.getQuestion()), new NameValuePair("Answer", bean.getAnswer()), new NameValuePair("Language", bean.getLanguage()), new NameValuePair("Email", bean.getEmail()) };
        ManResponseBean response = handlePOSTRequest(url, params, null);
        return response;
    }

    public static void main(String[] args) {
        try {
            UserRegisterForm bean = new UserRegisterForm();
            bean.setEmail("China_Test" + System.currentTimeMillis() + "@mediazone.com");

            bean.setSecurePassword(System.currentTimeMillis() + "");
            bean.setFirstName("FN" + System.currentTimeMillis());
            bean.setLastName("LN" + System.currentTimeMillis());
            RegisterUserTransaction rut = new RegisterUserTransaction();
            //System.out.println(rut.registerUser(bean).getBody());

            UserLoginForm loginForm = new UserLoginForm();

            loginForm.setEmail(bean.getEmail());
            loginForm.setSecurePassword(bean.getSecurePassword());

            ManHandler.loginUser.login(loginForm, null, null);

            // ERROR 550 seems to be for duplicate email address
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}