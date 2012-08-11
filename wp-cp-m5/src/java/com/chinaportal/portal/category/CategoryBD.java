package com.chinaportal.portal.category;

import java.util.List;

import com.chinaportal.portal.util.PageContent;
import com.chinaportal.portal.util.VOCache;
import com.mediazone.dao.DAOException;

/**
 * @author rsun
 * Business Delegate for CategoryDAO, handle the cache thing
 */
public class CategoryBD {

	private static CategoryDAO cd = new CategoryDAO();
	
	public static PageContent getCategoryMedias(Integer category_id, Integer lang,	String curpage) {
        String key = "CategoryDAO.getCategoryMedias(" + category_id + "," + lang + "," + curpage + ")";
        PageContent result = (PageContent)VOCache.getVO(key);
        if (result == null) {
        	result = new PageContent();
        	CategoryDAO dao = new CategoryDAO();
        	result.content = dao.getCategoryMedias(category_id, lang, curpage);
        	try {
        		dao.closeJDBCSession();
        		dao.closeSession();
        	} catch (Exception e) {
    			e.printStackTrace();
			}
        	result.page = dao;
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static List getPopular(Integer category_id, Integer lang) {
        String key = "CategoryDAO.getPopular(" + category_id + "," + lang + ")";
        List result = (List)VOCache.getVO(key);
        if (result == null) {
        	result = cd.getPopular(category_id, lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static List getCommingSoonMedias(Integer category_id, Integer lang) {
        String key = "CategoryDAO.getCommingSoonMedias(" + category_id + "," + lang + ")";
        List result = (List)VOCache.getVO(key);
        if (result == null) {
        	result = cd.getCommingSoonMedias(category_id, lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static MediaView getBlock(Integer category_id, Integer lang) {
		String key = "CategoryDAO.getBlock(" + category_id + "," + lang + ")";
		MediaView result = (MediaView)VOCache.getVO(key);
        if (result == null) {
        	result = cd.getBlock(category_id, lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static List getChildren(String parent_id, Integer lang) throws DAOException {
        String key = "CategoryDAO.getChildren(" + parent_id + "," + lang + ")";
        List result = (List)VOCache.getVO(key);
        if (result == null) {
        	result = cd.getChildren(parent_id, lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static List getMedias(Integer category_id, Integer lang)throws DAOException {
        String key = "CategoryDAO.getMedias(" + category_id + "," + lang + ")";
        List result = (List)VOCache.getVO(key);
        if (result == null) {
        	result = cd.getMedias(category_id, lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static CategoryView getCategoryInfo(Integer category_id, Integer lang, String contextPath) {
        String key = "CategoryDAO.getCategoryInfo(" + category_id + "," + lang + ")";
		CategoryView result = (CategoryView)VOCache.getVO(key);
        if (result == null) {
			cd.setContextPath(contextPath);
        	result = cd.getCategoryInfo(category_id, lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
}
