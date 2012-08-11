package com.chinaportal.portal.adult;

import java.util.List;

import com.chinaportal.portal.util.PageContent;
import com.chinaportal.portal.util.VOCache;
import com.mediazone.dao.DAOException;

/**
 * @author rsun
 * Business Delegate for AdultDAO, handle the cache thing
 */
public class AdultBD {

	private static AdultDAO ad = new AdultDAO();

	public static PageContent queryRecommend(Integer category_id, Integer lang, String curPage, Integer pageSize) throws DAOException {
        String key = "AdultDAO.queryRecommend(" + category_id + "," + lang + "," + curPage + "," + pageSize + ")";
        PageContent result = (PageContent)VOCache.getVO(key);
        if (result == null) {
        	result = new PageContent();
        	AdultDAO dao = new AdultDAO();
        	result.content = dao.queryRecommend(category_id, lang, curPage, pageSize);
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
	
	public static PageContent queryNewOffer(Integer category_id, Integer lang, String curPage, Integer pageSize) throws DAOException {
        String key = "AdultDAO.queryNewOffer(" + category_id + "," + lang + "," + curPage + "," + pageSize + ")";
        PageContent result = (PageContent)VOCache.getVO(key);
        if (result == null) {
        	result = new PageContent();
        	AdultDAO dao = new AdultDAO();
        	result.content = dao.queryNewOffer(category_id, lang, curPage, pageSize);
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
	
	public static PageContent queryComingSoon(Integer category_id, Integer lang, String curPage, Integer pageSize) throws DAOException {
        String key = "AdultDAO.queryComingSoon(" + category_id + "," + lang + "," + curPage + "," + pageSize + ")";
        PageContent result = (PageContent)VOCache.getVO(key);
        if (result == null) {
        	result = new PageContent();
        	AdultDAO dao = new AdultDAO();
        	result.content = dao.queryComingSoon(category_id, lang, curPage, pageSize);
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
	
	/**
	 * Currently, the functions(ad.popListWeek, ad.popListAll) are using Hibernate thread session,
	 * which MUST be closed at the end of the thread, by calling this fuction(AdultBD.closeSession)
	 * by rsun 10/7/2005
	 * @throws DAOException
	 */
	public static void closeSession() throws DAOException {
		ad.closeSession();
	}
	
	public static List popListWeek(Integer category_id, Integer lang, String curPage, Integer pageSize) throws DAOException {
        String key = "AdultDAO.popListWeek(" + category_id + "," + lang + "," + curPage + "," + pageSize + ")";
        List result = (List)VOCache.getVO(key);
        if (result == null) {
        	result = ad.popListWeek(category_id, lang, curPage, pageSize);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static List popListAll(Integer category_id, Integer lang, String curPage, Integer pageSize) throws DAOException {
        String key = "AdultDAO.popListAll(" + category_id + "," + lang + "," + curPage + "," + pageSize + ")";
        List result = (List)VOCache.getVO(key);
        if (result == null) {
        	result = ad.popListAll(category_id, lang, curPage, pageSize);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
}
