package com.mediazone.man.form;

import javax.servlet.http.Cookie;

import org.apache.struts.action.ActionForm;

/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: UserManForm.java,v 1.1.2.1 2005/09/20 11:19:56 liushengbin Exp $
 */
public class UserManForm extends ActionForm
{
    private String Result = null;

    private String ErrorCode = null;

    private String ErrorMessage = null;

    private String SessionId = null;

    private String Ticket = null;

    private String CrmId = null;

    private String UserId = null;

    private String AccountId = null;

    private String AgentHost = null;

    private String AgentId = null;

    private Cookie[] cookies = null;

    private String Version = null;

    private String Name = null;

    private String Debit = null;

    private String Credit = null;

    private String AccessTime = null;

    private String BillDay = null;

    private String Status = null;

    private String Langauge = null;

    private String Country = null;

    private String Pin = null;

    private String SecurePassword = null;

    private String SecurePin = null;

    private String PinPayment = null;

    private String PinAmount = null;

    private String PinMenu = null;

    private String PinPG = null;

    private String PinPGRate = null;

    private String Question = null;

    private String Answer = null;

    private String LeadId = null;

    private String EmailNotify = null;

    private String etc = null;

    private String Email = null;

    private String Language = null;

    private String FirstName = null;

    private String LastName = null;

    private String CardName = null;

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

    private String loginForwardURL = null;
    
    /**
     * @return Returns the loginForwardURL.
     */
    public String getLoginForwardURL()
    {
        return loginForwardURL;
    }
    

    /**
     * @param loginForwardURL The loginForwardURL to set.
     */
    public void setLoginForwardURL( String loginForwardURL )
    {
        this.loginForwardURL = loginForwardURL;
    }
    

    /**
     * @return Returns the cookies.
     */
    public Cookie[] getCookies()
    {
        return cookies;
    }

    /**
     * @param cookies
     *            The cookies to set.
     */
    public void setCookies( Cookie[] cookies )
    {
        this.cookies = cookies;
    }

    /**
     * @return Returns the errorCode.
     */
    public String getErrorCode()
    {
        return ErrorCode;
    }

    /**
     * @param errorCode
     *            The errorCode to set.
     */
    public void setErrorCode( String errorCode )
    {
        ErrorCode = errorCode;
    }

    /**
     * @return Returns the errorMessage.
     */
    public String getErrorMessage()
    {
        return ErrorMessage;
    }

    /**
     * @param errorMessage
     *            The errorMessage to set.
     */
    public void setErrorMessage( String errorMessage )
    {
        ErrorMessage = errorMessage;
    }

    /**
     * @return Returns the result.
     */
    public String getResult()
    {
        return Result;
    }

    /**
     * @param result
     *            The result to set.
     */
    public void setResult( String result )
    {
        Result = result;
    }

    /**
     * @return Returns the accountId.
     */
    public String getAccountId()
    {
        return AccountId;
    }

    /**
     * @param accountId
     *            The accountId to set.
     */
    public void setAccountId( String accountId )
    {
        AccountId = accountId;
    }

    /**
     * @return Returns the agentHost.
     */
    public String getAgentHost()
    {
        return AgentHost;
    }

    /**
     * @param agentHost
     *            The agentHost to set.
     */
    public void setAgentHost( String agentHost )
    {
        AgentHost = agentHost;
    }

    /**
     * @return Returns the agentId.
     */
    public String getAgentId()
    {
        return AgentId;
    }

    /**
     * @param agentId
     *            The agentId to set.
     */
    public void setAgentId( String agentId )
    {
        AgentId = agentId;
    }

    /**
     * @return Returns the crmId.
     */
    public String getCrmId()
    {
        return CrmId;
    }

    /**
     * @param crmId
     *            The crmId to set.
     */
    public void setCrmId( String crmId )
    {
        CrmId = crmId;
    }

    /**
     * @return Returns the sessionId.
     */
    public String getSessionId()
    {
        return SessionId;
    }

    /**
     * @param sessionId
     *            The sessionId to set.
     */
    public void setSessionId( String sessionId )
    {
        SessionId = sessionId;
    }

