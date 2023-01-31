package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;

public class BoardUpdatePro implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		// request 정보 가져오기
		// num name subject content 파라미터 가져와서 변수에 저장
//		private int Notice_num;
//		private String Manager_Num;         
//		private String Notice_title;      
//		private String Notice_content;      
//		private int Notice_view;   
//		private Timestamp Notice_date;   
//		private String Notice_file;
		int Notice_num=Integer.parseInt(request.getParameter("Notice_num"));
		String Manager_Num=request.getParameter("Manager_Num");
		String Notice_title=request.getParameter("Notice_title");
		String Notice_content=request.getParameter("Notice_content");

		// BoardDTO 객체생성
		BoardDTO dto=new BoardDTO();
		// set메서드호출 num name subject content 저장
		dto.setNotice_num(Notice_num);
		dto.setManager_Num(Manager_Num);
		dto.setNotice_title(Notice_title);
		dto.setNotice_content(Notice_content);

		// 수정작업
		// BoardDAO 객체생성
		BoardDAO dao=new BoardDAO();
		// 리턴할형없음 updateBoard(BoardDTO 변수)메서드 정의 
		// 디비작업 주소를 통해서 updateBoard(BoardDTO 주소값) 호출
		dao.updateBoard(dto);
		// list.jsp 이동
//		response.sendRedirect("list.jsp");
		ActionForward forward=new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		return forward;
	}
}
