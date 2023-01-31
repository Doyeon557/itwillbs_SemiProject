package com.itwillbs.Reboard.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReBoardFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberFrontController doProcess()");
	
		
		
	String RequestURI=request.getRequestURI();// 
	String contextPath=request.getContextPath(); 
	String strpath = RequestURI.substring(contextPath.length()); 
	ActionForward forward = null;
	Action action = null;
	
	if(strpath.equals("/BoardMypage.bo")) {
//		./board/writeForm.jsp 이동주소, false 이동방식
		forward=new ActionForward();
		forward.setPath("./board/mypage.jsp");
		forward.setRedirect(false);
	
	}else if(strpath.equals("/ReboardWrite.re")) {
		forward=new ActionForward();
		forward.setPath("./reboard/qna_board_write.jsp");
		forward.setRedirect(false);	
	
	}else if(strpath.equals("/BoardDelete.re")){
		 forward=new ActionForward();
		 forward.setRedirect(false);
		 forward.setPath("./reboard/qna_board_delete.jsp");
	
	}else if(strpath.equals("/BoardAddAction.re")){
		 action  = new BoardAddAction();
		 try {
			 forward=action.execute(request, response );
		 } catch (Exception e) {
			 e.printStackTrace();
		 }
	
	}else if(strpath.equals("/BoardModify.re")){
		 action = new BoardModifyView();
		 try{
			 forward=action.execute(request, response);
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	
	}else if(strpath.equals("/BoardReplyView.re")){
		 action = new BoardReplyAction();
		 try{
			 forward=action.execute(request, response);
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	}else if(strpath.equals("/BoardModifyAction.re")){
		 action = new BoardModifyAction();
		 try{
			 forward=action.execute(request, response);
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }else if(strpath.equals("/BoardDeleteAction.re")){
		 action = new BoardDeleteAction();
		 try{
			 forward=action.execute(request, response);
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }else if(strpath.equals("/BoardList.re")){
		 action = new BoardListAction(); // ��ü�� ��������. 
		 try{
			 forward = action.execute(request, response); // redirect, forward���� ���� ��ȯ
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }else if(strpath.equals("/BoardDetailAction.re")){
		 action = new BoardDetailAction();
		 try{
			 forward=action.execute(request, response);
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	 }

	 
	 
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
		

}

/**
 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doProcess(request, response);
}
/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doProcess(request, response);
}

}
