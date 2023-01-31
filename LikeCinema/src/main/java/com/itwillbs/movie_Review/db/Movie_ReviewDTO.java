package com.itwillbs.movie_Review.db;

import java.sql.Timestamp;

public class Movie_ReviewDTO {
	
	private int Review_Num;
	private String Reserve_Num;
	private double Review_Score; 
	private String Review_Text;
	private String User_ID;
	private Timestamp Review_Date;
	

	public int getReview_Num() {
		return Review_Num;
	}
	public void setReview_Num(int review_Num) {
		Review_Num = review_Num;
	}
	public String getReserve_Num() {
		return Reserve_Num;
	}
	public void setReserve_Num(String reserve_Num) {
		Reserve_Num = reserve_Num;
	}

	public double getReview_Score() {
		return Review_Score;
	}
	public void setReview_Score(double review_Score) {
		Review_Score = review_Score;
	}
	public String getReview_Text() {
		return Review_Text;
	}
	public void setReview_Text(String review_Text) {
		Review_Text = review_Text;
	}
	public String getUser_ID() {
		return User_ID;
	}
	public void setUser_ID(String user_ID) {
		User_ID = user_ID;
	}
	public Timestamp getReview_Date() {
		return Review_Date;
	}
	public void setReview_Date(Timestamp review_Date) {
		Review_Date = review_Date;
	}


}
