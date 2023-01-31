package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		
		// 폼에서 입력한 파라미터 값(id, pass, name)을 서버에 request에 저장
		// 변수 = request에 저장된 값 가져오기
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String pass=request.getParameter("pass");
		String newPass = request.getParameter("pass2");
		String birth=request.getParameter("birth");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String address2=request.getParameter("address2");
		String address=request.getParameter("address") + " " + request.getParameter("address2");
		
		//MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// MemberDTO dto = db작업주소.userCheck(id,pass) 메서드 호출
		MemberDTO dto = dao.userCheck(id,pass);

		// dto null이 아니면 => "아이디 비밀번호 일치" => 수정, 메인이동
		// dto가 null이면 => "아이디 비밀번호 틀림" => 뒤로 이동

		if(dto!=null) { // dto null이 아니면 => "아이디 비밀번호 일치" => 수정, 메인이동
			MemberDTO dtoUpdate = new MemberDTO();
			dtoUpdate.setUser_Name(name);
			dtoUpdate.setUser_Pass(newPass);
			dtoUpdate.setUser_Email(email);
			dtoUpdate.setUser_Phone(phone);
			dtoUpdate.setUser_Address(address);
			dtoUpdate.setUser_ID(id);
			dao.updateMember(dtoUpdate);
			
	 	 	// ./MemberMain.me로 이동
		 	ActionForward forward = new ActionForward();
		 	forward.setPath("./BoardMypage.bo");
		 	forward.setRedirect(true);
		 	return forward;
				

		} else { 
			//데이터 없으면 => false => "아이디 비밀번호 틀림"
//					out.println("아이디 비밀번호 틀림");
			// "입력하신 정보 틀림", 뒤로이동
			// response에 응답할 파일형식 지정
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.print("<script>");
			out.print("alert('기존 비밀번호를 다시 확인해 주세요');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
			
		}
		
	}
}
