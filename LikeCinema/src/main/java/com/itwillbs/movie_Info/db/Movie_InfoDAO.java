package com.itwillbs.movie_Info.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Movie_InfoDAO {

	Connection con=null;
	PreparedStatement pstmt2=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		con=ds.getConnection();
		return con;
	} // getConnection()
	
	public void close() {
		if(con!=null) try{con.close();}catch(SQLException ex) {}
		if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
		if(pstmt2!=null) try{pstmt2.close();}catch(SQLException ex) {}
		if(rs!=null) try{rs.close();}catch(SQLException ex) {}
	} // close()
	
	public Movie_InfoDTO getMovieInfo(String movie_ID) {
		Movie_InfoDTO dto = null;
		
		try {
			con=getConnection();
			String sql="select * from Movie_Info where movie_ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, movie_ID);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new Movie_InfoDTO();
				dto.setMovie_ID(rs.getString("movie_ID"));
				dto.setMovie_Title(rs.getString("movie_Title"));
				dto.setMovie_Genre(rs.getString("movie_Genre"));
				dto.setMovie_Country(rs.getString("movie_Country"));
				dto.setMovie_Director(rs.getString("movie_Director"));
				dto.setMovie_Cast(rs.getString("movie_Cast"));
				dto.setMovie_Grade(rs.getString("movie_Grade"));
				dto.setMovie_RunTime(rs.getString("movie_RunTime"));
				dto.setMovie_RlsDate(rs.getString("movie_RlsDate"));
				dto.setMovie_Video(rs.getString("movie_Video"));
				dto.setMovie_Story(rs.getString("movie_Story"));
				dto.setMovie_Picture(rs.getString("movie_Picture"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
		
	} //getMovieInfo()
	
	public List<Movie_InfoDTO> getMovieList(int startRow, int pageSize) {

		List<Movie_InfoDTO> movieList=new ArrayList<Movie_InfoDTO>();
	
		try {
			// 1, 2단계 디비연결
			con=getConnection();
			// 3 sql
			String sql="select * from Movie_Info order by movie_RlsDate desc limit ?,?";
			// 4 실행 => 결과저장
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			// 5 while 결과 접근 
			while(rs.next()) {
				Movie_InfoDTO dto = new Movie_InfoDTO();
				// => BoardDTO 객체생성 set 호출 디비에서 가져온 값저장				
				dto.setMovie_ID(rs.getString("movie_ID"));
				dto.setMovie_Title(rs.getString("movie_Title"));
				dto.setMovie_Genre(rs.getString("movie_Genre"));
				dto.setMovie_Country(rs.getString("movie_Country"));
				dto.setMovie_Director(rs.getString("movie_Director"));
				dto.setMovie_Cast(rs.getString("movie_Cast"));
				dto.setMovie_Grade(rs.getString("movie_Grade"));
				dto.setMovie_RunTime(rs.getString("movie_RunTime"));
				dto.setMovie_RlsDate(rs.getString("movie_RlsDate"));
				dto.setMovie_Video(rs.getString("movie_Video"));
				dto.setMovie_Story(rs.getString("movie_Story"));
				dto.setMovie_Picture(rs.getString("movie_Picture"));

				// => 글 하나를 배열한칸에 저장
				movieList.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return movieList;
		
	} //getMovieList()
	
	public int getMovieCount() {
		int count=0;
		try {
			con=getConnection();
			String sql="select count(*) from Movie_Info";
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
	} //getMovieCount()
	
	public void insertMovie(Movie_InfoDTO dto) {
		
		try {
			// 1,2 메서드 호출
			con=getConnection();
			// 3 sql구문 만들기
			String sql="insert into Movie_Info(Movie_ID, Movie_Title, Movie_Genre, Movie_Country, Movie_Director, Movie_Cast, Movie_Grade, Movie_RunTime, Movie_RlsDate, Movie_Video, Movie_Story, Movie_Picture) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getMovie_ID());
			pstmt.setString(2, dto.getMovie_Title());
			pstmt.setString(3, dto.getMovie_Genre());
			pstmt.setString(4, dto.getMovie_Country());
			pstmt.setString(5, dto.getMovie_Director());
			pstmt.setString(6, dto.getMovie_Cast());
			pstmt.setString(7, dto.getMovie_Grade());
			pstmt.setString(8, dto.getMovie_RunTime());
			pstmt.setString(9, dto.getMovie_RlsDate());
			pstmt.setString(10, dto.getMovie_Video());
			pstmt.setString(11, dto.getMovie_Story());
			pstmt.setString(12, dto.getMovie_Picture());
			// 4 sql구문 실행
			pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close();
		}
		
	}//insertMovie()
	
	public void updateMovie(Movie_InfoDTO dto) {
		
		try {
			con=getConnection();
			String sql="update Movie_Info set Movie_ID=?, Movie_Title=?, Movie_Genre=?, Movie_Country=?, Movie_Director=?, Movie_Cast=?, Movie_Grade=?, Movie_RunTime=?, Movie_RlsDate=?, Movie_Video=?, Movie_Story=?, Movie_Picture=? where movie_ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getMovie_ID());
			pstmt.setString(2, dto.getMovie_Title());
			pstmt.setString(3, dto.getMovie_Genre());
			pstmt.setString(4, dto.getMovie_Country());
			pstmt.setString(5, dto.getMovie_Director());
			pstmt.setString(6, dto.getMovie_Cast());
			pstmt.setString(7, dto.getMovie_Grade());
			pstmt.setString(8, dto.getMovie_RunTime());
			pstmt.setString(9, dto.getMovie_RlsDate());
			pstmt.setString(10, dto.getMovie_Video());
			pstmt.setString(11, dto.getMovie_Story());
			pstmt.setString(12, dto.getMovie_Picture());
			pstmt.setString(13, dto.getMovie_ID());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	} // updateMovie()
	
	public void deleteMovie(String movie_ID) {
		
		try {
			con=getConnection();
			String sql="delete from Movie_Info where movie_ID = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, movie_ID);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}//deleteMovie()
}
