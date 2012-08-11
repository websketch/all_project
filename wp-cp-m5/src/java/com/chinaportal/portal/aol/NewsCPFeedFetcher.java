package com.chinaportal.portal.aol;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.net.URL;
import java.net.URLConnection;
import java.sql.ResultSet;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.mediazone.bean.News;
import com.mediazone.bean.NewsCaption;
import com.mediazone.dao.BaseQuery;

/**
 * 
 * 
 * @author Rick Sun
 * 
 * $Id: NewsCPFeedFetcher.java,v 1.1.2.7 2006/02/21 03:04:10 rick Exp $
 */
public class NewsCPFeedFetcher
{

	private static final Log log = LogFactory.getLog(NewsCPFeedFetcher.class);

	private String feedCpUrl;
	private String localCpDir;
	private String authorization;

	public NewsCPFeedFetcher(String feedCpUrl, String localCpDir) {
		this.feedCpUrl  = feedCpUrl;
		this.localCpDir = localCpDir;
		
		int slash = feedCpUrl.indexOf("//");
		int at    = feedCpUrl.indexOf("@");
		if ( slash > -1 && at > slash ) {
			String userPassword = feedCpUrl.substring( slash + 2, at );
			this.authorization  = "Basic " + new sun.misc.BASE64Encoder().encode( userPassword.getBytes() );
		} else {
			this.authorization  = "";
		}
	}

	public Document pullFeed( String xmlEncoding ) throws Exception {

		SAXBuilder parser = new SAXBuilder();
		Document result = null;

		//Try 3 times to pull feed
		for (int i = 0; i < 3; i++) {
			try {

				URL url = new URL(feedCpUrl + "/aol/exportNewsData.do");
				URLConnection uc = url.openConnection();
				if ( ! "".equals(authorization) ) {
					uc.setRequestProperty ("Authorization", authorization);
				}
				InputStream inputStream = uc.getInputStream();

				String xmlData = "";
				int in;
				// boolean firstchar = true;
				// int byte1 = 0;//inputStream.read();
				// int byte2 = 0;//inputStream.read();
				// int byte3 = 0;//inputStream.read();
				// check for BOM (utf-8 files are encoded with a special BOM character
				// in the beginning of the file.
				// if BOM detected then remove it
				// if ( byte1 != 0xEF && byte2 != 0xBB && byte3 != 0xBF )
				// {
				// reset may not be supported
				// inputStream.close();
				// inputStream = url.openStream();
				// }
				Reader reader = new BufferedReader(new InputStreamReader(inputStream, xmlEncoding));
				while ( (in = reader.read()) != -1 ) {
					xmlData += (char) in;
					// System.out.print((char) in);
				}
				// System.out.println(xmlData);
				inputStream.close();

				result = parser.build( new StringReader(xmlData) );

				log.info("Newsfeed pull, succeeded");
				break;// pull succeed
			} catch (Exception e) {
				log.error("Newsfeed pull, failed: ", e);
				//e.printStackTrace();
			}
		}

		return result;
	}

