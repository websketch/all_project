package com.mediazone.man;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;
import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpState;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.contrib.ssl.EasySSLProtocolSocketFactory;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.protocol.Protocol;
import org.jdom.Document;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.XMLOutputter;
import com.mediazone.man.bean.ManResponseBean;
import com.mediazone.util.Common;

/**
 * @author Hanson Wong $Id: BaseManTransaction.java,v 1.1.2.6 2005/11/29 20:46:26 ganquan Exp $
 */
public abstract class BaseManTransaction {
    private String manBaseUrl = Common.manResources.getString("manBaseUrl");

    protected String manBaseUrlSSL = Common.manResources.getString("manBaseUrlSSL");

    private String manCrmId = Common.manResources.getString("manCrmId");

    private String manAccountId = Common.manResources.getString("manAccountId");

    private String manUserId = Common.manResources.getString("manUserId");

    private String manPassword = Common.manResources.getString("manPassword");

    private String cookieDomain = Common.manResources.getString("cookieDomain");

    private int httpConnectionTimeout = Integer.parseInt(Common.manResources.getString("httpConnectionTimeout"));

    private String cookieInfo = "";

    protected boolean DEBUG = false;

    protected ManResponseBean handleGetRequest(String url, javax.servlet.http.Cookie[] userCookies) throws Exception {
        
    	HttpClient client = null;
    	//if(url.indexOf("/services/geocheck?ipaddress")!=-1){
        //	client = initClientWithoutSSL(userCookies);
        //}else{
        	client = initClient(userCookies);
        //}

        // postMethod = new PostMethod(url);
        String connector = "?";
        if (url.indexOf("?") != -1)
            connector = "&";

        if (DEBUG)
            System.out.println("Calling:" + url + connector + "CrmId=" + manCrmId);

        GetMethod method = new GetMethod(url + connector + "CrmId=" + manCrmId);

        // save the auth information to request header
        method.addRequestHeader("MAN-user-id", manUserId);
        method.addRequestHeader("MAN-user-password", manPassword);
        method.addRequestHeader("MAN-crm-id", manCrmId);

        // send it off!
        int statusCode = client.executeMethod(method);

        ManResponseBean responseBean = new ManResponseBean();
        String result = "";

        // set the status code to the bean for use later (if necessary)
        responseBean.setStatusCode(statusCode + "");

        if (DEBUG)
            System.out.println("statuscode:" + statusCode);

        // if it was sent over correctly
        if (statusCode == HttpStatus.SC_OK) {
            // process the response from the server
            InputStream ins = method.getResponseBodyAsStream();

            // read bye by byte into a "buffer"
            int byteRead = -1;

            while ((byteRead = ins.read()) != -1) {
                result += (char) byteRead;
            }

            if (DEBUG)
                System.out.println(result);

        }

        Header[] headers = method.getResponseHeaders();

        if (headers != null && headers.length > 0) {
            for (int i = 0; i < headers.length; i++) {
                if (DEBUG)
                    System.out.println(headers[i].getName() + " : " + headers[i].getValue());

                if (headers[i].getName().equals("MAN-error-code")) {
                    responseBean.setMAN_ERROR_CODE(headers[i].getValue());
                } else if (headers[i].getName().equals("Entriq-error-code")) {
                    responseBean.setENTRIQ_ERROR_CODE(headers[i].getValue());
                }
            }
        }

        Cookie[] cookies = client.getState().getCookies();

        if (cookies == null || cookies.length == 0) {
            if (DEBUG)
                System.out.println("No cookie.");
        } else {

            javax.servlet.http.Cookie[] responseCookies = new javax.servlet.http.Cookie[cookies.length];

            for (int i = 0; i < cookies.length; i++) {
                javax.servlet.http.Cookie cook = new javax.servlet.http.Cookie(cookies[i].getName(), cookies[i].getValue());
                cook.setDomain(cookieDomain);
                cook.setPath("/");
                cook.setMaxAge(7200);

                responseCookies[i] = cook;

                if (DEBUG)
                    System.out.println("COOKIE:" + cookies[i].getName() + "::" + cookies[i].getValue());
            }

            responseBean.setCookies(responseCookies);
        }

        responseBean.setBody(result);

        return responseBean;

    }

