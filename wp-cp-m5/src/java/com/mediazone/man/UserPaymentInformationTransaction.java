package com.mediazone.man;

import com.mediazone.man.form.UserRegisterForm;
import com.mediazone.man.bean.UserPaymentInformationBean;
import java.util.List;

import javax.servlet.http.Cookie;

import org.apache.commons.httpclient.NameValuePair;
import org.jdom.Document;

import com.mediazone.man.bean.ManResponseBean;

import com.mediazone.man.bean.UserRegisterBean;
import com.sun.rsasign.h;

/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: UserPaymentInformationTransaction.java,v 1.2 2005/04/27 01:10:18 hanson
 * Exp $
 */
public class UserPaymentInformationTransaction extends BaseManTransaction
{

//    public ManResponseBean updatePaymentInformation( UserPaymentInformationBean bean, String userID, Cookie[] cookies )
//            throws Exception
//    {
//        // TODO: handle amount
//        String url = " /services/UserPaymentData?UserId=" + userID;
//
//        NameValuePair[] params = { new NameValuePair("CardName", bean.getCardName()),
//
//        new NameValuePair("SecureCardNumber", bean.getSecureCardNumber()),
//
//        new NameValuePair("SecureCardID", bean.getSecureCardID()),
//
//        new NameValuePair("CardExpM", bean.getCardExpM()),
//
//        new NameValuePair("CardExpY", bean.getCardExpY()),
//
//        new NameValuePair("SecureCardAddress", bean.getSecureCardAddress()),
//
//        new NameValuePair("CardCity", bean.getCardCity()),
//
//        new NameValuePair("CardState", bean.getCardState()),
//
//        new NameValuePair("CardType", bean.getCardType()),
//
//        new NameValuePair("CardZip", bean.getCardZip()),
//
//        new NameValuePair("CardCountry", bean.getCardCountry()),
//
//        new NameValuePair("ReturnUrl", bean.getReturnUrl()),
//
//        new NameValuePair("TermsAgree", bean.getTermsAgree()),
//
//        new NameValuePair("SecurePassword", bean.getSecurePassword()) };
//
//        // NameValuePair[] params = { new NameValuePair("username", "hanson"),
//        // new NameValuePair("_password", "asdfsa") };
//
//        ManResponseBean responseBean = handlePOSTRequest(url, params, cookies);
//
//        System.out.println(responseBean.getStatusCode());
//        System.out.println(responseBean.getBody());
//
//        return responseBean;
//
//    }

    
    public static int REQUIRES_PAYMENT = 2;
    public static int PAYMENT_SUCCESSFUL = 3;
    public static int DEBIT_SUCCESSFUL = 1;
    public static int CREDIT_EXCEEDED = 4;
    
    public ManResponseBean updatePaymentInformation( UserRegisterForm bean, String userID, Cookie[] cookies )
    throws Exception
    {
        return updatePaymentInformation(bean, null, userID, cookies);
    }
    
    public ManResponseBean updatePaymentInformation( UserRegisterForm bean, String amount, String userID, Cookie[] cookies )
            throws Exception
    {
        
        String url = " /services/UserPaymentData?UserId=" + userID;

        if ( amount != null )
        {
            url += "&Amount="+amount;
        }
        
        
        NameValuePair[] params = {

                new NameValuePair("UserId", userID),
               
                new NameValuePair("Email", bean.getEmail()),

                new NameValuePair("CardName", bean.getCardName()),

                new NameValuePair("SecureCardNumber", bean.getSecureCardNumber()),

                new NameValuePair("SecureCardID", bean.getSecureCardID()),

                new NameValuePair("CardExpM", bean.getCardExpM()),

                new NameValuePair("CardExpY", bean.getCardExpY()),

                new NameValuePair("SecureCardAddress", bean.getSecureCardAddress()),

                new NameValuePair("CardAddress", bean.getSecureCardAddress()),

                new NameValuePair("CardCity", bean.getCardCity()),

                new NameValuePair("CardState", bean.getCardState()),

                new NameValuePair("CardType", bean.getCardType()),

                new NameValuePair("CardZip", bean.getCardZip()),

                new NameValuePair("CardCountry", bean.getCardCountry()),
               
                new NameValuePair("CardLast4", bean.getSecureCardNumber().substring(
                        bean.getSecureCardNumber().length() - 4, bean.getSecureCardNumber().length())),

                new NameValuePair("SecurePassword", bean.getSecurePassword()) };

        ManResponseBean responseBean = handlePOSTRequest(url, params, cookies);

        return responseBean;

    }

