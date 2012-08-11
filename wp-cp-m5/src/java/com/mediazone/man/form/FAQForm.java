package com.mediazone.man.form;

import org.apache.struts.action.ActionForm;

/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: FAQForm.java,v 1.1.2.1 2005/09/20 11:19:56 liushengbin Exp $
 */
public class FAQForm extends ActionForm
{
    private String question;

    private String answer;

    private int id;
    
    public FAQForm(int id, String question, String answer)
    {
        this.question = question;
        this.answer = answer;
        this.id = id;
    }

    public String getAnswer()
    {
        return answer;
    }
    

    public void setAnswer( String answer )
    {
        this.answer = answer;
    }
    

    public String getQuestion()
    {
        return question;
    }
    

    public void setQuestion( String question )
    {
        this.question = question;
    }

    public int getId()
    {
        return id;
    }
    

    public void setId( int id )
    {
        this.id = id;
    }
    
    

}