    protected String handleGetRequest(String url) throws Exception
    {
    	String result = "";
    	
		HttpClient httpClient = new HttpClient();
		GetMethod getMethod = new GetMethod(url);
		
		try 
		{
			int statusCode = httpClient.executeMethod(getMethod);
			
			if (statusCode != HttpStatus.SC_OK) {
				System.out.println("Method failed: "
						+ getMethod.getStatusLine());
			}

			byte[] responseBody = getMethod.getResponseBody();

			result = new String(responseBody);
		}
		catch (HttpException e)
		{
			e.printStackTrace();
		}
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			getMethod.releaseConnection();
		}
		
		return result;
    }

    private HttpClient initClient(javax.servlet.http.Cookie [] cookies) throws Exception {
        //Frank add for HTTPS ====================================================
        //Protocol myhttps = new Protocol("https", new EasySSLProtocolSocketFactory(), 443);
        //Protocol.registerProtocol("https", new Protocol("https", new EasySSLProtocolSocketFactory(), 443));
        HttpClient httpClient = new HttpClient();
        httpClient.getHostConfiguration().setHost(manBaseUrlSSL, 443, "https");
        //httpClient.getHostConfiguration().setHost(manBaseUrl, 80, "http");
        //END: Frank add for HTTPS ====================================================

        HttpState clientState = httpClient.getState();

        clientState.setCookiePolicy(CookiePolicy.COMPATIBILITY);

        if (cookies != null) {

            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().startsWith("MAN")) {
                    Cookie cook = new Cookie("." + cookieDomain, cookies[i].getName(), cookies[i].getValue());

                    clientState.addCookie(cook);

                    if (DEBUG)
                        System.out.println("setting request cookies:" + cookies[i].getName() + "::" + cookies[i].getValue());

                }
                // if ( cookies[i].getName().equals("MAN") )
                // {
                // cookieInfo = cookies[i].getValue();
                // System.out.println("cookie info:"+cookieInfo);
                // }

            }

        }

        httpClient.setConnectionTimeout(httpConnectionTimeout);
        //httpClient.getHostConfiguration().setHost(manBaseUrlSSL, 443, "https");
        //httpClient.getHostConfiguration().setHost(manBaseUrl, 80, "http");
        httpClient.setState(clientState);

        return httpClient;
    }
    
    private HttpClient initClientWithoutSSL(javax.servlet.http.Cookie [] cookies) throws Exception {
        //Frank add for HTTPS ====================================================
        //Protocol myhttps = new Protocol("https", new EasySSLProtocolSocketFactory(), 443);
        //Protocol.registerProtocol("https", new Protocol("https", new EasySSLProtocolSocketFactory(), 443));
        HttpClient httpClient = new HttpClient();
        //httpClient.getHostConfiguration().setHost(manBaseUrlSSL, 443, "https");
        httpClient.getHostConfiguration().setHost(manBaseUrl, 80, "http");
        //END: Frank add for HTTPS ====================================================

        HttpState clientState = httpClient.getState();

        clientState.setCookiePolicy(CookiePolicy.COMPATIBILITY);

        if (cookies != null) {

            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().startsWith("MAN")) {
                    Cookie cook = new Cookie("." + cookieDomain, cookies[i].getName(), cookies[i].getValue());

                    clientState.addCookie(cook);

                    if (DEBUG)
                        System.out.println("setting request cookies:" + cookies[i].getName() + "::" + cookies[i].getValue());

                }
                // if ( cookies[i].getName().equals("MAN") )
                // {
                // cookieInfo = cookies[i].getValue();
                // System.out.println("cookie info:"+cookieInfo);
                // }

            }

        }

        httpClient.setConnectionTimeout(httpConnectionTimeout);
        //httpClient.getHostConfiguration().setHost(manBaseUrlSSL, 443, "https");
        //httpClient.getHostConfiguration().setHost(manBaseUrl, 80, "http");
        httpClient.setState(clientState);

        return httpClient;
    }
    
    

    protected ManResponseBean handlePOSTRequest(String url, NameValuePair[] postData, javax.servlet.http.Cookie[] userCookies) throws Exception {
        return handlePOSTRequest(url, postData, null, userCookies);
    }

    protected ManResponseBean handlePOSTRequest(String url, String postData, javax.servlet.http.Cookie[] userCookies) throws Exception {
        return handlePOSTRequest(url, null, postData, userCookies);
    }

    protected ManResponseBean handlePOSTRequest(String url, NameValuePair[] postData, String body, javax.servlet.http.Cookie[] userCookies) throws Exception {

        PostMethod postMethod = null;
        ManResponseBean responseBean = null;
        String result = "";
        HttpClient httpClient = null;

        try {
            httpClient = initClient(userCookies);

            // init the response component
            responseBean = new ManResponseBean();

            // postMethod = new PostMethod(url);
            String connector = "?";
            if (url.indexOf("?") != -1)
                connector = "&";

            // if ( cookieInfo == null || cookieInfo.length() <= 0 )
            // cookieInfo = "CrmId=" + manCrmId;

            if (DEBUG)
                System.out.println("Calling:" + url + connector + "CrmId=" + manCrmId);

            postMethod = new PostMethod(url + connector + "CrmId=" + manCrmId);

            // save the auth information to request header
            postMethod.addRequestHeader("MAN-user-id", manUserId);
            postMethod.addRequestHeader("MAN-user-password", manPassword);
            postMethod.addRequestHeader("MAN-crm-id", manCrmId);

            // set the request body
            if (postData != null)
                postMethod.setRequestBody(postData);

            if (body != null)
                postMethod.setRequestBody(body);

            // send it off!
            int statusCode = httpClient.executeMethod(postMethod);

            // set the status code to the bean for use later (if necessary)
            responseBean.setStatusCode(statusCode + "");

            if (DEBUG)
                System.out.println("statuscode:" + statusCode);

            // if it was sent over correctly
            if (statusCode == HttpStatus.SC_OK) {
                // process the response from the server
                InputStream ins = postMethod.getResponseBodyAsStream();

                // read bye by byte into a "buffer"
                int byteRead = -1;

                while ((byteRead = ins.read()) != -1) {
                    result += (char) byteRead;
                }

                if (DEBUG)
                    System.out.println(result);

            }

            Header[] headers = postMethod.getResponseHeaders();

            if (headers != null && headers.length > 0) {
                for (int i = 0; i < headers.length; i++) {
                    if (DEBUG)
                        System.out.println(headers[i].getName() + " : " + headers[i].getValue());

                    if (headers[i].getName().equals("MAN-error-code")) {
                        responseBean.setMAN_ERROR_CODE(headers[i].getValue());
                    } else if (headers[i].getName().equals("Entriq-error-code")) {
                        responseBean.setENTRIQ_ERROR_CODE(headers[i].getValue());
                    }
                }
            }

            Cookie[] cookies = httpClient.getState().getCookies();

            if (cookies == null || cookies.length == 0) {
                if (DEBUG)
                    System.out.println("No cookie.");
            } else {

                javax.servlet.http.Cookie[] responseCookies = new javax.servlet.http.Cookie[cookies.length];

                for (int i = 0; i < cookies.length; i++) {
                    javax.servlet.http.Cookie cook = new javax.servlet.http.Cookie(cookies[i].getName(), cookies[i].getValue());
                    cook.setDomain(cookieDomain);
                    cook.setPath("/");
                    cook.setMaxAge(7200);

                    responseCookies[i] = cook;

                    if (DEBUG)
                        System.out.println("COOKIE:" + cookies[i].getName() + "::" + cookies[i].getValue());
                }

                responseBean.setCookies(responseCookies);
            }

            responseBean.setBody(result);

        } catch (Exception e) {
            e.printStackTrace();
            responseBean.setBody("");
        } finally {
            postMethod.releaseConnection();
        }

        return responseBean;
    }

    
    /**
     * Do not add CrmId
     * @param url
     * @param postData
     * @param body
     * @param userCookies
     * @return
     * @throws Exception
     */
    protected ManResponseBean handlePOSTRequest2(String url, NameValuePair[] postData, String body, javax.servlet.http.Cookie[] userCookies) throws Exception {

        PostMethod postMethod = null;
        ManResponseBean responseBean = null;
        String result = "";
        HttpClient httpClient = null;

        try {
            httpClient = initClient(userCookies);

            // init the response component
            responseBean = new ManResponseBean();

            // postMethod = new PostMethod(url);
            String connector = "?";
            if (url.indexOf("?") != -1)
                connector = "&";

            // if ( cookieInfo == null || cookieInfo.length() <= 0 )
            // cookieInfo = "CrmId=" + manCrmId;

            if (DEBUG)
                System.out.println("Calling:" + url);

            postMethod = new PostMethod(url);

            // save the auth information to request header
            postMethod.addRequestHeader("MAN-user-id", manUserId);
            postMethod.addRequestHeader("MAN-user-password", manPassword);
            postMethod.addRequestHeader("MAN-crm-id", manCrmId);

            // set the request body
            if (postData != null)
                postMethod.setRequestBody(postData);

            if (body != null)
                postMethod.setRequestBody(body);

            // send it off!
            int statusCode = httpClient.executeMethod(postMethod);

            // set the status code to the bean for use later (if necessary)
            responseBean.setStatusCode(statusCode + "");

            if (DEBUG)
                System.out.println("statuscode:" + statusCode);

            // if it was sent over correctly
            if (statusCode == HttpStatus.SC_OK) {
                // process the response from the server
                InputStream ins = postMethod.getResponseBodyAsStream();

                // read bye by byte into a "buffer"
                int byteRead = -1;

                while ((byteRead = ins.read()) != -1) {
                    result += (char) byteRead;
                }

                if (DEBUG)
                    System.out.println(result);

            }

            Header[] headers = postMethod.getResponseHeaders();

            if (headers != null && headers.length > 0) {
                for (int i = 0; i < headers.length; i++) {
                    if (DEBUG)
                        System.out.println(headers[i].getName() + " : " + headers[i].getValue());

                    if (headers[i].getName().equals("MAN-error-code")) {
                        responseBean.setMAN_ERROR_CODE(headers[i].getValue());
                    } else if (headers[i].getName().equals("Entriq-error-code")) {
                        responseBean.setENTRIQ_ERROR_CODE(headers[i].getValue());
                    }
                }
            }

            Cookie[] cookies = httpClient.getState().getCookies();

            if (cookies == null || cookies.length == 0) {
                if (DEBUG)
                    System.out.println("No cookie.");
            } else {

                javax.servlet.http.Cookie[] responseCookies = new javax.servlet.http.Cookie[cookies.length];

                for (int i = 0; i < cookies.length; i++) {
                    javax.servlet.http.Cookie cook = new javax.servlet.http.Cookie(cookies[i].getName(), cookies[i].getValue());
                    cook.setDomain(cookieDomain);
                    cook.setPath("/");
                    cook.setMaxAge(7200);

                    responseCookies[i] = cook;

                    if (DEBUG)
                        System.out.println("COOKIE:" + cookies[i].getName() + "::" + cookies[i].getValue());
                }

                responseBean.setCookies(responseCookies);
            }

            responseBean.setBody(result);

        } catch (Exception e) {
            e.printStackTrace();
            responseBean.setBody("");
        } finally {
            postMethod.releaseConnection();
        }

        return responseBean;
    }

    protected HashMap parseQueryString(String queryString) {
        ArrayList segments = tokenizeString(queryString, "&");
        HashMap queryParams = new HashMap();

        for (int i = 0; i < segments.size(); i++) {
            ArrayList eachParam = tokenizeString((String) segments.get(i), "=");

            if (eachParam.size() == 1) {
                queryParams.put(eachParam.get(0), "");
            } else if (eachParam.size() == 2) {
                queryParams.put(eachParam.get(0), eachParam.get(1));
            }
        }

        return queryParams;
    }

    private ArrayList tokenizeString(String str, String delim) {
        StringTokenizer st = new StringTokenizer(str, delim);
        ArrayList resultList = new ArrayList();

        while (st.hasMoreTokens()) {
            String token = st.nextToken();
            resultList.add(token);
        }
        return resultList;
    }

    protected abstract List mapResponseToBean(Document doc);

    protected Document parseXMLString(String xml) throws IOException, JDOMException {
        SAXBuilder builder = new SAXBuilder();
        Document document = builder.build(new StringReader(xml));

        return document;
    }

    protected void printXML(Document doc) throws IOException {
        XMLOutputter outputter = new XMLOutputter();
        outputter.output(doc, System.out);

    }

}