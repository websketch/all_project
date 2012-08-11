package com.chinaportal.portal.sports;

import java.util.List;

public class TeamView {
	private String id;
	private String name;
	private String brief_introduction;
	private String description;
	private String photo;
	private String members;
	private List actors;
	public String getBrief_introduction() {
		return brief_introduction;
	}
	
	public void setBrief_introduction(String brief_introduction) {
		this.brief_introduction = brief_introduction;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getMembers() {
		return members;
	}
	
	public void setMembers(String members) {
		this.members = members;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPhoto() {
		return photo;
	}
	
	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public List getActors() {
		return actors;
	}
	

	public void setActors(List actors) {
		this.actors = actors;
	}
	
	
	

}
