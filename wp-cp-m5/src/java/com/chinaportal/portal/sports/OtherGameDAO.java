package com.chinaportal.portal.sports;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.chinaportal.portal.util.CategoryUtil;
import com.mediazone.bean.Category;
import com.mediazone.bean.CategoryCaption;
import com.mediazone.dao.BaseQuery;

public class OtherGameDAO extends BaseQuery {
	public java.util.List getSubCategorys(String ids,Integer lang){
		List catList = new ArrayList();
		String hql="select c from Category as c" +
				" where c.categoryId in("+ids+") order by c.categoryId desc";
		try {
			List cats = executeQuery(hql);
			if(cats==null || cats.size()<1)
				return catList;
			for(int i=0;i<cats.size();i++){
				SubCategoryView scv=new SubCategoryView();
				Category c=(Category)cats.get(i);

				scv.setId(c.getCategoryId().toString());
//				CategoryCaption cc = c.getCaption(lang);
				
				  CategoryCaption cc=null;
			      Set set =c.getCaptions();
			      Iterator iterator = set.iterator();
			      while (iterator.hasNext()) {
			        CategoryCaption cat = (CategoryCaption)iterator.next();
			         if (lang.equals(cat.getLangId())) 
				          cc=cat; 
			     }
				
				
				if (cc != null) {
					if (cc.getName() != null)
						scv.setName(cc.getName());
					else
						scv.setName(c.getName());					
				}
				
				List children=CategoryUtil.getAllChildren(c);
				
				
				
				for(int j=0;j<children.size();j++){
					Category subc=(Category)children.get(j);
					
					if(subc.getName()!=null && subc.getName().equals("2005")){
						List sub_children=CategoryUtil.getAllChildren(subc);
						scv.setMatchs(new ArrayList());
						if(sub_children!=null && sub_children.size()>0){							
							for(int m=0;m<children.size();m++){
								Category subcc=(Category)children.get(m);
								List medias=subcc.getMedias();								
								if(medias.size()>0){									
									MatchUtil.visitMediaList(scv.getMatchs(), medias,lang,true);	
								}
							}
						}else{
							List medias=subc.getMedias();							
							if(medias.size()>0){								
								MatchUtil.visitMediaList(scv.getMatchs(), medias,lang);																
							}
						}
						catList.add(scv);
						break;
					}
				}				
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return catList;
	}
}
