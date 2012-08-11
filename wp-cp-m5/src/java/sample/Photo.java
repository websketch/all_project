package sample;

import java.io.Serializable;
import java.util.Set;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

/** @author Hibernate CodeGenerator */
public class Photo implements Serializable {
    private Integer photo_id;
	
	private Integer category_id;
	
	private Integer media_id;
	
	private Integer actor_id;
	
	private Set captions;
	
    /** identifier field */


    /** nullable persistent field */
    private String photo;

    /** nullable persistent field */
    private java.util.Date create_time;

    /** nullable persistent field */
    private String creater;

    /** nullable persistent field */
    private java.util.Date update_time;

    /** nullable persistent field */
    private String updater;



    /** default constructor */
    public Photo() {
    }

    public Integer getPhoto_id() {
        return this.photo_id;
    }

	public void setPhoto_id(Integer photo_id) {
		this.photo_id = photo_id;
	}



    public Integer getActor_id() {
        return this.actor_id;
    }

	public void setActor_id(Integer actor_id) {
		this.actor_id = actor_id;
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

    public String toString() {
        return new ToStringBuilder(this)
            .append("photo_id", getPhoto_id())
            .toString();
    }

    public boolean equals(Object other) {
        if ( !(other instanceof Photo) ) return false;
        Photo castOther = (Photo) other;
        return new EqualsBuilder()
            .append(this.getPhoto_id(), castOther.getPhoto_id())
            .isEquals();
    }

    public int hashCode() {
        return new HashCodeBuilder()
            .append(getPhoto_id())
            .toHashCode();
    }


	/**
	 * @return
	 */
	public Set getCaptions() {
		return captions;
	}

	/**
	 * @param set
	 */
	public void setCaptions(Set set) {
		captions = set;
	}

	/**
	 * @return Returns the category_id.
	 */
	public Integer getCategory_id() {
		return category_id;
	}
	/**
	 * @param category_id The category_id to set.
	 */
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}
	/**
	 * @return Returns the media_id.
	 */
	public Integer getMedia_id() {
		return media_id;
	}
	/**
	 * @param media_id The media_id to set.
	 */
	public void setMedia_id(Integer media_id) {
		this.media_id = media_id;
	}
	/**
	 * @return Returns the photo.
	 */
	public String getPhoto() {
		return photo;
	}
	/**
	 * @param photo The photo to set.
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
