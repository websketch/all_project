package com.chinaportal.portal.util;

import java.util.Date;
import java.util.HashMap;

public class VOCache {

    private static HashMap cache = new HashMap();

    private static class CacheElement {
    	Object vo;
    	Date expire; /*null means never expire*/
    	public CacheElement(Object vo, Date expire) {
    		this.vo = vo;
    		this.expire = expire;
    	}
    }
    
    public static boolean containsKey(Object key) {
    	boolean result = false;
		CacheElement element = (CacheElement)cache.get(key);
		if (element != null) {
			if (element.expire == null || new Date().before(element.expire)) {
				result = true;
			} else {
				cache.remove(key);
			}
		}
		return result;
    }
    
    public static Object getVO(Object key) {
		Object result = null;
		CacheElement element = (CacheElement)cache.get(key);
		if (element != null) {
			if (element.expire == null || new Date().before(element.expire)) {
				result = element.vo;
			} else {
				cache.remove(key);
			}
		}
		return result;
	}
    
    public static void putVO(Object key, Object vo, Long life /*Millis, null means never expire*/) {
    	Date expire;
    	if (life == null) {
			expire = null;
		} else {
	    	expire = new Date(System.currentTimeMillis() + life.longValue());
		}
    	cache.remove(key);
		cache.put(key, new CacheElement(vo, expire));
	}
    
    public static void remove(Object key) {
    	cache.remove(key);
    }
    
    public static void clearCache() {
    	cache.clear();
    }
    
}
