package com.itwillbs.member.action;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 처리담당자(서블릿을 상속)
public class MemberFrontController extends HttpServlet{

//서블릿 파일이 동작할때 => 자동으로 메서드 호출 service()
	//                  doGet() doPost() 
	// 웹서버에서 서블릿이 동작할대 자동으로 메서드 호출되면
	// 메서드 오버라이딩해서 재정의
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController doProcess()");
		// 주소매핑:(가상주소)-->실제페이지 연결
		
		// 가상주소 뽑아오기
// URL => http://localhost:8080/Model2/insertForm.me
	String requestURL=request.getRequestURL().toString();
	System.out.println("requestURL : "+requestURL);
// URI => 		               /Model2/insertForm.me
	String requestURI=request.getRequestURI();
	System.out.println("requestURI : "+requestURI);
// 프로젝트 명(Context명) => 	   /Model2
	String contextPath=request.getContextPath();
	System.out.println("contextPath : " + contextPath);
	System.out.println("contextPath길이 : " + contextPath.length());
// 뽑은 가상주소          =>            /insertForm.me
// 시작위치(contextPath길이) 부터 끝까지 문자열을 잘라서 가져오기
	String strpath=requestURI.substring(contextPath.length());
	System.out.println("뽑은 주소 strpath : "+strpath);
		
	
	//이동경로,이동방식을 저장하는 ActionForward파일 선언
	ActionForward forward=null;
	// 부모 인터페이스 틀 선언
	Action action=null;
	
	
	
		// 뽑은 가상주소 비교 -> 실제페이지 연결
	if(strpath.equals("/MemberMain.me")) {
		
		forward=new ActionForward();
		forward.setPath("./member/main.jsp");
		forward.setRedirect(false);
		
	}else if(strpath.equals("/MemberLoginForm.me")) {
		
		forward=new ActionForward();
		forward.setPath("./member/loginForm.jsp");
		forward.setRedirect(false);
		
	
	}else if(strpath.equals("/MemberLoginPro.me")) {

		action=new MemberLoginPro();
		try {
			// 메서드호출
			forward=action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}else if(strpath.equals("/MemberInsertForm.me")) {
		
		forward=new ActionForward();
		forward.setPath("./member/insertForm.jsp");
		forward.setRedirect(false);
		
	}else if(strpath.equals("/MemberInsertPro.me")) {
		
		action=new MemberInsertPro();
		try {
			// 메서드호출
			forward=action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}else if(strpath.equals("/MemberLogout.me")) {
	// MemberLogout 자바파일 만들기 상속 인터페이스 Action
		// 메서드 오버라이딩 - 세션값 초기화 , 이동정보저장 리턴
		//부모인터페이스 = 자식클래스 객체생성
		action=new MemberLogout();
		// 메서드 호출
		try {
			forward=action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} else if(strpath.equals("/MemberRecheckForm.me")) {
		
		forward = new ActionForward();
		forward.setPath("./member/recheckForm.jsp"); // 주소가 바뀌지 않은 채로 이동해야 함
		forward.setRedirect(false);
		
	} else if(strpath.equals("/MemberRecheckPro.me")) {

		// 부모인터페이스 = 자식클래스 객체 생성
		action = new MemberRecheckPro();
		// 메서드 호출
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} else if(strpath.equals("/MemberUpdateForm.me")) {
		
		// 부모인터페이스 = 자식클래스 객체 생성
		action = new MemberUpdateForm();
		// 메서드 호출
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} else if(strpath.equals("/MemberUpdatePro.me")) {

		// 부모인터페이스 = 자식클래스 객체 생성
		action = new MemberUpdatePro();
		// 메서드 호출
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} else if(strpath.equals("/MemberIdCheck.me")) {
		action = new MemberIdCheck();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} else if(strpath.equals("/MemberDeletePro.me")) {
		action = new MemberDeletePro();
		try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} 
	
	// 이동 (경로정보, 이동방식 담아서 오면 이동)
	if(forward !=null) {
		if(forward.isRedirect()) {
			// true - sendRedirect(),
			System.out.println("true:"+ forward.getPath() +"sendRedirect() 이동");
			response.sendRedirect(forward.getPath());
		}else {
			// false - foward()  
			System.out.println("false:"+ forward.getPath() +"foward() 이동");
			RequestDispatcher dis
			=request.getRequestDispatcher(forward.getPath());
			dis.forward(request, response);	
		}
	}
	
	

	
	
	}//doProcess() 메서드
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController doGet()");
//		doProcess()호출
		doProcess(request, response);
	}//

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController doPost()");
//		doProcess()호출
		doProcess(request, response);
	}//
	
}//