    /**
     * @return Returns the ticket.
     */
    public String getTicket()
    {
        return Ticket;
    }

    /**
     * @param ticket
     *            The ticket to set.
     */
    public void setTicket( String ticket )
    {
        Ticket = ticket;
    }

    /**
     * @return Returns the userId.
     */
    public String getUserId()
    {
        return UserId;
    }

    /**
     * @param userId
     *            The userId to set.
     */
    public void setUserId( String userId )
    {
        UserId = userId;
    }

    /**
     * @return Returns the accessTime.
     */
    public String getAccessTime()
    {
        return AccessTime;
    }

    /**
     * @param accessTime
     *            The accessTime to set.
     */
    public void setAccessTime( String accessTime )
    {
        AccessTime = accessTime;
    }

    /**
     * @return Returns the billDay.
     */
    public String getBillDay()
    {
        return BillDay;
    }

    /**
     * @param billDay
     *            The billDay to set.
     */
    public void setBillDay( String billDay )
    {
        BillDay = billDay;
    }

    /**
     * @return Returns the country.
     */
    public String getCountry()
    {
        return Country;
    }

    /**
     * @param country
     *            The country to set.
     */
    public void setCountry( String country )
    {
        Country = country;
    }

    /**
     * @return Returns the credit.
     */
    public String getCredit()
    {
        return Credit;
    }

    /**
     * @param credit
     *            The credit to set.
     */
    public void setCredit( String credit )
    {
        Credit = credit;
    }

    /**
     * @return Returns the debit.
     */
    public String getDebit()
    {
        return Debit;
    }

    /**
     * @param debit
     *            The debit to set.
     */
    public void setDebit( String debit )
    {
        Debit = debit;
    }

    /**
     * @return Returns the email.
     */
    public String getEmail()
    {
        return Email;
    }

    /**
     * @param email
     *            The email to set.
     */
    public void setEmail( String email )
    {
        Email = email;
    }

    /**
     * @return Returns the emailNotify.
     */
    public String getEmailNotify()
    {
        return EmailNotify;
    }

    /**
     * @param emailNotify
     *            The emailNotify to set.
     */
    public void setEmailNotify( String emailNotify )
    {
        EmailNotify = emailNotify;
    }

    /**
     * @return Returns the langauge.
     */
    public String getLangauge()
    {
        return Langauge;
    }

    /**
     * @param langauge
     *            The langauge to set.
     */
    public void setLangauge( String langauge )
    {
        Langauge = langauge;
    }

    /**
     * @return Returns the name.
     */
    public String getName()
    {
        return Name;
    }

    /**
     * @param name
     *            The name to set.
     */
    public void setName( String name )
    {
        Name = name;
    }

    /**
     * @return Returns the pin.
     */
    public String getPin()
    {
        return Pin;
    }

    /**
     * @param pin
     *            The pin to set.
     */
    public void setPin( String pin )
    {
        Pin = pin;
    }

    /**
     * @return Returns the pinMenu.
     */
    public String getPinMenu()
    {
        return PinMenu;
    }

    /**
     * @param pinMenu
     *            The pinMenu to set.
     */
    public void setPinMenu( String pinMenu )
    {
        PinMenu = pinMenu;
    }

    /**
     * @return Returns the pinPayment.
     */
    public String getPinPayment()
    {
        return PinPayment;
    }

    /**
     * @param pinPayment
     *            The pinPayment to set.
     */
    public void setPinPayment( String pinPayment )
    {
        PinPayment = pinPayment;
    }

    /**
     * @return Returns the pinPG.
     */
    public String getPinPG()
    {
        return PinPG;
    }

    /**
     * @param pinPG
     *            The pinPG to set.
     */
    public void setPinPG( String pinPG )
    {
        PinPG = pinPG;
    }

    /**
     * @return Returns the pinPGRate.
     */
    public String getPinPGRate()
    {
        return PinPGRate;
    }

    /**
     * @param pinPGRate
     *            The pinPGRate to set.
     */
    public void setPinPGRate( String pinPGRate )
    {
        PinPGRate = pinPGRate;
    }

    /**
     * @return Returns the status.
     */
    public String getStatus()
    {
        return Status;
    }

