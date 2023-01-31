package com.itwillbs.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿(처리담당자)
public class BoardFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardFrontController doProcess()");
		//가상주소 뽑아오기
		String requestURI=request.getRequestURI();
		System.out.println("requestURI : "+requestURI);
		
		String contextPath=request.getContextPath();
		System.out.println("contextPath : " + contextPath);
		System.out.println("contextPath길이 : " + contextPath.length());
		
		String strpath=requestURI.substring(contextPath.length());
		System.out.println("뽑은 주소 strpath : "+strpath);
		
		//가상주소 비교 => 실제파일 연결
		ActionForward forward=null;
		Action action=null;
		if(strpath.equals("/BoardMypage.bo")) {
//			./board/writeForm.jsp 이동주소, false 이동방식
			forward=new ActionForward();
			forward.setPath("./board/mypage.jsp");
			forward.setRedirect(false);
		
		}else if(strpath.equals("/BoardList.bo")) {
			//BoardWritePro 객체생성
			action=new BoardList();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}else if(strpath.equals("/BoardWriteForm.bo")) {
//			./board/writeForm.jsp 이동주소, false 이동방식
			forward=new ActionForward();
			forward.setPath("./board/writeForm.jsp");
			forward.setRedirect(false);
		
		}else if(strpath.equals("/BoardWritePro.bo")) {
			//BoardWritePro 객체생성
			action=new BoardWritePro();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/BoardList.bo")) {
			// DB내용 가져와서 list.jsp 출력
			// BoardList 객체생성
			action=new BoardList();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/BoardContent.bo")) {
			// 디비에 가서 num에 대한 글을 가져와서 content.jsp 이동
			// BoardContent 객체생성
			action=new BoardContent();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/BoardUpdateForm.bo")) {
			// 디비에 가서 num에 대한 글을 가져와서 updateForm.jsp 이동
			// BoardUpdateForm 객체생성
			action=new BoardUpdateForm();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/BoardUpdatePro.bo")) {
			// BoardUpdatePro 객체생성
			action=new BoardUpdatePro();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/BoardDelete.bo")) {
			// BoardDelete 객체생성
			action=new BoardDelete();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/BoardWrite.re")){
			 forward=new ActionForward();
			 forward.setRedirect(false);
			 forward.setPath("./reboard/qna_board_write.jsp");
		}	 
		
		//이동
		if(forward!=null) {
			if(forward.isRedirect()) {
				//true : 주소변경 되면서 이동
				System.out.println("true:"+ forward.getPath() +"sendRedirect() 이동");
				response.sendRedirect(forward.getPath());
			}else {
				//false : 주소변경 안되면서 이동
				System.out.println("false:"+ forward.getPath() +"foward() 이동");
				RequestDispatcher dis
				=request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);	
			}
		}
		
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
