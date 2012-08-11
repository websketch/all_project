package com.mediazone.man;

/**
 * This class creates one instance of the man classes. This will help reduce the overhead in constructing and destructing classes created for each login(for example)
 * 
 * @author Hanson Wong $Id: ManHandler.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class ManHandler {
    public static RegisterUserTransaction registerUser = new RegisterUserTransaction();

    public static UserLoginTransaction loginUser = new UserLoginTransaction();

    public static UserLogoutTransaction logoutUser = new UserLogoutTransaction();

    public static UserForgotPassword userForgotPassword = new UserForgotPassword();

    public static UserInfoTransaction userInfo = new UserInfoTransaction();

    public static AuthorizeTransaction authorize = new AuthorizeTransaction();
    
    public static DeAuthorizeTransaction deauthorize = new DeAuthorizeTransaction();
}