package com.mediazone.man.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import com.mediazone.man.ManValidator;

/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: UserRegisterForm.java,v 1.1.2.1 2005/09/20 11:19:56 liushengbin Exp $
 */
public class UserRegisterForm extends ActionForm
{
    protected String UserId = null;

    protected String SecurePassword = null;

    protected String ConfirmSecurePassword = null;

    protected String SecurePin = null;

    protected String PinPayment = null;

    protected String PinAmount = null;

    protected String PinMenu = null;

    protected String PinPG = null;

    protected String PinPGRate = null;

    protected String Question = null;

    protected String Answer = null;

    protected String LeadId = null;

    protected String EmailNotify = null;

    protected String etc = null;

    protected String ReturnUrl = null;

    protected String TermsAgree = null;

    protected String Email = null;

    protected String Language = null;

    protected String FirstName = null;

    protected String LastName = null;

    protected String Name = null;

    protected String CardName = null;

    protected String SecureCardNumber = null;

    protected String SecureCardID = null;

    protected String CardExpM = null;

    protected String CardExpY = null;

    protected String SecureCardAddress = null;

    protected String CardCity = null;

    protected String CardState = null;

    protected String CardZip = null;

    protected String CardCountry = null;

    protected String CardType = null;

    protected String credit = null;

    protected String debit = null;

    protected String price = null;

    protected String sessionId = null;

    protected String accountId = null;

    protected String itemID = null;

    protected String step = null;
    
    /**
     * @return Returns the step.
     */
    public String getStep()
    {
        return step;
    }
    


    /**
     * @param step The step to set.
     */
    public void setStep( String step )
    {
        this.step = step;
    }
    


    /**
     * @return Returns the accountId.
     */
    public String getAccountId()
    {
        return accountId;
    }
    

    /**
     * @param accountId The accountId to set.
     */
    public void setAccountId( String accountId )
    {
        this.accountId = accountId;
    }
    

    /**
     * @return Returns the credit.
     */
    public String getCredit()
    {
        return credit;
    }
    

    /**
     * @param credit The credit to set.
     */
    public void setCredit( String credit )
    {
        this.credit = credit;
    }
    

    /**
     * @return Returns the debit.
     */
    public String getDebit()
    {
        return debit;
    }
    

    /**
     * @param debit The debit to set.
     */
    public void setDebit( String debit )
    {
        this.debit = debit;
    }
    

    /**
     * @return Returns the itemID.
     */
    public String getItemID()
    {
        return itemID;
    }
    

    /**
     * @param itemID The itemID to set.
     */
    public void setItemID( String itemID )
    {
        this.itemID = itemID;
    }
    

    /**
     * @return Returns the price.
     */
    public String getPrice()
    {
        return price;
    }
    

    /**
     * @param price The price to set.
     */
    public void setPrice( String price )
    {
        this.price = price;
    }
    

    /**
     * @return Returns the sessionId.
     */
    public String getSessionId()
    {
        return sessionId;
    }
    

    /**
     * @param sessionId The sessionId to set.
     */
    public void setSessionId( String sessionId )
    {
        this.sessionId = sessionId;
    }
    

