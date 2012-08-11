package com.chinaportal.portal.sports;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.chinaportal.portal.category.MediaView;
import com.chinaportal.portal.util.VOCache;
import com.mediazone.bean.Category;
import com.mediazone.bean.CategoryCaption;
import com.mediazone.bean.Media;
import com.mediazone.dao.BaseQuery;

public class MatchDetailDAO extends BaseQuery {
	
	public MatchView getMatchDetail(String channel_id, String id, Integer lang) {
        String key = "MatchDetailDAO.getMatchDetail(" + id + "," + lang + ")";
		MatchView mv = (MatchView)VOCache.getVO(key);
        if (mv != null) {
			return mv;
		}
		String hql = "select m from Media as m where m.mediaId='" + id + "'";
		try {
			List medias = executeQuery(hql);
			if (medias == null || medias.size() < 1)
				return mv;
			Media m = (Media) medias.get(0);
			mv = MatchUtil.getDetail(m, lang);
			
			if (channel_id != null) {
				this.closeSession();
				hql = "select c from Category as c where c.categoryId="
						+ channel_id;
				List categorys = executeQuery(hql);
				if (categorys != null && categorys.size() > 0) {
					Category c = (Category) categorys.get(0);
//					CategoryCaption cc = c.getCaption(lang);
					  
					  CategoryCaption cc =null;
				      Set set = c.getCaptions();
				      Iterator iterator = set.iterator();
				      while (iterator.hasNext()) {
				        CategoryCaption cat = (CategoryCaption)iterator.next();
				         if (lang.equals(cat.getLangId()))
					                   cc=cat;
				     }
					
					if (cc != null && cc.getName() != null)
						mv.setChannel_name(cc.getName());
					else
						mv.setChannel_name(c.getName());
				}
				this.closeSession();
			}else{
				//MatchUtil.getChannel(m,lang,mv);
				mv.setChannel_name("");
			}

		} catch (Exception e) {
			e.printStackTrace();
			return mv;
		}finally{
			try{
				this.closeSession();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		VOCache.putVO(key,mv,new Long(12*60*60*1000));
		return mv;
	}
}
