package com.itwillbs.movie_Info.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.movie_Info.db.Movie_InfoDAO;
import com.itwillbs.movie_Info.db.Movie_InfoDTO;

public class AdminMovieList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Movie_InfoDAO dao = new Movie_InfoDAO();
		// 한페이지 12개 글목록 가져오기
		int pageSize=10;
		String pageNum=request.getParameter("pageNum");
		
		// 페이지 넘버값이 없으면
		if(pageNum==null) pageNum="1";
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=startRow+pageSize-1;
		// 무비 리스트
		List<Movie_InfoDTO> movieList=dao.getMovieList(startRow, pageSize);

		int count=dao.getMovieCount();
		
		// 페이징 처리
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize + (count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount) endPage=pageCount;
		
		request.setAttribute("movieList", movieList);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);

		ActionForward forward=new ActionForward();
		forward.setPath("./Movie_Info/adminMovieList.jsp");
		forward.setRedirect(false);
		
		
		return forward;

	}

}
