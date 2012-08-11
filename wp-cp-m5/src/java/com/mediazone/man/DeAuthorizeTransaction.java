/*
 * Created on 2005-6-17
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.mediazone.man;

import java.util.List;

import org.jdom.Document;

import com.mediazone.man.bean.AuthorizationInfoBean;
import com.mediazone.man.bean.ManResponseBean;
import com.mediazone.man.bean.SubPolicyBean;

/**
 * @author Administrator TODO To change the template for this generated type comment go to Window - Preferences - Java - Code Style - Code Templates
 */
public class DeAuthorizeTransaction extends BaseManTransaction {

    /*
     * (non-Javadoc)
     * 
     * @see com.mediazone.man.BaseManTransaction#mapResponseToBean(org.jdom.Document)
     */
    protected List mapResponseToBean(Document doc) {
        // TODO Auto-generated method stub
        return null;
    }

    public boolean deAuthorize(String userId, String accountId, String channelId, String manItemId) {
        boolean resultOk = false;
        try {
            String url = "/services/Deauthorize?UserId=" + userId + "&ContentAccountId=" + accountId + "&ContentItemId=" + manItemId;
            if (channelId != null) {
                url += "&ContentChannelId=" + channelId;
            }
            if (DEBUG)
                System.out.println(url);
            ManResponseBean response = handleGetRequest(url, null);
            if (response.getStatusCode() != null && (response.getStatusCode().equalsIgnoreCase(ManResponseCodes.RC_NO_ERROR_0) || response.getStatusCode().equalsIgnoreCase(ManResponseCodes.RC_NO_ERROR_200))) {
                resultOk = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultOk;
    }

    public static void main(String[] args) {
    }
}