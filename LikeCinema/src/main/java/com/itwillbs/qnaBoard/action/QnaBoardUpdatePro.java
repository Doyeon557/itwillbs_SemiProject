package com.itwillbs.qnaBoard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.qnaBoard.db.qnaBoardDAO;
import com.itwillbs.qnaBoard.db.qnaBoardDTO;


public class QnaBoardUpdatePro implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		
		int num=Integer.parseInt(request.getParameter("num"));
		String id=request.getParameter("id");
		String title=request.getParameter("title");
		String content=request.getParameter("content");

		// BoardDTO 객체생성
		qnaBoardDTO dto=new qnaBoardDTO();
		// set메서드호출 num name subject content 저장
		dto.setQna_num(num);
		dto.setUser_ID(id);
		dto.setQna_title(title);
		dto.setQna_content(content);

		// 수정작업
		// BoardDAO 객체생성
		qnaBoardDAO dao=new qnaBoardDAO();
		// 리턴할형없음 updateBoard(BoardDTO 변수)메서드 정의 
		// 디비작업 주소를 통해서 updateBoard(BoardDTO 주소값) 호출
		dao.updateBoard(dto);
		// list.jsp 이동
//				response.sendRedirect("list.jsp");
		ActionForward forward=new ActionForward();
		forward.setPath("./QnaBoardList.ao");
		forward.setRedirect(true);
		return forward;
	}

}
