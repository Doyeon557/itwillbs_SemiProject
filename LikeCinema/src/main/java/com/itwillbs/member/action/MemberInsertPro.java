package com.itwillbs.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		// 폼에 입력한 데이터 -> 서버 request 저장
		// id pass name 변수 파라미터값 가져와서 저장
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String pass=request.getParameter("pass");
		String birth=request.getParameter("birth");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		
		// 웹서버의 날짜시간 가져오기
		Timestamp date=new Timestamp(System.currentTimeMillis());

		// 디비작업 => 1~4단계 자바파일에 메서드 정의
		// package member, 파일이름 MemberDAO 
		// => insertMember()메서드 정의

		// MemberDAO 자바파일 => 객체생성(기억장소 할당)
		// int a=10;
		MemberDAO dao=new MemberDAO();
		System.out.println("MemberDAO 주소 : "+dao);
		// 메서드 호출(id,pass,name,date 전달)

		// id,pass,name,date를 저장할 바구니 만들기 => 자바파일
		// package member, 파일이름 MemberDTO

		// 바구니에 id,pass,name,date 담기
		// MemberDTO => 객체생성(기억장소 할당)
		MemberDTO dto=new MemberDTO();
		System.out.println("MemberDTO 주소 : " + dto);
		// id,pass,name,date 변수 담기=> 변수 private 접근제한
		// dto.id=id;

		dto.setUser_ID(id);
		dto.setUser_Name(name);
		dto.setUser_Pass(pass);
		dto.setUser_Birth(birth);
		dto.setUser_Phone(phone);
		dto.setUser_Email(email);
		dto.setUser_Address(address);
		dto.setUser_Date(date);

		// dao.insertMember(id, pass, name, date);
		// dao.insertMember(MemberDTO 바구니 주소);
		dao.insertMember(dto);

		
		// 리턴 이동할 주소 
		// 이동 ./MemberLoginForm.me
		// ActionForward 객체생성
		// 이동경로, 이동방식 담아서 리턴
		ActionForward forward=new ActionForward();
		forward.setPath("./MemberLoginForm.me");
		forward.setRedirect(true);
		return forward;
	}
	
	

	
}//클래스