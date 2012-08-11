package com.mediazone.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeUtil {
	private static SimpleDateFormat wholeWithoutSecond =
		new SimpleDateFormat("yyyy-MM-dd HH:mm");
	private static SimpleDateFormat monthAndDay =
		new SimpleDateFormat("MM月dd日");	
	public static String getWholeWithoutSecond(Date dt) {
		return wholeWithoutSecond.format(dt);
	}
	
	
	public static SimpleDateFormat normaDateWithTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static String getNormalDateWithTime(Date dt) {
		return normaDateWithTime.format(dt);
	}
	
	public static SimpleDateFormat MANDateWithTime = new SimpleDateFormat("M/dd/yyyy h:mm:ss a", java.util.Locale.US);
	public static String getMANDateWithTime(Date dt) {
		return MANDateWithTime.format(dt);
	}
	
	
	
	public static int getCurrentYear(){
		return Calendar.getInstance().get(Calendar.YEAR);
	}
	
	public static String getMonthDate(Date d){
		return monthAndDay.format(d);
	}
	
	public static void main(String[] args) {
		try{
			Date tt = TimeUtil.MANDateWithTime.parse("9/20/2005 8:36:57 PM");
			System.out.println(tt);
			System.out.println(getNormalDateWithTime(tt));
			System.out.println(getMANDateWithTime(tt));
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