    /**
     * @param status
     *            The status to set.
     */
    public void setStatus( String status )
    {
        Status = status;
    }

    /**
     * @return Returns the version.
     */
    public String getVersion()
    {
        return Version;
    }

    /**
     * @param version
     *            The version to set.
     */
    public void setVersion( String version )
    {
        Version = version;
    }

    /**
     * @return Returns the answer.
     */
    public String getAnswer()
    {
        return Answer;
    }
    

    /**
     * @param answer The answer to set.
     */
    public void setAnswer( String answer )
    {
        Answer = answer;
    }
    

    /**
     * @return Returns the cardCity.
     */
    public String getCardCity()
    {
        return CardCity;
    }
    

    /**
     * @param cardCity The cardCity to set.
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
     * @param cardCountry The cardCountry to set.
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
     * @param cardExpM The cardExpM to set.
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
     * @param cardExpY The cardExpY to set.
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
     * @param cardName The cardName to set.
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
     * @param cardState The cardState to set.
     */
    public void setCardState( String cardState )
    {
        CardState = cardState;
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
     * @return Returns the cardZip.
     */
    public String getCardZip()
    {
        return CardZip;
    }
    

    /**
     * @param cardZip The cardZip to set.
     */
    public void setCardZip( String cardZip )
    {
        CardZip = cardZip;
    }
    

    /**
     * @return Returns the etc.
     */
    public String getEtc()
    {
        return etc;
    }
    

    /**
     * @param etc The etc to set.
     */
    public void setEtc( String etc )
    {
        this.etc = etc;
    }
    

    /**
     * @return Returns the firstName.
     */
    public String getFirstName()
    {
        return FirstName;
    }
    

    /**
     * @param firstName The firstName to set.
     */
    public void setFirstName( String firstName )
    {
        FirstName = firstName;
    }
    

    /**
     * @return Returns the language.
     */
    public String getLanguage()
    {
        return Language;
    }
    

    /**
     * @param language The language to set.
     */
    public void setLanguage( String language )
    {
        Language = language;
    }
    

    /**
     * @return Returns the lastName.
     */
    public String getLastName()
    {
        return LastName;
    }
    

    /**
     * @param lastName The lastName to set.
     */
    public void setLastName( String lastName )
    {
        LastName = lastName;
    }
    

    /**
     * @return Returns the leadId.
     */
    public String getLeadId()
    {
        return LeadId;
    }
    

    /**
     * @param leadId The leadId to set.
     */
    public void setLeadId( String leadId )
    {
        LeadId = leadId;
    }
    

    /**
     * @return Returns the pinAmount.
     */
    public String getPinAmount()
    {
        return PinAmount;
    }
    

    /**
     * @param pinAmount The pinAmount to set.
     */
    public void setPinAmount( String pinAmount )
    {
        PinAmount = pinAmount;
    }
    

    /**
     * @return Returns the question.
     */
    public String getQuestion()
    {
        return Question;
    }
    

    /**
     * @param question The question to set.
     */
    public void setQuestion( String question )
    {
        Question = question;
    }
    

    /**
     * @return Returns the returnUrl.
     */
    public String getReturnUrl()
    {
        return ReturnUrl;
    }
    

    /**
     * @param returnUrl The returnUrl to set.
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
     * @param secureCardAddress The secureCardAddress to set.
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
     * @param secureCardID The secureCardID to set.
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
     * @param secureCardNumber The secureCardNumber to set.
     */
    public void setSecureCardNumber( String secureCardNumber )
    {
        SecureCardNumber = secureCardNumber;
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
    

    /**
     * @return Returns the securePin.
     */
    public String getSecurePin()
    {
        return SecurePin;
    }
    

    /**
     * @param securePin The securePin to set.
     */
    public void setSecurePin( String securePin )
    {
        SecurePin = securePin;
    }
    

    /**
     * @return Returns the termsAgree.
     */
    public String getTermsAgree()
    {
        return TermsAgree;
    }
    

    /**
     * @param termsAgree The termsAgree to set.
     */
    public void setTermsAgree( String termsAgree )
    {
        TermsAgree = termsAgree;
    }
    

}
