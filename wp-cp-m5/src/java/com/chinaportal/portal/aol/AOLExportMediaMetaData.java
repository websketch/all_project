package com.chinaportal.portal.aol;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.XMLOutputter;

import com.chinaportal.portal.base.BaseAction;
import com.mediazone.bean.Media;
import com.mediazone.bean.MediaCaption;
import com.mediazone.dao.BaseQuery;
import com.mediazone.dao.DAOException;
import com.mediazone.util.TimeUtil;

/**
 * AOLExportMediaMetaData generates the MetaData of selected medias from
 * ChinaPortal M5 Database and dumps the contents to an XML file for
 * AOLChinese(another site/project) to pick up, read and input. Currently only
 * Media and Media Caption information is being transferred over, b/c only
 * metadata is reusable.
 * 
 * @author Hanson Wong
 * 
 * $Id: AOLExportMediaMetaData.java,v 1.1.2.4 2006/02/18 02:16:18 rick Exp $
 */
public class AOLExportMediaMetaData extends BaseAction
{

    /*
     * (non-Javadoc)
     * 
     * @see com.chinaportal.portal.base.BaseAction#excuteAction(org.apache.struts.action.ActionMapping,
     *      org.apache.struts.action.ActionForm,
     *      javax.servlet.http.HttpServletRequest,
     *      javax.servlet.http.HttpServletResponse)
     */
    public ActionForward doExecute( ActionMapping actionmapping, ActionForm actionform,
            HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse ) throws Exception
    {

        // Document doc = new Document();
        // Element root = new Element("MediaList");
        // doc.setRootElement(root);

        // get all ids
        // loop through all ids and add them to the document
        // doc.addContent(pullData(mediaId));
        // print doc to webserver

        try
        {
            Document doc = new Document();
            Element root = new Element("MediaList");
            doc.setRootElement(root);

            AOLExportMediaMetaData test = new AOLExportMediaMetaData();
    		Set selection = (Set) httpservletrequest.getSession().getAttribute("selection");
            if (selection != null) {
        		for (Iterator iter = selection.iterator(); iter.hasNext();) {
    				String media = (String) iter.next();
    				Element mediaElement = test.pullData(media);
    				if (mediaElement != null)
    					root.addContent(mediaElement);
    			}
            }

            //XMLOutputter out = new XMLOutputter();
            //out.output(doc, System.out);
            writeFile(doc, "/htdocs/www.chinaportal.com/aol/TESTAOLIMPORT.xml");

            httpservletrequest.setAttribute("count", new Integer(selection.size()));
            selection.clear();
            return actionmapping.findForward("success");
        }
        catch ( Exception e )
        {
            //e.printStackTrace();
        	httpservletrequest.setAttribute("exception", e);
            return actionmapping.findForward("error");
        }
    }

    private void writeFile( Document doc, String filename ) throws IOException
    {
        FileOutputStream outputStream = new FileOutputStream(filename);
        Writer writer = new BufferedWriter(new OutputStreamWriter(outputStream, "UTF-8"));

        // org.jdom.output.Format format = Format.getRawFormat();
        // format.setEncoding("UTF-8");

        XMLOutputter out = new XMLOutputter();
        // out.setFormat(format);
        out.output(doc, writer);

        writer.close();
    }

    /**
     * Pull the data from the database and prepare to generate XML
     * 
     * @param mediaId
     * @return
     * @throws DAOException
     */
    private Element pullData( String mediaId ) throws DAOException
    {
        String hql = "from Media WHERE media_id=" + mediaId;

        BaseQuery bq = new BaseQuery();
        List results = bq.executeQuery(hql);

        if ( results != null && results.size() == 1 )
        {
            // check to make sure this is the root media
            Media media = (Media) (results.get(0));
            List parents = media.getParents();
            if ( parents == null || parents.size() == 0 )
            {
                // process this media
                return constructMediaXML(media);
            }
            else
            {
                Media pMedia = (Media) (parents.get(0));

                // this is to clone the individual media as an independent media
                // (for cases
                // such as tv series)
                // pMedia.setMediaId(media.getMediaId());

                // process parent media
                return constructMediaXML(pMedia, media);

            }
        }

        return null;
    }

    private Element constructMediaXML( Media media )
    {
        return constructMediaXML(media, media);
    }

