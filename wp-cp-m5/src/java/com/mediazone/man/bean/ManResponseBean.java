package com.mediazone.man.bean;

import javax.servlet.http.Cookie;
 
/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: ManResponseBean.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class ManResponseBean
{
    private String body;
    private String statusCode;
    private String MAN_ERROR_CODE;
    private String ENTRIQ_ERROR_CODE; 
    
    private Cookie[] cookies;

    /**
     * @return Returns the body.
     */
    public String getBody()
    {
        return body;
    }
    

    /**
     * @param body The body to set.
     */
    public void setBody( String body )
    {
        this.body = body;
    }
    

    /**
     * @return Returns the cookies.
     */
    public Cookie[] getCookies()
    {
        return cookies;
    }
    

    /**
     * @param cookies The cookies to set.
     */
    public void setCookies( Cookie[] cookies )
    {
        this.cookies = cookies;
    }


    /**
     * @return Returns the statusCode.
     */
    public String getStatusCode()
    {
        return statusCode;
    }
    


    /**
     * @param statusCode The statusCode to set.
     */
    public void setStatusCode( String statusCode )
    {
        this.statusCode = statusCode;
    }


    /**
     * @return Returns the eNTRIQ_ERROR_CODE.
     */
    public String getENTRIQ_ERROR_CODE()
    {
        return ENTRIQ_ERROR_CODE;
    }
    


    /**
     * @param entriq_error_code The eNTRIQ_ERROR_CODE to set.
     */
    public void setENTRIQ_ERROR_CODE( String entriq_error_code )
    {
        ENTRIQ_ERROR_CODE = entriq_error_code;
    }
    


    /**
     * @return Returns the mAN_ERROR_CODE.
     */
    public String getMAN_ERROR_CODE()
    {
        return MAN_ERROR_CODE;
    }
    


    /**
     * @param man_error_code The mAN_ERROR_CODE to set.
     */
    public void setMAN_ERROR_CODE( String man_error_code )
    {
        MAN_ERROR_CODE = man_error_code;
    }
    
    
    

}
