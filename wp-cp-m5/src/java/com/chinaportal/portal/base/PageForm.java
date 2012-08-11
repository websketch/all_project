package com.chinaportal.portal.base;

import org.apache.struts.action.ActionForm;

public class PageForm extends ActionForm {
	protected String curpage;
	protected String prepage;
	protected String nextpage;
	protected String tolpage;
	protected String tolrow;
	public String getCurpage() {
		return curpage;
	}
	public void setCurpage(String curpage) {
		this.curpage = curpage;
	}
	public String getTolpage() {
		return tolpage;
	}
	public void setTolpage(String tolpage) {
		this.tolpage = tolpage;
	}
	public String getTolrow() {
		return tolrow;
	}
	public void setTolrow(String tolrow) {
		this.tolrow = tolrow;
	}
	public String getNextpage() {
		return nextpage;
	}
	public void setNextpage(String nextpage) {
		this.nextpage = nextpage;
	}
	public String getPrepage() {
		return prepage;
	}
	public void setPrepage(String prepage) {
		this.prepage = prepage;
	}

}
