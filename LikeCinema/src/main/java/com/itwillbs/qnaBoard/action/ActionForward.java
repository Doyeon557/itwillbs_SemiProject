package com.itwillbs.qnaBoard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActionForward {
	// 이동 (경로정보, 이동방식 담아서 오면 이동)
	private String path; // 이동경로
	private boolean isRedirect; // 이동방식
	// true - sendRedirect(),
	// false - foward()  
	
	//alt shift s -> r
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
}
