package sample;

import java.io.Serializable;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

import net.sf.hibernate.collection.Bag;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;


public class Media implements Serializable,Comparable { 	
	public int compareTo(Object o){
		Media m=(Media)o;
		if(m.getRelease_time()==null)
			return -1;
		return m.getRelease_time().compareTo(m.getRelease_time());
	}
	

	public Media_caption getCaption(Integer lang) {
		Set set = getCaptions();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			Media_caption cat = (Media_caption) iterator.next();
			if (lang.equals(cat.getLang_id())) {
				return cat;
			}
		}
		return null;
	}


	
	private Set captions;
    /** identifier field */
    private Integer  media_id;

    /** nullable persistent field */
    private String name;

    /** nullable persistent field */
    private String homepage;

    /** nullable persistent field */
    private String level;

    /** nullable persistent field */
    private java.util.Date premiere;

    /** nullable persistent field */
    private String upc;

    /** nullable persistent field */
    private String leng;

    /** nullable persistent field */
    private String status;

    /** nullable persistent field */
    private Date starttime;

    /** nullable persistent field */
    private Date endtime;

    /** nullable persistent field */
    private String subtitle;

    /** nullable persistent field */
    private String voice;

    /** nullable persistent field */
    private String size;

    /** nullable persistent field */
    private java.util.Date release_time;

    /** nullable persistent field */
    private java.util.Date close_time;

    /** nullable persistent field */
    private String release;

    /** nullable persistent field */
    private Long clicked;

    /** nullable persistent field */
    private Long play;

    /** nullable persistent field */
    private Long download;

    /** nullable persistent field */
    private Integer  provider_id;

    /** nullable persistent field */
    private Integer  crm_id;

    private Bag photos;
    /** full constructor */
    public Media(java.lang.String name, java.lang.String homepage, java.lang.String level, java.util.Date premiere, java.lang.String upc, java.lang.String leng, java.lang.String status, java.util.Date starttime, java.util.Date endtime, java.lang.String subtitle, java.lang.String voice, java.lang.String size, java.util.Date release_time, java.util.Date close_time, java.lang.String release, Long clicked, Long play, Long download, Integer  provider_id, Integer  crm_id) {
        this.name = name;
        this.homepage = homepage;
        this.level = level;
        this.premiere = premiere;
        this.upc = upc;
        this.leng = leng;
        this.status = status;
        this.starttime = starttime;
        this.endtime = endtime;
        this.subtitle = subtitle;
        this.voice = voice;
        this.size = size;
        this.release_time = release_time;
        this.close_time = close_time;
        this.release = release;
        this.clicked = clicked;
        this.play = play;
        this.download = download;
        this.provider_id = provider_id;
        this.crm_id = crm_id;
    }

    /** default constructor */
    public Media() {
    }

    public Integer  getMedia_id() {
        return this.media_id;
    }

	public void setMedia_id(Integer  media_id) {
		this.media_id = media_id;
	}

    public java.lang.String getName() {
        return this.name;
    }

	public void setName(java.lang.String name) {
		this.name = name;
	}

    public java.lang.String getHomepage() {
        return this.homepage;
    }

	public void setHomepage(java.lang.String homepage) {
		this.homepage = homepage;
	}

    public java.lang.String getLevel() {
        return this.level;
    }

	public void setLevel(java.lang.String level) {
		this.level = level;
	}

    public java.util.Date getPremiere() {
        return this.premiere;
    }

	public void setPremiere(java.util.Date premiere) {
		this.premiere = premiere;
	}

    public java.lang.String getUpc() {
        return this.upc;
    }

	public void setUpc(java.lang.String upc) {
		this.upc = upc;
	}

    public java.lang.String getLeng() {
        return this.leng;
    }

	public void setLeng(java.lang.String leng) {
		this.leng = leng;
	}

    public java.lang.String getStatus() {
        return this.status;
    }

	public void setStatus(java.lang.String status) {
		this.status = status;
	}

    public Date getStarttime() {
        return this.starttime;
    }

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}

    public Date getEndtime() {
        return this.endtime;
    }

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

    public java.lang.String getSubtitle() {
        return this.subtitle;
    }

	public void setSubtitle(java.lang.String subtitle) {
		this.subtitle = subtitle;
	}

    public java.lang.String getVoice() {
        return this.voice;
    }

	public void setVoice(java.lang.String voice) {
		this.voice = voice;
	}

    public java.lang.String getSize() {
        return this.size;
    }

	public void setSize(java.lang.String size) {
		this.size = size;
	}

    public java.util.Date getRelease_time() {
        return this.release_time;
    }

	public void setRelease_time(java.util.Date release_time) {
		this.release_time = release_time;
	}

    public java.util.Date getClose_time() {
        return this.close_time;
    }

	public void setClose_time(java.util.Date close_time) {
		this.close_time = close_time;
	}

    public java.lang.String getRelease() {
        return this.release;
    }

	public void setRelease(java.lang.String release) {
		this.release = release;
	}

    public Long getClicked() {
        return this.clicked;
    }

	public void setClicked(Long clicked) {
		this.clicked = clicked;
	}

    public Long getPlay() {
        return this.play;
    }

	public void setPlay(Long play) {
		this.play = play;
	}

    public Long getDownload() {
        return this.download;
    }

	public void setDownload(Long download) {
		this.download = download;
	}

    public Integer  getProvider_id() {
        return this.provider_id;
    }

	public void setProvider_id(Integer  provider_id) {
		this.provider_id = provider_id;
	}

    public Integer  getCrm_id() {
        return this.crm_id;
    }

	public void setCrm_id(Integer  crm_id) {
		this.crm_id = crm_id;
	}

    public String toString() {
        return new ToStringBuilder(this)
            .append("media_id", getMedia_id())
            .toString();
    }

    public boolean equals(Object other) {
        if ( !(other instanceof Media) ) return false;
        Media castOther = (Media) other;
        return new EqualsBuilder()
            .append(this.getMedia_id(), castOther.getMedia_id())
            .isEquals();
    }

    public int hashCode() {
        return new HashCodeBuilder()
            .append(getMedia_id())
            .toHashCode();
    }

	/**
	 * @return Returns the captions.
	 */
	public Set getCaptions() {
		return captions;
	}
	/**
	 * @param captions The captions to set.
	 */
	public void setCaptions(Set captions) {
		this.captions = captions;
	}
	/**
	 * @return Returns the categorys.
	 */

	/**
	 * @return Returns the photo.
	 */
	public Bag getPhotos() {
		return photos;
	}
	
	public String getPhoto(){
		if(getPhotos()!=null && getPhotos().size()>0){
			Photo p=(Photo)getPhotos().get(0);
			return p.getPhoto();
		}
		return null;
	}
	/**
	 * @param photo The photo to set.
	 */
	public void setPhotos(Bag photos) {
		this.photos = photos;
	}
}
