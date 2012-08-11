package com.chinaportal.portal.homepage;

import java.util.List;

import com.chinaportal.portal.util.VOCache;

/**
 * @author rsun
 * Business Delegate for HomePageDAO, handle the cache thing
 */
public class HomePageBD {

	private static HomePageDAO hpd = new HomePageDAO();

	public static List getSpecial(Integer category_id, int pagesize, Integer lang) {
        String key = "HomePageDAO.getSpecial(" + category_id + "," + pagesize + "," + lang + ")";
        List result = (List)VOCache.getVO(key);
        if (result == null) {
        	result = hpd.getSpecial(category_id, pagesize, lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static List getRecommend(Integer lang) {
        String key = "HomePageDAO.getRecommend(" + lang + ")";
        List result = (List)VOCache.getVO(key);
        if (result == null) {
        	result = hpd.getRecommend(lang);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}
	
	public static List getCommingSoonMedias(Integer lang, int pagesize) {
        String key = "HomePageDAO.getCommingSoonMedias(" + lang + "," + pagesize + ")";
        List result = (List)VOCache.getVO(key);
        if (result == null) {
        	result = hpd.getCommingSoonMedias(lang, pagesize);
        	VOCache.putVO(key, result, new Long(12*60*60*1000));
		}
        return result;
	}

	public static List getNews(Integer news_type_id,Integer lang){
		String key = "HomePageDAO.getNews("+news_type_id+","+lang+")";
		List result = (List)VOCache.getVO(key);
		if (result == null) {
        	result = hpd.getNews(news_type_id,lang);
        	VOCache.putVO(key, result, new Long(4*60*60*1000));
		}
		return result;
	}
}
