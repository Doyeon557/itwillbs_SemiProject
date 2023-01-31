package com.itwillbs.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con=null;
	PreparedStatement pstmt2 =null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	
	// 디비연결하는 메서드 1,2단계
		public Connection getConnection() throws Exception {
			// 예외처리를 함수 호출하는 곳으로 전달
			
//			//1단계 JDBC 프로그램 가져오기
//			Class.forName("com.mysql.cj.jdbc.Driver");
//			//2단계 JDBC 프로그램 이용해서 데이터베이스 연결
//			String dbUrl="jdbc:mysql://localhost:3306/jspdb2?serverTimezone=Asia/Seoul";
//			String dbUser="root";
//			String dbPass="1234";
//			con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//			return con;
			
			// Connection Pool : 서버에서 드라이버로더, 디비연결을
			//   미리하고 그 디비연결 자원의 이름을 부여해서            
			//   DAO에서 자원의 이름을 호출해서 사용
			// 1. 속도 향상
			// 2. 디비연결정보 수정을 최소화(한 번 만 수정)
			
			// 설치 : 웹서버에 DBCP(DataBase Connection Pool) 프로그램 설치
			// META-INF 폴더에 context.xml 파일을 만들고
			// 디비연결정보(1,2단계)를 저장 => 자원 이름으로 정의
			// DAO에서 자원 이름을 호출해서 사용
			
			// Context 객체 생성
			// import javax.naming.Context;
			// import javax.naming.InitialContext;
			Context init=new InitialContext();
			// 자원이름호출("자원위치/자원이름") => DataSource 에 저장
			// import javax.sql.DataSource;
			DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
			// DataSource => con 에 저장
			con=ds.getConnection();
			return con;
			
		}
		
		public void close() {
			//마무리=> 내장객체 => 기억장소 해제
			// con pstmt pstmt2 rs => 기억장소 해제
			if(rs!=null) try{rs.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try{pstmt2.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
		
	
// 리턴할형 없음 insertBoard(BoardDTO 주소값 저장하는 변수) 메서드 정의
		public void insertMember(MemberDTO dto) {
			// 1~4단계
			System.out.println("MemberDAO insertMember()");
			System.out.println("전달받은 바구니(dto)의 주소 : "+dto);
			System.out.println("전달받은 바구니안에 있는 Nam 값 : " + dto.getUser_Name());
			System.out.println("전달받은 바구니안에 있는 Id 값 : " + dto.getUser_ID());
			System.out.println("전달받은 바구니안에 있는 Pass 값 : " + dto.getUser_Pass());
			System.out.println("전달받은 바구니안에 있는 Phone 값 : " + dto.getUser_Phone());
			System.out.println("전달받은 바구니안에 있는 Email 값 : " + dto.getUser_Email());
			
			try {
				// 예외(에러)가 발생할 가능성 높은 코드(명령)
				// 1, 2 단계 메서드 호출
				con = getConnection();

				// 3단계 sql구문을 만들고 실행할 준비 insert
				String sql="insert into User_Info values(?,?,?,?,?,?,?,?)";
				pstmt =con.prepareStatement(sql);
				// ? 표 값을 넣어서 sql구문 완성
				pstmt.setString(1, dto.getUser_ID());
				pstmt.setString(2, dto.getUser_Name());
				pstmt.setString(3, dto.getUser_Pass());
				pstmt.setString(4, dto.getUser_Birth());
				pstmt.setString(5, dto.getUser_Phone());
				pstmt.setString(6, dto.getUser_Email());
				pstmt.setString(7, dto.getUser_Address());
				pstmt.setTimestamp(8, dto.getUser_Date());

				// 4단계 : sql구문 실행 (insert)
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				// 예외가 발생하면 처리하는 곳=> 에러메시지 출력
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리 작업 
				// => Connection, PreparedStatement
				// => 기억장소 해제
			}
			return;
		}//insertMember() 메서드
		
		// 리턴할형MemberDTO userCheck(String id,String pass)
		// 메서드 정의
		public MemberDTO userCheck(String id,String pass) {
			// MemberDTO 변수 선언 초기값 null
			MemberDTO dto=null;
			try {
				//1,2 디비연결
				con = getConnection();
				// 3단계 sql구문을 만들고 실행할 준비 select
				//String sql="select * from 테이블이름 where id=? and pass=?";
				String sql="select * from User_Info where User_ID=? and User_Pass=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				//4단계 : sql구문 실행 , 실행결과 저장(select)
				//ResultSet : sql구문 실행 결과를 저장하는 자바 내장객체
				rs=pstmt.executeQuery();
				//5단계 : 결과를 출력, 배열저장 (select)
				//if 다음행이동=> 데이터 있으면 => true =>"아이디 비밀번호 일치"
				//else        데이터 없으면 => false => "아이디 비밀번호 틀림"
				if(rs.next()){
					//데이터 있으면 => true =>"아이디 비밀번호 일치"
//					out.println("아이디 비밀번호 일치");
					// id pass name date => 바구니 MemberDTO 저장
					// MemberDTO 객체생성
					// set메서드 호출 값(디비 가져온값)을 저장
					dto = new MemberDTO();
					dto.setUser_ID(rs.getString("User_ID"));
					dto.setUser_Name(rs.getString("User_Name"));
					dto.setUser_Pass(rs.getString("User_Pass"));
					dto.setUser_Birth(rs.getString("User_Birth"));
					dto.setUser_Phone(rs.getString("User_Phone"));
					dto.setUser_Email(rs.getString("User_Email"));
					dto.setUser_Address(rs.getString("User_Address"));
					dto.setUser_Date(rs.getTimestamp("User_Date"));
					
				}else{
					//데이터 없으면 => false => "아이디 비밀번호 틀림"
//					out.println("아이디 비밀번호 틀림");
					// "입력하신 정보 틀림", 뒤로이동
//						초기값 null
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//마무리
			}
			System.out.println("회원정보가 저장된 리턴할 주소usercheck : " + dto);
			return dto;
		}// userCheck()
		
		// 리턴할형MemberDTO getMember(String id)
		// 메서드 정의
		public MemberDTO getMember(String id) {
			// MemberDTO 변수 선언 초기값 null
			MemberDTO dto=null;
			try {
				//1,2 디비연결
				con = getConnection();
				// 3단계 sql구문을 만들고 실행할 준비 select
				//String sql="select * from 테이블이름 where id=? and pass=?";
				String sql="select * from User_Info where User_ID=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				//4단계 : sql구문 실행 , 실행결과 저장(select)
				//ResultSet : sql구문 실행 결과를 저장하는 자바 내장객체
				ResultSet rs=pstmt.executeQuery();
				//5단계 : 결과를 출력, 배열저장 (select)
				//if 다음행이동=> 데이터 있으면 => true =>"아이디 비밀번호 일치"
				//else        데이터 없으면 => false => "아이디 비밀번호 틀림"
				if(rs.next()){
					//데이터 있으면 => true =>"아이디  일치"
//					out.println("아이디 비밀번호 일치");
					// id pass name date => 바구니 MemberDTO 저장
					// MemberDTO 객체생성
					dto=new MemberDTO();
					// set메서드 호출 값(디비 가져온값)을 저장
					dto = new MemberDTO();
					dto.setUser_ID(rs.getString("User_ID"));
					dto.setUser_Name(rs.getString("User_Name"));
					dto.setUser_Pass(rs.getString("User_Pass"));
					dto.setUser_Birth(rs.getString("User_Birth"));
					dto.setUser_Phone(rs.getString("User_Phone"));
					dto.setUser_Email(rs.getString("User_Email"));
					dto.setUser_Address(rs.getString("User_Address"));
					dto.setUser_Date(rs.getTimestamp("User_Date"));
					
				}else{
					//데이터 없으면 => false => "아이디  틀림"
//					out.println("아이디 비밀번호 틀림");
					// "입력하신 정보 틀림", 뒤로이동
//						초기값 null
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//마무리
			}
			System.out.println("회원정보가 저장된 리턴할 주소 : " + dto);
			return dto;
		}// getMember()
		
		public void updateMember(MemberDTO dto) {
			try {
				Connection con = getConnection();
				String sql="update User_Info set User_Name=?, User_Pass=?, User_Phone=?, User_Email=?, User_Address=? where User_ID=?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1,dto.getUser_Name());
				pstmt.setString(2,dto.getUser_Pass());
				pstmt.setString(3,dto.getUser_Phone());
				pstmt.setString(4,dto.getUser_Email());
				pstmt.setString(5,dto.getUser_Address());
				pstmt.setString(6,dto.getUser_ID());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 리턴할형MemberDTO getMember(String id)
		// 메서드 정의
		public MemberDTO deleteMember(String id, String pass) {
			// MemberDTO 변수 선언 초기값 null
			MemberDTO dto=null;
			try {
				//1,2 디비연결
				con = getConnection();
				// 3단계 sql구문을 만들고 실행할 준비 select
				//String sql="select * from 테이블이름 where id=? and pass=?";
				String sql="delete from User_Info where User_ID=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				//4단계 : sql구문 실행 , 실행결과 저장(select)
				//ResultSet : sql구문 실행 결과를 저장하는 자바 내장객체
				pstmt.executeUpdate();
				//5단계 : 결과를 출력, 배열저장 (select)
				//if 다음행이동=> 데이터 있으면 => true =>"아이디 비밀번호 일치"
				//else        데이터 없으면 => false => "아이디 비밀번호 틀림"
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				//마무리
			}
			System.out.println("회원정보가 저장된 리턴할 주소delete : " + dto);
			return dto;
		}// deleteMember()
	
			
}//class