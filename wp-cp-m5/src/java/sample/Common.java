package sample;

import java.util.ResourceBundle;
public class Common{
	public static ResourceBundle resource=ResourceBundle.getBundle("com.mediezone.resource.Common");		
	public static String getPageSize(){
		return resource.getString("PAGE_SIZE");
	}
}