package com.itwillbs.board.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;

public class BoardWritePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 글쓰기 폼에서 입력한 내용을 서버에 전달하면 
				// 내장객체 request에 저장
				// request 한글처리
				request.setCharacterEncoding("utf-8");
				// request name,subject,content 파라미터 가져와서 변수에 저장
				String Manager_Num=request.getParameter("Manager_Num");
				String Notice_title=request.getParameter("Notice_title");
				String Notice_content=request.getParameter("Notice_content");
				
//				private int Notice_num;
//				private String Manager_Num;         
//				private String Notice_title;      
//				private String Notice_content;      
//				private int Notice_view;   
//				private Timestamp Notice_date;   
//				private String Notice_file;
				
				// 패키지board 파일이름BoardDTO 자바 클래스 만들기
				// 멤버변수 num,name,subject,content,readcount,date
				// set() get() 메서드 정의

				// BoardDTO객체생성(기억장소 할당)
				BoardDTO dto=new BoardDTO();
				// set메서드 호출 파라미터값 저장
				dto.setManager_Num(Manager_Num);
				dto.setNotice_title(Notice_title);
				dto.setNotice_content(Notice_content);
				// 현시스템 날짜시간
				dto.setNotice_date(new Date(System.currentTimeMillis()));
				//조회수 0 설정
				dto.setNotice_view(0);
				// 글번호 num => BoardDAO에서 작업


				// 패키지board 파일이름BoardDAO 자바 클래스 만들기
				// BoardDAO 객체생성(기억장소 할당)
				BoardDAO dao=new BoardDAO();
				// 리턴할형 없음 insertBoard(BoardDTO 주소값 저장하는 변수) 메서드 정의 
				// BoardDAO주소.insertBoard(BoardDTO 주소)메서드 호출
				dao.insertBoard(dto);
				//글목록 이동
//				response.sendRedirect("list.jsp");
				ActionForward forward=new ActionForward();
				forward.setPath("./BoardList.bo");
				forward.setRedirect(true);
				return forward;
	}

}
