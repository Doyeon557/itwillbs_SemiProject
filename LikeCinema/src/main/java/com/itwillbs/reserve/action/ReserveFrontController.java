package com.itwillbs.reserve.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ReserveFrontController extends HttpServlet{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReserveFrontController doProcess()");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String strPath = requestURI.substring(contextPath.length());
		System.out.println("뽑은 주소 strPath : "+strPath);
		
		com.itwillbs.reserve.action.ActionForward forward = null;
		Action action = null;
		if(strPath.equals("/Reservation.re")) {
			forward = new ActionForward();
			forward.setPath("./reserve/new.jsp");
			forward.setRedirect(false);
			
		}else if(strPath.equals("/ReservationPay.re")) {
			
			forward = new ActionForward();
			forward.setPath("./reserve/ReservationPay.jsp");
			forward.setRedirect(false);
			
		}else if(strPath.equals("/ReservationComplete.re")) {
			
			forward = new ActionForward();
			forward.setPath("./reserve/completeReservation.jsp");
			forward.setRedirect(false);
			
		}else if(strPath.equals("/ReserveMovieInfo.re")) {
			action = new getMovieInfo();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strPath.equals("/ReserveLocationList.re")) {
			action = new ReserveLocationList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strPath.equals("/ReserveDateList.re")) {
			action = new ReserveDateList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strPath.equals("/ReserveTimeList.re")) {
			action = new ReserveTimeList();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(strPath.equals("/Reserve.re")) {
			
			forward = new ActionForward();
			forward.setPath("./project/Reserve.jsp");
			forward.setRedirect(false);
			
		} else if(strPath.equals("/SelectSeat.re")) {
			
			forward = new ActionForward();
			forward.setPath("./selectSeat/selectSeat.jsp");
			forward.setRedirect(false);
			
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
