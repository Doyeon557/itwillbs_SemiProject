package com.itwillbs.movie_Info.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.movie_Review.db.Movie_ReviewDAO;

public class MovieReviewDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String movie_ID = request.getParameter("movie_ID");
		System.out.println(movie_ID);
		int Review_Num=Integer.parseInt(request.getParameter("Review_Num"));
		System.out.println(Review_Num);
		Movie_ReviewDAO dao=new Movie_ReviewDAO();
		dao.deleteReview(Review_Num);

		ActionForward forward=new ActionForward();
		forward.setPath("./MovieDetail.in?movie_ID="+movie_ID+"#comment");
		forward.setRedirect(true);
		
		return forward;
	}

}
