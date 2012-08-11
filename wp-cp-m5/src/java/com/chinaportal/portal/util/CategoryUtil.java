package com.chinaportal.portal.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.mediazone.bean.Category;

public class CategoryUtil {
	public static ArrayList getAllChildren(Category c) {
		ArrayList children = new ArrayList();
		getChildren(c, children);
		return children;
	}
	private static void getChildren(Category c, ArrayList children) {
		children.add(c);
		if (c.getChildren().size() > 0) {
			List list = (List) c.getChildren();
			Category category = null;
			for(int i=0;i<list.size();i++) {
			 category = (Category)list.get(i);
				getChildren(category, children);
			}
		} 
	}

}
