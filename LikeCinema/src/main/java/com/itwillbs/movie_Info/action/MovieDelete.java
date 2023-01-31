package com.itwillbs.movie_Info.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.movie_Info.db.Movie_InfoDAO;

public class MovieDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String movie_ID = request.getParameter("movie_ID");
		System.out.println(movie_ID);
		
		Movie_InfoDAO dao=new Movie_InfoDAO();
		dao.deleteMovie(movie_ID);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./AdminMovieList.in");
		forward.setRedirect(true);
		
		return forward;

	}

}