    public int purchaseController( UserRegisterForm bean, String userID, Cookie[] cookies ) throws Exception
    {
        boolean processed = false; 
        
        //attempt to debit from card.
        processed = processDebit(bean, userID, cookies);
        
        if ( processed )
            return DEBIT_SUCCESSFUL;

        processed = processCCCharge(bean, userID, cookies);
        
        if ( processed ) 
            return PAYMENT_SUCCESSFUL;
        
        
        return CREDIT_EXCEEDED;
        
    }

    private boolean processCCCharge(UserRegisterForm bean, String userID, Cookie[] cookies) throws Exception
    {
        boolean processed = false;
        
        String credit = bean.getCredit();
        
        if ( credit == null || credit.equals("0.0") )
        {
            
            ManResponseBean response = updatePaymentInformation(bean, bean.getPrice(), cookies);
            
            System.out.println(response.getStatusCode());
            System.out.println(response.getBody());
            
            processed = true;
        }
        
        return processed;
    }
    
    private boolean processDebit( UserRegisterForm bean, String userID, Cookie[] cookies ) throws Exception
    {
        boolean processed = false;

        if ( bean.getCredit() == null || bean.getDebit() == null || bean.getPrice() == null )
            return processed;
        
        
        if ( Float.parseFloat(bean.getCredit()) + Float.parseFloat(bean.getDebit()) - Float.parseFloat(bean.getPrice()) > -1.0 )
        {
            // deduct from credit in account
            String url = "/services/authorize?UpdateBalance=true&SessionId=" + bean.getSessionId() + "&Email=" + userID
                    + "&contentaccountid=" + bean.getAccountId() + "&contentitemid=" + bean.getItemID();
            
            handleGetRequest(url, null);

            processed = true;
        }

        return processed;
    }

    public void test() throws Exception
    {
        String url = "/services/authorize?UpdateBalance=true&SessionId=B6341536FD78EF50&Email=hwong@mediazone.com&contentaccountid=mediazonetest&contentchannelid=download&contentitemid=DemoFile4";
        handleGetRequest(url, null);

    }

    public static void main( String[] args )
    {
        try
        {

            /*
             * UserRegisterBean bean1 = new UserRegisterBean();
             * bean1.setEmail(System.currentTimeMillis() + "@mediazone.com");
             * bean1.setSecurePassword(System.currentTimeMillis() + "");
             * bean1.setFirstName("FIRST NAME " + System.currentTimeMillis());
             * bean1.setLastName("LAST NAME " + System.currentTimeMillis());
             * RegisterUserTransaction rut = new RegisterUserTransaction();
             * rut.registerUser(bean1);
             * 
             */

            //UserPaymentInformationTransaction u = new UserPaymentInformationTransaction();
            //u.test();

                      
             UserRegisterForm bean = new UserRegisterForm();
                       
             bean.setCardName("Hanson Wong");
                        
             bean.setSecureCardNumber("4111111111111111");
             bean.setSecureCardAddress("65465454 4th ave");
             bean.setSecureCardID("123");
             bean.setCardCity("SF");
             bean.setCardState("CA");
             bean.setCardExpM("04");
             bean.setCardExpY("07");
             bean.setTermsAgree("");
             UserPaymentInformationTransaction pit = new UserPaymentInformationTransaction();
             pit.updatePaymentInformation(bean, "3.99", null);

        }
        catch ( Exception e )
        {
            e.printStackTrace();
        }
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