    /**
     * Convert a Media bean to an xml representation
     * 
     * <media mediaId="1"> <name></name> <homepage></homepage> <level></level>
     * <premiere>
     *                    
     *  &lt;/premiere&gt;
     *    &lt;upc&gt;&lt;/upc&gt;
     *    &lt;leng&gt;&lt;/leng&gt;           
     *    &lt;status&gt;&lt;/status&gt;              
     *    &lt;starttime&gt;&lt;/starttime&gt;
     *    &lt;endtime&gt;&lt;/endtime&gt;
     *    &lt;subtitle&gt;&lt;/subtitle&gt;             
     *    &lt;voice&gt;&lt;/voice&gt;
     *    &lt;size&gt;&lt;/size&gt;
     *    &lt;releaseTime&gt;&lt;/releaseTime&gt;
     *    &lt;closeTime&gt;&lt;/closeTime&gt;
     *    &lt;release&gt;&lt;/release&gt;
     *    &lt;clicked&gt;&lt;/clicked&gt;
     *    &lt;play&gt;&lt;/clicked&gt;
     *    &lt;download&gt;&lt;/download&gt;
     *    &lt;providerId&gt;&lt;/providerId&gt;
     *    &lt;crmId&gt;&lt;/crmId&gt;
     *    
     *    &lt;captions&gt;
     *        &lt;caption&gt;
     *            &lt;mediaId&gt;&lt;/mediaId&gt;
     *            &lt;langId&gt;&lt;/langId&gt;
     *            &lt;name&gt;&lt;/name&gt;
     *            &lt;location&gt;&lt;/location&gt;
     *            &lt;premiereArea&gt;&lt;/premiereArea&gt;
     *            &lt;metadata&gt;&lt;/metadata&gt;
     *            &lt;preview&gt;&lt;/preview&gt;
     *            &lt;highlight&gt;&lt;/highlight&gt;
     *            &lt;createTime&gt;&lt;/createTime&gt;
     *            &lt;creater&gt;&lt;/creater&gt;
     *            &lt;updateTime&gt;&lt;/updateTime&gt;
     *            &lt;updater&gt;&lt;/updater&gt;
     *        &lt;/caption&gt;
     *    &lt;captions&gt;
     *    
     *   &lt;/media&gt;
     *   @param media
     * 
     *
     */
    private Element constructMediaXML( Media media, Media childMedia )
    {
        Element mediaElement = new Element("media");
        mediaElement.setAttribute("mediaId", childMedia.getMediaId().intValue() + "");

        // name node
        Element name = new Element("name");
        String childName = "";
        if ( !media.getMediaId().equals(childMedia.getMediaId()) )
        {
            childName += " " + childMedia.getName();
        }
        name.setText(media.getName() + childName);
        mediaElement.addContent(name);

        // home page node
        Element homepage = new Element("homepage");
        if ( media.getHomepage() != null )
            homepage.setText(media.getHomepage());
        mediaElement.addContent(homepage);

        // level node
        Element level = new Element("level");
        if ( media.getLevel() != null )
            level.setText(media.getLevel());
        mediaElement.addContent(level);

        // premiere node
        Element premiere = new Element("premiere");
        if ( media.getPremiere() != null )
        {

            premiere.setText(TimeUtil.getNormalDateWithTime(media.getPremiere()));
        }
        else
            premiere.setText(null);

        mediaElement.addContent(premiere);

        // upc node
        Element upc = new Element("upc");
        if ( media.getUpc() != null )
            upc.setText(media.getUpc());
        mediaElement.addContent(upc);

        // leng node
        Element leng = new Element("leng");
        if ( media.getLeng() != null )
            leng.setText(media.getLeng());
        mediaElement.addContent(leng);

        // status node
        Element status = new Element("status");
        if ( media.getStatus() != null )
            status.setText(media.getStatus());
        mediaElement.addContent(status);

        // stattime node
        Element startTime = new Element("startTime");
        if ( media.getStartTime() != null )
        {
            startTime.setText(TimeUtil.getNormalDateWithTime(media.getStartTime()));
        }
        else
        {
            startTime.setText(null);
        }

        mediaElement.addContent(startTime);

        // endtime node
        Element endTime = new Element("endTime");
        if ( media.getEndTime() != null )
        {
            endTime.setText(TimeUtil.getNormalDateWithTime(media.getEndTime()));
        }
        else
        {
            endTime.setText(null);
        }

        mediaElement.addContent(endTime);

        // subtitle node
        Element subtitle = new Element("subtitle");
        if ( media.getSubTitle() != null )
            subtitle.setText(media.getSubTitle());
        mediaElement.addContent(subtitle);

        // voice node
        Element voice = new Element("voice");
        if ( media.getVoice() != null )
            voice.setText(media.getVoice());
        mediaElement.addContent(voice);

        // size node
        Element size = new Element("size");
        if ( media.getSize() != null )
            size.setText(media.getSize());
        mediaElement.addContent(size);

        // release_time node
        Element releaseTime = new Element("releaseTime");

        if ( media.getReleaseTime() != null )
        {
            releaseTime.setText(TimeUtil.getNormalDateWithTime(media.getReleaseTime()));
        }
        else
        {
            releaseTime.setText(null);

        }
        mediaElement.addContent(releaseTime);

        // close_time node
        Element closeTime = new Element("closeTime");
        if ( media.getCloseTime() != null )
        {
            closeTime.setText(TimeUtil.getNormalDateWithTime(media.getCloseTime()));
        }
        else
            closeTime.setText(null);

        mediaElement.addContent(closeTime);

        // release node
        Element release = new Element("release");
        if ( media.getRelease() != null )
            release.setText(media.getRelease());
        mediaElement.addContent(release);

        // clicked node
        Element clicked = new Element("clicked");
        if ( media.getClicked() != null )
            clicked.setText(media.getClicked() + "");
        mediaElement.addContent(clicked);

        // play node
        Element play = new Element("play");
        if ( media.getPlay() != null )
            play.setText(media.getPlay() + "");
        mediaElement.addContent(play);

        // download node
        Element download = new Element("download");
        if ( media.getDownLoad() != null )
            download.setText(media.getDownLoad() + "");
        mediaElement.addContent(download);

        // provider node
        Element providerId = new Element("providerId");
        if ( media.getProviderId() != null )
            providerId.setText(media.getProviderId() + "");
        mediaElement.addContent(providerId);

        // crmId node
        Element crmId = new Element("crmId");
        if ( media.getCrmId() != null )
            crmId.setText(media.getCrmId() + "");
        mediaElement.addContent(crmId);

        // captions
        Element captions = new Element("captions");

        Set mediaCaptions = media.getCaptions();

        // if media captions exist, loop through and construct them as xml
        if ( mediaCaptions != null && mediaCaptions.size() > 0 )
        {

            Iterator it = mediaCaptions.iterator();

            while ( it != null && it.hasNext() )
            {
                MediaCaption mc = (MediaCaption) (it.next());

                if ( childMedia.getMediaId().equals(media.getMediaId()) )
                {
                    captions.addContent(constructMediaCaptionXML(null, mc, childMedia.getMediaId().toString()));
                }
                else
                    captions.addContent(constructMediaCaptionXML(childMedia, mc, childMedia.getMediaId().toString()));
            }

        }

        // end captions loop
        mediaElement.addContent(captions);

        return mediaElement;
    }

