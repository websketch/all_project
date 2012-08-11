/*
 * Created on 2005-6-23
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package sample;

import java.util.ArrayList;
import java.util.List;


/**
 * @author Administrator
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class SampleDAO extends BaseQuery {
	public List getMediaList(String curpage,String lang) {
			List result = new ArrayList();

			try {
				String hql="select m from Media m";
				setPageSize(20);            
				List medias = executeQuery(hql, curpage); 
				for(int i=0;i<medias.size();i++){
					Media m=(Media)medias.get(i);
					MediaView mv=new MediaView();
					mv.setId(m.getMedia_id().toString());
					Media_caption mc=m.getCaption(Integer.valueOf(lang));
					mv.setName(mc.getName());
					mv.setDescription(mc.getDescription());
					result.add(mv);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}

	public static void main(String[] args) {
	}
}
