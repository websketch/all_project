package com.mediazone.man;

import com.mediazone.man.bean.ManResponseBean;
import com.mediazone.man.bean.UserRegisterBean;
import com.mediazone.util.Common;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Cookie;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

/**
 * @author Hanson Wong $Id: UserInfoTransaction.java,v 1.1.2.5 2005/11/29 20:46:26 ganquan Exp $
 */
public class UserInfoTransaction extends BaseManTransaction {

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
    public String updateUserInfo(UserRegisterBean bean, Cookie[] cookies) throws Exception {
        String url = "/services/UpdateUser?UserId=" + bean.getUserId();

        String body = buildUpdateUserInfo(bean);

        ManResponseBean response = handlePOSTRequest(url, null, body, cookies);

        return response.getStatusCode();
    }

    private String buildUpdateUserInfo(UserRegisterBean bean) throws Exception {
        String xml = "<User CrmId=\"" + Common.manResources.getString("manCrmId") + "\"";
        if (bean.getUserId() != null) {
            xml += " UserId=\"" + bean.getUserId() + "\"";
        } else {
            throw new Exception();
        }
        if (bean.getSecurePassword() != null) {
            xml += " SecurePassword=\"" + bean.getSecurePassword() + "\"";
        }
        if (bean.getName() != null) {
            xml += " Name=\"" + bean.getName() + "\"";
        }
        if (bean.getFirstName() != null) {
            xml += " FirstName=\"" + bean.getFirstName() + "\"";
        }
        if (bean.getLastName() != null) {
            xml += " LastName=\"" + bean.getLastName() + "\"";
        }
        if (bean.getEmail() != null) {
            xml += " Email=\"" + bean.getEmail() + "\"";
        }
        xml += "/>";

        return xml;
    }

    public String getUserInfo(String userId, String field) throws Exception {
        String url = "/services/UserData?UserId=" + userId;

        ManResponseBean bean = handleGetRequest(url, null);

        if (bean.getMAN_ERROR_CODE().equals(ManResponseCodes.RC_INCORRECT_USER_ID_PASSWORD)) {
            // send error to screen
            return null;
        } else {
            // parse XML to find question
            SAXBuilder parser = new SAXBuilder();
            Document xmlDoc = parser.build(new StringReader(bean.getBody()));
            return xmlDoc.getRootElement().getAttributeValue(field);
        }
    }

    public String getUserInfo(String userId) throws Exception {
        String url = "/services/UserData?UserId=" + userId;

        ManResponseBean bean = handleGetRequest(url, null);

        if (bean.getMAN_ERROR_CODE().equals(ManResponseCodes.RC_INCORRECT_USER_ID_PASSWORD)) {
            return null;
        } else {
            return bean.getBody();
        }
    }

    public String getUserSession(String sessionId) throws Exception {
        String url = "/services/QuerySession?SessionId=" + sessionId;

        ManResponseBean bean = handleGetRequest(url, null);

        if (bean.getMAN_ERROR_CODE().equals(ManResponseCodes.RC_INCORRECT_USER_ID_PASSWORD)) {
            return null;
        } else {
            return bean.getBody();
        }
    }
    
    public ArrayList getUserEntitlementList(String userId) throws Exception {
        ArrayList al = new ArrayList();
        String url = "/services/UserData?UserId=" + userId;
        ManResponseBean bean = handleGetRequest(url, null);
        if (bean.getMAN_ERROR_CODE().equals(ManResponseCodes.RC_INCORRECT_USER_ID_PASSWORD)) {
            // send error to screen
            return null;
        } else {
            // parse XML to find list
            SAXBuilder parser = new SAXBuilder();
            Document xmlDoc = parser.build(new StringReader(bean.getBody()));
            Element rootel = (Element) xmlDoc.getRootElement();
            List nodes = rootel.getChildren("EntitlementList");
            nodes = ((Element) nodes.get(0)).getChildren("Entitlement");
            if (nodes != null) {
                for (int i = 0; i < nodes.size(); i++) {
                    Element elm = (Element) nodes.get(i);
                    al.add(elm.getAttributeValue("ItemId"));
                }
            }
            return al;
        }
    }
    
    public String getUserIpInfo(String ip) throws Exception 
    {
     	String url = "http://man.entriq.net/services/geocheck?ipaddress=" + ip;
    	String info = handleGetRequest(url);
    	//System.out.println(info);
    	return info;
    }

    public static void main(String[] args) {
        try {
            UserInfoTransaction ui = new UserInfoTransaction();
            String u = ui.getUserSession("amzcn");
            if(u==null){
                System.out.println("no user");
            }else{
                System.out.println(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}