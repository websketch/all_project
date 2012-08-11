/*
 * File   : $Source: /cvsroot/xpatrinet/wp-cp/src/java/com/chinaportal/portal/comment/CommentForm.java,v $
 * Date   : $Date: 2005/07/14 05:57:43 $
 * Version: $Revision: 1.1.2.3 $
 * Author : $Author: hujf $
 */
package com.chinaportal.portal.comment;

import org.apache.struts.action.ActionForm;

/**
 * @author Jason
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class CommentForm extends ActionForm {
	private Integer lang_id;
	private Integer media_id;
	private Integer category_id;
	private String user_id;
	
	private String title;
	private String content;
	private String rating;
	

	public Integer getCategory_id() {
		return category_id;
	}
	public Integer getLang_id() {
		return lang_id;
	}
	public Integer getMedia_id() {
		return media_id;
	}
	
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}
	public void setLang_id(Integer lang_id) {
		this.lang_id = lang_id;
	}
	public void setMedia_id(Integer media_id) {
		this.media_id = media_id;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getRating() {
		return rating;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
