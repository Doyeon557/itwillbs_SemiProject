package com.itwillbs.movie_Info.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.movie_Info.db.Movie_InfoDAO;
import com.itwillbs.movie_Info.db.Movie_InfoDTO;
import com.itwillbs.movie_Review.db.Movie_ReviewDAO;
import com.itwillbs.movie_Review.db.Movie_ReviewDTO;
import com.itwillbs.reserve.db.ReserveDAO;
import com.itwillbs.reserve.db.ReserveDTO;

public class MovieDetail implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 영화 상세페이지
		// 포스터를 클릭할때 영화아이디값이 세션에 저장되어야 하나?
		String movie_ID=request.getParameter("movie_ID");
		
		//ok
		Movie_InfoDAO dao=new Movie_InfoDAO();
		Movie_InfoDTO dto=dao.getMovieInfo(movie_ID);
		
		//ok
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");

		//ok
		ReserveDAO rsdao=new ReserveDAO(); 
		ReserveDTO rsdto=rsdao.getReserveInfo(movie_ID, id);
//		String Reserve_Num=rsdto.getReserveNum();
		
		// 리뷰체크
		Movie_ReviewDAO rvdao=new Movie_ReviewDAO();
		Movie_ReviewDTO rvdto2=rvdao.reviewCheck(movie_ID, id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("rsdto", rsdto);
		request.setAttribute("rvdto2", rvdto2);
		
		// 리뷰 리스트
		int pageSize=10;

		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) pageNum="1";

		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=startRow+pageSize-1;
		
		List<Movie_ReviewDTO> reviewList=rvdao.getReviewList(movie_ID, startRow, pageSize);
		int count=rvdao.getReviewCount();
		
		// 페이징 처리
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize + (count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount) endPage=pageCount;
		
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		
		
		ActionForward forward=new ActionForward();
		forward.setPath("./Movie_Info/movieDetail.jsp?movie_ID="+movie_ID);
		forward.setRedirect(false);
		
		
		return forward;
	}

	
	
}
