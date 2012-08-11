<%@ page import="java.util.*,java.text.*,java.net.URLEncoder,java.io.UnsupportedEncodingException" %>
<%!
String trans(String chi)
{
String result = null;
               byte temp [];
               try
               {
                      temp=chi.getBytes("iso-8859-1");
                      result = new String(temp);
                }
                catch(java.io.UnsupportedEncodingException e)
                {
                        System.out.println (e.toString());
                }
			return result;
}

String trans(Object chi)
{
   return trans(chi.toString());
  }
  
  // Date Format
  SimpleDateFormat normaDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  String getNormalDate(Date dt) {
		return normaDate.format(dt);
	}
	
	SimpleDateFormat USDateWithoutTime = new SimpleDateFormat("MMM dd,yyyy", Locale.US);
	String getUSDateWithoutTime(Date dt) {
		return USDateWithoutTime.format(dt);
	}
	//encode
	String tranEncode(String str){
		String result = null;
		try{
			result = URLEncoder.encode(str,"UTF-8");
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
		return result;
	}	
	
%>