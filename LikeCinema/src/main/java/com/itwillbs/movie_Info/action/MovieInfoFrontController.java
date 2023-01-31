package com.itwillbs.movie_Info.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieInfoFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String strpath=requestURI.substring(contextPath.length());
		
		ActionForward forward=null;
		Action action=null;
		
		if(strpath.equals("/MovieDetail.in")) {
			action=new MovieDetail();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(strpath.equals("/MovieReviewWritePro.in")) {
			action=new MovieReviewWritePro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(strpath.equals("/MovieReviewUpdateForm.in")) {
			action=new MovieReviewUpdateForm();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(strpath.equals("/MovieReviewUpdatePro.in")) {
			action=new MovieReviewUpdatePro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/MovieReviewDelete.in")) {
			action=new MovieReviewDelete();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/MovieList.in")) {
			action=new MovieList();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/MyReviewList.in")) {
			action=new MyReviewList();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/AdminMovieList.in")) {
			action=new AdminMovieList();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/MovieInsertForm.in")) {
			forward=new ActionForward();
			forward.setPath("./Movie_Info/movieInsertForm.jsp");
			forward.setRedirect(false);
		}else if(strpath.equals("/MovieInsertPro.in")) {
			action=new MovieInsertPro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/MovieUpdateForm.in")) {
			action=new MovieUpdateForm();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/MovieUpdatePro.in")) {
			action=new MovieUpdatePro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(strpath.equals("/MovieDelete.in")) {
			action=new MovieDelete();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				// true : 주소 변경되면서 이동
				System.out.println("true: " + forward.getPath() + " sendRedirect 이동");
				response.sendRedirect(forward.getPath());
			}else {
				// false : 주소 변경 안되면서 이동
				System.out.println("false: " + forward.getPath() + " forward 이동");
				RequestDispatcher dis=request.getRequestDispatcher(forward.getPath());
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
