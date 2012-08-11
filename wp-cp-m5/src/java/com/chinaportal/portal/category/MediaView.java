/*
 * Created on 2005-6-23
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.chinaportal.portal.category;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Administrator
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class MediaView implements Serializable{
	private String id;
	private String name;	
	private String photo;
	private String description;
	private String highlight;
	private String directors;
	private String actors;
	private String starttime;
	private String onlineURL;
	private String dir;
	private String downloadURL;
	private String freeUrl;
	private List children;
	private String level;
	private String category_id;
	private String parent_id;
	private String price;
	private String manPackageId;
	
	

	
	public String getManPackageId() {
		return manPackageId;
	}

	public void setManPackageId(String manPackageId) {
		this.manPackageId = manPackageId;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	


	public String getParent_id() {
		return parent_id;
	}


	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}


	public String getCategory_id() {
		return category_id;
	}
	

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	

	public String getDir() {
		return dir;
	}
	
	public void setDir(String dir) {
		this.dir = dir;
	}
	
	public void addChild(MediaView child){
		if(children==null)
			children=new ArrayList();
		children.add(child);
	}
	public String getLevel() {
		return level;
	}
	

	public void setLevel(String level) {
		this.level = level;
	}
	

	/**
	 * @return
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @return
	 */
	public String getId() {
		return id;
	}

	/**
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * @return
	 */
	public String getPhoto() {
		return photo;
	}

	/**
	 * @param string
	 */
	public void setDescription(String string) {
		description = string;
	}

	/**
	 * @param string
	 */
	public void setId(String string) {
		id = string;
	}

	/**
	 * @param string
	 */
	public void setName(String string) {
		name = string;
	}

	/**
	 * @param string
	 */
	public void setPhoto(String string) {
		photo = string;
	}

	/**
	 * @return
	 */
	public String getActors() {
		return actors;
	}

	/**
	 * @return
	 */
	public String getDirectors() {
		return directors;
	}

	/**
	 * @return
	 */
	public String getDownloadURL() {
		return downloadURL;
	}

	/**
	 * @return
	 */
	public String getHighlight() {
		return highlight;
	}

	/**
	 * @return
	 */
	public String getOnlineURL() {
		return onlineURL;
	}

	/**
	 * @param string
	 */
	public void setActors(String string) {
		actors = string;
	}

	/**
	 * @param string
	 */
	public void setDirectors(String string) {
		directors = string;
	}

	/**
	 * @param string
	 */
	public void setDownloadURL(String string) {
		downloadURL = string;
	}

	/**
	 * @param string
	 */
	public void setHighlight(String string) {
		highlight = string;
	}

	/**
	 * @param string
	 */
	public void setOnlineURL(String string) {
		onlineURL = string;
	}

	public List getChildren() {
		return children;
	}
	

	public void setChildren(List children) {
		this.children = children;
	}


	public String getStarttime() {
		return starttime;
	}


	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}


	public String getFreeUrl() {
		return freeUrl;
	}


	public void setFreeUrl(String freeUrl) {
		this.freeUrl = freeUrl;
	}
	

}
