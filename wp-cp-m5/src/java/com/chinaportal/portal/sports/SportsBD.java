package com.chinaportal.portal.sports;

import java.util.List;

import com.chinaportal.portal.util.VOCache;
import com.mediazone.dao.DAOException;

/**
 * @author rsun
 * Business Delegate for SportsDAO, handle the cache thing
 */
public class SportsBD {

	private static SportsDAO sd = new SportsDAO();
	
	public static List getMediaBlock(String blockName, Integer lang) {
        String key = "SportsDAO.getMediaBlock(" + blockName + "," + lang + ")";
        List result = (List)VOCache.getVO(key);
        if (result == null) {
        	result = sd.getMediaBlock(blockName, lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static SubCategoryView getCategoryBlock(String blockName, Integer lang) {
        String key = "SportsDAO.getCategoryBlock(" + blockName + "," + lang + ")";
        SubCategoryView result = (SubCategoryView)VOCache.getVO(key);
        if (result == null) {
        	result = sd.getCategoryBlock(blockName, lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static List getNewMaths(Integer lang) {
        String key = "SportsDAO.getNewMaths(" + lang + ")";
        List result = (List)VOCache.getVO(key);
        if (result == null) {
        	result = sd.getNewMaths(lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	/**
	 * Currently, the functions(sd.getCommingGame, sd.getWeekReferMatch) are using Hibernate thread session,
	 * which MUST be closed at the end of the thread, by calling this fuction(SportsBD.closeSession)
	 * by rsun 10/7/2005
	 * @throws DAOException
	 */
	public static void closeSession() throws DAOException {
		sd.closeSession();
	}
	
	public static List getCommingGame(String blockName, Integer lang) {
        String key = "SportsDAO.getCommingGame(" + blockName + "," + lang + ")";
        List result = (List)VOCache.getVO(key);
        if (result == null) {
        	result = sd.getCommingGame(blockName, lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static MatchView getWeekReferMatch(String category_id, Integer lang) {
        String key = "SportsDAO.getWeekReferMatch(" + category_id + "," + lang + ")";
        MatchView result = (MatchView)VOCache.getVO(key);
        if (result == null) {
        	result = sd.getWeekReferMatch(category_id, lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static List getNews(Integer news_type_id,Integer lang){
		String key = "SportsDAO.getNews("+news_type_id+","+lang+")";
		List result = (List)VOCache.getVO(key);
		if (result == null) {
        	result = sd.getNews(news_type_id,lang);;
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
		return result;
	}
	
}
