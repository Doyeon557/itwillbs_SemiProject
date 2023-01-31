package com.itwillbs.reserve.db;

public class ReserveDTO {
	
	//회원 테이블(User_Info)
	private String userId;
	
	//영화 테이블(Movie_Info)
	//Merge하고 나면 MovieDTO하기
//	private MovieDTO movieDto;
	private String movieId;
	private String movieTitle;
	private String movieGrade;
	private String movieRuntime; //runtime 370분
	private String moviePicture;
	
	//상영 테이블(Screen_Info)
	//Merge하고 나면 ScreenInfoDTO
//	private ScreenInfoDTO screenInfoDto;
	private int screenTheaterNum;
	private String screenLocation;
	private String movieDate;
	private int screenSeat;
	private String screenStartTime; //영화 상영 시작 시간 11:50
	
	//예매 테이블(Reserve_Info)
	private String reserveNum;
	//---나이별 예매 인원 수
	private int reserveTeenager;
	private int reserveAdult;
	private int reservePreferential;
	//---예매 결제
	private String reservePayType;
	private String reservePayPrice;
	private int reserveSeat;
	
	
	public String getScreenLocation() {
		return screenLocation;
	}
	public void setScreenLocation(String screenLocation) {
		this.screenLocation = screenLocation;
	}
	public String getScreenStartTime() {
		return screenStartTime;
	}
	public void setScreenStartTime(String screenStartTime) {
		this.screenStartTime = screenStartTime;
	}
	public String getMovieGrade() {
		return movieGrade;
	}
	public void setMovieGrade(String movieGrade) {
		this.movieGrade = movieGrade;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public int getReserveSeat() {
		return reserveSeat;
	}
	public void setReserveSeat(int reserveSeat) {
		this.reserveSeat = reserveSeat;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getMovieDate() {
		return movieDate;
	}
	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}
	public String getMovieRuntime() {
		return movieRuntime;
	}
	public void setMovieRuntime(String movieRuntime) {
		this.movieRuntime = movieRuntime;
	}
	public String getMoviePicture() {
		return moviePicture;
	}
	public void setMoviePicture(String moviePicture) {
		this.moviePicture = moviePicture;
	}
	public int getScreenTheaterNum() {
		return screenTheaterNum;
	}
	public void setScreenTheaterNum(int screenTheaterNum) {
		this.screenTheaterNum = screenTheaterNum;
	}

	public int getScreenSeat() {
		return screenSeat;
	}
	public void setScreenSeat(int screenSeat) {
		this.screenSeat = screenSeat;
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
	
	
	
}
