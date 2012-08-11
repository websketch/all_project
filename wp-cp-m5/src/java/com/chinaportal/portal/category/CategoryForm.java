package com.chinaportal.portal.category;

import com.chinaportal.portal.base.PageForm;

public class CategoryForm extends PageForm {
	private String category_id;
	
	private String tar;

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	
	

	public String getTar() {
		return tar;
	}
	public void setTar(String tar) {
		this.tar = tar;
	}
}
