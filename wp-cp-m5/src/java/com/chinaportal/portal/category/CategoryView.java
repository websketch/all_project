/*
 * Created on 2005-7-1
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.chinaportal.portal.category;

import java.util.List;
import java.util.Properties;
import java.util.Set;

import com.mediazone.bean.CategoryCaption;

/**
 * @author Administrator
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class CategoryView {
	private String category_id;
	private String category_name;
	private String startTime;
	private String parent_id;
	private String parent_name;
	private String description;
	private String location;
	private String photo;
	private Properties captions;
	private List parents;
	private List children;
	
	public CategoryCaption getCaption(Integer lang){
		if(captions!=null)
			return (CategoryCaption)captions.get(lang);
		else{
			System.out.println(category_id+":"+lang);
			return null;
		}
	}
	
	public List getChildren() {
		return children;
	}
	




	public void setChildren(List children) {
		this.children = children;
	}
	




	public List getParents() {
		return parents;
	}
	



	public void setParents(List parents) {
		this.parents = parents;
	}
	


	public Properties getCaptions() {
		return captions;
	}
	




	public void setCaptions(Properties captions) {
		this.captions = captions;
	}
	




	public String getPhoto() {
		return photo;
	}
	

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	

	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return
	 */
	public String getCategory_id() {
		return category_id;
	}

	/**
	 * @return
	 */
	public String getCategory_name() {
		return category_name;
	}

	public String getstartTime() {
		return startTime;
	}
	/**
	 * @return
	 */
	public String getParent_id() {
		return parent_id;
	}

	/**
	 * @return
	 */
	public String getParent_name() {
		return parent_name;
	}

	/**
	 * @param string
	 */
	public void setCategory_id(String string) {
		category_id = string;
	}

	/**
	 * @param string
	 */
	public void setCategory_name(String string) {
		category_name = string;
	}

	/**
	 * @param string
	 */
	public void setParent_id(String string) {
		parent_id = string;
	}

	/**
	 * @param string
	 */
	public void setParent_name(String string) {
		parent_name = string;
	}

	/**
	 * @param string
	 */
	public void setStartTime(String string) {
		// TODO Auto-generated method stub
		this.startTime = string;
	}

}
