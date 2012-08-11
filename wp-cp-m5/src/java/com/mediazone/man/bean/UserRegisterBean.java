package com.mediazone.man.bean;

/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: UserRegisterBean.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class UserRegisterBean extends BaseTransactionBean
{
    private String UserId = null;

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

    private String ReturnUrl = null;

    private String TermsAgree = null;

    private String Email = null;

    private String Language = null;

    private String FirstName = null;
    
    private String LastName = null;
    
    private String Name = null;
    
    /**
     * @return Returns the name.
     */
    public String getName()
    {
        return Name;
    }
    



    /**
     * @param name The name to set.
     */
    public void setName( String name )
    {
        Name = name;
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
     * @return Returns the email.
     */
    public String getEmail()
    {
        return Email;
    }
    

    /**
     * @param email The email to set.
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
     * @param emailNotify The emailNotify to set.
     */
    public void setEmailNotify( String emailNotify )
    {
        EmailNotify = emailNotify;
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
     * @return Returns the pinMenu.
     */
    public String getPinMenu()
    {
        return PinMenu;
    }
    

    /**
     * @param pinMenu The pinMenu to set.
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
     * @param pinPayment The pinPayment to set.
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
     * @param pinPG The pinPG to set.
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
     * @param pinPGRate The pinPGRate to set.
     */
    public void setPinPGRate( String pinPGRate )
    {
        PinPGRate = pinPGRate;
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
    

    /**
     * @return Returns the userId.
     */
    public String getUserId()
    {
        return UserId;
    }
    

    /**
     * @param userId The userId to set.
     */
    public void setUserId( String userId )
    {
        UserId = userId;
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
    
    
}
