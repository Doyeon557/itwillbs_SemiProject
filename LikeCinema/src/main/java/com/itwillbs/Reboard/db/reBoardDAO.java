package com.itwillbs.Reboard.db;

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

public class reBoardDAO {
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
		
		public int getListCount() {
			int x= 0;
			
			try{
				pstmt=con.prepareStatement("select count(*) from board");
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					x=rs.getInt(1);
				}
			}catch(Exception ex){
				System.out.println("getListCount : " + ex);			
			}finally{
//				if(rs!=null) try{rs.close();}catch(SQLException ex){}
//				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			}
			return x;
		}
		
		//�� ��� ����.	
		public List getBoardList(int page,int limit){
			String board_list_sql="select * from "+
			"(select rownum rnum,BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,"+
			"BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,"+
			"BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE from "+
			"(select * from board order by BOARD_RE_REF desc,BOARD_RE_SEQ asc)) "+
			"where rnum>=? and rnum<=?";
			
			List list = new ArrayList();
			
			int startrow=(page-1)*10+1; //�б� ������ row ��ȣ.
			int endrow=startrow+limit-1; //���� ������ row ��ȣ.		
			try{
				pstmt = con.prepareStatement(board_list_sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					reBoardDTO board = new reBoardDTO();
					board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
					board.setBOARD_NAME(rs.getString("BOARD_NAME"));
					board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
					board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
					board.setBOARD_FILE(rs.getString("BOARD_FILE"));
					board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
					board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
					board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
					board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
					board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
					list.add(board);
				}
				
				return list;
			}catch(Exception ex){
				System.out.println("getBoardList ���� : " + ex);
			}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			}
			return null;
		}
		
		//�� ���� ����.
		public reBoardDTO getDetail(int num) throws Exception{
			reBoardDTO board = null;
			try{
				pstmt = con.prepareStatement("select * from board where BOARD_NUM = ?");
				pstmt.setInt(1, num);
				
				rs= pstmt.executeQuery();
				
				if(rs.next()){
					board = new reBoardDTO();
					board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
					board.setBOARD_NAME(rs.getString("BOARD_NAME"));
					board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
					board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
					board.setBOARD_FILE(rs.getString("BOARD_FILE"));
					board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
					board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
					board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
					board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
					board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				}
				return board;
			}catch(Exception ex){
				System.out.println("getDetail ���� : " + ex);
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
				if(con != null) try {con.close();}catch(SQLException ex) {}
			}
			return null;
		}
		
		//�� ���.
		public boolean boardInsert(reBoardDTO board){
			int num =0;
			String sql="";
			
			int result=0;
			
			try{
				pstmt=con.prepareStatement("select max(board_num) from board");
				rs = pstmt.executeQuery();
				
				if(rs.next())
					num =rs.getInt(1)+1;
				else
					num=1;
				
				sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,";
				sql+="BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF,"+
					"BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"+
					"BOARD_DATE) values(?,?,?,?,?,?,?,?,?,sysdate)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, board.getBOARD_NAME());
				pstmt.setString(3, board.getBOARD_PASS());
				pstmt.setString(3, board.getBOARD_SUBJECT());
				pstmt.setString(4, board.getBOARD_CONTENT());
				pstmt.setString(5, board.getBOARD_FILE());
				pstmt.setInt(6, num);
				pstmt.setInt(7, 0);
				pstmt.setInt(8, 0);
				pstmt.setInt(9, 0);
				
				result=pstmt.executeUpdate();
				if(result==0)return false;
				
				return true;
			}catch(Exception ex){
				System.out.println("boardInsert ���� : "+ex);
			}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(con != null) try {con.close();}catch(SQLException ex) {}
			}
			return false;
		}
		
		//�� �亯.
		public int boardReply(reBoardDTO board){
			String board_max_sql="select max(board_num) from board";
			String sql="";
			int num=0;
			int result=0;
			
			int re_ref=board.getBOARD_RE_REF();
			int re_lev=board.getBOARD_RE_LEV();
			int re_seq=board.getBOARD_RE_SEQ();
			
			try{
				pstmt=con.prepareStatement(board_max_sql);
				rs = pstmt.executeQuery();
				if(rs.next())num =rs.getInt(1)+1;
				else num=1;
				
				sql="update board set BOARD_RE_SEQ=BOARD_RE_SEQ+1 where BOARD_RE_REF=? ";
				sql+="and BOARD_RE_SEQ>?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,re_ref);
				pstmt.setInt(2,re_seq);
				result=pstmt.executeUpdate();
				
				re_seq = re_seq + 1;
				re_lev = re_lev+1;
				
				sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,";
				sql+="BOARD_CONTENT, BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,BOARD_RE_SEQ,";
				sql+="BOARD_READCOUNT,BOARD_DATE) values(?,?,?,?,?,?,?,?,?,sysdate)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, board.getBOARD_NAME());
				pstmt.setString(3, board.getBOARD_PASS());
				pstmt.setString(3, board.getBOARD_SUBJECT());
				pstmt.setString(4, board.getBOARD_CONTENT());
				pstmt.setString(5, ""); //���忡�� ������ ���ε����� ����.
				pstmt.setInt(6, re_ref);
				pstmt.setInt(7, re_lev);
				pstmt.setInt(8, re_seq);
				pstmt.setInt(9, 0);
				pstmt.executeUpdate();
				return num;
			}catch(SQLException ex){
				System.out.println("boardReply ���� : "+ex);
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(con != null) try {con.close();}catch(SQLException ex) {}
			}
			return 0;
		}
		
		//�� ����.
		public boolean boardModify(reBoardDTO modifyboard) throws Exception{
			String sql="update board set BOARD_SUBJECT=?,BOARD_CONTENT=? where BOARD_NUM=?";
			
			try{
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, modifyboard.getBOARD_SUBJECT());
				pstmt.setString(2, modifyboard.getBOARD_CONTENT());
				pstmt.setInt(3, modifyboard.getBOARD_NUM());
				pstmt.executeUpdate();
				return true;
			}catch(Exception ex){
				System.out.println("boardModify ���� : " + ex);
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(con != null) try {con.close();}catch(SQLException ex) {}
				}
			return false;
		}
		
		//�� ����.
		public boolean boardDelete(int num){
			String board_delete_sql="delete from board where BOARD_NUM='"+num+"'";
			
			int result=0;
			
			try{
				pstmt=con.prepareStatement(board_delete_sql);
				
				result=pstmt.executeUpdate();
				if(result==0)return false;
				
				return true;
			}catch(Exception ex){
				System.out.println("boardDelete ���� : "+ex);
			}finally{
				try{
					if(pstmt!=null)pstmt.close();
					if(con != null) try {con.close();}catch(SQLException ex) {}
				}catch(Exception ex) {}
			}
			
			return false;
		}
		
		//��ȸ�� ������Ʈ.
		public void setReadCountUpdate(int num) throws Exception{
			String sql="update board set BOARD_READCOUNT = "+
				"BOARD_READCOUNT+1 where BOARD_NUM = "+num;
			
			try{
				pstmt=con.prepareStatement(sql);
				pstmt.executeUpdate();
			}catch(SQLException ex){
				System.out.println("setReadCountUpdate ���� : "+ex);
			}
		}
		
		//�۾������� Ȯ��.
		public boolean isBoardWriter(String id,int num){
			String board_sql="select board_num, board_name from board where BOARD_NUM='"+num+"'";
			// BOARD_NAME
			try{
				pstmt=con.prepareStatement(board_sql);
				rs=pstmt.executeQuery();
				
				rs.next();
				if(id.equals(rs.getString("BOARD_NAME"))){
					return true;
				}
			}catch(SQLException ex){
				System.out.println("isBoardWriter ���� : "+ex);
			}
			return false;
		}

	}
