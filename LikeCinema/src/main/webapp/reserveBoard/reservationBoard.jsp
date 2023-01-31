<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwillbs.reserveBoard.db.ReserveBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매내역</title>
<link href="./css/adminMovieList.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="canonical" href="https://www.feminique.kr/board/notice/1/" />
<link rel="stylesheet" type="text/css"
	href="./qnalist_css/froala_style_ec.min.css" />
<link rel="stylesheet" type="text/css"
	href="./qnalist_css/optimizer.css" />
<link rel="stylesheet" type="text/css"
	href="./qnalist_css/optimizer2.css" />
<link href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
	rel="stylesheet" />	
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- <link rel="stylesheet" href="./css/style19.css">
<link rel="stylesheet" href="./css/reset19.css"> -->
<style>
.container2 {
    margin: 0px 0px auto 215px;
    /* height: 1000px; */
}

</style>

</head>
<body>
<!--  	헤더들어가는 곳  -->
	<jsp:include page="../member/top.jsp"></jsp:include>
<!-- 	 헤더들어가는 곳 -->
	 <!-- 추후에 삭제 -->
<nav class="w3-sCidebar w3-bar-block w3-white w3-collapse w3-top" style="width:200px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
<!--     <h3 class="w3-wide"><b>LOGO</b></h3> -->
  </div>
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="ReservationBoard.rb" class="w3-bar-item w3-button">예매내역</a>
    <a href="BoardList.bo" class="w3-bar-item w3-button">공지사항</a>
    <a href="QnaBoardList.ao" class="w3-bar-item w3-button">1:1문의</a>
    
    <% 
	String id = (String)session.getAttribute("id");
	%> 
	
      <% 
   	 	if(id != null){ // 로그인은 한상태
   	 		if(id.equals("admin")) {
   	 			%>
  	 			<a href="./AdminMovieList.in" class="w3-bar-item w3-button">영화 관리</a>
   	 			<%
              } else {
              	%>
              	<a href="MemberRecheckForm.me" class="w3-bar-item w3-button">회원 정보</a>          	 
              	<%
              }
   	 	}
        %>
<!--     <a href="MemberRecheckForm.me" class="w3-bar-item w3-button">회원 정보</a> -->
  </div>
</nav>
<br>
<br>
<br>
	<h1>예약내역 확인 게시판</h1>
	<%
	List<ReserveBoardDTO> reserveList = (List<ReserveBoardDTO>)request.getAttribute("reserveList");
	int currentPage=(Integer)request.getAttribute("currentPage");
	int pageBlock=(Integer)request.getAttribute("pageBlock");
	int pageCount=(Integer)request.getAttribute("pageCount");
	int startPage=(Integer)request.getAttribute("startPage");
	int endPage=(Integer)request.getAttribute("endPage");
	
/* 	System.out.println("jsp currentPage: " + currentPage);
	System.out.println("pageBlock: " + pageBlock);
	System.out.println("pageCount: " + pageCount);
	System.out.println("startPage: " + startPage);
	System.out.println("endPage: " + endPage); */
	
	%>
	<div class="container2">
	
	
	<table border="1" class="movieList" >
		<tr>
			<%if(id.equals("admin")){
				%>		
				<th>예약 회원</th>
			<%} %>
			
			<th>예약번호</th>
			<th>극장</th>
			<th>영화 이름</th>
			<th>영화 날짜</th>
			<th>영화 시작 시간</th>
			<th>영화 상영 시간</th>
			<th>상영관</th>
			<th>인원</th>
			<th>좌석 번호</th>
			<th>결제 금액</th>
			<th>결제 방법</th>
			<%if(id.equals("admin")){
				%>		
				<th>예약 취소</th>
			<%} %>
			
		</tr>
		<% for(int i = 0; i < reserveList.size(); i++){
			ReserveBoardDTO dto = reserveList.get(i);%>
		<tr>
			<%if(id.equals("admin")) {
			%>
			<td><%=dto.getUserId()%></td>
			<%}%>
			<td><%=dto.getReserveNum() %></td>
			<td><%=dto.getReserveLocation() %></td>
			<td><%=dto.getMovieTitle()%></td>
			<td><%=dto.getMovieDate() %></td>
			<td><%=dto.getScreenStartTime() %></td>
			<% 
			dto.getScreenStartTime(); // String -> date or time으로 형변환하여 계산해보기
			%>
			<td><%=dto.getMovieRunTime() %>분</td>
			<td><%= dto.getScreenTheaterNum()%></td>
			<td>총 <%= dto.getReserveTeenager()+dto.getReserveAdult()+dto.getReservePreferential()%>명 <br>
			<%
			// 0명인 경우 내역에 안 보임
			if(dto.getReserveTeenager() != 0){%>
				청소년 <%=dto.getReserveTeenager() %>명
			<%}%>
			<%
			if(dto.getReserveAdult() != 0){%>
				일반 <%=dto.getReserveAdult() %>명
			<%}%>
			<%
			if(dto.getReservePreferential() != 0){%>
				우대 <%=dto.getReservePreferential() %>명
			<%}%></td>
			<td><%=dto.getReserveSeat() %></td>
			<td><%=dto.getReservePayPrice() %></td>
			<td><%=dto.getReservePayType() %></td>
			<%if(id.equals("admin")) {
			%>
			<td><a href="./ReservationCancle.rb?ReserveNum=<%=dto.getReserveNum() %>">예약 취소</a></td>
			<%}%>
		</tr>
		<%}%>
	</table>
	</div>
	<br>
	
	<div id="paging">
	 <div
		class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
		<a href="?board_no=1&page=1" class="prev"> <img
			src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
			alt="이전 페이지" /></a>
	<ol>		
	
	<%
	// 5 페이지 이전 
	if (startPage > pageBlock) {
	%>
	<a href="./ReservationBoard.rb?pageNum=<%=startPage - pageBlock%>"><%=pageBlock%></a>
	<%
	}
	// 이전 currentPage-1
	if (currentPage > 1) {
	%>
		<a href="./ReservationBoard.rb?pageNum=<%=currentPage-1%>">[1페이지 이전] </a>
	<%
	}

	for (int i = startPage; i <= endPage; i++) {
	%>
	<li class="xans-record-"><a href="./ReservationBoard.rb?pageNum=<%=i%>"><%=i%></a></li>
	<%
	}

	// 다음 currentPage+1
	if (currentPage < pageCount) {
	%>
		<a href="./ReservationBoard.rb?pageNum=<%=currentPage+1%>">[1페이지 다음]</a>
	<%
	}

	//5 페이지 다음 
	if (endPage < pageCount) {
	%>
	<a href="./ReservationBoard.rb?pageNum=<%=startPage + pageBlock%>"><%=pageBlock%></a>
	<%
	}
	%>
	</ol>
	<a href="./ReservationBoard.rb?pageNum=<%=startPage + pageBlock%>" class="next"> <img
		src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
		alt="다음 페이지" /></a>
		</div>
	</div><br>
	
	
	
	
	<!-- 	 푸터들어가는 곳  -->
	<jsp:include page="../member/bottom.jsp"></jsp:include>
<!-- 	 푸터들어가는 곳  -->
</body>
</html>