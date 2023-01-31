<%@page import="com.itwillbs.movie_Info.db.Movie_InfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.movie_Review.db.Movie_ReviewDAO"%>
<%@page import="com.itwillbs.movie_Review.db.Movie_ReviewDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Review List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- myReviewList css, 별점 css, 웹 폰트 -->
<link href="./css/myReviewList.css" rel="stylesheet" type="text/css">
<link href="./css/star.css" rel="stylesheet" type="text/css">

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
<!-- Sidebar/menu -->
<nav class="w3-sCidebar w3-bar-block w3-white w3-collapse w3-top" style="width:200px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
<!--     <h3 class="w3-wide"><b>LOGO</b></h3> -->
  </div>
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="BoardList.bo" class="w3-bar-item w3-button">공지사항</a>
    <a href="#" class="w3-bar-item w3-button">1:1문의</a>
    <a onclick="myAccFunc()" href="javascript:void(0)" class="w3-button w3-block w3-white w3-left-align" id="myBtn">
      회원정보 <i class="fa fa-caret-down"></i>
    <a href="./MyReviewList.in" class="w3-bar-item w3-button">My Review</a>
    </a>
    <div id="demoAcc" class="w3-bar-block w3-hide w3-padding-large w3-medium">
      <a href="MemberRecheckForm.me" class="w3-bar-item w3-button w3-light-grey"><i class="fa fa-caret-right w3-margin-right"></i>회원정보 수정</a>
      <a href="#" class="w3-bar-item w3-button">Relaxed</a>
      <a href="#" class="w3-bar-item w3-button">Bootcut</a>
      <a href="#" class="w3-bar-item w3-button">Straight</a>
    </div>
    <a href="#" class="w3-bar-item w3-button">Jackets</a>
    <a href="#" class="w3-bar-item w3-button">Gymwear</a>
    <a href="#" class="w3-bar-item w3-button">Blazers</a>
    <a href="#" class="w3-bar-item w3-button">Shoes</a>
  </div>
</nav>
<!-- Sidebar/menu -->
<br>
<br>
<br>

<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
Movie_ReviewDAO rvdao = new Movie_ReviewDAO();

List<Movie_ReviewDTO> myReviewList=(List<Movie_ReviewDTO>)request.getAttribute("myReviewList");
int startPage=(Integer)request.getAttribute("startPage");
int endPage=(Integer)request.getAttribute("endPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int currentPage=(Integer)request.getAttribute("currentPage");
int pageCount=(Integer)request.getAttribute("pageCount");
%>  
<p>My Review</p>
<div>

	<div>영화 포스터</div>
	<div>영화 타이틀</div>
	<div>리뷰 텍스트</div>
	<div>수정/삭제 버튼</div>

</div>

<div class="myReview">
	<table>
	<%
    	SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
    	for(int i = 0; i < myReviewList.size(); i++) {
    	Movie_ReviewDTO rvdto=myReviewList.get(i);
    %>	
		<tr><td class="reviewId"><b><%=rvdto.getUser_ID().replaceAll("(?!.{3}).", "*") %></b></td>
   			<% if(rvdto.getReview_Score() == 1.0) %> <td class="starImg"><img src="./img/star1.png"></td>
   			<% if(rvdto.getReview_Score() == 2.0) %> <td class="starImg"><img src="./img/star2.png"></td>
   			<% if(rvdto.getReview_Score() == 3.0) %> <td class="starImg"><img src="./img/star3.png"></td>
			<% if(rvdto.getReview_Score() == 4.0) %> <td class="starImg"><img src="./img/star4.png"></td>
  			<% if(rvdto.getReview_Score() == 5.0) %> <td class="starImg"><img src="./img/star5.png"></td>
    	  	<td>
   	  			<%
   	  			if(rvdto.getUser_ID().equals(id)) {  
   				%>
   		 		<a href="./MovieReviewDelete.in?Review_Num=<%=rvdto.getReview_Num() %>" class="revBtn2" onclick="return confirm('삭제하신 관람평은 복구할 수 없습니다. \n정말 관람평을 삭제하시겠습니까?');">삭제</a>
				<input type="button" value="수정" class="revBtn2" onclick="window.open('./MovieReviewUpdateForm.in?Review_Num=<%=rvdto.getReview_Num() %>','관람평 수정', 'width=445, height=400, left=500, top=100');">
   	  		</td></tr>
   				<%  
   	  			} 
   	  			%>

		<tr><td colspan="3"><%=rvdto.getReview_Text() %></td></tr>
		<tr><td colspan="3" class="reviewDate"><%=dateFormat.format(rvdto.getReview_Date()) %>
		<input type="hidden" id="reviewNum" value="<%=rvdto.getReview_Num()%>"></td></tr>
    <%
    }
	%>
	</table>
</div>



<jsp:include page="../member/bottom.jsp"></jsp:include>
</body>
</html>