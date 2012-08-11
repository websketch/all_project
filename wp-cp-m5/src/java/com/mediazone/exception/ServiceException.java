/*
 * Created on 2005-9-13
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.mediazone.exception;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ServiceException extends ApplicationException{
	
	public ServiceException(String errorCode) {
		super(errorCode);
	}

	public ServiceException(String errorCode, Throwable cause) {
		super(errorCode, cause);
	}

	public ServiceException(String errorCode, Object param) {
		super(errorCode, param);
	}

	public ServiceException(String errorCode, Object param, Throwable cause) {
		super(errorCode, param, cause);
	}

}
