package com.itwillbs.board.db;

import java.sql.Date;

public class BoardDTO {
	
	private int Notice_num;
	private String Manager_Num;         
	private String Notice_title;      
	private String Notice_content;      
	private int Notice_view;   
	private Date Notice_date;   
	private String Notice_file;
	
	public int getNotice_num() {
		return Notice_num;
	}
	public void setNotice_num(int notice_num) {
		Notice_num = notice_num;
	}
	public String getManager_Num() {
		return Manager_Num;
	}
	public void setManager_Num(String manager_Num) {
		Manager_Num = manager_Num;
	}
	public String getNotice_title() {
		return Notice_title;
	}
	public void setNotice_title(String notice_title) {
		Notice_title = notice_title;
	}
	public String getNotice_content() {
		return Notice_content;
	}
	public void setNotice_content(String notice_content) {
		Notice_content = notice_content;
	}
	public int getNotice_view() {
		return Notice_view;
	}
	public void setNotice_view(int notice_view) {
		Notice_view = notice_view;
	}
	public Date getNotice_date() {
		return Notice_date;
	}
	public void setNotice_date(Date notice_date) {
		Notice_date = notice_date;
	}
	public String getNotice_file() {
		return Notice_file;
	}
	public void setNotice_file(String notice_file) {
		Notice_file = notice_file;
	}
	
	

	
}
