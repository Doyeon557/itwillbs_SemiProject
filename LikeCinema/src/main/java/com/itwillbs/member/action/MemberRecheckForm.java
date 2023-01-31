package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberRecheckForm implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("id");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMember(id);

		request.setAttribute("dto", dto);

		ActionForward forward=new ActionForward();
		forward.setPath("./member/recheckForm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
