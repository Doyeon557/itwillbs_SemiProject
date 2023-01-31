package com.itwillbs.qnaBoard.db;

import java.sql.Date;

public class qnaBoardDTO {
	
	private int Qna_num;
	private String User_ID;
	private String Qna_title;
	private String Qna_content;
//	private Date Qna_date;
	private Date Qna_date;
	private int Qna_ref;
	private int Qna_re_step;
	private int Qna_re_level;
	
	public int getQna_ref() {
		return Qna_ref;
	}
	public void setQna_ref(int qna_ref) {
		Qna_ref = qna_ref;
	}
	public int getQna_re_step() {
		return Qna_re_step;
	}
	public void setQna_re_step(int qna_re_step) {
		Qna_re_step = qna_re_step;
	}
	public int getQna_re_level() {
		return Qna_re_level;
	}
	public void setQna_re_level(int qna_re_level) {
		Qna_re_level = qna_re_level;
	}
	public int getQna_num() {
		return Qna_num;
	}
	public void setQna_num(int qna_num) {
		Qna_num = qna_num;
	}
	public String getUser_ID() {
		return User_ID;
	}
	public void setUser_ID(String user_ID) {
		User_ID = user_ID;
	}
	public String getQna_title() {
		return Qna_title;
	}
	public void setQna_title(String qna_title) {
		Qna_title = qna_title;
	}
	public String getQna_content() {
		return Qna_content;
	}
	public void setQna_content(String qna_content) {
		Qna_content = qna_content;
	}
	public Date getQna_date() {
		return Qna_date;
	}
	public void setQna_date(Date qna_date) {
		Qna_date = qna_date;
	}
	
	
}
