package com.itwillbs.reserve.db;

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

import com.itwillbs.member.db.MemberDTO;


public class ReserveDAO {
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
	
	public List<ReserveDTO> ReserveMovieList() {
		System.out.println("ReserveMovieList() 호출");
		List<ReserveDTO> movieList = new ArrayList<ReserveDTO>();
		
		try {
			con = getConnection();
			
			String sql = "select distinct m.Movie_ID, m.Movie_Title, m.Movie_Grade, m.Movie_Picture "
					+ "from movie_info m join screen_info s "
					+ "on (m.Movie_ID = s.Movie_Id) "
					+ "where s.Screen_Start_Time is not null";
			// order by Movie_ID desc
			pstmt = con.prepareStatement(sql);
			System.out.println("sql 연동완료");
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReserveDTO dto = new ReserveDTO();
				dto.setMovieId(rs.getString("Movie_ID"));
				dto.setMovieTitle(rs.getString("Movie_Title"));
				System.out.println("결과: " + rs.getString("Movie_Title"));
				dto.setMovieGrade(rs.getString("Movie_Grade"));
				dto.setMoviePicture(rs.getString("Movie_Picture"));
				
				movieList.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("ReserveMovieList 예외 발생");
			e.printStackTrace();
		}finally {
			close();
		}
		return movieList;
	} //ReserveMovieList()
	
	public List<ReserveDTO> ReserveLocationList(String movieId) {
		System.out.println(movieId);
		List<ReserveDTO> locationList = new ArrayList<ReserveDTO>();
		try {
			con = getConnection();
			
			String sql = "select distinct Screen_Location from screen_info where Movie_Id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movieId);
			System.out.println("sql 연동 완료");
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReserveDTO dto = new ReserveDTO();
				dto.setScreenLocation(rs.getString("Screen_Location"));
				locationList.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("ReserveLocationList 예외 발생");
			e.printStackTrace();
		}finally {
			close();
		}
		return locationList;
	}//ReserveLocationList()
	
	public List<ReserveDTO> ReserveDateList(String movieId, String screenLocation) {
		List<ReserveDTO> dateList = new ArrayList<ReserveDTO>();
		
		try {
			con = getConnection();
			
			String sql = "select distinct Movie_Date from screen_info "
					+ "where Movie_Id = ? and Screen_Location = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movieId);
			pstmt.setString(2, screenLocation);
			System.out.println("sql 연동 완료");
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReserveDTO dto = new ReserveDTO();
				dto.setMovieDate(rs.getString("Movie_Date"));
				dateList.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dateList;
	}//ReserveDateList();
	
	public List<ReserveDTO> reserveTimeList(String movieId, String screenLocation, String movieDate) {
		List<ReserveDTO> timeList = new ArrayList<ReserveDTO>();
		try {
			con = getConnection();
			
			String sql = "select Screen_Start_Time from screen_info "
					+ "where Movie_Id = ? and Screen_Location = ? and Movie_Date = ?"
					+ "order by Screen_Start_Time";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movieId);
			pstmt.setString(2, screenLocation);
			pstmt.setString(3, movieDate);
			System.out.println("sql 연동 완료");
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReserveDTO dto = new ReserveDTO();
				dto.setScreenStartTime(rs.getString("Screen_Start_Time"));
				timeList.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return timeList;
	}
	public MemberDTO getReserveUserInfo(String id) {
		//예약하는 id에 해당하는 user의 정보 가져와서 결제창으로 전달하는 메서드
		//MemberDTO로 전달!
		MemberDTO dto = new MemberDTO();
		try {
			con = getConnection();
			
			String sql = "select User_Name, User_Phone, User_Email, User_Address "
					+ "from user_info where User_ID = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setUser_Name(rs.getString("User_Name"));
				dto.setUser_Phone(rs.getString("User_Phone"));
				dto.setUser_Email(rs.getString("User_Email"));
				dto.setUser_Address(rs.getString("User_Address"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}
	public ReserveDTO getMovieInfo(String movieId) {
		
		ReserveDTO dto = new ReserveDTO();
		try {
			con = getConnection();
			
			String sql = "select Movie_Title, Movie_Grade, Movie_Picture "
					+ "from movie_info where Movie_ID = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movieId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setMovieTitle(rs.getString("Movie_Title"));
				dto.setMovieGrade(rs.getString("Movie_Grade"));
				dto.setMoviePicture(rs.getString("Movie_Picture"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return dto;
	}
	public int getScreenInfo(String movieId, String location, String date, String time) {
		int ScreenTheater = 0;
		try {
			con = getConnection();
			
			String sql = "select Screen_Theater_Num "
					+ " from screen_info where Movie_ID = ? and Screen_Location = ?"
					+ "and Movie_Date= ? and Screen_Start_Time= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movieId);
			pstmt.setString(2, location);
			pstmt.setString(3, date);
			pstmt.setString(4, time);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ScreenTheater = rs.getInt("Screen_Theater_Num");
				System.out.println(ScreenTheater);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		System.out.println(ScreenTheater);
		return ScreenTheater;
	}
	
	// 지혜) 리뷰 쓸 때 예매정보 가져오려고 만든 메서드
		public ReserveDTO getReserveInfo(String movie_ID, String User_ID) {
			
			ReserveDTO dto = null;
			
			try {
				Connection con = getConnection();
				String sql = "select * from Reserve_Info where Movie_ID =? and User_ID =?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, movie_ID);
				pstmt.setString(2, User_ID);
				ResultSet rs = pstmt.executeQuery();
				
				if (rs.next()) {
					dto = new ReserveDTO();
					dto.setUserId(rs.getString("User_ID"));
					dto.setMovieId(rs.getString("movie_ID"));
					dto.setReserveNum(rs.getString("Reserve_Num"));
				}else {
					dto = new ReserveDTO();
					dto.setReserveNum("");
				}
				
			} catch (Exception e) {
				e.getStackTrace();
			} finally {
			}

			return dto;
		}// getReserveInfo()
	
}
