/*
 * Created on 2005-1-26
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.mediazone.man.form;

import org.apache.struts.action.*;
import javax.servlet.http.*;

/**
 * @author Wang Jiexin
 * 
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class ReviewActionForm extends ActionForm
{
    private String content;

    private String media_id;

    private String media_type_id;

    private String user_id;

    private String detail_type;

    private String rating;

    private String title;

    private String name;

    public ActionErrors validate( ActionMapping actionMapping, HttpServletRequest httpServletRequest )
    {
        // System.out.println("hello here");
        /** @todo: finish this method, this is just the skeleton. */
        return null;
    }

    public void reset( ActionMapping actionMapping, HttpServletRequest httpServletRequest )
    {
    }

    public static void main( String[] args )
    {
    }

    /**
     * @return
     */
    public String getContent()
    {
        return content;
    }

    /**
     * @return
     */
    public String getMedia_id()
    {
        return media_id;
    }

    /**
     * @return
     */
    public String getUser_id()
    {
        return user_id;
    }

    /**
     * @param string
     */
    public void setContent( String string )
    {
        content = string;
    }

    /**
     * @param string
     */
    public void setMedia_id( String string )
    {
        media_id = string;
    }

    /**
     * @param string
     */
    public void setUser_id( String string )
    {
        user_id = string;
    }

    /**
     * @return
     */
    public String getDetail_type()
    {
        return detail_type;
    }

    /**
     * @param string
     */
    public void setDetail_type( String string )
    {
        detail_type = string;
    }

    /**
     * @return
     */
    public String getRating()
    {
        return rating;
    }

    /**
     * @param string
     */
    public void setRating( String string )
    {
        rating = string;
    }

    /**
     * @return
     */
    public String getTitle()
    {
        return title;
    }

    /**
     * @param string
     */
    public void setTitle( String string )
    {
        title = string;
    }

    /**
     * @return Returns the name.
     */
    public String getName()
    {
        return name;
    }

    /**
     * @param name
     *            The name to set.
     */
    public void setName( String name )
    {
        this.name = name;
    }

    /**
     * @return Returns the media_type_id.
     */
    public String getMedia_type_id()
    {
        return media_type_id;
    }

    /**
     * @param media_type_id
     *            The media_type_id to set.
     */
    public void setMedia_type_id( String media_type_id )
    {
        this.media_type_id = media_type_id;
    }

}
