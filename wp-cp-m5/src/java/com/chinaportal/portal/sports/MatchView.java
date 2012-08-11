package com.chinaportal.portal.sports;

import java.util.List;

public class MatchView {
	private String id;
	private String name;
	private String starttime;
	private String endtime;
	private String photo;
	private String description;
	private String highlight;
	private List host;
	private List guest;
	private String host_id;
	private String visiting_id;
    private String time;
	private String onlineURL;
	private String downloadURL;
	private String dir;
	private String channel_id;
	private String channel_name;
	private String level;
	private List reviews;
	
	public String getDir() {
		return dir;
	}
	





	public void setDir(String dir) {
		this.dir = dir;
	}
	





	public List getReviews() {
		return reviews;
	}
	




	public void setReviews(List reviews) {
		this.reviews = reviews;
	}
	




	public String getLevel() {
		return level;
	}
	



	public void setLevel(String level) {
		this.level = level;
	}
	



	public List getGuest() {
		return guest;
	}
	


	public void setGuest(List guest) {
		this.guest = guest;
	}
	


	public List getHost() {
		return host;
	}
	


	public void setHost(List host) {
		this.host = host;
	}
	


	public String getHost_id() {
		return host_id;
	}
	

	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	

	public String getVisiting_id() {
		return visiting_id;
	}
	

	public void setVisiting_id(String visiting_id) {
		this.visiting_id = visiting_id;
	}
	

	public String getChannel_id() {
		return channel_id;
	}
	
	public void setChannel_id(String channel_id) {
		this.channel_id = channel_id;
	}
	
	public String getChannel_name() {
		return channel_name;
	}
	
	public void setChannel_name(String channel_name) {
		this.channel_name = channel_name;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDownloadURL() {
		return downloadURL;
	}
	public void setDownloadURL(String downloadURL) {
		this.downloadURL = downloadURL;
	}
	public String getHighlight() {
		return highlight;
	}
	public void setHighlight(String highlight) {
		this.highlight = highlight;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOnlineURL() {
		return onlineURL;
	}
	public void setOnlineURL(String onlineURL) {
		this.onlineURL = onlineURL;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getEndtime() {
		return endtime;
	}
	
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	
	public String getStarttime() {
		return starttime;
	}
	
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	
}
