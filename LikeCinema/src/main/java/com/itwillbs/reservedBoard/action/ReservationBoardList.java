package com.itwillbs.reservedBoard.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.reserveBoard.db.ReserveBoardDAO;
import com.itwillbs.reserveBoard.db.ReserveBoardDTO;


public class ReservationBoardList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("ReservationBoardList 예약 내역 불러오기 자바 처리 작업");
		ReserveBoardDAO dao = new ReserveBoardDAO();
		
		// 한 페이지에 보여 줄 예매내역 개수
		int pageSize = 5;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		System.out.println("pageNum: " + pageNum);
		int currentPage = Integer.parseInt(pageNum);
		
		//게시판 글자 행 번호 계산
		int startRow = (currentPage - 1) * pageSize + 1;
		System.out.println("startRow: " + startRow);
		
		int endRow = startRow + pageSize - 1;
		System.out.println("endRow: " + endRow);
		
		//세션값 가져오기
		HttpSession session=request.getSession();
		String id =(String)session.getAttribute("id");
		
		//예매내역 불러오는 ReserveDAO getReserveBoardList()메서드 호출
		List<ReserveBoardDTO> reserveBoardList = dao.getReserveBoardList(startRow, pageSize, id);
		
		//예매내역 넘기기 페이지 번호 계산
		//이 유저의 전체 게시판 글의 개수 가져오기
		
		//id값을 넘겨서 where 조건으로 게시판 글 개수 가져오기
		int count = dao.getReserveCount(id);
		System.out.println("java파일 count" + count);
		
		//한 화면에 보여줄 페이지 개수 설정 1 2 3 4 5
		int pageBlock = 5;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		System.out.println("startPage: " + startPage);
		
		int endPage = startPage + pageBlock - 1;
		
		//글이 존재하는 페이지만 화면에 출력
		//전체 페이지 개수 글 개수 / 페이지 개수
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if(endPage > pageCount) {
			endPage = pageCount;
		};
		
		//예약 내역의 영화ID에 해당하는 영화의 이름과 runTime 가져오기 작업
		System.out.println("영화 이름, 상영시간 가져오는 메서드 호출");
		List<ReserveBoardDTO> reserveList = new ArrayList<ReserveBoardDTO>();
		
		for(int i = 0; i < reserveBoardList.size(); i++) {
			ReserveBoardDTO dtoMovie= dao.getMovieEndTime(reserveBoardList.get(i));
			System.out.println("자바파일 for문 안: " + dtoMovie.getMovieTitle());
			reserveList.add(dtoMovie);
		}
		
		//request로 전달
		request.setAttribute("reserveList", reserveList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		//주소를 바꾸면서 이동하게끔 forward 구현
		ActionForward forward = new ActionForward();
		forward.setPath("./reserveBoard/reservationBoard.jsp");
		forward.setRedirect(false);
		
		System.out.println("예약내역 불러오기 끝");
		return forward;
	}

}
