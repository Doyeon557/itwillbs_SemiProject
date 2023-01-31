package com.itwillbs.qnaBoard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.qnaBoard.db.qnaBoardDAO;
import com.itwillbs.qnaBoard.db.qnaBoardDTO;


public class QnaBoardUpdateForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//updateForm.jsp?num=1
		int num=Integer.parseInt(request.getParameter("Qna_num"));
		//BoardDAO 객체생성 기억장소 할당=> dao 기억장소 주소 저장
		qnaBoardDAO dao=new qnaBoardDAO();
		//dao주소를 통해서 getBoard(num)메서드 호출 => 리턴할형 BoardDTO
		qnaBoardDTO dto=dao.getBoard(num);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./qnaboard/updateForm.jsp");
		forward.setRedirect(false);
		return forward;
	
	}
	
	
}
