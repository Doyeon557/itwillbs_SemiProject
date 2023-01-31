package com.itwillbs.qnaBoard.action;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.qnaBoard.db.qnaBoardDAO;
import com.itwillbs.qnaBoard.db.qnaBoardDTO;

public class QnaBoardWritePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//한글처리
		request.setCharacterEncoding("utf-8");
		
		//값 저장하기
		String name=request.getParameter("id");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
//		String file=request.getParameter("Notice_File");
		//---------------------------------------------------------------
		//1.8일수정    writeform에서 hidden주석치면 안되서 같이 주석 침.. 
//		int ref = Integer.parseInt(request.getParameter("ref"));
//		int step = Integer.parseInt(request.getParameter("step"));
//		int level = Integer.parseInt(request.getParameter("level"));
		
		qnaBoardDTO dto = new qnaBoardDTO();
	
		dto.setUser_ID(name);
		dto.setQna_title(title);
		dto.setQna_content(content);
		dto.setQna_date(new Date(System.currentTimeMillis()));
//		dto.setQna_date(new Timestamp(System.currentTimeMillis()));
		
		qnaBoardDAO dao = new qnaBoardDAO();
		dao.insertBoard(dto);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./QnaBoardList.ao");
		forward.setRedirect(true);
		return forward;
	}

}
