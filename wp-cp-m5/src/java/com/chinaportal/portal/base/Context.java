package com.chinaportal.portal.base;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import com.chinaportal.portal.category.CategoryView;
import com.mediazone.bean.Category;
import com.mediazone.bean.CategoryCaption;
import com.mediazone.bean.Photo;
import com.mediazone.dao.BaseQuery;

public class Context {
	private static java.util.Properties categorys;
	private static List leftSports;
	
	public boolean isLeftSport(String category_id){
		if(leftSports==null){
			setLeftSports();
		}
		if(leftSports.contains(category_id))
			return true;
		return false;
	}
	
	public void setLeftSports(){
		leftSports=new ArrayList();
		String hql="select cr.categoryId from CategoryRelation as cr where cr.parentCategoryId=130 and cr.sort=1";
		BaseQuery bq=new BaseQuery();
		try{
			List crs=bq.executeQuery(hql);
			for(int i=0;i<crs.size();i++){
				leftSports.add(((Integer)crs.get(i)).toString());
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				bq.closeSession();
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
	}
	public List getCategory(List ids, Integer langId){
		List result=new ArrayList();
		if(categorys==null)
			setCategorys();
		for(int i=0;i<ids.size();i++){
			result.add(categorys.get((String)ids.get(i)));
		}
		return result;
	}
	
	public CategoryView getParent(String child_id){
		CategoryView c=getCategory( child_id);
		return getCategory((String)(c.getParents().get(0)));
	}
	
	public List getChildren(String category_id){
		List result=new ArrayList();
		if(categorys==null)
			setCategorys();
		CategoryView c=getCategory(category_id);
		List children =c.getChildren();
		if(children==null ||children.size()==0)
			return result;
		for(int i=0;i<children.size();i++){
			result.add(categorys.get((String)children.get(i)));
		}
		return result;
	}
	public List getChildren(String category_id,Integer lang){
		List result=new ArrayList();
		if(categorys==null)
			setCategorys();
		CategoryView c=getCategory(category_id);
		List children =c.getChildren();
		if(children==null ||children.size()==0)
			return result;
		for(int i=0;i<children.size();i++){
			CategoryView clone=new CategoryView();
			CategoryView child = (CategoryView)getCategory((String) children.get(i));
			clone.setCategory_id(child.getCategory_id());
			CategoryCaption child_cc=child.getCaption(lang);
			if(child_cc!=null && child_cc.getName()!=null)
				clone.setCategory_name(child_cc.getName());
			else
				clone.setCategory_name(child.getCategory_name());
			result.add(clone);
		}
		return result;
	}
	public CategoryView  getCategory(String category_id){
		if(categorys==null)
			setCategorys();
		return (CategoryView)categorys.get(category_id);
	}
	public Properties getCategorys(){
		if(categorys==null)
			setCategorys();
		return categorys;
	}
	public void setCategorys(){
		categorys=new Properties();
		String hql="select c from Category as c";
		BaseQuery bq=new BaseQuery();
		try{
			List cats=bq.executeQuery(hql);
			for(int i=0;i<cats.size();i++){
				CategoryView cv=new CategoryView();
				Category c=(Category)cats.get(i);	
				cv.setCategory_id(c.getCategoryId().toString());
				Set captions=c.getCaptions();
				if(captions!=null && !captions.isEmpty()){
					Iterator it=captions.iterator();
					Properties ccs=new Properties();
					while(it.hasNext()){
						CategoryCaption cc=(CategoryCaption)it.next();
						ccs.put(cc.getLangId(),cc);
					}
					cv.setCaptions(ccs);
				}
				cv.setCategory_name(c.getName());
				
				if(c.getPhotos()!=null && c.getPhotos().size()>0){
					Photo p=(Photo)c.getPhotos().get(0);
					cv.setPhoto(p.getPhoto());
				}
				
				
				Set parents=c.getParents();
				if(parents!=null && !parents.isEmpty()){
					Iterator it=parents.iterator();
					List parentIds=new ArrayList();
					while(it.hasNext()){
						Category parent=(Category)it.next();
						parentIds.add(parent.getCategoryId().toString());
					}
					cv.setParents(parentIds);
				}
				List children=c.getChildren();
				if(children!=null && children.size()>0){
					List childIds=new ArrayList();
					for(int j=0;j<children.size();j++){
						Category child=(Category)children.get(j);
						childIds.add(child.getCategoryId().toString());
					}
					cv.setChildren(childIds);
				}
				categorys.put(cv.getCategory_id(),cv);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				bq.closeSession();
			}catch(Exception fe){
				fe.printStackTrace();
			}
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
