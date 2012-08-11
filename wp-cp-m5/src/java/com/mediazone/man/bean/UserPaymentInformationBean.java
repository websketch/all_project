package com.mediazone.man.bean;

/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: UserPaymentInformationBean.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */ 
public class UserPaymentInformationBean extends BaseTransactionBean
{
    private String CardName = null;
   
    private String SecurePassword = null;
    
    private String SecureCardNumber = null;

    private String SecureCardID = null;

    private String CardExpM = null;

    private String CardExpY = null;

    private String SecureCardAddress = null;

    private String CardCity = null;

    private String CardState = null;

    private String CardZip = null;

    private String CardCountry = null;
    
    private String CardType = null;

    private String ReturnUrl = null;

    private String TermsAgree = null;

    /**
     * @return Returns the cardCity.
     */
    public String getCardCity()
    {
        return CardCity;
    }

    /**
     * @param cardCity
     *            The cardCity to set.
     */
    public void setCardCity( String cardCity )
    {
        CardCity = cardCity;
    }

    /**
     * @return Returns the cardCountry.
     */
    public String getCardCountry()
    {
        return CardCountry;
    }

    /**
     * @param cardCountry
     *            The cardCountry to set.
     */
    public void setCardCountry( String cardCountry )
    {
        CardCountry = cardCountry;
    }

    /**
     * @return Returns the cardExpM.
     */
    public String getCardExpM()
    {
        return CardExpM;
    }

    /**
     * @param cardExpM
     *            The cardExpM to set.
     */
    public void setCardExpM( String cardExpM )
    {
        CardExpM = cardExpM;
    }

    /**
     * @return Returns the cardExpY.
     */
    public String getCardExpY()
    {
        return CardExpY;
    }

    /**
     * @param cardExpY
     *            The cardExpY to set.
     */
    public void setCardExpY( String cardExpY )
    {
        CardExpY = cardExpY;
    }

    /**
     * @return Returns the cardName.
     */
    public String getCardName()
    {
        return CardName;
    }

    /**
     * @param cardName
     *            The cardName to set.
     */
    public void setCardName( String cardName )
    {
        CardName = cardName;
    }

    /**
     * @return Returns the cardState.
     */
    public String getCardState()
    {
        return CardState;
    }

    /**
     * @param cardState
     *            The cardState to set.
     */
    public void setCardState( String cardState )
    {
        CardState = cardState;
    }

    /**
     * @return Returns the cardZip.
     */
    public String getCardZip()
    {
        return CardZip;
    }

    /**
     * @param cardZip
     *            The cardZip to set.
     */
    public void setCardZip( String cardZip )
    {
        CardZip = cardZip;
    }

    /**
     * @return Returns the returnUrl.
     */
    public String getReturnUrl()
    {
        return ReturnUrl;
    }

    /**
     * @param returnUrl
     *            The returnUrl to set.
     */
    public void setReturnUrl( String returnUrl )
    {
        ReturnUrl = returnUrl;
    }

    /**
     * @return Returns the secureCardAddress.
     */
    public String getSecureCardAddress()
    {
        return SecureCardAddress;
    }

    /**
     * @param secureCardAddress
     *            The secureCardAddress to set.
     */
    public void setSecureCardAddress( String secureCardAddress )
    {
        SecureCardAddress = secureCardAddress;
    }

    /**
     * @return Returns the secureCardID.
     */
    public String getSecureCardID()
    {
        return SecureCardID;
    }

    /**
     * @param secureCardID
     *            The secureCardID to set.
     */
    public void setSecureCardID( String secureCardID )
    {
        SecureCardID = secureCardID;
    }

    /**
     * @return Returns the secureCardNumber.
     */
    public String getSecureCardNumber()
    {
        return SecureCardNumber;
    }

    /**
     * @param secureCardNumber
     *            The secureCardNumber to set.
     */
    public void setSecureCardNumber( String secureCardNumber )
    {
        SecureCardNumber = secureCardNumber;
    }

    /**
     * @return Returns the termsAgree.
     */
    public String getTermsAgree()
    {
        return TermsAgree;
    }

    /**
     * @param termsAgree
     *            The termsAgree to set.
     */
    public void setTermsAgree( String termsAgree )
    {
        TermsAgree = termsAgree;
    }

    /**
     * @return Returns the cardType.
     */
    public String getCardType()
    {
        return CardType;
    }
    

    /**
     * @param cardType The cardType to set.
     */
    public void setCardType( String cardType )
    {
        CardType = cardType;
    }

    /**
     * @return Returns the securePassword.
     */
    public String getSecurePassword()
    {
        return SecurePassword;
    }
    

    /**
     * @param securePassword The securePassword to set.
     */
    public void setSecurePassword( String securePassword )
    {
        SecurePassword = securePassword;
    }
    
    

}
