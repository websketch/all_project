package com.mediazone.man;

/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: ManResponseCodes.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public final class ManResponseCodes
{

    // NO Problems!
    public static String RC_NO_ERROR_0 = "0";

    public static String RC_NO_ERROR_200 = "200";

    // User authorization error codes:
    //Region is blocked
    public static String RC_REGION_BLOCKED = "100";

    //Content not yet available
    public static String RC_CONTENT_NOT_AVAIL_110 = "110";

    //Content no longer available
    public static String RC_CONTENT_NO_LONGER_AVAIL = "120";

    //Content not available at this time
    public static String RC_CONTENT_NOT_AVAIL_TIME = "130";

    //No valid entitlement
    public static String RC_NO_ENTITLEMENT = "140";

    //Entitlement expired
    public static String RC_ENTITLEMENT_EXPIRED = "150";

    //Not yet entitled
    public static String RC_NOT_YET_ENTITLED = "160";

    //Not yet entitled
    public static String RC_ALREADY_AUTHORIZED = "165";

    //Payment required
    public static String RC_PAYMENT_REQUIRED = "170";

    //No credit
    public static String RC_NO_CREDIT = "172";

    //Monthly credit limit reached
    public static String RC_MONTHLY_CREDIT_LIMIT = "173";

    //Access time expired
    public static String RC_ACCESS_TIME_EXPIRED = "180";

    //Parental control
    public static String RC_PARENTAL_CONTROL = "190";

    //Requires a PIN code
    public static String RC_REQUIRES_PIN = "195";

    //Invalid PIN code
    public static String RC_INVALID_PIN = "196";

    // User authorization error codes, security and fraud related:

    //Too many simultaneous streams.
    public static String RC_TOO_MANY_SIM_STREAMS = "400";

    //Invalid IP address
    public static String RC_INVALID_IP_ADDRESS = "401";

    //Player security upgrade required
    public static String RC_PLAYER_SECURITY_UPGRADE_REQUIRED = "402";

    //Session sharing detected between multiple players.
    public static String RC_SESSION_SHARING = "403";

    // System error codes
    
    //System Error
    public static String RC_SYSTEM_ERROR = "500";

    //User not authenticated
    public static String RC_USER_NOT_AUTHENTICATED = "505";

    //Content is not available
    public static String RC_CONTENT_NOT_AVAIL_510 = "510";

    //Incorrect user ID or password
    public static String RC_INCORRECT_USER_ID_PASSWORD = "520";
    
    //User already exists
    public static String RC_USER_ALREADY_EXIST = "530";

    //Client upgrade required
    public static String RC_CLIENT_UPGRADE_REQUIRED = "540";

    //this error code is theoretical.  Seems like true from the testing
    //Duplicate Email/User
    public static String RC_DUPLICATE_USER = "550";
    
    //Invalid payment information.
    public static String RC_INVALID_PAYMENT_INFORMATION = "560-x-y";

    // Payment processor (x) and payment error code (y) are appended to error
    // code. Example = "560-verisign-24 for Verisign invalid expiration date.";
}
