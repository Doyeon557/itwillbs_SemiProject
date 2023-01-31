package com.itwillbs.movie_Info.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.movie_Info.db.Movie_InfoDAO;
import com.itwillbs.movie_Info.db.Movie_InfoDTO;

public class MovieUpdateForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String movie_ID=request.getParameter("movie_ID");

		Movie_InfoDAO dao=new Movie_InfoDAO();
		Movie_InfoDTO dto=dao.getMovieInfo(movie_ID);
		request.setAttribute("dto", dto);
//		request.setAttribute("num", num);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./Movie_Info/movieUpdateForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
