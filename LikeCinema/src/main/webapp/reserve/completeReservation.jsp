<%@page import="com.itwillbs.reserveBoard.db.ReserveBoardDAO"%>
<%@page import="com.itwillbs.reserveBoard.db.ReserveBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매완료</title>
<link rel="stylesheet" href="./reserve/complete.css">
<link rel="stylesheet" href="./member/assets/css/style19.css">
<link rel="stylesheet" href="./member/assets/css/swiper.css">
</head>
<body>
<!-- 	 헤더들어가는 곳  -->
	<jsp:include page="../member/top.jsp"></jsp:include>
<!-- 	 헤더들어가는 곳  -->
	<%
	String id = (String)session.getAttribute("id");
	ReserveBoardDAO dao = new ReserveBoardDAO();
	ReserveBoardDTO dto = dao.getRecentInfo(id);
	
	ReserveBoardDTO mdto = dao.getMovieEndTime(dto);
	System.out.println(id);
	%>
	<section class="border">
	
		<div class="reserve_com">예약 완료 되었습니다!</div>
		
 		<table class="info">
			<tr> 
				<th>예약 번호 :&nbsp;</th> 
 				<td>&nbsp;<%=dto.getReserveNum()%></td>
 			</tr>
 			<tr>
 				<th>영화 제목 :&nbsp;</th>
 				<td>&nbsp;<%=mdto.getMovieTitle()%></td>
 			</tr>
 		</table>
		
		<table class="href">
		<tr>
			<td><img src="./img/arrow.jpg" width="20" height="20"></td><td><a href="./ReservationBoard.rb" style="color:#6A0888">예매 내역 확인</a></td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><img src="./img/arrow.jpg" width="20" height="20"></td><td><a href="./MemberMain.me" style="color:#6A0888">메인으로 이동</a></td>
		</tr>
		</table>
		

 		<table class="info1">
 			<tr>
 				<th>&nbsp;예매 인원 :&nbsp;</th>
 				<td>&nbsp;총 <%=dto.getReserveAdult()+dto.getReserveTeenager()+
 						  dto.getReservePreferential()%>명&nbsp;</td>
 				<th>&nbsp;극장 위치 :&nbsp;</th>
 				<td>&nbsp;<%=dto.getReserveLocation()%>&nbsp;</td>
 			</tr>
 			<tr>
 				<th>&nbsp;상영 날짜 :&nbsp;</th>
 				<td>&nbsp;<%=dto.getMovieDate()%>&nbsp;</td>
 				<th>&nbsp;상영 시간 :&nbsp;</th>
 				<td>&nbsp;<%=dto.getScreenStartTime()%>&nbsp;</td>
 			</tr>
 			<tr>
 				<th>&nbsp;예매 좌석 :&nbsp;</th>
 				<td>&nbsp;<%=dto.getReserveSeat()%>&nbsp;</td>
 				<th>&nbsp;결제 금액 :&nbsp;</th>
 				<td>&nbsp;<%=dto.getReservePayPrice()%>원&nbsp;</td>
 			</tr>
 		</table>
		
	</section>
	
	<!-- 	 푸터들어가는 곳  -->
	<jsp:include page="../member/bottom.jsp"></jsp:include>
<!-- 	 푸터들어가는 곳  -->
<!-- reserve/completeReservation.jsp -->
</body>
</html>