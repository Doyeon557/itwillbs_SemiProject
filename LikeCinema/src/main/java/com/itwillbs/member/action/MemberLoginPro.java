package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberLoginPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		// 폼에서 입력한 id, pass => 서버 request에 저장 
		// request에 저장된 id,pass 파라미터 => 변수에 저장
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");

		// MemberDAO 객체생성
		MemberDAO dao=new MemberDAO();
		// 리턴할형MemberDTO userCheck(String id,String pass)
		// 메서드 정의
		System.out.println("디비작업하는 주소 : " + dao);
		// MemberDTO dto =디비작업주소.userCheck(id,pass) 메서드 호출
		MemberDTO dto=dao.userCheck(id, pass);
		System.out.println("데이터 저장된 리턴받은 주소 : " + dto);

		//dto null이 아니면  =>"아이디 비밀번호 일치" =>세션값 생성,메인이동
//		    null이면      => "아이디 비밀번호 틀림" => 뒤로이동
		if(dto!=null){
			//데이터 있으면 => true =>"아이디 비밀번호 일치"
//			out.println("아이디 비밀번호 일치");
			// 페이지 상관없이 값이 유지 => 세션값 부여(저장)
			// session내장객체생성
			HttpSession session=request.getSession();
			session.setAttribute("id", id);
			// 주소가 변경되면서 이동 ./MemberMain.me 이동
			// ActionForward 객체생성
			// 이동경로, 이동방식 true 담아서  리턴
			ActionForward forward=new ActionForward();
			forward.setPath("./MemberMain.me");
			forward.setRedirect(true);
			return forward;
		}else{
			//데이터 없으면 => false => "아이디 비밀번호 틀림"
//			out.println("아이디 비밀번호 틀림");
			// "입력하신 정보 틀림", 뒤로이동
			// response에 응답할 파일형식 지정
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.print("<script>");
			out.print("alert('아이디 비밀번호를 확인해주세요');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
	}
	
}