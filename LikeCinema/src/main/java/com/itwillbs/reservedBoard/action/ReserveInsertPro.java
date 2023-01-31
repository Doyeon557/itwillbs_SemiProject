package com.itwillbs.reservedBoard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.reserve.db.ReserveDAO;
import com.itwillbs.reserveBoard.db.ReserveBoardDAO;
import com.itwillbs.reserveBoard.db.ReserveBoardDTO;

public class ReserveInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println("id: " + id);
		
		ReserveBoardDTO dto = new ReserveBoardDTO();
		
//		System.out.println("insert 작업 시작!");
		
		String imp_uid = request.getParameter("imp_uid");
		
		String merchant_uid = request.getParameter("merchant_uid");
		
		String pay_method = request.getParameter("pay_method");
		
		String paid_amount = request.getParameter("paid_amount");
		
		String movieID = request.getParameter("movieID");
		String mTitle = request.getParameter("title");
		String rLocation = request.getParameter("location");
		String rDate = request.getParameter("date");
		String rTime = request.getParameter("time");
		int rAdult = Integer.parseInt(request.getParameter("adult"));
		int rTeenager = Integer.parseInt(request.getParameter("teen"));
		int rPrefer = Integer.parseInt(request.getParameter("prefer"));
		String rSeats = request.getParameter("seatList");
		
		System.out.println("아임포트 고유 결제 번호 : " + imp_uid);
		System.out.println("주문 번호 : " + merchant_uid);
		System.out.println("결제 수단 : " + pay_method);
		System.out.println("결제 금액 : " + paid_amount);
		System.out.println("영화 아이디 : " + movieID);
		System.out.println("영화 제목 : " + mTitle);
		System.out.println("예약 지역 : " + rLocation);
		System.out.println("예약 날짜 : " + rDate);
		System.out.println("예약 시간 : " + rTime);
		System.out.println("일반 성인 : " + rAdult);
		System.out.println("청소년 : " + rTeenager);
		System.out.println("우대 : " + rPrefer);
		System.out.println("좌석 : " + rSeats);
		
		//예약 메뉴에서 선택해서 넘어오는 값
		dto.setUserId(id); //id 세션값
		dto.setMovieId(movieID); // 선택한 영화ID
		dto.setMovieTitle(mTitle); //영화 제목
		dto.setReserveLocation("부산" + " " + rLocation);//선택한 지역(부산 + " " + 지역구)
		dto.setMovieDate(rDate); // 선택한 날짜
		dto.setScreenStartTime(rTime);//선택한 시간
		dto.setReserveAdult(rAdult); //선택한 일반 수
		dto.setReserveTeenager(rTeenager);//선택한 청소년 수
		dto.setReservePreferential(rPrefer); //선택한 우대 수
		dto.setReserveSeat(rSeats);//선택한 좌석
		
		//결제에서 넘어오는 값
		dto.setReserveNum(merchant_uid); //예매 번호
		dto.setReservePayType(pay_method);//결제한 방식
		dto.setReservePayPrice(paid_amount);//결제 금액
		
		//해당하는 영화 id에 맞는 정보
		ReserveDAO rdao = new ReserveDAO();
		dto.setScreenTheaterNum(rdao.getScreenInfo(movieID, rLocation, rDate, rTime));//선택한 영화의 극장
		
		//그 값들을 dto에 담아서 dao의 insertReservation 메서드에 전달
		ReserveBoardDAO dao = new ReserveBoardDAO();
		dao.insertReservation(dto);
		System.out.println("예매내역 insert 완료!");
				
		
		return null;
		
	}

}
