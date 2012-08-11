package sample;

import java.io.Serializable;
import java.util.*;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

import sample.BaseQuery;
import sample.DAOException;

/** @author Hibernate CodeGenerator */
public class Media_caption implements Serializable {
	private String location;
	private String premiere_area;
	private String crm_id;
    /** identifier field */
    private Integer media_id;

    /** identifier field */
    private Integer lang_id;

    /** nullable persistent field */
//    private String post;

    /** nullable persistent field */
    private String metadata;
    
    private String description;

    /** nullable persistent field */
    private java.util.Date create_time;

    /** nullable persistent field */
    private String creater;

    /** nullable persistent field */
    private java.util.Date update_time;

    /** nullable persistent field */
    private String updater;

    /** nullable persistent field */
    private String name;

    /** nullable persistent field */
    private String preview;
    
    private String highlight;
    
	private Media media;

    /** full constructor */
    public Media_caption(Integer media_id, Integer lang_id, java.lang.String post, String metadata, java.util.Date create_time, java.lang.String creater, java.util.Date update_time, java.lang.String updater, java.lang.String name, java.lang.String preview) {
        this.media_id = media_id;
        this.lang_id = lang_id;
//        this.post = post;
        this.metadata = metadata;
        this.create_time = create_time;
        this.creater = creater;
        this.update_time = update_time;
        this.updater = updater;
        this.name = name;
        this.preview = preview;
    }

    /** default constructor */
    public Media_caption() {
    }

    /** minimal constructor */
    public Media_caption(Integer media_id, Integer lang_id) {
        this.media_id = media_id;
        this.lang_id = lang_id;
    }

    public Integer getMedia_id() {
        return this.media_id;
    }

	public void setMedia_id(Integer media_id) {
		this.media_id = media_id;
	}

    public Integer getLang_id() {
        return this.lang_id;
    }

	public void setLang_id(Integer lang_id) {
		this.lang_id = lang_id;
	}

    public java.lang.String getPost() {
        BaseQuery bq = null;				
		String hql="select p from Photo p ";
		hql+= " where ";
		hql+= "  p.media_id =:mediaid";
		bq = new BaseQuery();
		Properties conditions = new Properties(); 
		//conditions.setProperty("langid", langid.toString());
		if (media_id == null) return null;
		conditions.setProperty("mediaid", media_id.toString());
		List resultList = null;
		try {
		    resultList = bq.executeQuery(hql, null, conditions);
		}catch (DAOException e){
		    e.printStackTrace();
		}
		if (resultList==null || resultList.size()<=0 ) return null;
		Photo p = (Photo)resultList.get(0);
		if (p==null) return null;
        return p.getPhoto();
    }

//	public void setPost(java.lang.String post) {
//		this.post = post;
//	}

    public String getMetadata() {
        return this.metadata;
    }

	public void setMetadata(String metadata) {
		this.metadata = metadata;
	}

    public java.util.Date getCreate_time() {
        return this.create_time;
    }

	public void setCreate_time(java.util.Date create_time) {
		this.create_time = create_time;
	}

    public java.lang.String getCreater() {
        return this.creater;
    }

	public void setCreater(java.lang.String creater) {
		this.creater = creater;
	}

    public java.util.Date getUpdate_time() {
        return this.update_time;
    }

	public void setUpdate_time(java.util.Date update_time) {
		this.update_time = update_time;
	}

    public java.lang.String getUpdater() {
        return this.updater;
    }

	public void setUpdater(java.lang.String updater) {
		this.updater = updater;
	}

    public java.lang.String getName() {
        return this.name;
    }

	public void setName(java.lang.String name) {
		this.name = name;
	}

    public java.lang.String getPreview() {
        return this.preview;
    }

	public void setPreview(java.lang.String preview) {
		this.preview = preview;
	}

    public String toString() {
        return new ToStringBuilder(this)
            .append("media_id", getMedia_id())
            .append("lang_id", getLang_id())
            .toString();
    }

    public boolean equals(Object other) {
        if ( !(other instanceof Media_caption) ) return false;
        Media_caption castOther = (Media_caption) other;
        return new EqualsBuilder()
            .append(this.getMedia_id(), castOther.getMedia_id())
            .append(this.getLang_id(), castOther.getLang_id())
            .isEquals();
    }

    public int hashCode() {
        return new HashCodeBuilder()
            .append(getMedia_id())
            .append(getLang_id())
            .toHashCode();
    }

	/**
	 * @return
	 */
	public Media getMedia() {
		return media;
	}

	/**
	 * @param media
	 */
	public void setMedia(Media media) {
		this.media = media;
	}

	/**
	 * @return
	 */
	public String getHighlight() {
		return highlight;
	}

	/**
	 * @param string
	 */
	public void setHighlight(String string) {
		highlight = string;
	}

	/**
	 * @return
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param string
	 */
	public void setDescription(String string) {
		description = string;
	}

	/**
	 * @return Returns the location.
	 */
	public String getLocation() {
		return location;
	}
	/**
	 * @param location The location to set.
	 */
	public void setLocation(String location) {
		this.location = location;
	}
	/**
	 * @return Returns the premiere_area.
	 */
	public String getPremiere_area() {
		return premiere_area;
	}
	/**
	 * @param premiere_area The premiere_area to set.
	 */
	public void setPremiere_area(String premiere_area) {
		this.premiere_area = premiere_area;
	}
	/**
	 * @return Returns the crm_id.
	 */
	public String getCrm_id() {
		return crm_id;
	}
	/**
	 * @param crm_id The crm_id to set.
	 */
	public void setCrm_id(String crm_id) {
		this.crm_id = crm_id;
	}
}
