package com.mediazone.man;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.httpclient.NameValuePair;
import org.jdom.Document;

import com.mediazone.man.form.UserLoginForm;
import com.mediazone.man.form.UserManForm;
import com.mediazone.man.bean.ManResponseBean;
import com.mediazone.util.Common;

/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: UserLoginTransaction.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class UserLoginTransaction extends BaseManTransaction
{

    public String EC_INVALID_PASSWORD = "521";

    /* THIS IS A BUG IN ENTRIQ.  AS TOLD BY DEVIN, THERE IS A BUG IN MAN WHICH WOULD NOT 
     * AUTHENTICATE A LOGIN IF LEADID IS NOT SUBMITTED
     */
    private String leadID = Common.manResources.getString("manCrmId");
    
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

    public UserManForm login( UserLoginForm bean, HttpServletRequest request, HttpServletResponse httpResponse )
            throws Exception
    {
        String url = "/services/LoginUser";

        NameValuePair[] params = { new NameValuePair("UserId", bean.getUserId()),
                new NameValuePair("Password", bean.getSecurePassword()) };
        ManResponseBean response = handlePOSTRequest(url, params, null);
        UserManForm manBean = mapResultStringToBean(response.getBody());
        String result = response.getBody();
        // set cookies
        manBean.setCookies(response.getCookies());
        // parse and set manBeanCookies
        manBean = mapCookiesToBean(manBean);
        Cookie[] cookies = manBean.getCookies();

        if ( cookies != null )
        {
            for ( int i = 0; i < cookies.length; i++ )
            {
                httpResponse.addCookie(cookies[i]);
            }
        }

        return manBean;
    }

    private UserManForm mapCookiesToBean( UserManForm loginBean ) throws Exception
    {
        Cookie[] cookies = loginBean.getCookies();

        for ( int i = 0; cookies != null && i < cookies.length; i++ )
        {
            if ( cookies[i].getName().compareToIgnoreCase("MANUser") == 0 )
            {
                StringTokenizer valuepairs = new StringTokenizer(cookies[i].getValue(), "&");

                while ( valuepairs.hasMoreTokens() )
                {
                    String valuepair = valuepairs.nextToken();
                    StringTokenizer names = new StringTokenizer(valuepair, "=");

                    String key = "";
                    String value = "";
                    if ( names.hasMoreTokens() )
                    {
                        key = names.nextToken();
                    }
                    if ( names.hasMoreTokens() )
                    {
                        value = names.nextToken();
                    }

                    BeanUtils.setProperty(loginBean,
                            key.substring(0, 1).toLowerCase() + key.substring(1, key.length()), value);

                }

            }
        }

        return loginBean;
    }

    private void parseCookieToBean( Cookie[] cookies, UserManForm bean ) throws Exception
    {
        for ( int i = 0; i < cookies.length; i++ )
        {
            String value = cookies[i].getValue();

            beanSetter(bean, value);

            // SessionId=88C4326B2BAF4601&Ticket=1AF893290CF4FB54&CrmId=MEDIAZONETEST
            // &UserId=FF77CBE18EFC2B50&AccountId=FF77CBE18EFC2B50&AgentHost=man&AgentId=man

            // Version=1&Name=Media Zone&Debit=&Credit=50&AccessTime=&BillDay=&
            // Status=Enabled&Language=&Country=&Email=hwong@mediazone.com&EmailNotify=Enabled&Pin=&PinPayment=&PinAmount=&PinPG=&PinPGRate=&PinMenu=&
        }
    }

    private UserManForm mapResultStringToBean( String result ) throws Exception
    {
        String prefix = "<HTML><body><script Language=\"Javascript\">var ret = \"";

        String suffix = "\";</script></body></HTML>";

        result = result.replaceAll(prefix, "");
        result = result.replaceAll(suffix, "");
        result = result.substring(1, result.length());
        // result = result.replaceAll(" ", "+");

        UserManForm loginBean = new UserManForm();
        loginBean = beanSetter(loginBean, result);

        return loginBean;
    }

    private UserManForm beanSetter( UserManForm loginBean, String result ) throws Exception
    {
        HashMap queryString = parseQueryString(result);

        Iterator keys = queryString.keySet().iterator();

        while ( keys.hasNext() )
        {
            String key = (String) (keys.next());
            BeanUtils.setProperty(loginBean, key.substring(0, 1).toLowerCase() + key.substring(1, key.length()),
                    (String) queryString.get(key));
        }

        return loginBean;

    }

    public UserManForm loginUserWithSession( String sessionID, String ticket ) throws Exception
    {
        String url = "/services/LoginUser";

        NameValuePair[] params = { new NameValuePair("SessionId", sessionID), new NameValuePair("Ticket", ticket),
                new NameValuePair("LeadId", leadID) };

        ManResponseBean response = handlePOSTRequest(url, params, null);

        String result = response.getBody();

        UserManForm loginBean = mapResultStringToBean(result);

        loginBean.setCookies(response.getCookies());

        return loginBean;
    }

    public String responseWrapper( UserManForm bean )
    {
        String ec = bean.getErrorCode();

        if ( ec != null && ec.equals(EC_INVALID_PASSWORD) )
        {
            return "Invalid Password";
        }

        return "";
    }

}
