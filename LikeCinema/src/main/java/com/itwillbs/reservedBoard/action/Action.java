package com.itwillbs.reservedBoard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// 인터페이스 => 클래스 틀 : 처리작업하는 자바파일의 틀
	// 인터페이스 상속받은 모든 자식클래스는 틀을 강제적으로 적용
	// 강제적으로 메서드오버라이딩 
	// 리턴할때 ActionForward에 이동경로, 이동방식을 담아서 리턴
	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
