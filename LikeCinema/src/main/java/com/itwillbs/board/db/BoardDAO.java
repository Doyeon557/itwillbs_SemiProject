package com.itwillbs.board.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
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
	public void insertBoard(BoardDTO dto) {

		
		System.out.println("BoardDAO insertBoard()");
		System.out.println("BoardDTO 주소값 :"+dto);
		System.out.println("BoardDTO name :"+dto.getManager_Num());
		System.out.println("BoardDTO subject :"+dto.getNotice_title());
		System.out.println("BoardDTO content :"+dto.getNotice_content());
		System.out.println("BoardDTO readcount :"+dto.getNotice_view());
		System.out.println("BoardDTO date :"+dto.getNotice_date());
		System.out.println("BoardDTO date :"+dto.getNotice_file());
		try {
			//1,2 메서드호출
			con=getConnection();
			//게시판 글번호 구하기  가장 큰번호 +1 => 이번에 입력할 글번호
			//3. select max(num) from board;
			String sql2="select max(Notice_num) as maxnum from notice";
			pstmt2 =con.prepareStatement(sql2);
			//4. 실행 => 결과 저장
			rs=pstmt2.executeQuery();
			//5. 결과접근 max(num)가져와서 +1 
			int Notice_num=0;
			if(rs.next()) {
				Notice_num=rs.getInt("maxnum")+1;
			}
			//3 sql구문 만들기
			String sql="insert into notice(Notice_num,Manager_Num,Notice_title,Notice_content,Notice_view,Notice_date,Notice_file) values(?,?,?,?,?,?,?)";
			pstmt =con.prepareStatement(sql);
			//게시판 글번호 
			pstmt.setInt(1, Notice_num);
			pstmt.setString(2, dto.getManager_Num());
			pstmt.setString(3, dto.getNotice_title());
			pstmt.setString(4, dto.getNotice_content());
			pstmt.setInt(5, dto.getNotice_view());
			pstmt.setDate(6, dto.getNotice_date());
			pstmt.setString(7, dto.getNotice_file());
			//4 sql구문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}//insertBoard()
	
	// List<BoardDTO> 리턴할형 getBoardList()메서드 정의
	public List<BoardDTO> getBoardList(int startRow,int pageSize) {

List<BoardDTO> boardList=new ArrayList<BoardDTO>();
	try {
		//1,2단계 디비연결
		con=getConnection();
		//3 sql 
//		String sql="select * from board";
//		String sql="select * from board order by num desc limit 시작행-1,글개수";
		String sql="select * from notice order by Notice_num desc limit ?,?";
		pstmt =con.prepareStatement(sql);
		pstmt.setInt(1, startRow-1);
		pstmt.setInt(2, pageSize);
		//4 실행=> 결과저장
		rs=pstmt.executeQuery();
		//5 while 결과 접근 
		// => BoardDTO 객체생성 set호출 디비에서 가져온 값저장
		// => 글하나를 배열한칸에 저장

		
		while(rs.next()) {
			BoardDTO dto=new BoardDTO();
			dto.setNotice_num(rs.getInt("Notice_num"));
			dto.setManager_Num(rs.getString("Manager_Num"));
			dto.setNotice_title(rs.getString("Notice_title"));
			dto.setNotice_content(rs.getString("Notice_content"));
			dto.setNotice_view(rs.getInt("Notice_view"));
			dto.setNotice_date(rs.getDate("Notice_date"));
			dto.setNotice_file(rs.getString("Notice_file"));
			//배열 한칸에 글한개 저장
			boardList.add(dto);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		close();
	}
	// 배열의 주소 리턴
	return boardList;
	}//getBoardList()
	
	// BoardDTO 리턴할형  getBoard(int num)메서드 정의
	public BoardDTO getBoard(int num) {
		
		BoardDTO dto=null;
		try {
			//1,2 디비연결
			con=getConnection();
			//3 sql
			String sql="select * from notice where Notice_num=?";
			pstmt =con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4 실행 => 결과 저장
			rs=pstmt.executeQuery();
			//5 결과 있으면 => BoardDTO 객체생성
			//   =>set메서드호출=> 디비에서 가져온값 저장
			if(rs.next()) {
//		
				//결과 있으면  =>num에 대한 글있음
				dto=new BoardDTO();
				dto.setNotice_num(rs.getInt("Notice_num"));
				dto.setManager_Num(rs.getString("Manager_Num"));
				dto.setNotice_title(rs.getString("Notice_title"));
				dto.setNotice_content(rs.getString("Notice_content"));
				dto.setNotice_view(rs.getInt("Notice_view"));
				dto.setNotice_date(rs.getDate("Notice_date"));
				dto.setNotice_file(rs.getString("Notice_file"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}//
	
	// update board set readcount=readcount+1 where num=?
	// 리턴할형없음 updateReadcount(int num)	메서드 정의	
			public void updateReadcount(int num) {

				try {
					//1,2 디비연결
					con = getConnection();
					//3 sql
					String sql="update notice set Notice_view=Notice_view+1 where Notice_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, num);
					//4 실행
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					close();
				}
			}//
			// 리턴할형없음 updateBoard(BoardDTO 변수)메서드 정의 
			public void updateBoard(BoardDTO dto) {
//		
				try {
					//1,2 디비연결
					con = getConnection();
					//3 sql
					String sql="update notice set Notice_title=?,Notice_content=? where Notice_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, dto.getNotice_title());
					pstmt.setString(2, dto.getNotice_content());
					pstmt.setInt(3, dto.getNotice_num());
					//4 실행
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					close();
				}
			}//
			
			// 리턴할형없음 deleteBoard(int num)메서드 정의
			public void deleteBoard(int num) {

				try {
					//1,2 디비연결
					con = getConnection();
					//3 sql
					String sql="delete from notice where Notice_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, num);
					//4 실행
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					close();
				}
			}//	
			
//		int count=dao.getBoardCount();
		public int 	getBoardCount() {
			int count=0;
			try {
				//1,2 디비연결
				con=getConnection();
				//3 sql
				String sql="select count(*) from notice";
				pstmt=con.prepareStatement(sql);
				//4 실행 => 결과 저장
				rs=pstmt.executeQuery();
				//5 결과 접근 글개수 가져오기
				if(rs.next()) {
					count=rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return count;
		}
			
}//class
