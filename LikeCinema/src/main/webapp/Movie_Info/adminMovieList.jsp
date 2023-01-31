<%@page import="com.itwillbs.movie_Info.db.Movie_InfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.movie_Review.db.Movie_ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="./css/adminMovieList.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div><jsp:include page="../member/top.jsp"></jsp:include></div>	
<% 
String id = (String)session.getAttribute("id");
%> 
<!-- Sidebar/menu -->
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
   	 	if(id != null){ // 로그인은 한상태
   	 		if(id.equals("admin")) {
   	 			%>
  	 			<a href="./AdminMovieList.in" class="w3-bar-item w3-button">영화관리</a>
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


<h1>영화 관리</h1>

<%
Movie_ReviewDAO rvdao = new Movie_ReviewDAO();

List<Movie_InfoDTO> movieList=(List<Movie_InfoDTO>)request.getAttribute("movieList");
int startPage=(Integer)request.getAttribute("startPage");
int endPage=(Integer)request.getAttribute("endPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int currentPage=(Integer)request.getAttribute("currentPage");
int pageCount=(Integer)request.getAttribute("pageCount");
%>
	
	<div class="container1">
		<input type="button" value="영화등록" class="revBtn1" onclick="window.open('./MovieInsertForm.in','영화 등록', 'width=800, height=650, left=360, top=50');">
		<table class="movieList">
		<tr>
			<th width="50px">포스터</th><th>영화ID</th><th>영화명</th><th>감독</th><th>개봉일</th><th>출연</th>
			<th>나라</th><th>장르</th><th>등급</th><th>러닝타임(분)</th>
<!-- 			<td>예고편</td><td>줄거리</td> -->
			<th colspan="2">관리</th>
		</tr>
		 <%
    	for(int i = 0; i < movieList.size(); i++) {
    	Movie_InfoDTO dto=movieList.get(i);
   		 %>
		<tr>
			<td width="70px"><img src="./img/<%=dto.getMovie_Picture() %>" width="25px"></td>
			<td width="90px"><%=dto.getMovie_ID() %></td>
			<td width="300px"><%=dto.getMovie_Title() %></td>
			<td><%=dto.getMovie_Director() %></td>
			<td><%=dto.getMovie_RlsDate() %></td>
			<td width="150px"><%=dto.getMovie_Cast() %></td>
			<td  width="90px"><%=dto.getMovie_Country() %></td>
			<td><%=dto.getMovie_Genre() %></td>
			<td><%=dto.getMovie_Grade() %></td>
			<td><%=dto.getMovie_RunTime() %></td>
<%-- 			<td><%=dto.getMovie_Video() %></td> --%>
<%-- 			<td><%=dto.getMovie_Story() %></td> --%>
			<td>
			<input type="button" value="수정" class="revBtn2" onclick="window.open('./MovieUpdateForm.in?movie_ID=<%=dto.getMovie_ID() %>','영화 수정', 'width=800, height=650, left=360, top=50');">
			</td>
			<td>
			<a href="./MovieDelete.in?movie_ID=<%=dto.getMovie_ID() %>" class="revBtn2" onclick="return confirm('삭제하신 영화는 복구할 수 없습니다. \n정말 영화를 삭제하시겠습니까?');">삭제</a>
			</td>
		</tr>


	    <%
	    }
		%>
	</table>
	</div>

		<!-- 페이징 -->
		<div id="paging">
		<%
		// 10 페이지 이전
		if(startPage > pageBlock){
		%>
			<a href="AdminMovieList.in?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
		<%
		}
			for(int i = startPage; i <= endPage; i++){
				%>
				<a href="AdminMovieList.in?pageNum=<%=i %>"><%=i %></a>
				<%
			}
		
		// 10 페이지 다음
		if(endPage < pageCount){
				%>
				<a href="AdminMovieList.in?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
				<%
		}
		%>
		</div><br><br>


<jsp:include page="../member/bottom.jsp"></jsp:include>
</body>
</html>