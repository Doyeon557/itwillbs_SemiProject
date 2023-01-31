<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwillbs.movie_Review.db.Movie_ReviewDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.movie_Info.db.Movie_InfoDTO"%>
<%@page import="com.itwillbs.movie_Info.db.Movie_InfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieList</title>
<link href="./css/movieList.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">
</head>
<body>

<!-- header -->
<jsp:include page="../member/top.jsp"></jsp:include>
<!-- header -->

<%
Movie_ReviewDAO rvdao = new Movie_ReviewDAO();

List<Movie_InfoDTO> movieList=(List<Movie_InfoDTO>)request.getAttribute("movieList");
int startPage=(Integer)request.getAttribute("startPage");
int endPage=(Integer)request.getAttribute("endPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int currentPage=(Integer)request.getAttribute("currentPage");
int pageCount=(Integer)request.getAttribute("pageCount");
%>
	<!-- tab -->
	<div>
		<ul id="tab">
			<li><a href="#story">현재상영작</a></li>
			<li><a href="#trailer">상영예정작</a></li>
		</ul>
	</div>
	
	<div>
		<ul id="tab">
			<li><a href="#story">예매순</a></li>
			<li><a href="#trailer">평점순</a></li>
			<li><a href="#trailer">관람평 많은 순</a></li>
		</ul>
	</div>
	
	<div>
		<ul id="tab">
			<li><a href="#story">가나다순</a></li>
			<li><a href="#trailer">개봉일순</a></li>
		</ul>
	</div>
	
	<div class="container1">

    <%
    for(int i = 0; i < movieList.size(); i++) {
    	Movie_InfoDTO dto=movieList.get(i);
    %>
		<span class="movieList">
	
			<div class="poster">
				<img src="./img/<%=dto.getMovie_Picture() %>" alt="<%=dto.getMovie_Title() %>">

			<div class="textbox">
				</div>
			</div>
			
			<div class="title">
				<%if(dto.getMovie_Grade().equals("전체관람가"))%>		<img src="./img/all.png">
				<%if(dto.getMovie_Grade().equals("12세이상관람가"))%>	<img src="./img/12.png">
				<%if(dto.getMovie_Grade().equals("15세이상관람가"))%>	<img src="./img/15.png">
				<%if(dto.getMovie_Grade().equals("청소년관람불가"))%>	<img src="./img/18.png">
				<strong><%=dto.getMovie_Title() %></strong>
				<span>
<%-- 				<span class="star_info"><%=rvdao.averageReviewScore(dto.getMovie_ID()) %></span> --%>
				</span>
			</div>
			
			<div>
				<%
				SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
				Calendar cal = Calendar.getInstance();
				String strToday = date.format(cal.getTime());
				System.out.println("Today=" + strToday);
				
				int intToday = Integer.parseInt(strToday);
				int rlsDate = Integer.parseInt(dto.getMovie_RlsDate());
				
				if(intToday < rlsDate) {
					%>
					<button type="button"  class="soonBtn">개봉예정</button>
					<%
				} else {
					%>
					<button type="button" class="resBtn" onclick="location.href='./Reservation.re'">예매하기</button>
					<%
				}
				%>
				<button type="button" class="resBtn" onclick="location.href='./MovieDetail.in?movie_ID=<%=dto.getMovie_ID() %>'">상세정보</button>
			</div>

		</span>
    <%
    }
%>
	</div>

		<!-- 페이징 -->
		<div id="paging">
		<%
		// 10 페이지 이전
		if(startPage > pageBlock){
		%>
			<a href="MovieList.in?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
		<%
		}
			for(int i = startPage; i <= endPage; i++){
				%>
				<a href="MovieList.in?pageNum=<%=i %>"><%=i %></a>
				<%
			}
		
		// 10 페이지 다음
		if(endPage < pageCount){
				%>
				<a href="MovieList.in?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
				<%
		}
		%>
		</div><br><br>


<!-- footer -->
<jsp:include page="../member/bottom.jsp"></jsp:include>
<!-- footer -->
</body>
</html>