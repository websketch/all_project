package com.chinaportal.portal.aol;

import java.io.Serializable;

public class ChildMedia implements Serializable {

	private String id;
	private String parent_id;
	private String name;
	private String caption;
	private String parent_caption;
	
	private boolean selected;

	public String getId() {
		return id;
	}
	public void setId(String string) {
		id = string;
	}

	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String string) {
		parent_id = string;
	}

	public String getName() {
		return name;
	}
	public void setName(String string) {
		name = string;
	}

	public String getCaption() {
		return caption;
	}
	public void setCaption(String string) {
		caption = string;
	}

	public String getParent_caption() {
		return parent_caption;
	}
	public void setParent_caption(String string) {
		parent_caption = string;
	}

	public boolean getSelected() {
		return selected;
	}
	public void setSelected(boolean bool) {
		selected = bool;
	}

}
