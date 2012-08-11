package com.chinaportal.portal.news;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


import com.mediazone.bean.NewsCaption;
import com.mediazone.dao.BaseQuery;
import com.mediazone.dao.DAOException;
import com.mediazone.exception.ServiceException;
import com.mediazone.util.DBUtil;
import com.mediazone.util.GbkConvert;

public class NewsTrans {
	
	
	public int[] convertToBig5() throws DAOException{
		int[] counts = null;
		try {
			List list = this.getNewsCpationsWithoutBig5();
			counts = this.insertNewsCaptionBig5(list);
		} catch (DAOException e) {
			throw e;
		}
		return counts;
	}
	
	public List getNewsCpationsWithoutBig5() throws DAOException{
		List list = new ArrayList();
		List newsIds = new ArrayList();
		String sql = "select a.news_id from news_caption as a " +
				"left join (select c.news_id from news_caption as c where c.lang_id=3) as b on a.news_id = b.news_id " +
				"where a.lang_id=2 and b.news_id is null";
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				int news_id_int = rs.getInt("news_id");
				String news_id = Integer.toString(news_id_int);
				newsIds.add(news_id);
			}
		}catch(ServiceException se){
			throw new DAOException(se);
		}catch (SQLException se) {
			throw new DAOException(se);
		}finally{
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.closeConnection(conn);
		}
		for(int j=0; j<newsIds.size(); j++){
			NewsCaption nc = getNewsCaptionById((String)newsIds.get(j), new Integer(2));
			list.add(nc);
		}
		return list;
	}
	
	public NewsCaption getNewsCaptionById(String media_id, Integer lang) throws DAOException{
		String hql = "select nc from NewsCaption as nc where nc.newsId='"+media_id+"' and nc.langId='"+lang+"'";
		BaseQuery baseQuery = new BaseQuery();
		List list = baseQuery.executeQuery(hql);
		baseQuery.closeSession();
		NewsCaption nc = (NewsCaption)list.get(0);
		return nc;
	}
	
	
	public int[] insertNewsCaptionBig5(List list) throws DAOException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int[] counts = null;
		String sql = "insert into news_caption(news_id,lang_id,title,description,click_url,style,keyword,author,origin,create_time,creater,update_time,updater,body,image) " +
				"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			conn = DBUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			Iterator it = list.iterator();
			while(it.hasNext()){
				NewsCaption newsCaption = (NewsCaption)it.next();
				fillPreparedStatementParam(pstmt, newsCaption);
				pstmt.addBatch();
			}
			counts = pstmt.executeBatch();
		}catch(ServiceException se){
			throw new DAOException(se);
		}catch(SQLException sqle){
			throw new DAOException(sqle);
		}finally{
			DBUtil.close(pstmt);
			DBUtil.closeConnection(conn);
		}
		return counts;
	}
	
	private void fillPreparedStatementParam(PreparedStatement pstmt, NewsCaption nc) throws SQLException{
		pstmt.setInt(1, nc.getNewsId().intValue());
		pstmt.setInt(2, 3);
		pstmt.setString(3, GbkConvert.traditionalize(nc.getTitle()));
		pstmt.setString(4, GbkConvert.traditionalize(nc.getDescription()));
		pstmt.setString(5, nc.getClickUrl());
		pstmt.setString(6, nc.getStyle());
		pstmt.setString(7, GbkConvert.traditionalize(nc.getKeyword()));
		pstmt.setString(8, GbkConvert.traditionalize(nc.getAuthor()));
		pstmt.setString(9, GbkConvert.traditionalize(nc.getOrigin()));
		pstmt.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
		pstmt.setString(11, GbkConvert.traditionalize(nc.getCreater()));
		pstmt.setTimestamp(12, new Timestamp(System.currentTimeMillis()));
		pstmt.setString(13, GbkConvert.traditionalize(nc.getUpdater()));
		pstmt.setString(14, GbkConvert.traditionalize(nc.getBody()));
		pstmt.setString(15, nc.getImage());
	}
	
	
	private String gbkToBig(String gbkStr) throws IOException{
		String big5String = null;
			String pathname = "E:/project/space3.1/portal-cp/webapp/code_table/gb-big5.tab";
			File file = new File(pathname);
			int len = gbkStr.length();
			System.out.println("长度: "+len);
			//char bg[] = new char[2];
			byte bg[] = new byte[2];
			//char[] charStr = gbkStr.toCharArray();
			byte[] charStr = gbkStr.getBytes();
			System.out.println("char[]长度: "+gbkStr.toCharArray().length);
			System.out.println("bytes长度: "+gbkStr.getBytes().length);
			
			for(int i = 0 ; i <gbkStr.getBytes().length; i++ ) 
			{
				int h;
				h=(int)charStr[i];
				System.out.println("high: "+h);
				h=255+h;
				System.out.println(h);
				if(h > 160 && h < 248 ) 
				{
					int l;
					l=(int)charStr[i+1];
					System.out.println("low: "+l);
					l=255+l;
					if( l > 160 && l < 255 ) 
					{	
						System.out.println("读文件前");
						if(file.exists()){
							System.out.println("开始读文件");
							FileInputStream fileInputStream = new FileInputStream(file);
							fileInputStream.skip(((h-161)*94+l-161)*3);
							fileInputStream.read(bg, 0, 2);
							fileInputStream.close();
							System.out.println("读文件： "+i+"次");
						}	
					}
					else{
						String empty = " ";
						//byte[] e = empty.getBytes();
						//System.out.print("empty length:"+e.length);
						bg[0]=new Byte(empty).byteValue();
						bg[1]=new Byte(empty).byteValue();
					}
					charStr[i] = bg[0];
					charStr[i+1] = bg[1];
					i++;
				}
			}
			
			big5String = new String(charStr);
			System.out.println("new (charStr): "+big5String);
		return big5String;
	}
	
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		NewsTrans newsTrans = new NewsTrans();
		try{
		String testStr = newsTrans.gbkToBig("中国");
		System.out.println("result: "+testStr);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		/*
		byte bg[] = new byte[2];
		String pathname = "E:/project/space3.1/portal-cp/webapp/code_table/test.txt";
		File file = new File(pathname);
		try{
		FileInputStream fileInputStream = new FileInputStream(file);
		fileInputStream.skip(2);
		fileInputStream.read(bg, 0, 2);
		System.out.println(new String(bg));
		fileInputStream.close();
		}catch(IOException e){
			e.printStackTrace();
		}
		*/
	}

}
