package com.mediazone.man.bean;

/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: AuthorizationInfoBean.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class AuthorizationInfoBean extends BaseTransactionBean
{
    protected String Authorized = null;

    protected String ErrorCode = null;

    protected String ErrorCodes = null;

    protected String ErrorMessage = null;
    
    protected ContentBean content = null;
    
    protected SubPolicyBean subpolicy = null;

    /**
     * @return Returns the authorized.
     */
    public String getAuthorized()
    {
        return Authorized;
    }
    

    /**
     * @param authorized The authorized to set.
     */
    public void setAuthorized( String authorized )
    {
        Authorized = authorized;
    }
    

    /**
     * @return Returns the content.
     */
    public ContentBean getContent()
    {
        return content;
    }
    

    /**
     * @param content The content to set.
     */
    public void setContent( ContentBean content )
    {
        this.content = content;
    }
    

    /**
     * @return Returns the errorCode.
     */
    public String getErrorCode()
    {
        return ErrorCode;
    }
    

    /**
     * @param errorCode The errorCode to set.
     */
    public void setErrorCode( String errorCode )
    {
        ErrorCode = errorCode;
    }
    

    /**
     * @return Returns the errorCodes.
     */
    public String getErrorCodes()
    {
        return ErrorCodes;
    }
    

    /**
     * @param errorCodes The errorCodes to set.
     */
    public void setErrorCodes( String errorCodes )
    {
        ErrorCodes = errorCodes;
    }
    

    /**
     * @return Returns the errorMessage.
     */
    public String getErrorMessage()
    {
        return ErrorMessage;
    }
    

    /**
     * @param errorMessage The errorMessage to set.
     */
    public void setErrorMessage( String errorMessage )
    {
        ErrorMessage = errorMessage;
    }
    

    /**
     * @return Returns the subpolicy.
     */
    public SubPolicyBean getSubpolicy()
    {
        return subpolicy;
    }
    

    /**
     * @param subpolicy The subpolicy to set.
     */
    public void setSubpolicy( SubPolicyBean subpolicy )
    {
        this.subpolicy = subpolicy;
    }
    
    
}
