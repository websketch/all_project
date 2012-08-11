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
 * $Id: AOLUserRegisterForm.java,v 1.1.2.1 2005/09/20 11:19:56 liushengbin Exp $
 */
public class AOLUserRegisterForm extends UserRegisterForm
{


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
        
        if (this.TermsAgree == null || this.TermsAgree.length() <= 0  )
        {
            errors.add("noTermsAgree", new ActionError("register.error.noTermsAgree"));
        }

        /*
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

        
       

        
        
        if ( errors.size() == 0 )
        {
            //validate cc
            if ( !ManValidator.isValidCreditCardNumber(this.SecureCardNumber, this.CardType) )
            {
                errors.add("invalidCC", new ActionError("register.error.invalidCreditCard"));
            }
        }
*/        
        
        return errors;
    }


    
   
    
}
