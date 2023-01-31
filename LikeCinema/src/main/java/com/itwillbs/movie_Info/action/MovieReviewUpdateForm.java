package com.itwillbs.movie_Info.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.movie_Info.db.Movie_InfoDAO;
import com.itwillbs.movie_Info.db.Movie_InfoDTO;
import com.itwillbs.movie_Review.db.Movie_ReviewDAO;
import com.itwillbs.movie_Review.db.Movie_ReviewDTO;

public class MovieReviewUpdateForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String movie_ID=request.getParameter("movie_ID");
		int Review_Num=Integer.parseInt(request.getParameter("Review_Num"));

		Movie_InfoDAO dao=new Movie_InfoDAO();
		Movie_InfoDTO dto=dao.getMovieInfo(movie_ID);

		Movie_ReviewDAO rvdao=new Movie_ReviewDAO();
		Movie_ReviewDTO rvdto=rvdao.getReview(Review_Num);

		request.setAttribute("dto", dto);
		request.setAttribute("rvdto", rvdto);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./Movie_Review/updateForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