    /*
     * (non-Javadoc)
     * 
     * @see org.apache.struts.action.ActionForm#validate(org.apache.struts.action.ActionMapping,
     *      javax.servlet.http.HttpServletRequest)
     */
    public ActionErrors validate( ActionMapping arg0, HttpServletRequest arg1 )
    {
        ActionErrors errors = new ActionErrors();

        if ( this.FirstName == null || this.FirstName.length() <= 0 )
        {
            errors.add("noFirstName", new ActionError("register.error.noFirstName"));
        }
        if ( this.LastName == null || this.LastName.length() <= 0 )
        {
            errors.add("noLastName", new ActionError("register.error.noLastName"));
        }

        if ( this.SecurePassword == null || this.SecurePassword.length() <= 0 )
        {
            errors.add("noPassword", new ActionError("register.error.noPassword"));
        }

        if ( this.ConfirmSecurePassword == null || this.ConfirmSecurePassword.length() <= 0 )
        {
            errors.add("noConfirmPassword", new ActionError("register.error.noConfirmPassword"));
        }

        if ( this.SecurePassword != null && this.SecurePassword.length() > 0 && this.ConfirmSecurePassword != null
                && this.ConfirmSecurePassword.length() > 0 && !this.SecurePassword.equals(this.ConfirmSecurePassword) )
        {
            errors.add("mismatchPassword", new ActionError("register.error.passwordMismatch"));
        }

        // Name

        if ( this.Email == null || this.Email.length() <= 0 )
        {
            errors.add("noEmail", new ActionError("register.error.noEmail"));
        }
        else
        {
            if ( !ManValidator.isEmailValid(this.Email) )
                errors.add("invalidEmail", new ActionError("register.error.invalidEmail"));
        }

        if ( this.Question == null || this.Question.length() <= 0 )
        {
            errors.add("noQuestion", new ActionError("register.error.noQuestion"));
        }

        if ( this.Answer == null || this.Answer.length() <= 0 )
        {
            errors.add("noAnswer", new ActionError("register.error.noAnswer"));
        }

        if ( this.CardName == null || this.CardName.length() <= 0 )
        {
            errors.add("noCardName", new ActionError("register.error.noCardName"));
        }
        if ( this.SecureCardNumber == null || this.SecureCardNumber.length() <= 0 )
        {
            errors.add("noSecureCardNumber", new ActionError("register.error.noCardNumber"));
        }
        if ( this.SecureCardID == null || this.SecureCardID.length() <= 0 )
        {
            errors.add("noSecureCardID", new ActionError("register.error.noSecureCardID"));
        }
        if ( this.CardExpM == null || this.CardExpM.length() <= 0 || this.CardExpY == null
                || this.CardExpY.length() <= 0 )
        {
            errors.add("noCardExpY", new ActionError("register.error.noCardExp"));
        }
        if ( this.SecureCardAddress == null || this.SecureCardAddress.length() <= 0 )
        {
            errors.add("noSecureCardAddress", new ActionError("register.error.noCardAddress"));
        }
        if ( this.CardCity == null || this.CardCity.length() <= 0 )
        {
            errors.add("noCardCity", new ActionError("register.error.noCardCity"));
        }
        if ( this.CardState == null || this.CardState.length() <= 0 )
        {
            errors.add("noCardState", new ActionError("register.error.noCardState"));
        }
        if ( this.CardZip == null || this.CardZip.length() <= 0 )
        {
            errors.add("noCardZip", new ActionError("register.error.noCardZip"));
        }
        if ( this.CardCountry == null || this.CardCountry.length() <= 0 )
        {
            errors.add("noCardCountry", new ActionError("register.error.noCardCountry"));
        }
        if ( this.CardType == null || this.CardType.length() <= 0 )
        {
            errors.add("noCardType", new ActionError("register.error.noCardType"));
        }

        if ( this.TermsAgree == null || this.TermsAgree.length() <= 0 )
        {
            errors.add("noTermsAgree", new ActionError("register.error.noTermsAgree"));
        }

        if ( errors.size() == 0 )
        {
            // validate cc

            if ( !ManValidator.isValidCreditCardNumber(this.SecureCardNumber, this.CardType) )
            {
                errors.add("invalidCC", new ActionError("register.error.invalidCreditCard"));
            }
        }

        return errors;
    }

    /**
     * @return Returns the answer.
     */
    public String getAnswer()
    {
        return Answer;
    }

    /**
     * @param answer
     *            The answer to set.
     */
    public void setAnswer( String answer )
    {
        Answer = answer;
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
     * @return Returns the etc.
     */
    public String getEtc()
    {
        return etc;
    }

    /**
     * @param etc
     *            The etc to set.
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
     * @param firstName
     *            The firstName to set.
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
     * @param language
     *            The language to set.
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
     * @param lastName
     *            The lastName to set.
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
     * @param leadId
     *            The leadId to set.
     */
    public void setLeadId( String leadId )
    {
        LeadId = leadId;
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
     * @return Returns the pinAmount.
     */
    public String getPinAmount()
    {
        return PinAmount;
    }

    /**
     * @param pinAmount
     *            The pinAmount to set.
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
     * @return Returns the question.
     */
    public String getQuestion()
    {
        return Question;
    }

    /**
     * @param question
     *            The question to set.
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
     * @param returnUrl
     *            The returnUrl to set.
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
     * @param securePassword
     *            The securePassword to set.
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
     * @param securePin
     *            The securePin to set.
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
     * @param termsAgree
     *            The termsAgree to set.
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
     * @param userId
     *            The userId to set.
     */
    public void setUserId( String userId )
    {
        UserId = userId;
    }

    /**
     * @return Returns the confirmSecurePassword.
     */
    public String getConfirmSecurePassword()
    {
        return ConfirmSecurePassword;
    }

    /**
     * @param confirmSecurePassword
     *            The confirmSecurePassword to set.
     */
    public void setConfirmSecurePassword( String confirmSecurePassword )
    {
        ConfirmSecurePassword = confirmSecurePassword;
    }

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
     * @return Returns the cardType.
     */
    public String getCardType()
    {
        return CardType;
    }

    /**
     * @param cardType
     *            The cardType to set.
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
     * @param cardZip
     *            The cardZip to set.
     */
    public void setCardZip( String cardZip )
    {
        CardZip = cardZip;
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

}
