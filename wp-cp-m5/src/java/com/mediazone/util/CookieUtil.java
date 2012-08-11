package com.mediazone.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil
{
    public static void setCookie( HttpServletResponse response, String name, String value )
    {
		try{
			Cookie killMyCookie = new Cookie(name, null); 
			killMyCookie.setDomain(com.mediazone.util.Common.manResources.getString("cookieDomain"));
			killMyCookie.setMaxAge(0);
			killMyCookie.setPath("/"); 
			response.addCookie(killMyCookie); 

			Cookie cookie = new Cookie(name, value);
			cookie.setDomain(com.mediazone.util.Common.manResources.getString("cookieDomain"));
			cookie.setMaxAge(3600*24*180);		
			cookie.setPath("/");
			response.addCookie(cookie);
		}catch(Exception e){
			e.printStackTrace();
		}
    }

    public static String getCookie( HttpServletRequest request, String key )
    {
        if ( request.getCookies() != null )
        {
            Cookie[] cookies = request.getCookies();

            if ( cookies.length > 0 )
            {
                for ( int i = 0; i < cookies.length; i++ )
                {
                    Cookie cookie = cookies[i];
                    if ( cookie.getName().equals(key) )
                    {
                        return cookie.getValue();
                    }
                }

            }
        }
        
        return "";
    }

}
