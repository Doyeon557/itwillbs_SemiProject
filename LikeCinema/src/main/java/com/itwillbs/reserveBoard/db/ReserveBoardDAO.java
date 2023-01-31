package com.itwillbs.reserveBoard.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ReserveBoardDAO {
	Connection con=null;
	PreparedStatement pstmt2 =null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;

	public Connection getConnection() throws Exception {

		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		con = ds.getConnection();
		return con;
	}
	public void close() {
		if(rs!=null) try{rs.close();}catch(SQLException ex) {}
		if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
		if(pstmt2!=null) try{pstmt2.close();}catch(SQLException ex) {}
		if(con!=null) try{con.close();}catch(SQLException ex) {}
	}
	
	public int getReserveNum() {
		int reserveNum = 0;

		try {
			con = getConnection();
			// DB에 있는 마지막 예매의 예약번호 select
			String sql = "select max(Reserve_Num) as maxReserveNum from reserve_info";
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// DB에 존재하는 예매번호에 + 1

			if(rs.next()) {
				
				reserveNum = rs.getInt("maxReserveNum");
//				System.out.println("db에서 가져온 예매번호" + num);
				if(reserveNum != 0) reserveNum += 1;
				else		 		reserveNum = 23001; // 첫 주문 Number: 23001
				
			}else {
				reserveNum = 23001;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}

		return reserveNum;
	}

	public void insertReservation(ReserveBoardDTO dto) { //결제하면 예매 테이블에 받아온 값 insert하는 메서드
		try {
			con = getConnection();


			//insert 작업
			String sql = "insert into reserve_info("
					+ "Reserve_Num, User_ID, Movie_Date, Screen_Start_Time"
					+ ",Movie_ID, Screen_Theater_Num, Reserve_Teenager"
					+ ",Reserve_Adult, Reserve_Preferential, Reserve_Seat"
					+ ",Reserve_Pay_Type, Reserve_Pay_Price, Reserve_Location)"
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getReserveNum());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getMovieDate());
			pstmt.setString(4, dto.getScreenStartTime());
			pstmt.setString(5, dto.getMovieId());
			pstmt.setInt(6, dto.getScreenTheaterNum());
			pstmt.setInt(7, dto.getReserveTeenager());
			pstmt.setInt(8, dto.getReserveAdult());
			pstmt.setInt(9, dto.getReservePreferential());
			pstmt.setString(10, dto.getReserveSeat());
			pstmt.setString(11, dto.getReservePayType());
			pstmt.setString(12, dto.getReservePayPrice());
			pstmt.setString(13, dto.getReserveLocation());

			pstmt.executeUpdate();

			System.out.println("insert 완료!");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}

	}//insertReservation()

	public List<ReserveBoardDTO> getReserveBoardList(int startRow, int pageSize, String id) { //예매내역 불러오기
		List<ReserveBoardDTO> reserveBoardList = new ArrayList<ReserveBoardDTO>();
		try {
			con = getConnection();
			
			if(!id.equals("admin")) { //일반회원 아이디 => 해당 아이디의 예매내역만 호출
				
			String sql = "select * from reserve_info where User_ID = ?"
						+ "order by Reserve_num desc limit ?, ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			
			rs = pstmt.executeQuery();
			}else { //사원 아이디는 admin로 => 모든 예매내역 호출
				
				String sql = "select * from reserve_info order by Reserve_num desc limit ?, ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				
				rs = pstmt.executeQuery();
			}
			
			while (rs.next()) {
				ReserveBoardDTO dto = new ReserveBoardDTO();
				dto.setReserveNum(rs.getString("Reserve_Num"));
				dto.setReserveLocation(rs.getString("Reserve_Location"));
				dto.setUserId(rs.getString("User_ID"));
				dto.setMovieId(rs.getString("Movie_ID"));
				dto.setMovieDate(rs.getString("Movie_Date"));
				dto.setScreenStartTime(rs.getString("Screen_Start_Time"));
				dto.setScreenTheaterNum(rs.getInt("Screen_Theater_Num"));
				dto.setReserveSeat(rs.getString("Reserve_Seat"));
				dto.setReserveAdult(rs.getInt("Reserve_Adult"));
				dto.setReserveTeenager(rs.getInt("Reserve_Teenager"));
				dto.setReservePreferential(rs.getInt("Reserve_Preferential"));
				dto.setReservePayType(rs.getString("Reserve_Pay_Type"));
				dto.setReservePayPrice(rs.getNString("Reserve_Pay_Price"));
				
				reserveBoardList.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("예약 내역 목록 DB 연동 예외");
			e.printStackTrace();
		}finally {
			close();
		}
		
		return reserveBoardList;
	}

	//영화 끝나는 시간계산 메서드
	//영화런타임(Movie_RunTime) from movie_info + 영화시작시간(Screen_Start_Time) from screen_info
	//시작시간과 끝나는 시간을 화면에 출력할 용도
	public ReserveBoardDTO getMovieEndTime(ReserveBoardDTO dto) {
		System.out.println("getMovieEndTime 시작");
		try {
			con = getConnection();
			System.out.println("영화 id값: " + dto.getMovieId());
			String sql = "select Movie_Title, Movie_RunTime from movie_info where Movie_ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMovieId());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setMovieTitle(rs.getString("Movie_Title"));
				System.out.println("영화이름: " + rs.getString("Movie_Title"));
				dto.setMovieRunTime(rs.getString("Movie_RunTime"));
				System.out.println("영화 상영시간: " + rs.getString("Movie_RunTime"));
			}

			System.out.println("getMovieEndTime 끝");

		} catch (Exception e) {
			System.out.println("영화 끝나는 시간 구하는 getMovieEndTime 예외");
			e.printStackTrace();
		}finally {
			close();
		}

		return dto;
	}

	// id당 전체 예매내역 개수
	public int getReserveCount(String id) {
		int count = 0;
		System.out.println("넘어온 id: " + id);
		try {
			con = getConnection();
			System.out.println("con 연결");
			
			if(!id.equals("admin")) { //일반 회원 예약내역 수 id.charAt(0) > 'A'
				
				String sql = "select count(*) from reserve_info where User_ID = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
			}else { //모든 예약내역 수
				String sql = "select count(*) from reserve_info";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
			}


			if(rs.next()) {
				count = rs.getInt("count(*)");
				System.out.println("DAO count: " + count);
			}else {
				System.out.println("rs값 없음!");
			}

		} catch (Exception e) {
			System.out.println("예매 내역 개수 구하는 메서드 예외 발생");
			e.printStackTrace();
		}finally {
			close();
		}
		return count;
	}//getReserveCount()

	//예매내역 환불하기 - deleteBoard
	public void deleteReserve(String reserveNum) {
		try {
			con = getConnection();

			String sql = "delete from reserve_info where Reserve_Num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reserveNum);
			pstmt.executeUpdate();

			System.out.println("삭제 완료!");
		} catch (Exception e) {
			System.out.println("예약 delete 메서드 예외 발생");
			e.printStackTrace();
		}finally {
			close();
		}

	}
	public ReserveBoardDTO getRecentInfo(String id) { //해당 아이디의 예매내역 중 가장 최근 예매내역 정보 불러오기
		ReserveBoardDTO dto = new ReserveBoardDTO();
		try {
			con= getConnection();
			String sql = "select * from reserve_info where User_ID = ?"
					+ "						   and Reserve_Num = (select max(Reserve_Num)"
					+ "											  from reserve_info"
					+ "                                           where User_ID = ?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setReserveNum(rs.getString("Reserve_Num"));
				dto.setReserveLocation(rs.getString("Reserve_Location"));
				dto.setUserId(rs.getString("User_ID"));
				dto.setMovieId(rs.getString("Movie_ID"));
				dto.setMovieDate(rs.getString("Movie_Date"));
				dto.setScreenStartTime(rs.getString("Screen_Start_Time"));
				dto.setScreenTheaterNum(rs.getInt("Screen_Theater_Num"));
				dto.setReserveSeat(rs.getString("Reserve_Seat"));
				dto.setReserveAdult(rs.getInt("Reserve_Adult"));
				dto.setReserveTeenager(rs.getInt("Reserve_Teenager"));
				dto.setReservePreferential(rs.getInt("Reserve_Preferential"));
				dto.setReservePayType(rs.getString("Reserve_Pay_Type"));
				dto.setReservePayPrice(rs.getNString("Reserve_Pay_Price"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
	}

}
