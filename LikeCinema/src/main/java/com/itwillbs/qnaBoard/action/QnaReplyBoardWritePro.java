package com.itwillbs.qnaBoard.action;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.qnaBoard.db.qnaBoardDAO;
import com.itwillbs.qnaBoard.db.qnaBoardDTO;

public class QnaReplyBoardWritePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		request.setCharacterEncoding("utf-8");
		String num	= request.getParameter("Qna_num");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		//-----------------------------------------------------
		//1.9일 수정
//		int ref = Integer.parseInt(request.getParameter("ref"));
//		int step = Integer.parseInt(request.getParameter("step"));
//		int level = Integer.parseInt(request.getParameter("level"));
		
		//writepro에서 inputtype
				
		qnaBoardDTO dto = new qnaBoardDTO();

//		dto.setManager_Num(id);
		dto.setQna_num(Integer.parseInt(num));
		dto.setUser_ID(id);
		dto.setQna_title(title);
		dto.setQna_content(content);
		dto.setQna_date(new Date(System.currentTimeMillis()));
		//-------------------------------------------------------
		//1.9일 수정
//		dto.setQna_ref(ref);
//		dto.setQna_re_step(step);
//		dto.setQna_re_level(level);
		
//		dto.setQna_date(new Date(System.currentTimeMillis()));
		qnaBoardDAO dao = new qnaBoardDAO();
		
		// 리턴할형 없음 insertBoard(BoardDTO 주소값 저장하는 변수) 메서드 정의
		// BoardDAO주소.insertBoard(BoardDTO 주소) 메서드 호출
		
//		dao.insertBoard(dto);
		dao.replyBoard(dto);
		
		
		//글목록
//		response.sendRedirect("list.jsp");
		ActionForward forward = new ActionForward();
		forward.setPath("./QnaBoardList.ao");
		forward.setRedirect(true); //주소값변경 
		
		return forward;
		
	}

	
}
