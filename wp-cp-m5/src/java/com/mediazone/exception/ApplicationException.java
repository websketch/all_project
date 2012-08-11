/*
 * Created on 2005-9-13
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.mediazone.exception;

import java.io.PrintStream;
import java.io.PrintWriter;

/**
 * @author Bily
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ApplicationException extends Exception {
	
	protected String errorCode;
	
	protected Object param;	
	
	private Throwable exception;

	protected ApplicationException() {
		super();
	}

	protected ApplicationException(Throwable cause) {
		this.exception = cause;
	}

	/**
	 * 
	 * @param errorCode
	 */
	public ApplicationException(String errorCode) {
		this.errorCode = errorCode;
	}

	/**
	 * 
	 * @param errorCode
	 * @param cause
	 */
	public ApplicationException(String errorCode, Throwable cause) {
		this(cause);
		this.errorCode = errorCode;
	}

	public ApplicationException(String errorCode, String message) {
		super(message);
		this.errorCode = errorCode;
	}
	
	
	/**
	 * 
	 * @param errorCode
	 * @param param
	 */
	public ApplicationException(String errorCode, Object param) {
		this.errorCode = errorCode;
		this.param = param;
	}

	/**
	 * 
	 * @param errorCode
	 * @param param
	 * @param cause
	 */
	public ApplicationException(String errorCode, Object param, Throwable cause) {
		this(cause);
		this.errorCode = errorCode;
		this.param = param;
	}

	public String getErrorCode() {
		return this.errorCode;
	}

	public Object getParam() {
		return param;
	}

	
	public Throwable getCause(){
		return getRootCause();
	}

	public Throwable getRootCause() {
		if (exception instanceof ApplicationException) {
			return ((ApplicationException) exception).getRootCause();
		}
		return exception == null ? this : exception;
	}

	public String getMessage() {
		StringBuffer buf = new StringBuffer(200);
		// Get this exception's message.
		buf.append(super.getMessage());
		if (exception != null) {
			buf.append(exception.getMessage());
		}
		// Return the completed message.
		return buf.toString();
	}

	public void printStackTrace() {
		super.printStackTrace();
		if (exception != null) {
			exception.printStackTrace();
		}
	}

	public void printStackTrace(PrintWriter w) {
		// Print the stack trace for this exception.
		super.printStackTrace(w);
		if (exception != null) {
			exception.printStackTrace(w);
		}
	}

	public void printStackTrace(PrintStream s) {
		// Print the stack trace for this exception.
		super.printStackTrace(s);
		if (exception != null) {
			exception.printStackTrace(s);
		}
	}

}
