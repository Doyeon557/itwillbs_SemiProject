package com.itwillbs.movie_Review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwillbs.reserve.db.ReserveDTO;

public class Movie_ReviewDAO {

	Connection con=null;
	PreparedStatement pstmt2=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		con=ds.getConnection();
		return con;
	}

	public void close() {
		if(con!=null) try{con.close();}catch(SQLException ex) {}
		if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
		if(pstmt2!=null) try{pstmt2.close();}catch(SQLException ex) {}
		if(rs!=null) try{rs.close();}catch(SQLException ex) {}
	}
	
	public void insertReview(Movie_ReviewDTO dto) {
		try {
			con=getConnection();
			
			String sql2="select max(Review_Num) from Review_Info";
			pstmt2=con.prepareStatement(sql2);
			rs=pstmt2.executeQuery();
			
			int Review_Num = 0;
			if(rs.next()) {
				Review_Num=rs.getInt("max(Review_Num)") + 1;
			}
			
			String sql="insert into Review_Info(Review_Num,Reserve_Num,Review_Score,Review_Text,User_ID,Review_Date) values(?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, Review_Num);
			pstmt.setString(2, dto.getReserve_Num());
			pstmt.setDouble(3, dto.getReview_Score());
			pstmt.setString(4, dto.getReview_Text());
			pstmt.setString(5, dto.getUser_ID());
			pstmt.setTimestamp(6, dto.getReview_Date());
			pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	
	} // insertReview()
	
	public List<Movie_ReviewDTO> getReviewList(String movie_ID, int startRow, int pageSize) {

		List<Movie_ReviewDTO> reviewList=new ArrayList<Movie_ReviewDTO>();
	
		try {
			// 1, 2단계 디비연결
			con=getConnection();
			// 3 sql
			String sql="select rv.Review_Num, rv.Reserve_Num, rv.Review_Score, rv.Review_Text, rv.User_ID, rv.Review_Date from Review_Info rv join Reserve_Info rs on rv.Reserve_Num = rs.Reserve_Num where rs.Movie_ID = ? order by Review_Num desc limit ?,?";
			// 4 실행 => 결과저장
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, movie_ID);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			// 5 while 결과 접근 
			while(rs.next()) {
				Movie_ReviewDTO dto = new Movie_ReviewDTO();
				// => BoardDTO 객체생성 set 호출 디비에서 가져온 값저장
				dto.setReview_Num(rs.getInt("Review_Num"));
				dto.setUser_ID(rs.getString("User_ID"));
				dto.setReview_Score(rs.getInt("Review_Score"));
				dto.setReview_Text(rs.getString("Review_Text"));
				dto.setReview_Date(rs.getTimestamp("Review_Date"));
				
				// => 글 하나를 배열한칸에 저장
				reviewList.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return reviewList;
		
	} //getReviewList()
	
	public Movie_ReviewDTO getReview(int Review_Num) {
		Movie_ReviewDTO dto = null;

		try {
			con=getConnection();
			String sql="select * from Review_Info where Review_Num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Review_Num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// Review_Num에 대한 게시글이 있음
				dto = new Movie_ReviewDTO();
				dto.setReview_Num(rs.getInt("Review_Num"));
				dto.setReserve_Num(rs.getString("Reserve_Num"));
				dto.setUser_ID(rs.getString("User_ID"));
				dto.setReview_Score(rs.getInt("Review_Score"));
				dto.setReview_Text(rs.getString("Review_Text"));
				dto.setReview_Date(rs.getTimestamp("Review_Date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	} //getReview()
	
	public void updateReview(Movie_ReviewDTO dto) {
		
		try {
			con=getConnection();
			String sql="update Review_Info set Review_Score = ? , Review_Text = ? where Review_Num = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setDouble(1, dto.getReview_Score());
			pstmt.setString(2, dto.getReview_Text());
			pstmt.setInt(3, dto.getReview_Num());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	} //updateReview()
	
	public void deleteReview(int Review_Num) {
		
		try {
			con=getConnection();
			String sql="delete from Review_Info where Review_Num = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, Review_Num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}//deleteReview()
	
	public int getReviewCount() {
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from Review_Info";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return count;
	} //getReviewCount()
	
	public int countMovieReview(String movie_ID) {
		
		int count=0;
		try {
			con=getConnection();
			String sql="select count(rv.Reserve_Num) from Review_Info rv join Reserve_Info rs on rv.Reserve_Num = rs.Reserve_Num where rs.Movie_ID = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, movie_ID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(rv.Reserve_Num)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return count;
		
	}
	
	public double averageReviewScore(String movie_ID) {
		
		double avg=0.0;
		try {
			con=getConnection();
			String sql="select round(avg(rv.Review_Score),2) from Review_Info rv join Reserve_Info rs on rv.Reserve_Num = rs.Reserve_Num where rs.Movie_ID = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, movie_ID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				avg=rs.getDouble("round(avg(rv.Review_Score),2)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return avg;
		
	}

	
	public Movie_ReviewDTO reviewCheck(String movie_ID, String user_ID) {
		
		Movie_ReviewDTO dto = null;
		try {
			con=getConnection();
			String sql="select * from review_info rev join reserve_info res on rev.reserve_num = res.reserve_num where res.movie_id=? and rev.user_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movie_ID);
			pstmt.setString(2, user_ID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// Review_Num에 대한 게시글이 있음
				dto = new Movie_ReviewDTO();
				dto.setReview_Num(rs.getInt("Review_Num"));
			} else {
				// Review_Num에 대한 게시글이 없음
				dto = new Movie_ReviewDTO();
				dto.setReview_Num(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
		
	}
	
	public List<Movie_ReviewDTO> getMyReviewList(String User_ID, int startRow, int pageSize) {

		List<Movie_ReviewDTO> myReviewList=new ArrayList<Movie_ReviewDTO>();
	
		try {
			// 1, 2단계 디비연결
			con=getConnection();
			// 3 sql
			String sql="SELECT REV.Review_Num, REV.Reserve_Num, REV.Review_Score, REV.Review_Text, REV.User_ID, REV.Review_Date, RES.Movie_ID"
					+ " FROM REVIEW_INFO REV JOIN RESERVE_INFO RES"
					+ "	ON REV.Reserve_Num = RES.Reserve_Num"
					+ " WHERE REV.User_ID = ? order by Review_Num desc limit ?,?";
			// 4 실행 => 결과저장
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, User_ID);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			// 5 while 결과 접근 
			while(rs.next()) {
				Movie_ReviewDTO dto = new Movie_ReviewDTO();
				// => BoardDTO 객체생성 set 호출 디비에서 가져온 값저장
				dto.setReview_Num(rs.getInt("Review_Num"));
				dto.setUser_ID(rs.getString("User_ID"));
				dto.setReview_Score(rs.getInt("Review_Score"));
				dto.setReview_Text(rs.getString("Review_Text"));
				dto.setReview_Date(rs.getTimestamp("Review_Date"));
				
				// => 글 하나를 배열한칸에 저장
				myReviewList.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return myReviewList;
		
	} //getmyReviewList()
	
	public int countMyReview(String User_ID) {
		
		int count=0;
		try {
			con=getConnection();
			String sql="select count(rv.Review_Num)"
					+ "from Review_Info rv join Reserve_Info rs"
					+ "on rv.Reserve_Num = rs.Reserve_Num"
					+ "where rs.User_ID = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, User_ID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("count(rv.Review_Num)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return count;
		
	} //countMyReview()
	
}
