package com.mediazone.util;

public class HtmlUtils {
	private static final HtmlCharacterEntityReferences characterEntityReferences = new HtmlCharacterEntityReferences();
	public static String htmlEscape(String input)
	    {
	        if(input == null)
	            return null;
	        StringBuffer escaped = new StringBuffer(input.length() * 2);
	        for(int i = 0; i < input.length(); i++)
	        {
	            char character = input.charAt(i);
	            String reference = characterEntityReferences.convertToReference(character);
	            if(reference != null)
	                escaped.append(reference);
	            else
	                escaped.append(character);
	        }

	        return escaped.toString();
	    }

	public static void main(String[] args) {
		System.out.println(htmlEscape("<a href=\"/portalgetHomePage.do\">首页</a>-><a href=\"/portalgetCategory.do?category_id=18\">影视频道</a>->电影"));

	}

}
