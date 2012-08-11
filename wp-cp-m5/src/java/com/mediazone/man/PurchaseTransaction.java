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
 * $Id: PurchaseTransaction.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class PurchaseTransaction extends BaseManTransaction
{
    

    
    
    public void purchase(String userId, String contentAccountId, String contentChannelId, String contentItemId, String sessionId, String leadId, Boolean updateBalance, Cookie[] cookies)
    {
        String url = "/services/Authorize?UserId="+userId;
        
        
        
        /*CrmId: identifies operator 
        UserId: identifies user 
        ContentAccountId: Identifies the 'owner' of the content (content provider). [optional, default = CrmId] 
        ContentChannelId: Identifies the content channel. [not required for packages] 
        ContentItemId: Identifies the media id or package id. [required] 
        SessionId: Identifies the session that has been established for the user 
        LeadId: ID of affiliate (sales lead) [optional] used for settlements. If not specified, it will default to the lead id of the session. 
        UpdateBalance: Boolean*/ 
    }
    /*
     * 
     *     if ( user.Credit == 0.0 )
        {
            //prompt user to update CC info and charge them!
            href = "https://" + document.location.hostname + "/common/cc/cc1.html";
            href += "?aid=" + authorizationInfo.Content.AccountId + "&cid=" + cid + "&iid="
                    + authorizationInfo.Content.ItemId;
            href += "&Amount=" + authorizationInfo.SubPolicy.Price + "&ReturnUrl=" + escape(returnUrl);
            document.location.href = href;
        }
        else if ( (credit + debit - parseFloat(authorizationInfo.SubPolicy.Price)) > -1.0 )
        {
            theForm.action = manBaseUrl + "authorize?contentaccountid=" + authorizationInfo.Content.AccountId
                    + "&contentchannelid=" + cid + "&contentitemid=" + authorizationInfo.Content.ItemId;
            if ( confirmationPage == "Y" )
            {
                theForm.ReturnUrl.value = document.location.protocol + "//" + document.location.hostname
                        + "/common/index.asp?action=confirm&event=" + unescape(authorizationInfo.Content.Name)
                        + "&price=" + amount + "&returnUrl=" + escape("<%=returnUrl%>");
            }
            else
                theForm.ReturnUrl.value = "<%=returnUrl%>";
            theForm.submit();
        }
        else
            document.location.href = "https://" + document.location.hostname + "/common/cc/creditlimitexceeded.html";
  
     */

    /* (non-Javadoc)
     * @see com.mediazone.man.BaseManTransaction#mapResponseToBean(org.jdom.Document)
     */
    protected List mapResponseToBean( Document doc )
    {
        // TODO Auto-generated method stub
        return null;
    }
}
