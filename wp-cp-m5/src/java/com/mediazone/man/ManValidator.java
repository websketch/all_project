package com.mediazone.man;

import org.apache.commons.lang.NumberUtils;

/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: ManValidator.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class ManValidator
{
    private static final String INVALID = "0";

    private static final String VISA = "V";

    private static final String MASTERCARD = "M";

    private static final String AMERICAN_EXPRESS = "A";

    private static final String DINERS_CLUB = "D";

    private static final String DISCOVER = "S";

    private static final String JCB = "J";


    
    public static boolean isValidCreditCardNumber( String ccNum, String cardType )
    {

        if ( ccNum.length() > 19 )
            return (false);

        String cardNumberType = INVALID;
       
        if ( !(cardNumberType = getCardID(ccNum)).equals("0") )
        {
            //check if card type and actual card format is correct
            if ( !cardNumberType.equals(cardType) )
                return false;
            
            return isValidCCNumber(ccNum);
        }

        return false;
    }

    private static boolean isValidCCNumber( String n)
    {
        try
        {
            /*
             * * known as the LUHN Formula (mod10)
             */
            int j = n.length();

            String[] s1 = new String[j];
            for ( int i = 0; i < n.length(); i++ )
                s1[i] = "" + n.charAt(i);

            int checksum = 0;

            for ( int i = s1.length - 1; i >= 0; i -= 2 )
            {
                int k = 0;

                if ( i > 0 )
                {
                    k = Integer.valueOf(s1[i - 1]).intValue() * 2;
                    if ( k > 9 )
                    {
                        String s = "" + k;
                        k = Integer.valueOf(s.substring(0, 1)).intValue() + Integer.valueOf(s.substring(1)).intValue();
                    }
                    checksum += Integer.valueOf(s1[i]).intValue() + k;
                }
                else
                    checksum += Integer.valueOf(s1[0]).intValue();
            }
            return ((checksum % 10) == 0);
        }
        catch ( Exception e )
        {
            return false;
        }
    }

    private static String getCardID( String number )
    {
        String valid = INVALID;

        String digit1 = number.substring(0, 1);
        String digit2 = number.substring(0, 2);
        String digit3 = number.substring(0, 3);
        String digit4 = number.substring(0, 4);

        if ( NumberUtils.isNumber(number) )
        {
            /*
             * ---- * VISA prefix=4 * ---- length=13 or 16 (can be 15 too!?!
             * maybe)
             */
            if ( digit1.equals("4") )
            {
                if ( number.length() == 13 || number.length() == 16 )
                    valid = VISA;
            }
            /*
             * ---------- * MASTERCARD prefix= 51 ... 55 * ---------- length= 16
             */
            else if ( digit2.compareTo("51") >= 0 && digit2.compareTo("55") <= 0 )
            {
                if ( number.length() == 16 )
                    valid = MASTERCARD;
            }
            /*
             * ---- * AMEX prefix=34 or 37 * ---- length=15
             */
            else if ( digit2.equals("34") || digit2.equals("37") )
            {
                if ( number.length() == 15 )
                    valid = AMERICAN_EXPRESS;
            }
            /*
             * ----- * DCLUB prefix=300 ... 305 or 36 or 38 * ----- length=14
             */
            else if ( digit2.equals("36") || digit2.equals("38")
                    || (digit3.compareTo("300") >= 0 && digit3.compareTo("305") <= 0) )
            {
                if ( number.length() == 14 )
                    valid = DINERS_CLUB;
            }
            /*
             * ---- * DISCOVER card prefix = 60 * -------- lenght = 16
             */
            else if ( digit2.equals("60") )
            {
                if ( number.length() == 16 )
                    valid = DISCOVER;
            }
            else if ( digit1.equals("3") && number.length() == 16 )
            {
                valid = JCB;
            }
            else if ( (digit4.equals("1800") || digit4.equals("2131")) && number.length() == 15 )
            {
                valid = JCB;
            }

        }
        return valid;

    }

    public static boolean isEmailValid( String email )
    {

        // Validate email
        if ( email == null || email.length() <= 0 )
        {
            return false;
        }
        else if ( !email
                .matches("([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)") )
        {
            return false;
        }

        return true;
    }
}
