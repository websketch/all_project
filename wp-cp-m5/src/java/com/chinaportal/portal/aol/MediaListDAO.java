package com.chinaportal.portal.aol;

import java.util.ArrayList;
import java.util.List;

import com.mediazone.dao.BaseQuery;

public class MediaListDAO extends BaseQuery {

	public List getMediaList(Integer lang, String curpage, String key) {
		List mediaList = new ArrayList();
		String hql="SELECT mr.parent_media_id, m.media_id, m.name, mc2.name AS parent_caption, mc1.name AS caption "
				+ " from media m "/* 'FROM' not supported by BaseQuery */
				+ "  INNER JOIN      media_caption mc1 ON         (m.media_id=mc1.media_id AND mc1.lang_id="+lang.intValue()+") "
				+ "  LEFT OUTER JOIN media_relation mr ON (m.media_id=mr.media_id) "
				+ "  LEFT OUTER JOIN media_caption mc2 ON (mr.parent_media_id=mc2.media_id AND mc2.lang_id="+lang.intValue()+") "
				+ " WHERE m.name LIKE '%"+key+"%' "
				+ "  OR mc1.name LIKE '%"+key+"%' "
				+ "  OR mc2.name LIKE '%"+key+"%' "
				+ " ORDER BY m.media_id ";
		try {
			this.setPageSize(20);
			executeJDBCQuery(hql, curpage, null);
			while (rs.next()) {
				ChildMedia mv = new ChildMedia();
				mv.setId(rs.getString("media_id"));
				mv.setParent_id(rs.getString("parent_media_id"));
				mv.setName(rs.getString("name"));
				mv.setCaption(rs.getString("caption"));
				mv.setParent_caption(rs.getString("parent_caption"));
				mediaList.add(mv);
			}
			rs.close();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				this.closeJDBCSession();
			} catch (Exception fe) {
				fe.printStackTrace();
			}
		}
		return mediaList;
	}

}
