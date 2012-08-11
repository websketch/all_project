package com.mediazone.man.bean;

/**
 * 
 * 
 * @author Hanson Wong
 * 
 * $Id: ContentBean.java,v 1.1.2.3 2005/09/20 11:19:56 liushengbin Exp $
 */
public class ContentBean extends BaseTransactionBean
{
    private String AccountId = null;

    private String ChannelId = null;

    private String ItemId = null;

    private String Type = null;

    private String PolicyId = null;

    private String Remove = null;

    private String Live = null;

    private String Length = null;

    private String DistributionType = null;

    private String FileSize = null;

    private String Modified = null;

    private String Registered = null;

    private String MediaType = null;

    private String SourceId = null;

    private String Name = null;

    private String PGRate = null;

    private String MediaNumber = null;

    private String Artist = null;

    private String PackageId = null;

    private String Removed = null;

    private String URL = null;

    private String Category = null;

    private String SubCategory = null;

    public ContentBean()
    {
    }
    
    /**
     * @param AccountId
     * @param ChannelId
     * @param ItemId
     * @param Type
     * @param PolicyId
     * @param Remove
     * @param Live
     * @param Length
     * @param DistributionType
     * @param FileSize
     * @param Modified
     * @param Registered
     * @param MediaType
     * @param SourceId
     * @param Name
     * @param PGRate
     * @param MediaNumber
     * @param Artist
     * @param PackageId
     * @param Removed
     * @param URL
     * @param Category
     * @param SubCategory
     */
    public ContentBean(String AccountId, String ChannelId, String ItemId, String Type, String PolicyId, String Remove,
            String Live, String Length, String DistributionType, String FileSize, String Modified, String Registered,
            String MediaType, String SourceId, String Name, String PGRate, String MediaNumber, String Artist,
            String PackageId, String Removed, String URL, String Category, String SubCategory)
    {
        this.AccountId = AccountId;
        this.ChannelId = ChannelId;
        this.ItemId = ItemId;
        this.Type = Type;
        this.PolicyId = PolicyId;
        this.Remove = Remove;
        this.Live = Live;
        this.Length = Length;
        this.DistributionType = DistributionType;
        this.FileSize = FileSize;
        this.Modified = Modified;
        this.Registered = Registered;
        this.MediaType = MediaType;
        this.SourceId = SourceId;
        this.Name = Name;
        this.PGRate = PGRate;
        this.MediaNumber = MediaNumber;
        this.Artist = Artist;
        this.PackageId = PackageId;
        this.Removed = Removed;
        this.URL = URL;
        this.Category = Category;
        this.SubCategory = SubCategory;
    }

    /**
     * @return Returns the accountId.
     */
    public String getAccountId()
    {
        return AccountId;
    }

    /**
     * @param accountId
     *            The accountId to set.
     */
    public void setAccountId( String accountId )
    {
        AccountId = accountId;
    }

    /**
     * @return Returns the artist.
     */
    public String getArtist()
    {
        return Artist;
    }

    /**
     * @param artist
     *            The artist to set.
     */
    public void setArtist( String artist )
    {
        Artist = artist;
    }

    /**
     * @return Returns the category.
     */
    public String getCategory()
    {
        return Category;
    }

    /**
     * @param category
     *            The category to set.
     */
    public void setCategory( String category )
    {
        Category = category;
    }

    /**
     * @return Returns the channelId.
     */
    public String getChannelId()
    {
        return ChannelId;
    }

    /**
     * @param channelId
     *            The channelId to set.
     */
    public void setChannelId( String channelId )
    {
        ChannelId = channelId;
    }

    /**
     * @return Returns the distributionType.
     */
    public String getDistributionType()
    {
        return DistributionType;
    }

    /**
     * @param distributionType
     *            The distributionType to set.
     */
    public void setDistributionType( String distributionType )
    {
        DistributionType = distributionType;
    }

    /**
     * @return Returns the fileSize.
     */
    public String getFileSize()
    {
        return FileSize;
    }

    /**
     * @param fileSize
     *            The fileSize to set.
     */
    public void setFileSize( String fileSize )
    {
        FileSize = fileSize;
    }

