package com.itwillbs.reserveBoard.db;

public class ReserveBoardDTO {
	
	//회원 테이블(User_Info)
	private String userId;
	
	//예매 테이블(Reserve_Info)
	private String reserveNum;
	private String movieDate;
	private String screenStartTime;
	private String movieId;
	private String reserveLocation;
	private int screenTheaterNum;
	private String reserveSeat;
	//---나이별 예매 인원 수
	private int reserveTeenager;
	private int reserveAdult;
	private int reservePreferential;
	//---예매 결제
	private String reservePayType;
	private String reservePayPrice;
	
	/*  예매테이블 칼럼
	 * (Reserve_Num, User_ID, Movie_Date, Movie_RunTime
	 * ,Movie_ID, Screen_Theater_Num, Reserve_Teenager
	 * ,Reserve_Adult, Reserve_Preferential, Reserve_Seat
	 * ,Reserve_Pay_type, Reserve_Pay_Price, Reserve_location)
	 */
	
	private String movieTitle;
	private String movieRunTime;
	private String movieEndTime;

	
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getMovieRunTime() {
		return movieRunTime;
	}
	public void setMovieRunTime(String movieRunTime) {
		this.movieRunTime = movieRunTime;
	}
	public String getMovieEndTime() {
		return movieEndTime;
	}
	public void setMovieEndTime(String movieEndTime) {
		this.movieEndTime = movieEndTime;
	}
	public String getUserId() {
		return userId;
	}
	public String getMovieDate() {
		return movieDate;
	}
	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}
	public String getScreenStartTime() {
		return screenStartTime;
	}
	public void setScreenStartTime(String screenStartTime) {
		this.screenStartTime = screenStartTime;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getReserveLocation() {
		return reserveLocation;
	}
	public void setReserveLocation(String reserveLocation) {
		this.reserveLocation = reserveLocation;
	}
	public int getScreenTheaterNum() {
		return screenTheaterNum;
	}
	public void setScreenTheaterNum(int screenTheaterNum) {
		this.screenTheaterNum = screenTheaterNum;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReserveNum() {
		return reserveNum;
	}
	public void setReserveNum(String reserveNum) {
		this.reserveNum = reserveNum;
	}
	public int getReserveTeenager() {
		return reserveTeenager;
	}
	public void setReserveTeenager(int reserveTeenager) {
		this.reserveTeenager = reserveTeenager;
	}
	public int getReserveAdult() {
		return reserveAdult;
	}
	public void setReserveAdult(int reserveAdult) {
		this.reserveAdult = reserveAdult;
	}
	public int getReservePreferential() {
		return reservePreferential;
	}
	public void setReservePreferential(int reservePreferential) {
		this.reservePreferential = reservePreferential;
	}
	public String getReservePayType() {
		return reservePayType;
	}
	public void setReservePayType(String reservePayType) {
		this.reservePayType = reservePayType;
	}
	public String getReservePayPrice() {
		return reservePayPrice;
	}
	public void setReservePayPrice(String reservePayPrice) {
		this.reservePayPrice = reservePayPrice;
	}
	public String getReserveSeat() {
		return reserveSeat;
	}
	public void setReserveSeat(String reserveSeat) {
		this.reserveSeat = reserveSeat;
	}
	
	
	
}