    /**
     * Convert media caption bean to a xml representation
     * 
     * @param media
     * @param mc
     * @return
     */
    private Element constructMediaCaptionXML( Media childMedia, MediaCaption mc, String mediaId )
    {
        // begin captions loop
        Element caption = new Element("caption");

        Element mediaIdElement = new Element("mediaId");
        mediaIdElement.setText(mediaId);
        caption.addContent(mediaIdElement);

        Element langId = new Element("langId");
        if ( mc.getLangId() != null )
            langId.setText(mc.getLangId().intValue() + "");
        caption.addContent(langId);

        Element captionName = new Element("name");

        // for the case when it is a tv series and you need to distinguish
        // between episode numbers
        String childName = "";
        if ( childMedia != null )
        {
            childName = " ";
            Set mediaCaptions = childMedia.getCaptions();

            // if media captions exist, loop through and construct them as xml
            if ( mediaCaptions != null && mediaCaptions.size() > 0 )
            {
                Iterator it = mediaCaptions.iterator();

                while ( it != null && it.hasNext() )
                {
                    MediaCaption childCaption = (MediaCaption) (it.next());
                    if ( childCaption.getLangId().equals(mc.getLangId()) )
                    {
                        childName += childCaption.getName();
                    }
                }
            }
        }

        captionName.setText(mc.getName() + childName);
        caption.addContent(captionName);

        Element location = new Element("location");
        if ( mc.getLocation() != null )
            location.setText(mc.getLocation());
        caption.addContent(location);

        Element premiereArea = new Element("premiereArea");
        if ( mc.getPremiereArea() != null )
            premiereArea.setText(mc.getPremiereArea());
        caption.addContent(premiereArea);

        Element metadata = new Element("metadata");
        if ( mc.getMetadata() != null )
            metadata.setText(mc.getMetadata());
        caption.addContent(metadata);

        Element preview = new Element("preview");
        if ( mc.getPreview() != null )
            preview.setText(mc.getPreview());
        caption.addContent(preview);

        Element highlight = new Element("highlight");
        if ( mc.getHighLight() != null )
            highlight.setText(mc.getHighLight());
        caption.addContent(highlight);

        Element createTime = new Element("createTime");
        if ( mc.getCreateTime() != null )
        {
            createTime.setText(TimeUtil.getNormalDateWithTime(mc.getCreateTime()));
        }
        else
        {
            createTime.setText(null);
        }

        caption.addContent(createTime);

        Element creater = new Element("creater");
        if ( mc.getCreater() != null )
            creater.setText(mc.getCreater());
        caption.addContent(creater);

        Element updateTime = new Element("updateTime");
        if ( mc.getUpdateTime() != null )
        {
            updateTime.setText(TimeUtil.getNormalDateWithTime(mc.getUpdateTime()));
        }
        else
        {
            updateTime.setText(null);
        }

        caption.addContent(updateTime);

        Element updater = new Element("updater");
        if ( mc.getUpdater() != null )
            updater.setText(mc.getUpdater());
        caption.addContent(updater);

        return caption;
    }

	/* (non-Javadoc)
	 * @see com.chinaportal.portal.base.BaseAction#getFunctionName()
	 */
	public String getFunctionName() {
		return null;
	}

}
