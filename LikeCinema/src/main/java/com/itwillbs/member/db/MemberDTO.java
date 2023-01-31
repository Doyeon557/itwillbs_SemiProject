package com.itwillbs.member.db;

import java.sql.Timestamp;

public class MemberDTO {
	
	private String User_ID;
	private String User_Name;
	private String User_Pass;
	private String User_Birth;
	private String User_Phone;
	private String User_Email;
	private String User_Address;
	private Timestamp User_Date;
	
	public String getUser_ID() {
		return User_ID;
	}
	public void setUser_ID(String user_ID) {
		User_ID = user_ID;
	}
	public String getUser_Name() {
		return User_Name;
	}
	public void setUser_Name(String user_Name) {
		User_Name = user_Name;
	}
	public String getUser_Pass() {
		return User_Pass;
	}
	public void setUser_Pass(String user_Pass) {
		User_Pass = user_Pass;
	}
	public String getUser_Birth() {
		return User_Birth;
	}
	public void setUser_Birth(String user_Birth) {
		User_Birth = user_Birth;
	}
	public String getUser_Phone() {
		return User_Phone;
	}
	public void setUser_Phone(String user_Phone) {
		User_Phone = user_Phone;
	}
	public String getUser_Email() {
		return User_Email;
	}
	public void setUser_Email(String user_Email) {
		User_Email = user_Email;
	}
	public String getUser_Address() {
		return User_Address;
	}
	public void setUser_Address(String user_Address) {
		User_Address = user_Address;
	}
	public Timestamp getUser_Date() {
		return User_Date;
	}
	public void setUser_Date(Timestamp user_Date) {
		User_Date = user_Date;
	}
	@Override
	public String toString() {
		return "MemberDTO [User_ID=" + User_ID + ", User_Name=" + User_Name + ", User_Pass=" + User_Pass
				+ ", User_Birth=" + User_Birth + ", User_Phone=" + User_Phone + ", User_Email=" + User_Email
				+ ", User_Address=" + User_Address + ", User_Date=" + User_Date + "]";
	}
	
}
