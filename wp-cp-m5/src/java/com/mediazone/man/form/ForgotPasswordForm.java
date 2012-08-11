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
 * $Id: ForgotPasswordForm.java,v 1.1.2.1 2005/09/20 11:19:56 liushengbin Exp $
 */
public class ForgotPasswordForm extends ActionForm
{
    private String email = null;

    private String question = null;

    private String answer = null;

    private String step = null;

    private String questionDescription = null;

    /**
     * @return Returns the questionDescription.
     */
    public String getQuestionDescription()
    {
        return questionDescription;
    }
    

    /**
     * @param questionDescription The questionDescription to set.
     */
    public void setQuestionDescription( String questionDescription )
    {
        this.questionDescription = questionDescription;
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

        if ( !ManValidator.isEmailValid(this.email) )
        {
            errors.add("noEmail", new ActionError("forgotPassword.invalidEmail"));
        }

        return errors;
    }



    /**
     * @return Returns the step.
     */
    public String getStep()
    {
        return step;
    }

    /**
     * @param step
     *            The step to set.
     */
    public void setStep( String step )
    {
        this.step = step;
    }

    /**
     * @return Returns the answer.
     */
    public String getAnswer()
    {
        return answer;
    }

    /**
     * @param answer
     *            The answer to set.
     */
    public void setAnswer( String answer )
    {
        this.answer = answer;
    }

    /**
     * @return Returns the email.
     */
    public String getEmail()
    {
        return email;
    }

    /**
     * @param email
     *            The email to set.
     */
    public void setEmail( String email )
    {
        this.email = email;
    }

    /**
     * @return Returns the question.
     */
    public String getQuestion()
    {
        return question;
    }

    /**
     * @param question
     *            The question to set.
     */
    public void setQuestion( String question )
    {
        this.question = question;
    }

}
