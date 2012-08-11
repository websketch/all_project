package sample;

import java.io.Serializable;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;

/** @author Hibernate CodeGenerator */
public class Photo_caption implements Serializable {
	private String url;
	private String title;

    /** identifier field */
    private Integer lang_id;

    /** identifier field */
    private Integer photo_id;

    /** nullable persistent field */
    private String description;

    /** nullable persistent field */
    private java.util.Date create_time;

    /** nullable persistent field */
    private String creater;

    /** nullable persistent field */
    private java.util.Date update_time;

    /** nullable persistent field */
    private String updater;

    /** full constructor */
    public Photo_caption(Integer lang_id, Integer photo_id, java.lang.String description, java.util.Date create_time, java.lang.String creater, java.util.Date update_time, java.lang.String updater) {
        this.lang_id = lang_id;
        this.photo_id = photo_id;
        this.description = description;
        this.create_time = create_time;
        this.creater = creater;
        this.update_time = update_time;
        this.updater = updater;
    }

    /** default constructor */
    public Photo_caption() {
    }

    /** minimal constructor */
    public Photo_caption(Integer lang_id, Integer photo_id) {
        this.lang_id = lang_id;
        this.photo_id = photo_id;
    }

    public Integer getLang_id() {
        return this.lang_id;
    }

	public void setLang_id(Integer lang_id) {
		this.lang_id = lang_id;
	}

    public Integer getPhoto_id() {
        return this.photo_id;
    }

	public void setPhoto_id(Integer photo_id) {
		this.photo_id = photo_id;
	}

    public java.lang.String getDescription() {
        return this.description;
    }

	public void setDescription(java.lang.String description) {
		this.description = description;
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
            .append("lang_id", getLang_id())
            .append("photo_id", getPhoto_id())
            .toString();
    }

    public boolean equals(Object other) {
        if ( !(other instanceof Photo_caption) ) return false;
        Photo_caption castOther = (Photo_caption) other;
        return new EqualsBuilder()
            .append(this.getLang_id(), castOther.getLang_id())
            .append(this.getPhoto_id(), castOther.getPhoto_id())
            .isEquals();
    }

    public int hashCode() {
        return new HashCodeBuilder()
            .append(getLang_id())
            .append(getPhoto_id())
            .toHashCode();
    }

	/**
	 * @return
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @return
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param string
	 */
	public void setTitle(String string) {
		title = string;
	}

	/**
	 * @param string
	 */
	public void setUrl(String string) {
		url = string;
	}

}
