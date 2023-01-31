package com.itwillbs.qnaBoard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.qnaBoard.db.qnaBoardDAO;
import com.itwillbs.qnaBoard.db.qnaBoardDTO;

public class QnaBoardContent implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		// content.jsp?num=1
//		String num = request.getParameter("Notice_Num");
		int num=Integer.parseInt(request.getParameter("Qna_num"));
		// 객체생성 기억장소 할당=> dao 기억장소 주소 저장
		qnaBoardDAO dao=new qnaBoardDAO();
		// 조회수 증가 readcount 1증가
		// update board set readcount=readcount+1 where num=?
		// 리턴할형없음 updateReadcount(int num)	메서드 정의
		// dao주소를 통해서  updateReadcount(num) 메서드 호출
//		dao.updateReadcount(num);
		// BoardDTO 리턴할형  getBoard(int num)메서드 정의
		// dao주소를 통해서 메서드 호출 => 리턴할형 BoardDTO
		qnaBoardDTO dto=dao.getBoard(num); 
		System.out.println("num="+ num);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./qnaboard/content.jsp");
		forward.setRedirect(false);
		
		return forward;
	
	}

	
}
