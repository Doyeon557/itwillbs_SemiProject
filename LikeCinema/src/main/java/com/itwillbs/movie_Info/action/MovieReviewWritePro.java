package com.itwillbs.movie_Info.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.movie_Review.db.Movie_ReviewDAO;
import com.itwillbs.movie_Review.db.Movie_ReviewDTO;

public class MovieReviewWritePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		String Reserve_Num = request.getParameter("Reserve_Num");
		String movie_ID = request.getParameter("movie_ID");
		String Review_Text=request.getParameter("Review_Text");
		
		int Review_Score=Integer.parseInt(request.getParameter("Review_Score"));

		Movie_ReviewDTO dto=new Movie_ReviewDTO();
		dto.setUser_ID(id);
		dto.setReserve_Num(Reserve_Num);
		dto.setReview_Score(Review_Score);
		dto.setReview_Text(Review_Text);
		dto.setReview_Date(new Timestamp(System.currentTimeMillis()));

		Movie_ReviewDAO dao=new Movie_ReviewDAO();
		dao.insertReview(dto);

		System.out.println(id);
		System.out.println(Reserve_Num);
		System.out.println(Review_Score);
		System.out.println(Review_Text);
		System.out.println(movie_ID);
		// Model2로 만들땐 movie_ID로 화면 이동시키자..^^! 파이팅@
		
		ActionForward forward=new ActionForward();
		forward.setPath("./MovieDetail.in?movie_ID="+movie_ID+"#comment");
		forward.setRedirect(true);

		
		return forward;
	}

}
