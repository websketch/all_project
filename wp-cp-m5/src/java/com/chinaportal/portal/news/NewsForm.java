/*
 * Created on 2005-7-26
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.news;

import com.chinaportal.portal.base.PageForm;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class NewsForm extends PageForm {
	
	private String news_id;
	private String tar;
	

	public String getNews_id() {
		return news_id;
	}
	public void setNews_id(String news_id) {
		this.news_id = news_id;
	}
	
	public String getTar() {
		return tar;
	}
	public void setTar(String tar) {
		this.tar = tar;
	}
}
