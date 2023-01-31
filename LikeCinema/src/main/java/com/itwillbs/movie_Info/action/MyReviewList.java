package com.itwillbs.movie_Info.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.movie_Review.db.Movie_ReviewDAO;
import com.itwillbs.movie_Review.db.Movie_ReviewDTO;

public class MyReviewList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		Movie_ReviewDAO dao = new Movie_ReviewDAO();
		// 한페이지 12개 글목록 가져오기
		int pageSize=4;
		String pageNum=request.getParameter("pageNum");
		
		// 페이지 넘버값이 없으면
		if(pageNum==null) pageNum="1";
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=startRow+pageSize-1;
		// 무비 리스트
		List<Movie_ReviewDTO> myReviewList=dao.getMyReviewList(id, startRow, pageSize);

		int count=dao.countMyReview(id);
		
		// 페이징 처리
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize + (count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount) endPage=pageCount;
		
		request.setAttribute("myReviewList", myReviewList);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);

		ActionForward forward=new ActionForward();
		forward.setPath("./Movie_Review/myReviewList.jsp");
		forward.setRedirect(false);
		
		
		return forward;
		
	}

}