    /**
     * @return Returns the itemId.
     */
    public String getItemId()
    {
        return ItemId;
    }

    /**
     * @param itemId
     *            The itemId to set.
     */
    public void setItemId( String itemId )
    {
        ItemId = itemId;
    }

    /**
     * @return Returns the length.
     */
    public String getLength()
    {
        return Length;
    }

    /**
     * @param length
     *            The length to set.
     */
    public void setLength( String length )
    {
        Length = length;
    }

    /**
     * @return Returns the live.
     */
    public String getLive()
    {
        return Live;
    }

    /**
     * @param live
     *            The live to set.
     */
    public void setLive( String live )
    {
        Live = live;
    }

    /**
     * @return Returns the mediaNumber.
     */
    public String getMediaNumber()
    {
        return MediaNumber;
    }

    /**
     * @param mediaNumber
     *            The mediaNumber to set.
     */
    public void setMediaNumber( String mediaNumber )
    {
        MediaNumber = mediaNumber;
    }

    /**
     * @return Returns the mediaType.
     */
    public String getMediaType()
    {
        return MediaType;
    }

    /**
     * @param mediaType
     *            The mediaType to set.
     */
    public void setMediaType( String mediaType )
    {
        MediaType = mediaType;
    }

    /**
     * @return Returns the modified.
     */
    public String getModified()
    {
        return Modified;
    }

    /**
     * @param modified
     *            The modified to set.
     */
    public void setModified( String modified )
    {
        Modified = modified;
    }

    /**
     * @return Returns the name.
     */
    public String getName()
    {
        return Name;
    }

    /**
     * @param name
     *            The name to set.
     */
    public void setName( String name )
    {
        Name = name;
    }

    /**
     * @return Returns the packageId.
     */
    public String getPackageId()
    {
        return PackageId;
    }

    /**
     * @param packageId
     *            The packageId to set.
     */
    public void setPackageId( String packageId )
    {
        PackageId = packageId;
    }

    /**
     * @return Returns the pGRate.
     */
    public String getPGRate()
    {
        return PGRate;
    }

    /**
     * @param rate
     *            The pGRate to set.
     */
    public void setPGRate( String rate )
    {
        PGRate = rate;
    }

    /**
     * @return Returns the policyId.
     */
    public String getPolicyId()
    {
        return PolicyId;
    }

    /**
     * @param policyId
     *            The policyId to set.
     */
    public void setPolicyId( String policyId )
    {
        PolicyId = policyId;
    }

    /**
     * @return Returns the registered.
     */
    public String getRegistered()
    {
        return Registered;
    }

    /**
     * @param registered
     *            The registered to set.
     */
    public void setRegistered( String registered )
    {
        Registered = registered;
    }

    /**
     * @return Returns the remove.
     */
    public String getRemove()
    {
        return Remove;
    }

    /**
     * @param remove
     *            The remove to set.
     */
    public void setRemove( String remove )
    {
        Remove = remove;
    }

    /**
     * @return Returns the removed.
     */
    public String getRemoved()
    {
        return Removed;
    }

    /**
     * @param removed
     *            The removed to set.
     */
    public void setRemoved( String removed )
    {
        Removed = removed;
    }

    /**
     * @return Returns the sourceId.
     */
    public String getSourceId()
    {
        return SourceId;
    }

    /**
     * @param sourceId
     *            The sourceId to set.
     */
    public void setSourceId( String sourceId )
    {
        SourceId = sourceId;
    }

    /**
     * @return Returns the subCategory.
     */
    public String getSubCategory()
    {
        return SubCategory;
    }

    /**
     * @param subCategory
     *            The subCategory to set.
     */
    public void setSubCategory( String subCategory )
    {
        SubCategory = subCategory;
    }

    /**
     * @return Returns the type.
     */
    public String getType()
    {
        return Type;
    }

    /**
     * @param type
     *            The type to set.
     */
    public void setType( String type )
    {
        Type = type;
    }

    /**
     * @return Returns the uRL.
     */
    public String getURL()
    {
        return URL;
    }

    /**
     * @param url
     *            The uRL to set.
     */
    public void setURL( String url )
    {
        URL = url;
    }

}
