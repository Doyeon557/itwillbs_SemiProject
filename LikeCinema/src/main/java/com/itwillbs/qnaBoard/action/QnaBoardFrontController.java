package com.itwillbs.qnaBoard.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnaBoardFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("qnaBoardFrontController doProcess()");
		//가상주소 뽑아오기
		String requestURI=request.getRequestURI();
		System.out.println("requestURI : "+requestURI);
		
		String contextPath=request.getContextPath();
		System.out.println("contextPath : " + contextPath);
		System.out.println("contextPath길이 : " + contextPath.length());
		
		String strpath=requestURI.substring(contextPath.length());
		System.out.println("뽑은 주소 strpath : "+strpath);
		
		//가상주소 비교 => 실제파일 연결s
		ActionForward forward=null;
		Action action=null;
		
		if(strpath.equals("/QnaBoardWriteForm.ao")) {
//			./board/writeForm.jsp 이동주소, false 이동방식
			forward=new ActionForward();
			forward.setPath("./qnaboard/writeForm.jsp");
			forward.setRedirect(false);
			
		} else if(strpath.equals("/QnaBoardWritePro.ao")) {
			//BoardWritePro 객체생성
			action=new QnaBoardWritePro();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(strpath.equals("/QnaBoardList.ao")) {
			// DB내용 가져와서 list.jsp 출력
			// BoardList 객체생성
			action=new QnaBoardList();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(strpath.equals("/QnaBoardContent.ao")) {
			// 디비에 가서 num에 대한 글을 가져와서 content.jsp 이동
			// BoardContent 객체생성
			action=new QnaBoardContent();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(strpath.equals("/QnaBoardUpdateForm.ao")) {
			// 디비에 가서 num에 대한 글을 가져와서 updateForm.jsp 이동
			action=new QnaBoardUpdateForm();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(strpath.equals("/QnaBoardUpdatePro.ao")) {
			// BoardUpdatePro 객체생성
			action=new QnaBoardUpdatePro();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//		}  else if (strpath.equals("/QnaBoardDelete.ao")) { //delete는 pro, form없음
//			
//			action = new QnaBoardDelete();
//			//메서드호출
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
		
		} else if(strpath.equals("/QnaReplyForm.ao")) {
			
			forward=new ActionForward();
			forward.setPath("./qnaboard/replywriteForm.jsp");
			forward.setRedirect(false);
			
		} else if(strpath.equals("/QnaReplyBoardWritePro.ao")) {
			//BoardWritePro 객체생성
			action=new QnaReplyBoardWritePro();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(strpath.equals("/QnaBoardUpdateForm.ao")) {
			//BoardWritePro 객체생성
			action=new QnaBoardUpdateForm();
			//메서드호출
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(strpath.equals("/QnareplyBoardDelete.ao")) {
			action=new QnareplyBoardDelete();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	
		}//
		
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
