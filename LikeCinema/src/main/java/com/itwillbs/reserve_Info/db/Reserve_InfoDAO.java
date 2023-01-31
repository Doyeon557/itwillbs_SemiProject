package com.itwillbs.reserve_Info.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Reserve_InfoDAO {

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
	
	public Reserve_InfoDTO getReserveInfo(String movie_ID, String User_ID) {
		Reserve_InfoDTO dto = null;
		
		System.out.println("전달받은 movie_ID값 : " + movie_ID);
		System.out.println("전달받은 User_ID값 : " + User_ID);
		
		try {
			Connection con = getConnection();
			String sql = "select * from Reserve_Info where Movie_ID =? and User_ID =?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, movie_ID);
			pstmt.setString(2, User_ID);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto = new Reserve_InfoDTO();
				dto.setUser_ID(rs.getString("User_ID"));
				dto.setMovie_ID(rs.getString("movie_ID"));
				dto.setReserve_Num(rs.getString("Reserve_Num"));
			}else {
				dto = new Reserve_InfoDTO();
				dto.setReserve_Num("N");
			}
			
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
		}

		return dto;
	}// getReserveInfo()
	
	
	
}
