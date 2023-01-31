package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;

public class BoardDelete implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num=Integer.parseInt(request.getParameter("num"));
		//BoardDAO 객체생성
		BoardDAO dao=new BoardDAO();
		// 리턴할형없음 deleteBoard(int num)메서드 정의
		// 디비작업 주소를 통해서 deleteBoard(num) 호출
		dao.deleteBoard(num);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		return forward;
	}
}