	public void parseDocument( Document docToParse ) throws Exception
	{
		if (docToParse == null)
			return;

		log.info("Newsfeed insert, starts...");
		Element root = docToParse.getRootElement(); //<cpnews>
		List news = root.getChildren("news");
		log.info("Newsfeed insert, total news count: " + news.size());

		for ( int i = 0; i < news.size(); i++ )
		{
			Element newsElement = (Element)(news.get(i));
			
			try {
				//If this news already exists, skip it
				boolean skip = false;
				List captions = newsElement.getChild("captions").getChildren();
				for ( int j = 0; j < captions.size(); j++ )
				{
					Element caption = (Element)(captions.get(j));
					
					//check to see if caption has already been added.
					String checkCaption = "select * from news_caption where title = '"+caption.getChildText("title")+"'";
					BaseQuery bq = new BaseQuery();
					ResultSet rs = bq.executeJDBCQuery(checkCaption);
					if ( rs != null && rs.next() )
					{
						skip = true;
						rs.close();
						bq.closeJDBCSession();
						break;
					}
					rs.close();
					bq.closeJDBCSession();
				}
				if (skip) {
					log.info("skip");
					continue;
				}
				log.info("inserting");
				
				//String createTime = newsElement.getChildText("create_time");
				//String updateTime = newsElement.getChildText("update_time");
				Date now = new Date();
				
				String newsType = newsElement.getChildText("newsType");
				String newsTypeId = "0";
				String sql2 = "select * from news_type where name='" + newsType + "'";
				BaseQuery bq2 = new BaseQuery();
				ResultSet rs2 = bq2.executeJDBCQuery(sql2);
				if ( rs2 != null && rs2.next() )
				{
					newsTypeId = rs2.getString("news_type_id");
				}
				else
				{
					rs2.close();
					bq2.closeJDBCSession();
					continue;
				}
				rs2.close();
				bq2.closeJDBCSession();
				
				InsertDAO idao = new InsertDAO();
				
				News newsBean = new News();
				newsBean.setNewsTypeId(new Integer(newsTypeId));
				newsBean.setRelease(new Integer("1"));
				newsBean.setCreateTime(now);
				newsBean.setUpdateTime(now);
				String newsId = idao.execute(News.class, newsBean).toString();
				
				for ( int j = 0; j < captions.size(); j++ )
				{
					Element caption = (Element)(captions.get(j));
					
					String lang = caption.getChildText("langId");
					String title = caption.getChildText("title");
					String description = caption.getChildText("description");
					String origin = caption.getChildText("origin");
					String keyword = caption.getChildText("keyword");
					//String captionCreateTime = caption.getChildText("create_time");
					//String captionUpdateTime = caption.getChildText("update_time");
					String body = caption.getChildText("body");
					String image = caption.getChildText("image");
					
					NewsCaption nc = new NewsCaption();
					nc.setBody(body);
					nc.setCreateTime(now);
					nc.setDescription(description);
					nc.setImage(image);
					nc.setKeyword(keyword);
					nc.setLangId(new Integer(lang));
					nc.setOrigin(origin);
					nc.setTitle(title);
					nc.setUpdateTime(now);
					nc.setNewsId(new Integer(newsId));
					idao.execute(NewsCaption.class, nc);

					if (image != null && !image.equals("")) {
						try {
							catchHttpFile(feedCpUrl + "/images/news/" + image,
									localCpDir + File.separator+"images"+File.separator+"news"+File.separator,
									image, false);
						} catch ( Exception e ) {
							log.error("Newsfeed insert, pull image error: ", e);
							//e.printStackTrace();
						}
					}
				}
			} catch ( Exception e ) {
				log.error("Newsfeed insert, error: ", e);
				//e.printStackTrace();
			}
		}

		log.info("Newsfeed insert, finished");
	}

	// 下载HTML文件，并存放在相应的本地目录下
	private void catchHttpFile(String currentUrl, String thePath, String theFileName,
			boolean overwrite) throws Exception {

		//DataOutputStream ds
		File dir = new File(thePath);
		if (!dir.exists()) // 本地目录不存在
			dir.mkdir();
		File file = new File(thePath, theFileName);
		if (file.exists() && !overwrite) // 本地文件已经存在
			return; // 重复文件不再覆盖
		FileOutputStream fs = new FileOutputStream((thePath + theFileName), false);
		DataOutputStream ds = new DataOutputStream(fs);

		//InputStream in
		URL url = new URL(currentUrl); // 建立与目标文件的连接
		URLConnection uc = url.openConnection();
		if ( ! "".equals(authorization) ) {
			uc.setRequestProperty ("Authorization", authorization);
		}
		InputStream in = uc.getInputStream();
		
		int len;
		final int BUFFER = 2048; // 输入缓冲区长度
		byte buff[] = new byte[BUFFER];
		while ((len = in.read(buff)) != -1) {
			// 读入字节，并写入本地文件
			ds.write(buff, 0, len);
		}
		
		in.close();
		ds.close();
		
	}// end of catchHtmlFile

}
