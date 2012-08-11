package com.mediazone.man;

import com.mediazone.man.bean.ContentBean;
import com.mediazone.man.bean.ManResponseBean;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.XMLOutputter;

/**
 * @author Hanson Wong $Id: ContentTransaction.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class ContentTransaction extends BaseManTransaction {

    public void getContent(String itemID) throws Exception {
        String url = "/services/ContentData?AccountId=MEDIAZONE";

        if (itemID != null) {
            url += "&Type=PACKAGE&ItemId=" + itemID;
        }

        //System.out.println(url);
        ManResponseBean response = handleGetRequest(url, null);

        //System.out.println(response.getBody());

    }

    public static void main(String[] args) {
        ContentTransaction ct = new ContentTransaction();
        try {
            ct.getContent("IIHF_2005season");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.mediazone.man.BaseManTransaction#mapResponseToBean(org.jdom.Document)
     */
    protected List mapResponseToBean(Document doc) {
        // TODO Auto-generated method stub
        return null;
    }

    // private final String baseURL = "http://man.entriq.com/";
    //
    // public static final String typePackage = "PACKAGE";
    //
    // public static final String typeMedia = "MEDIA";
    //
    // public static final String typeChannel = "CHANNEL";
    //
    // public static final String paramChannelID = "ChannelId";
    //
    // public static final String paramAccountID = "AccountId";
    //
    // public static final String paramItemID = "ItemId";
    //
    // public static final String paramType = "Type";
    //
    // public static final String paramSearch = "Search";
    //
    // public static final String paramOrderBy = "OrderBy";
    //
    // public static final String paramDays = "Days";
    //
    // public static final String paramHours = "Hours";
    //
    // public static final String paramEnd = "End";
    //
    // public static final String paramBegin = "Begin";
    //
    // private final String accountID = "AccountId";
    //
    // private final String channelID = "ChannelId";
    //
    // private final String itemID = "ItemId";
    //
    // private final String type = "Type";
    //
    // private final String remove = "Remove";
    //
    // private final String removed = "Removed";
    //
    // private final String live = "Live";
    //
    // private final String length = "Length";
    //
    // private final String distributionType = "DistributionType";
    //
    // private final String fileSize = "FileSize";
    //
    // private final String modified = "Modified";
    //
    // private final String registered = "Registered";
    //
    // private final String mediaType = "MediaType";
    //
    // private final String sourceId = "SourceId";
    //
    // private final String name = "Name";
    //
    // private final String PGRate = "PGRate";
    //
    // private final String mediaNumber = "MediaNumber";
    //
    // private final String artist = "Artist";
    //
    // private final String packageId = "PackageId";
    //
    // private final String URL = "URL";
    //
    // private final String category = "Category";
    //
    // private final String subCategory = "SubCategory";
    //
    // /**
    // *
    // *
    // *
    // * @param params
    // * params are defined as follows
    // *
    // * param accountId:
    // * Identifies the 'owner' of the content (content provider).
    // * [required]
    // * param channelId:
    // * Identifies the content channel. [optional]
    // * param itemId:
    // * Identifies the media id or package id. [optional]
    // * param type:
    // * Identifies the type ("PACKAGE", "MEDIA" or "CHANNEL") default =
    // * "MEDIA" [optional]
    // * param search:
    // * Filter to select only content items that meet the conditions
    // * of the search [optional]
    // * param orderBy:
    // * Identifies the order in which individual content items are
    // * returned ("Hits", "LicenseHits", "MediaNumber", "ReleaseDate",
    // * "Registered", "Ratings") [optional]
    // * param days:
    // * Used to limit the query scope by number of days [optional]
    // * param hours:
    // * Used to limit the query scope by number of hours [optional]
    // * param end:
    // * Absolute ISO8601 dates to filter the search [optional]
    // * param begin:
    // * Absolute ISO8601 dates to filter the search [optional]
    // */
    //
    // public Document getContent( Properties params ) throws Exception
    // {
    // String url = baseURL + "services/ContentData?";
    //
    // // construct url
    // if ( params == null || params.isEmpty() || params.getProperty(accountID)
    // == null
    // || params.getProperty(accountID).trim().length() <= 0 )
    // {
    // throw new Exception("Account ID is a required field. Failed to construct
    // url to connect to Man.");
    // }
    //
    // Enumeration en = params.keys();
    //
    // while ( en.hasMoreElements() )
    // {
    // String key = (String) en.nextElement();
    // url += key + "=" + params.getProperty(key);
    //
    // if ( en.hasMoreElements() )
    // url += "&";
    // }
    //
    // return null;//handleGetRequest(url);
    // }
    //
    // protected List mapResponseToBean( Document doc )
    // {
    // List returnList = new ArrayList();
    //
    // Element root = doc.getRootElement();
    //
    // // check to see if root is batch or just a single record.
    // if ( root.getName().equals("Batch") )
    // {
    // List children = root.getChildren();
    //
    // for ( int i = 0; i < children.size(); i++ )
    // {
    // returnList.add(mapContentToBean((Element) children.get(i)));
    // }
    // }
    // else
    // returnList.add(mapContentToBean(root));
    //
    // return returnList;
    // }
    //
    // private ContentBean mapContentToBean( Element element )
    // {
    // ContentBean bean = new ContentBean();
    //
    // bean.setAccountId(element.getAttributeValue(accountID));
    // bean.setChannelId(element.getAttributeValue(channelID));
    // bean.setItemId(element.getAttributeValue(itemID));
    // bean.setType(element.getAttributeValue(type));
    // bean.setRemove(element.getAttributeValue(remove));
    // bean.setRemoved(element.getAttributeValue(removed));
    // bean.setLive(element.getAttributeValue(live));
    // bean.setLength(element.getAttributeValue(length));
    // bean.setDistributionType(element.getAttributeValue(distributionType));
    // bean.setFileSize(element.getAttributeValue(fileSize));
    // bean.setModified(element.getAttributeValue(modified));
    // bean.setRegistered(element.getAttributeValue(registered));
    // bean.setMediaType(element.getAttributeValue(mediaType));
    // bean.setSourceId(element.getAttributeValue(sourceId));
    // bean.setName(element.getAttributeValue(name));
    // bean.setPGRate(element.getAttributeValue(PGRate));
    // bean.setMediaNumber(element.getAttributeValue(mediaNumber));
    // bean.setArtist(element.getAttributeValue(artist));
    // bean.setPackageId(element.getAttributeValue(packageId));
    // bean.setURL(element.getAttributeValue(URL));
    // bean.setCategory(element.getAttributeValue(category));
    // bean.setSubCategory(element.getAttributeValue(subCategory));
    //
    // return bean;
    // }
    //
    // public boolean registerContent()
    // {
    // return true;
    // }
    //
    // public static void main( String[] args )
    // {
    // try
    // {
    // Properties params = new Properties();
    // params.setProperty(paramAccountID, "Mediazone");
    //
    // ContentTransaction ct = new ContentTransaction();
    // Document contents = ct.getContent(params);
    //
    // List l = ct.mapResponseToBean(contents);
    //
    // System.out.println(((ContentBean) l.get(0)).getName());
    //
    // }
    // catch ( Exception e )
    // {
    // e.printStackTrace();
    // }
    // }

}