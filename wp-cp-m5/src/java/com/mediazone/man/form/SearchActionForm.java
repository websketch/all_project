package com.mediazone.man.form;

import org.apache.struts.action.*;
import javax.servlet.http.*;

public class SearchActionForm extends ActionForm
{
    private String category;

    private String key;

    private String viewMode;

    private String currentPage;
    
    public String getCurrentPage()
    {
        return currentPage;
    }
    

    public void setCurrentPage( String currentPage )
    {
        this.currentPage = currentPage;
    }
    

    public String getViewMode()
    {
        return viewMode;
    }

    public void setViewMode( String viewMode )
    {
        this.viewMode = viewMode;
    }

    public String getCategory()
    {
        return category;
    }

    public void setCategory( String category )
    {
        this.category = category;
    }

    public String getKey()
    {
        return key;
    }

    public void setKey( String key )
    {
        this.key = key;
    }

    public ActionErrors validate( ActionMapping actionMapping, HttpServletRequest httpServletRequest )
    {
        //System.out.println("hello here");
        /** @todo: finish this method, this is just the skeleton. */
        return null;
    }

    public void reset( ActionMapping actionMapping, HttpServletRequest httpServletRequest )
    {
    }
}