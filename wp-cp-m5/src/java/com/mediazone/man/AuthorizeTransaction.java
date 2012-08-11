package com.mediazone.man;

import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.jdom.Attribute;
import org.jdom.Document;
import org.jdom.Element;

import com.mediazone.man.bean.AuthorizationInfoBean;
import com.mediazone.man.bean.ContentBean;
import com.mediazone.man.bean.ManResponseBean;
import com.mediazone.man.bean.SubPolicyBean;

/**
 * @author Hanson Wong $Id: AuthorizeTransaction.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class AuthorizeTransaction extends BaseManTransaction {
    public void aolAuthorizeFreeGameTransaction(String userID, String contentItemId, String sessionId) throws Exception {
        // String url =
        // "/services/Authorize?SecurePassword=amuck&Email="+userID+"&ContentItemId="+contentItemId;
        String url = "/services/Authorize?ContentAccountId=mediazone&Email=" + userID + "&SessionId=" + sessionId + "&ContentItemId=" + contentItemId;

        if (DEBUG)
            System.out.println(url);

        ManResponseBean responseBean = handleGetRequest(url, null);

        // System.out.println(responseBean.getStatusCode());
        // System.out.println(responseBean.getBody());

    }

    public boolean checkEntitlement(String manItemID, String userId) throws Exception {
        boolean hasEntitlement = false;

        String url = "/services/UserData?UserId=" + userId;

        ManResponseBean responseBean = handleGetRequest(url, null);

        // An XML is returned. To check entitlement you need to parse the XML.
        // A workaround instead to lower the server load is to search the string
        // and
        // see if there is a match with ItemId="manItemID"

        String result = responseBean.getBody();

        if (manItemID != null && result != null && result.length() > 0) {
            result = result.toLowerCase();

            manItemID = manItemID.toLowerCase();

            if (result.indexOf("itemid=\"" + manItemID + "\"") > -1) {
                hasEntitlement = true;
            }
        }

        return hasEntitlement;
    }

    /**
     * @param sessionID
     * @param accountID
     * @param channelID
     * @param manItemID -
     *            can be either a MAN_PACKAGE_ID or a MAN_ITEM_ID. If a MAN_PACKAGE_ID is specified, a channelID is not required.
     * @return @throws
     *         Exception
     */
    public AuthorizationInfoBean authorize(String sessionID, String accountID, String channelID, String manItemID) throws Exception {
        String url = "/services/QuerySessionAuthorization?SessionId=" + sessionID + "&ContentAccountId=" + accountID + "&ContentItemId=" + manItemID;

        if (channelID != null) {
            url += "&ContentChannelId=" + channelID;
        }

        if (DEBUG)
            System.out.println(url);

        ManResponseBean response = handleGetRequest(url, null);

        Document responseXML = parseXMLString(response.getBody());
        // SessionId=1234&ContentAccountId=private&ContentChanneldId=sports&ContentItemId=movie300_scene003

        if (DEBUG)
            printXML(responseXML);

        AuthorizationInfoBean infoBean = mapXMLToBean(responseXML);

        if (DEBUG)
            System.out.println(infoBean.getErrorCode());

        SubPolicyBean subPolicyBean = infoBean.getSubpolicy();

        if (subPolicyBean.getInternalPackage().equals("true")) {
            String packageID = subPolicyBean.getInternalPackageId();

            infoBean = authorize(sessionID, accountID, null, packageID);
            // InternalPackage="true" InternalPackageId="sportsworx_01"
        }

        return infoBean;
    }

    /**
     * @param crmId
     * @param userId
     * @param accountID
     * @param channelID
     * @param manItemID
     * @return @throws
     *         Exception
     */
    public AuthorizationInfoBean authorizeByUserId(String userID, String accountID, String channelID, String manItemID) throws Exception {
        if (checkEntitlement(manItemID, userID)) {
            AuthorizationInfoBean ai = new AuthorizationInfoBean();
            ai.setAuthorized("True");
            ai.setErrorCode(ManResponseCodes.RC_ALREADY_AUTHORIZED);
            ai.setErrorMessage("has already purchased");
            return ai;
        }
        String url = "/services/Authorize?UserId=" + userID + "&ContentAccountId=" + accountID + "&ContentItemId=" + manItemID;
        if (channelID != null) {
            url += "&ContentChannelId=" + channelID;
        }
        if (DEBUG)
            System.out.println(url);
        ManResponseBean response = handleGetRequest(url, null);
        AuthorizationInfoBean infoBean = null;
        if (response.getBody() != null && !response.getBody().equalsIgnoreCase("")) {
            Document responseXML = parseXMLString(response.getBody());
            if (DEBUG)
                printXML(responseXML);
            infoBean = mapXMLToBean(responseXML);
            if (DEBUG)
                System.out.println(infoBean.getErrorCode());
            SubPolicyBean subPolicyBean = infoBean.getSubpolicy();
            if (subPolicyBean.getInternalPackage().equals("true")) {
                String packageID = subPolicyBean.getInternalPackageId();
                infoBean = authorize(userID, accountID, null, packageID);
            }
        } else {
            if (response.getStatusCode() != null && (response.getStatusCode().equalsIgnoreCase(ManResponseCodes.RC_NO_ERROR_200) || response.getStatusCode().equalsIgnoreCase(ManResponseCodes.RC_NO_ERROR_0))) {
                infoBean = new AuthorizationInfoBean();
                infoBean.setAuthorized("True");
                infoBean.setErrorCode(response.getMAN_ERROR_CODE());
            }
        }
        return infoBean;
    }

    public AuthorizationInfoBean mapXMLToBean(Document doc) throws Exception {
        AuthorizationInfoBean infoBean = new AuthorizationInfoBean();

        Element authInfoNode = doc.getRootElement();

        if (DEBUG)
            System.out.println("ROOT----------");

        // map root node attributes
        List rootAttributes = authInfoNode.getAttributes();

        if (rootAttributes != null) {
            for (int i = 0; i < rootAttributes.size(); i++) {
                Attribute rootAtt = (Attribute) (rootAttributes.get(i));

                if (DEBUG)
                    System.out.println("mapping:" + rootAtt.getName() + " " + rootAtt.getValue());

                BeanUtils.setProperty(infoBean, rootAtt.getName().substring(0, 1).toLowerCase() + rootAtt.getName().substring(1, rootAtt.getName().length()), rootAtt.getValue());
            }
        }

        if (DEBUG)
            System.out.println("Content----------");

        // map all content node's attributes
        Element contentNode = authInfoNode.getChild("Content");

        List contentAttributes = contentNode.getAttributes();

        ContentBean contentBean = new ContentBean();

        if (contentAttributes != null) {
            for (int i = 0; i < contentAttributes.size(); i++) {
                Attribute contentAtt = (Attribute) (contentAttributes.get(i));

                if (DEBUG)
                    System.out.println("mapping:" + contentAtt.getName() + " " + contentAtt.getValue());

                // BeanUtils.setProperty(contentBean, contentAtt.getName(),
                // contentAtt.getValue());
                BeanUtils.setProperty(contentBean, contentAtt.getName().substring(0, 1).toLowerCase() + contentAtt.getName().substring(1, contentAtt.getName().length()), contentAtt.getValue());

            }

        }
        infoBean.setContent(contentBean);

        if (DEBUG)
            System.out.println("Subpolicy----------");

        // map all subpolicy node's attribtues
        Element subPolicyNode = authInfoNode.getChild("SubPolicy");

        List subpolicyAttributes = subPolicyNode.getAttributes();

        SubPolicyBean subPolicyBean = new SubPolicyBean();

        if (subpolicyAttributes != null) {
            for (int i = 0; i < subpolicyAttributes.size(); i++) {
                Attribute subpolicyAtt = (Attribute) (subpolicyAttributes.get(i));

                if (DEBUG)
                    System.out.println("mapping:" + subpolicyAtt.getName() + " " + subpolicyAtt.getValue());
                // BeanUtils.setProperty(subPolicyBean, subpolicyAtt.getName(),
                // subpolicyAtt.getValue());
                BeanUtils.setProperty(subPolicyBean, subpolicyAtt.getName().substring(0, 1).toLowerCase() + subpolicyAtt.getName().substring(1, subpolicyAtt.getName().length()), subpolicyAtt.getValue());

            }

        }
        infoBean.setSubpolicy(subPolicyBean);

        if (DEBUG)
            System.out.println("all mapped");

        return infoBean;
    }

    public static void main(String[] args) {
        try {
            AuthorizeTransaction at = new AuthorizeTransaction();
            AuthorizationInfoBean aib = at.authorize("mzcn2", "mediazonecn_test", "distribution_channel_001", "frank_test_item_1");
            //System.out.println(aib.getAuthorized());

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