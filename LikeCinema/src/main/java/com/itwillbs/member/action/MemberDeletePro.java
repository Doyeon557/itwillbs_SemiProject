package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberDeletePro implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//폼에서 입력한 파라미터값(id,pass)을 서버에 request에 저장
		//변수 = request에 저장된 값 가져오기
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("id");
//		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		System.out.println(id);
		System.out.println(pass);
		
		//MemberDAO 객체생성
		MemberDAO dao=new MemberDAO();
		
		// MemberDTO dto =디비작업주소.userCheck(id,pass) 메서드 호출
		MemberDTO dto=dao.userCheck(id, pass);
		//dto null이 아니면  =>"아이디 비밀번호 일치" =>삭제,메인이동
//		    null이면      => "아이디 비밀번호 틀림" => 뒤로이동
		if(dto!=null){
		//다음행이동=> 데이터 있으면 => true =>"아이디 비밀번호 일치"
		// 리턴할형없음 void deleteMember(String id) 메서드 정의
		// deleteMember(id) 메서드 호출
		dao.deleteMember(id, pass);
		// 세션초기화
//		HttpSession session=request.getSession();
		session.invalidate();
		// ./MemberMain.me 이동
		ActionForward forward=new ActionForward();
		forward.setPath("./MemberMain.me");
		forward.setRedirect(true);
		return forward;
		
		}else{
		//데이터 없으면 => false => "아이디 비밀번호 틀림"	
//		 	"입력하신 정보 틀림", 뒤로이동
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.print("<script>");
//			out.print("탈퇴 안내"
//					+ "회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요."
//					+ "사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다"
//					+ "탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.");
			out.print("alert('입력하신 정보 틀림");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			
			return null;
			
		}	
		
	}//메서드
}//클래스
