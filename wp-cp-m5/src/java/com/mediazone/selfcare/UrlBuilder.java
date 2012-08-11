/*
 * Created on 2005-1-27
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.mediazone.selfcare;
/**
 * @author Dtuffy
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class UrlBuilder {

    public static boolean useEntriqSelfCare = true;

    //static String domain = new String("secure2.mediazone.com");
    //static String protocol = new String("http");
    //static String crmID = "mediazonetest";
    static String domain = new String("secure.mediazone.com");
    static String protocol = new String("http"); 
    static String crmID = "mediazone";
     
    static String basemineurl = new String("ReturnUrl=http://www.mediazone.com/selfcare/");
    //static String basemineurl = new String("ReturnUrl=http://www.mediazone.com:8080/selfcare/");
    static String returnUrlLogin = new String(basemineurl + "ok.jsp");
    static String returnUrlRegister = new String(basemineurl + "registerok.jsp");
    static String returnUrlAuthorize = new String(basemineurl + "authorize.jsp");
    static String returnUrlSubscribe = new String(basemineurl + "subscribe.jsp");
    public static String InitSelfcare() {
        String headerInfo = new String();
        // add import file
        //		headerInfo = "<script language=\"javascript\" src=\"http://man.entriq.net/common/scripts/utils.js\"></script>";
        headerInfo = "<script language=\"javascript\" src=\"http://"+domain+"/common/scripts/utils.js\"></script>";
        // add js callselfcare function
        headerInfo = headerInfo + "<script>";
        headerInfo = headerInfo + "function callSelfCare(url)";
        headerInfo = headerInfo + "{";
        headerInfo = headerInfo + "miniPopup(url);";
        headerInfo = headerInfo + "}";
        headerInfo = headerInfo + "</script>";
        return headerInfo;
    }
    private static String buildUrl(String call, String parameters) {
        String url = new String();
        url = " onclick=\"callSelfCare('";
        url = url + protocol + "://" + domain + "/";
        url = url + "common/index.asp?crmid="+crmID;
        url = url + "&action=" + call;
        if (parameters != null) {
            url = url + "&" + parameters;
        }
        url = url + "');\" HREF=\"#\"";
        return url;
    }
	private static String buildUrlExt(String call, String parameters) {
		String url = new String();
		url = "callSelfCare('";
		url = url + protocol + "://" + domain + "/";
		url = url + "common/index.asp?crmid="+crmID;
		url = url + "&action=" + call;
		if (parameters != null) {
			url = url + "&" + parameters;
		}
		url = url + "');";
		return url;
	}
    public static String buildLoginLink() {
        String loginLink = new String();
        //modified 4/21/2005 by HW  removed to use our own selfcare
        if ( useEntriqSelfCare )
            loginLink = buildUrl("authenticate", returnUrlLogin);
        else
            loginLink = "href=\"/mediazone/signin.jsp\"";

        return loginLink;
    }
    public static String buildRegisterLink() {
        String registerLink = new String();
        //modified 4/21/2005 by HW  removed to use our own selfcare
       if ( useEntriqSelfCare )
           registerLink = buildUrl("authenticate", returnUrlRegister);
       else
           registerLink = "href=\"/mediazone/register.jsp\"";

        return registerLink;
    }
    public static String buildHelpLink() {
        String helpLink = new String();
        helpLink = buildUrl("help", null);
        return helpLink;
    }
    public static String buildSubscriptionsLink() {
        String subscriptionsLink = new String();
        subscriptionsLink = buildUrl("subscriptions", null); //TODO
        return subscriptionsLink;
    }
    public static String buildAccountLink() {
        String accountLink = new String();
        accountLink = buildUrl("account", null);
        return accountLink;
    }
    public static String buildAuthorizeLink(String aid, String cid, String iid, String itemUrl) {
        String authorizeLink = new String();
        if (itemUrl != null && (itemUrl.compareToIgnoreCase("") != 0)) {
            authorizeLink = buildUrl("authorize", "aid=" + aid + "&iid=" + iid + "&cid=" + cid + "&" + returnUrlAuthorize + "?ItemUrl=" + itemUrl);
        } else { // for package
            authorizeLink = buildUrl("authorize", "aid=" + aid + "&iid=" + iid + "&" + returnUrlAuthorize + "?ItemUrl=http://www.mediazone.com/selfcare/confirmPackage.jsp");
        }
        return authorizeLink;
    }
    public static String buildLogoutLink() {
        String logoutLink = new String();

        if ( useEntriqSelfCare )
        {
            // outside the scope of selfcare!  using MAN interface
            logoutLink = "http://man.mediazone.com/services/logoutUser?crmid="+crmID+"&"+basemineurl+"logout.jsp";
            //TODO: maybe change, after devin have check it. 2005-03-09
            //logoutLink = "http://secure.mediazone.com/services/logoutUser?crmid=mediazone&"+basemineurl+"logout.jsp";
            String url = " onclick=\"callSelfCare('";
            url = url + logoutLink;
            url = url + "');\" HREF=\"#\"";
            return url;
        }
        else
            return "href=\"/mediazone/signout.jsp\"";
    }
    public static String closeLink() {
        return "</A>";
    }
    //extension: build string, do not need "onClick" and HREF
	public static String buildLoginLinkExt() {
			String loginLink = new String();
			loginLink = buildUrlExt("authenticate", returnUrlLogin);
			return loginLink;
		}
		public static String buildRegisterLinkExt() {
			String registerLink = new String();
			registerLink = buildUrlExt("authenticate", returnUrlRegister);
			return registerLink;
		}
		public static String buildHelpLinkExt() {
			String helpLink = new String();
			helpLink = buildUrlExt("help", null);
			return helpLink;
		}
		public static String buildSubscriptionsLinkExt() {
			String subscriptionsLink = new String();
			subscriptionsLink = buildUrlExt("subscriptions", null); //TODO
			return subscriptionsLink;
		}
		public static String buildAccountLinkExt() {
			String accountLink = new String();
			accountLink = buildUrlExt("account", null);
			return accountLink;
		}
		public static String buildAuthorizeLinkExt(String aid, String cid, String iid, String itemUrl) {
			String authorizeLink = new String();
			if (itemUrl != null && (itemUrl.compareToIgnoreCase("") != 0)) {
				authorizeLink = buildUrlExt("authorize", "aid=" + aid + "&iid=" + iid + "&cid=" + cid + "&" + returnUrlAuthorize + "?ItemUrl=" + itemUrl);
			} else { // for package
				authorizeLink = buildUrlExt("authorize", "aid=" + aid + "&iid=" + iid + "&" + returnUrlAuthorize + "?ItemUrl=" + itemUrl);
			}
			return authorizeLink;
		} 

        /*public static String buildAuthorizeLinkExtCustomReturnURL(String aid, String cid, String iid, String returnURL) {
            String authorizeLink = new String();
            if (returnURL != null && (returnURL.compareToIgnoreCase("") != 0)) {
                authorizeLink = buildUrlExt("authorize", "aid=" + aid + "&iid=" + iid + "&cid=" + cid + "&ReturnUrl=" + returnURL);
            } else { // for package
                authorizeLink = buildUrlExt("authorize", "aid=" + aid + "&iid=" + iid + "&ReturnUrl=" + returnURL);
            }
            return authorizeLink;
        } */
        
        
		public static String buildLogoutLinkExt() {
			String logoutLink = new String();
			// outside the scope of selfcare!  using MAN interface
			logoutLink = "http://man.mediazone.com/services/logoutUser?crmid="+crmID+"&"+basemineurl+"logout.jsp";
			//TODO: maybe change, after devin have check it. 2005-03-09
			//logoutLink = "http://secure.mediazone.com/services/logoutUser?crmid=mediazone&"+basemineurl+"logout.jsp";
			String url = "callSelfCare('";
			url = url + logoutLink;
			url = url + "');";
			return url;
		}
    public static void main(String[] args) {
        String init = InitSelfcare();
        String help = buildHelpLink();
        String authen = buildLoginLink();
        String subs = buildSubscriptionsLink();
        String account = buildAccountLink();
        String autho = buildAuthorizeLink("my_aid", "my_cid", "my_iid", "my_item_url");
        String logout = buildLogoutLink();
        String close = closeLink();
        String register = buildRegisterLink();
        System.out.println(init);
        System.out.println(authen);
        System.out.println(help);
        System.out.println(subs);
        System.out.println(account);
        System.out.println(autho);
        System.out.println(logout);
        System.out.println(register);
        System.out.println(close);
        System.out.println("Extension String ---------------");
		help = buildHelpLinkExt();
		authen = buildLoginLinkExt();
		subs = buildSubscriptionsLinkExt();
		account = buildAccountLinkExt();
		autho = buildAuthorizeLinkExt("my_aid", "my_cid", "my_iid", "my_item_url");
		logout = buildLogoutLinkExt();
		register = buildRegisterLinkExt();
		System.out.println(authen);
		System.out.println(help);
		System.out.println(subs);
		System.out.println(account);
		System.out.println(autho);
		System.out.println(logout);
		System.out.println(register);
    }
}
