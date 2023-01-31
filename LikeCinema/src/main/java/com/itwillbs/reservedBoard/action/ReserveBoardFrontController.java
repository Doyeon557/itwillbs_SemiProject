package com.itwillbs.reservedBoard.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReserveBoardFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReserveFrontController doProcess()");

		String requestURI = request.getRequestURI();
		System.out.println("requestURI : "+requestURI);

		String contextPath = request.getContextPath();
		System.out.println("contextPath : " + contextPath);

		String strPath = requestURI.substring(contextPath.length());
		System.out.println("뽑은 주소 strPath:" + strPath);

		ActionForward forward = null;
		Action action = null;
		if(strPath.equals("/ReservationBoard.rb")) { //예약 내역으로 가기
			action = new ReservationBoardList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(strPath.equals("/ReservationInsertPro.rb")) {
			action = new ReserveInsertPro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strPath.equals("/ReservationCancle.rb")) {
			action = new ReserveDelete();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				//true : 주소변경 되면서 이동
				System.out.println("true:"+ forward.getPath() +" sendRedirect() 이동");
				response.sendRedirect(forward.getPath());
			}else {
				//false : 주소변경 안되면서 이동
				System.out.println("false:"+ forward.getPath() +" foward() 이동");
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
