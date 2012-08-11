/*
 * Created on 2005-8-9
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.chinaportal.portal.adult;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.chinaportal.portal.category.MediaView;
import com.chinaportal.portal.detail.MediaUtil;
import com.mediazone.bean.DistributeChannel;
import com.mediazone.bean.Item;
import com.mediazone.bean.Media;
import com.mediazone.bean.MediaCaption;
import com.mediazone.bean.Photo;
import com.mediazone.dao.BaseQuery;
import com.mediazone.dao.DAOException;
import com.chinaportal.portal.comment.CommentDAO;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class AdultDAO extends BaseQuery {
    
    private static final Log log = LogFactory.getLog(AdultDAO.class);
    
    public List popListWeek(Integer category_id, Integer lang, String curPage, Integer pageSize) throws DAOException {
        List mediaList = new ArrayList();
        List list = null;
        String hql = "select distinct m from MediaCategory as mc ,Media as m, ContentItemHitsWeekly as c" 
            +" where c.mediaId=m.mediaId and mc.categoryId="
            +category_id.toString()+" and mc.mediaId=m.mediaId order by c.hits desc";
        this.setPageSize(pageSize.intValue());
        try{
            list = this.executeQuery(hql, curPage);
	        if(list!=null && list.size()!=0){
	            this.adultVisitMediaList(mediaList, list, lang);
	        }
        }catch(DAOException de){
            log.error("查询每周排行popListWeek: "+de);
            throw de;
        }finally{
			this.closeSession();
        }
		for(int i=0;i<mediaList.size();i++ ){
			MediaView mv=(MediaView)mediaList.get(i);
			mv.setLevel(CommentDAO.getAverageRateJDBC(mv.getId(), lang.toString())+"");
		}
			//mv.setLevel(CommentDAO.getAverageRateJDBC(m.getMedia_id().toString(), lang.toString())+"");
        return mediaList;
    }
    
    public List popListAll(Integer category_id, Integer lang, String curPage, Integer pageSize) throws DAOException {
        List mediaList = new ArrayList();
        List list = null;
        String hql = "select distinct m from MediaCategory as mc ,Media as m, ContentItemHits as c" 
            +" where c.mediaId=m.mediaId  and mc.categoryId="
            +category_id.toString()+" and mc.mediaId=m.mediaId order by c.hits desc";
        this.setPageSize(pageSize.intValue());
        try{
            list = this.executeQuery(hql, curPage);
	        if(list!=null && list.size()!=0){
	            this.adultVisitMediaList(mediaList, list, lang);
	        }
        }catch(DAOException de){
            log.error("查询总排行popListAll: "+de);
            throw de;
        }finally{
			this.closeSession();
        }

		for(int i=0;i<mediaList.size();i++ ){
			MediaView mv=(MediaView)mediaList.get(i);
			mv.setLevel(CommentDAO.getAverageRateJDBC(mv.getId(), lang.toString())+"");
		}
        return mediaList;
    }
    
    
    public List queryRecommend(Integer category_id, Integer lang, String curPage, Integer pageSize) throws DAOException {
        List list = null;
        String addhql = "and m.startTime<=NOW() and m.endTime>=NOW() and m.release=1 order by mc.sort desc, m.mediaId desc";
        list = queryMedia(category_id, lang, curPage, pageSize, addhql);
        return list;
    }
    
    
    public List queryNewOffer(Integer category_id, Integer lang, String curPage, Integer pageSize) throws DAOException {
        List list = null;
        String addhql = "and m.startTime<=NOW() and m.endTime>=NOW() and m.release=1 order by m.startTime desc, m.mediaId desc";
        list = queryMedia(category_id, lang, curPage, pageSize, addhql);
        return list;
    }
    
    public List queryComingSoon(Integer category_id, Integer lang, String curPage, Integer pageSize) throws DAOException {
        List list = null;
        String addhql = "and m.startTime>NOW() order by m.startTime, m.mediaId";
        list = queryMedia(category_id, lang, curPage, pageSize, addhql);
        return list;
    }
    
    
    public List queryMedia(Integer category_id, Integer lang, String curPage, Integer pageSize, String addhql) throws DAOException{
        List mediaList = null;
        List list = null;
        String hql = "select distinct m from Media as m,MediaCategory as mc where mc.categoryId=:category_id "
            + " and m.mediaId=mc.mediaId ";
        if(addhql!=null){
            hql += addhql;
        }
        Properties conditions = new Properties();
        conditions.put("category_id", category_id);
        try{
            if(pageSize!=null){
                this.setPageSize(pageSize.intValue());
                try{
                    list = this.executeQuery(hql, curPage, conditions);
                }catch(DAOException de){
                    log.error("查询queryMedia有curPage: "+de);
                    throw de;
                }
            }else {
                try{
                    list = this.executeQuery(hql, conditions);
                }catch(DAOException de){
                    log.error("查询queryMedia无curPage: "+de);
                    throw de;
                }
            }
            if(list!=null && list.size()!=0){
                mediaList = new ArrayList();
                this.adultVisitMediaListNoRating(mediaList, list, lang);
            }
        }finally{
            this.closeSession();
        }
        return mediaList;
        
    }
    
    /**
     * with average rating
     * @param mediaList
     * @param medias
     * @param lang
     * @throws DAOException
     */
    public void adultVisitMediaList(List mediaList, List medias, Integer lang) throws DAOException {
        MediaView mv = null;
        for (int i = 0; i < medias.size(); i++) {
            mv = this.getDetailforPopList((Media)medias.get(i),lang);
            mediaList.add(mv);
        }
    }
    
    /**
     * without average rating
     * @param mediaList
     * @param medias
     * @param lang
     * @throws DAOException
     */
    public void adultVisitMediaListNoRating(List mediaList, List medias, Integer lang) throws DAOException {
        MediaView mv = null;
        for (int i = 0; i < medias.size(); i++) {
            mv = this.getDetailNoRating((Media)medias.get(i),lang);
            mediaList.add(mv);
        }
    }
    
    /**
     * use MediaUtil.getDetail() with average rating
     * @param mediaList
     * @param medias
     * @param lang
     */
    public void visitMediaList(List mediaList, List medias, Integer lang) {
        MediaView mv = null;
        for (int i = 0; i < medias.size(); i++) {
            mv = MediaUtil.getDetail((Media)medias.get(i),lang);
            mediaList.add(mv);
        }
    }
    
    
    public  MediaView getDetailNoRating(Media m,Integer lang) throws DAOException{
        MediaView mv = new MediaView();
        mv.setId(m.getMediaId().toString());
        //Category c=(Category)(m.getCategorys().get(0));
        //mv.setCategory_id(c.getCategory_id().toString());
//        MediaCaption mc = m.getCaption(lang);
//        if (mc != null && mc.getName() != null)
//            mv.setName(mc.getName());
//        else
//            mv.setName(m.getName());
//        mv.setPhoto(m.getPhoto());
//        //if(mc!=null && mc.getDescription()!=null)
//        if(mc!=null && mc.getHighlight()!=null)
//            mv.setHighlight(mc.getHighlight());
        
        MediaCaption  mc=null;
		Set set =m.getCaptions();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			MediaCaption cat = (MediaCaption) iterator.next();
			if (lang.equals(cat.getLangId()))
		            mc=cat;
		    }
         if (mc != null && mc.getName() != null )
                   mv.setName(mc.getName());
         if(mc.getHighLight()!=null)
                  mv.setHighlight(mc.getHighLight());                                                                    
         else
                   mv.setName(m.getName());          
    
        if (mv.getName() == null)
        	mv.setName(m.getName());        
        if(m.getPhotos()!=null && m.getPhotos().size()>0){
			Photo p=(Photo)m.getPhotos().get(0);
			mv.setPhoto(p.getPhoto());
		}
        
        getItem( m, mv);
        //mv.setLevel(CommentDAO.getAverageRateJDBC(m.getMedia_id().toString(), lang.toString())+"");
        return mv;
    }
    
    
    
    public  MediaView getDetailforPopList(Media m,Integer lang) throws DAOException{
        MediaView mv = new MediaView();
        mv.setId(m.getMediaId().toString());
        MediaCaption  mc;
		Set set =m.getCaptions();
		Iterator iterator = set.iterator();
		while (iterator.hasNext()) {
			MediaCaption cat = (MediaCaption) iterator.next();
			if (lang.equals(cat.getLangId())){
		            mc=cat;
               if (mc != null && mc.getName() != null ){
                         mv.setName(mc.getName());
                     if(mc.getHighLight()!=null)
                         mv.setHighlight(mc.getHighLight());       
                    }                                           
               else
                    mv.setName(m.getName());
                        break;
              }
        }
        if (mv.getName() == null)
        	mv.setName(m.getName());        
        if(m.getPhotos()!=null && m.getPhotos().size()>0){
			Photo p=(Photo)m.getPhotos().get(0);
			mv.setPhoto(p.getPhoto());
		}
//        
//               MediaCaption mc = m.getCaption(lang);
//                 if (mc != null && mc.getName() != null)
//                        mv.setName(mc.getName());
//                 else
//                        mv.setName(m.getName());
//                        mv.setPhoto(m.getPhoto());
                        
        /*if(mc!=null && mc.getDescription()!=null)
        mv.setDescription(mc.getDescription());
        if(mv.getDescription()!=null)
            mv.setDescription(mv.getDescription().replaceAll("\n","<br>"));
        */
//        if(mc!=null && mc.getHighlight()!=null)
//            mv.setHighlight(mc.getHighlight());
        
        /*
        List actors = m.getActors();
        if (actors != null && actors.size()>0) {
            String actor = "";
            int length = actors.size();
            for (int i = 0; i < length; i++) {
                Actor a = (Actor) actors.get(i);
                Actor_caption ac = a.getCaption(lang);
                if (ac != null && ac.getName() != null)
                    actor += ac.getName();
                else if (a.getName() != null)
                    actor += a.getName();
                if (i < length - 1)
                    actor += " ";
            }
            mv.setActors(actor);
        }
        
        List directors = m.getDirectors();
        if (directors != null && directors.size()>0) {
            String director = "";
            int length = directors.size();
            for (int i = 0; i < length; i++) {
                Actor a = (Actor) directors.get(i);
                Actor_caption ac = a.getCaption(lang);
                if (ac != null && ac.getName() != null)
                    director += ac.getName();
                else if (a.getName() != null)
                    director += a.getName();
            }
            mv.setDirectors(director);
        }
        */
        //getItem( m, mv);
        /*
        List children=m.getChildren();
        List childs=new ArrayList();
        if(children!=null && children.size()>0){
            for(int i=0;i<children.size();i++){
                Media child=(Media)children.get(i);
                MediaView child_mv = new MediaView();
                Media_caption child_mc = child.getCaption(lang);
                if (child_mc != null && child_mc.getName() != null)
                    child_mv.setName(child_mc.getName());
                else
                    child_mv.setName(child.getName());
                getItem( child, child_mv);
                childs.add(child_mv);
            }
        }
        mv.setChildren(childs);
        */
       // mv.setLevel(CommentDAO.getAverageRateJDBC(m.getMedia_id().toString(), lang.toString())+"");
        return mv;
    }
    
    public static void getItem(Media m,MediaView mv){
        List items = m.getItems();
        String url = null;
        String man_account_id = null;
        String man_item_id = null;
        String man_channel_id = null;
        String dis_name = "";
        if (items != null && items.size() > 0) {
            for (int i = 0; i < items.size(); i++) {
                Item item = (Item) items.get(i);
                //man_account_id = item.getManAccountId();
                man_item_id = item.getManItemId();
                DistributeChannel dc = item.getDistribute();
                url=item.getUrl();
                if (dc != null) {                   
                    man_channel_id = dc.getManChannelId();
                    if (dc.getName() != null)
                        dis_name = dc.getName();
                    if ("Download".equals(dis_name)) {
                        if(url.indexOf("http")!=-1){
                            String temp=url.substring(0,url.lastIndexOf("/"));  
                            mv.setDownloadURL(url.substring(url.lastIndexOf("/")+1,url.length()));
                            mv.setDir(temp.substring(temp.lastIndexOf("/")+1,temp.length()));
                        }
                    } else if ("Streaming".equals(dis_name)) {
                        mv.setOnlineURL(url);
                    }
                }
            }
        }
    }
    
    
    

    public static void main(String[] args) {
    }
}
