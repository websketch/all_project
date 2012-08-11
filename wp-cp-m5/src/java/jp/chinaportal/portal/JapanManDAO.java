package jp.chinaportal.portal;

import java.io.IOException;
import java.io.StringReader;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import jp.chinaportal.portal.common.CommonUtil;

import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jdom.Document;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import com.chinaportal.portal.login.LoginMAN;
import com.mediazone.bean.User;
import com.mediazone.man.BaseManTransaction;
import com.mediazone.man.UserInfoTransaction;
import com.mediazone.man.bean.ManResponseBean;
import com.mediazone.man.form.UserRegisterForm;

public class JapanManDAO extends BaseManTransaction {
    private static final Logger logs = LogsFile.getLogs(JapanManDAO.class
            .getName());
    /*
     * (non-Javadoc)
     * 
     * @see com.mediazone.man.BaseManTransaction#mapResponseToBean(org.jdom.Document)
     */
    protected List mapResponseToBean(Document doc) {
        // TODO Auto-generated method stub
        return null;
    }

    public User getMANUserInfo(String userId) throws Exception {
        User user = new User();
        UserInfoTransaction userInfoTransaction = new UserInfoTransaction();
        String userInfo = userInfoTransaction.getUserInfo(userId);
        if (!CommonUtil.checkEmptyString(userInfo)) {

            SAXBuilder parser = new SAXBuilder();
            Document document = null;

            try {
                document = parser.build(new StringReader(userInfo));
            }
            catch (JDOMException e) {
                logs.log(Level.SEVERE, "ERROR: " + "getMANUserInfo()" + " "
                        + e.toString());
            }
            catch (IOException e) {
                logs.log(Level.WARNING, "ERROR: " + "getMANUserInfo()" + " "
                        + e.toString());
            }

            String MANCrmId = document.getRootElement().getAttributeValue(
                    "CrmId");
            String MANEmail = document.getRootElement().getAttributeValue(
                    "Email");
            String MANUserId = document.getRootElement().getAttributeValue(
                    "UserId");
            String MANName = document.getRootElement()
                    .getAttributeValue("Name");
            String MANEmailNotify = document.getRootElement()
                    .getAttributeValue("EmailNotify");
            user.setLoginName(MANEmail);
            user.setManUserId(MANUserId);
            user.setName(MANName);
            if ( MANEmailNotify != null && MANEmailNotify.equals("on")) {
                user.setStatus(new Integer(1));
            }
            else {
                user.setStatus(new Integer(0));
            }
        }

        return user;

    }

    /**
     * Bean properties to set UserId SecurePassword SecurePin PinPayment
     * PinAmount PinMenu PinPG PinPGRate Name LeadId EmailNotify etc ReturnUrl
     * TermsAgree Email Language
     * 
     * @param bean
     * @param response
     *            code
     */
    public ManResponseBean registerUser(UserRegisterForm bean) throws Exception {
        String url = "/services/RegisterUser";
        /*
         * UserId SecurePassword SecurePin PinPayment PinAmount PinMenu PinPG
         * PinPGRate Name LeadId EmailNotify etc ReturnUrl TermsAgree Email
         * Language
         */
        NameValuePair[] params = {
                new NameValuePair("UserId", bean.getUserId()),
                new NameValuePair("SecurePassword", bean.getSecurePassword()),
                new NameValuePair("SecurePin", bean.getSecurePin()),
                new NameValuePair("PinPayment", bean.getPinPayment()),
                new NameValuePair("PinAmount", bean.getPinAmount()),
                new NameValuePair("PinMenu", bean.getPinMenu()),
                new NameValuePair("PinPG", bean.getPinPG()),
                new NameValuePair("PinPGRate", bean.getPinPGRate()),
                new NameValuePair("FirstName", bean.getFirstName()),
                new NameValuePair("LastName", bean.getLastName()),
                new NameValuePair("Name", bean.getFirstName() + " "
                        + bean.getLastName()),
                new NameValuePair("LeadId", bean.getLeadId()),
                new NameValuePair("EmailNotify", bean.getEmailNotify()),
                new NameValuePair("etc", bean.getEtc()),
                new NameValuePair("ReturnUrl", bean.getReturnUrl()),
                new NameValuePair("TermsAgree", bean.getTermsAgree()),
                new NameValuePair("Question", bean.getQuestion()),
                new NameValuePair("Answer", bean.getAnswer()),
                new NameValuePair("Language", bean.getLanguage()),
                new NameValuePair("Email", bean.getEmail()) };
        ManResponseBean response = handlePOSTRequest(url, params, null);
        return response;
    }
    
}
