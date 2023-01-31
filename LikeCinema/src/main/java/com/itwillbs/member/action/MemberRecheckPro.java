package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.mysql.cj.Session;

public class MemberRecheckPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("id");
		String pass=request.getParameter("pass");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.userCheck(id, pass);
	
		if(dto!=null){
			
			session.setAttribute("id", id);
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out=response.getWriter();
//			out.println("<script>");
//			out.println("alert('본인인증이 확인되었습니다.');");
//			out.println("</script>");
//			out.close();
			
			ActionForward forward = new ActionForward();
			forward.setPath("./MemberUpdateForm.me");
			forward.setRedirect(true);
			
			return forward;
			
			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('아이디 비밀번호를 확인해주세요');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
				
				return null;
				
			}
		
	}
	

}
