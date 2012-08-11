package com.chinaportal.portal.aol;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.XMLOutputter;

import com.chinaportal.portal.base.BaseAction;
import com.mediazone.bean.News;
import com.mediazone.bean.NewsCaption;
import com.mediazone.dao.BaseQuery;
import com.mediazone.dao.DAOException;
import com.mediazone.util.TimeUtil;

/**
 * AOLExportNewsMetaData generates the MetaData of News of recent time block from
 * ChinaPortal M5 Database and dumps the contents to an XML file for
 * AOLChinese(another site/project) to pick up, read and input. Currently only
 * News and News Caption information is being transferred over, b/c only
 * metadata is reusable.
 * 
 * @author Rick Sun
 * 
 * $Id: AOLExportNewsMetaData.java,v 1.1.4.7 2006/02/21 03:04:10 rick Exp $
 */
public class AOLExportNewsMetaData extends BaseAction
{

	private static final Log log = LogFactory.getLog(AOLExportNewsMetaData.class);

    private static final long TIME_INTERVAL = 24* 60 * 60 * 1000;

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
        // Element root = new Element("CPNews");
        // doc.setRootElement(root);

        // build News List on root

        // print doc to webserver

        try
        {
            Document doc = new Document();
            Element root = new Element("CPNews");
            doc.setRootElement(root);

            AOLExportNewsMetaData test = new AOLExportNewsMetaData();
            test.buildRecentNewsList(root);

            XMLOutputter out = new XMLOutputter();
            //out.output(doc, System.out);
            //writeFile(doc, "C:\\dev\\java\\apache\\TESTAOLIMPORT.xml");
            httpservletresponse.setContentType("text/xml");
            httpservletresponse.setCharacterEncoding("UTF-8");
            PrintWriter writer = httpservletresponse.getWriter();
            out.output(doc, writer);
			log.info("Newsfeed export, succeeded");
            return null;
        }
        catch ( Exception e )
        {
        	log.error("Newsfeed export, failed: ", e);
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
     * 
     * 
     * @param root
     * @return
     * @throws DAOException
     */
    private void buildRecentNewsList( Element root ) throws DAOException
    {
		long now = new Date().getTime();
		// now = 1127984520000l;//TimeUtil.normaDateWithTime.parse("2005-09-29 02:02:00").getTime();
		//Date startTime = new Date(now - now % timeInterval - timeInterval);
		//Date endTime   = new Date(now - now % timeInterval);
		Date startTime = new Date(now - TIME_INTERVAL);
		Date endTime   = new Date(now);
    	
        String hql = "from News WHERE create_time>=:startTime AND create_time<:endTime";
		Properties conditions = new Properties();
//conditions doestn't work for Date type yet
//		conditions.put("startTime", startTime);
//		conditions.put("endTime",   endTime);
		conditions.put("startTime", TimeUtil.getNormalDateWithTime(startTime));
		conditions.put("endTime",   TimeUtil.getNormalDateWithTime(endTime));
		// System.out.println("from News WHERE create_time>='"+TimeUtil.getNormalDateWithTime(startTime)
		// 		+"' AND create_time<'"+TimeUtil.getNormalDateWithTime(endTime)+"'");

        BaseQuery bq = new BaseQuery();
        List newsList = bq.executeQuery(hql, conditions);
        if (newsList != null) {
    		for (Iterator iter = newsList.iterator(); iter.hasNext();) {
				News news = (News) iter.next();
				Element newsElement = constructNewsXML(news);
				if (newsElement != null)
					root.addContent(newsElement);
			}
        }
    }

    /**)
     * Convert a News bean to an xml representation
     * 
    <?xml version="1.0" encoding="utf8"?> 
    <CPNews> 
         <news> 
              <create_time>2005-12-10 21:15:22</create_time> 
              <update_time>2005-12-10 22:22:22</update_time> 
              <newsType>Entertainment</newsType> 
              <captions> 
                   <caption> 
                        <lang>2</lang> 
                        <title>My News</title> 
                        <description>My News Description</description> 
                        <origin>here</origin> 
                        <keyword>asf</keyword> 
                        <create_time>2005-12-10 21:15:22</create_time> 
                        <update_time>2005-12-10 22:22:22</update_time> 
                        <body>my body</body> 
                        <image>asdfdsaf</image> 
                   </caption> 
              </captions> 
         </news> 
    </CPNews>
     *    
     *   @param news
     */
    private Element constructNewsXML( News news )
    {
		//Construct News XML only when News has both simpCaption & tradCaption
		NewsCaption simpCaption = null;
		NewsCaption tradCaption = null;
		Set Captions = news.getCaptions();
		for (Iterator iter = Captions.iterator(); iter.hasNext();) {
			NewsCaption caption = (NewsCaption) iter.next();
			switch (caption.getLangId().intValue()) {
			case 2:
				simpCaption = caption;
				break;
			case 3:
				tradCaption = caption;
				break;
			}
		}
		if (simpCaption == null || tradCaption == null)
			return null;
		
        //Start Construction
		Element newsElement = new Element("news");

        // create_time
        Element create_time = new Element("create_time");
        if ( news.getCreateTime() != null )
        	create_time.setText(TimeUtil.getNormalDateWithTime(news.getCreateTime()));
        else
        	create_time.setText(null);
        newsElement.addContent(create_time);

        // update_time
        Element update_time = new Element("update_time");
        if ( news.getUpdateTime() != null )
        	update_time.setText(TimeUtil.getNormalDateWithTime(news.getUpdateTime()));
        else
        	update_time.setText(null);
        newsElement.addContent(update_time);

        // newsType
        Element newsType = new Element("newsType");
        switch (news.getNewsTypeId().intValue()) {
		case 1:
        	newsType.setText("Entertainment");
			break;
		case 2:
        	newsType.setText("Sports");
			break;
		}
        newsElement.addContent(newsType);

        // captions
        Element captions = new Element("captions");
        captions.addContent(constructNewsCaptionXML(simpCaption));
        captions.addContent(constructNewsCaptionXML(tradCaption));
        newsElement.addContent(captions);

        return newsElement;
    }
    
    /**
     * Convert news caption bean to an xml representation
     * 
     * @param nc
     * @return
     */
    private Element constructNewsCaptionXML( NewsCaption nc)
    {
        Element caption = new Element("caption");

        Element langId = new Element("langId");
        if ( nc.getLangId() != null )
            langId.setText(nc.getLangId().intValue() + "");
        caption.addContent(langId);

        Element title = new Element("title");
        if ( nc.getTitle() != null )
        	title.setText(nc.getTitle());
        caption.addContent(title);

        Element description = new Element("description");
        if ( nc.getDescription() != null )
        	description.setText(nc.getDescription());
        caption.addContent(description);

        Element origin = new Element("origin");
        if ( nc.getOrigin() != null )
        	origin.setText(nc.getOrigin());
        caption.addContent(origin);

        Element keyword = new Element("keyword");
        if ( nc.getKeyword() != null )
        	keyword.setText(nc.getKeyword());
        caption.addContent(keyword);

        // create_time
        Element create_time = new Element("create_time");
        if ( nc.getCreateTime() != null )
        	create_time.setText(TimeUtil.getNormalDateWithTime(nc.getCreateTime()));
        else
        	create_time.setText(null);
        caption.addContent(create_time);

        // update_time
        Element update_time = new Element("update_time");
        if ( nc.getUpdateTime() != null )
        	update_time.setText(TimeUtil.getNormalDateWithTime(nc.getUpdateTime()));
        else
        	update_time.setText(null);
        caption.addContent(update_time);

        Element body = new Element("body");
        if ( nc.getBody() != null )
        	body.setText(nc.getBody());
        caption.addContent(body);

        Element image = new Element("image");
        if ( nc.getImage() != null )
        	image.setText(nc.getImage());
        caption.addContent(image);

        return caption;
    }

	/* (non-Javadoc)
	 * @see com.chinaportal.portal.base.BaseAction#getFunctionName()
	 */
	public String getFunctionName() {
		return null;
	}

}
