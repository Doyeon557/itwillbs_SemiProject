package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberIdCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		MemberDAO dao=new MemberDAO();
		MemberDTO dto=dao.getMember(id);
		String result="";
		if(dto!=null) {
			//아이디 있음, 아이디 중복 
			result="이미 사용중인 아이디입니다.";
		}else {
			//아이디 없음, 아이디 사용가능
			result="사용가능한 아이디입니다.";
		}
		//웹으로 출력 => ajax 되돌아감
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print(result);
		out.close();
		
		//forward = null 이동 안함
		return null;
	}

}
