package com.itwillbs.reservedBoard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.reserve.db.ReserveDAO;
import com.itwillbs.reserveBoard.db.ReserveBoardDAO;

public class ReserveDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String reserveNum = request.getParameter("ReserveNum");
		
		ReserveBoardDAO dao = new ReserveBoardDAO();
		dao.deleteReserve(reserveNum);
		
		System.out.println("삭제 성공");
		ActionForward forward = new ActionForward();
		forward.setPath("./ReservationBoard.rb");
		forward.setRedirect(true);
		return forward;
	}

}
