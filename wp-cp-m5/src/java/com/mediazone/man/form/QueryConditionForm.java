/*
 * Created on 2005-1-20
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.mediazone.man.form;

import org.apache.struts.action.ActionForm;

/**
 * @author Administrator
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class QueryConditionForm extends ActionForm {
	private String searchValue;
	private String category;
	private String sortColumn;
	private String currentpage;
	private String gotopage;
	private String parent_category;
	private String parent_category_id;
	
	private String viewMode;

	/**
	 * @return
	 */
	public String getCategory() {
		return category;
	}

	/**
	 * @return
	 */
	public String getCurrentpage() {
		return currentpage;
	}

	/**
	 * @return
	 */
	public String getSearchValue() {
		return searchValue;
	}

	/**
	 * @return
	 */
	public String getSortColumn() {
		return sortColumn;
	}

	/**
	 * @param string
	 */
	public void setCategory(String string) {
		category = string;
	}

	/**
	 * @param i
	 */
	public void setCurrentpage(String i) {
		currentpage = i;
	}

	/**
	 * @param string
	 */
	public void setSearchValue(String string) {
		searchValue = string;
	}

	/**
	 * @param string
	 */
	public void setSortColumn(String string) {
		sortColumn = string;
	}

	/**
	 * @return
	 */
	public String getViewMode() {
		return viewMode;
	}

	/**
	 * @param string
	 */
	public void setViewMode(String string) {
		viewMode = string;
	}

	/**
	 * @return
	 */
	public String getGotopage() {
		return gotopage;
	}

	/**
	 * @param string
	 */
	public void setGotopage(String string) {
		gotopage = string;
	}

	/**
	 * @return
	 */
	public String getParent_category() {
		return parent_category;
	}

	/**
	 * @param string
	 */
	public void setParent_category(String string) {
		parent_category = string;
	}

	/**
	 * @return
	 */
	public String getParent_category_id() {
		return parent_category_id;
	}

	/**
	 * @param string
	 */
	public void setParent_category_id(String string) {
		parent_category_id = string;
	}

}
