<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>마이페이지</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>
</head>
<!-- <body class="w3-content" style="max-width:1500px"> -->
  <header>
<jsp:include page="../member/top.jsp"></jsp:include>
 </header>
  <br>
  <br>
   <br>
  <br>
  <br>
  <br>
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

  
  <div class="w3-display-container w3-container">
    <center><img src="board/dd_mv_img1 (1).jpg" alt="Jeans" style="width:50%"></center>
  </div>
  
<script>
// Accordion 
function myAccFunc() {
  var x = document.getElementById("demoAcc");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}

// // Click on the "Jeans" link on page load to open the accordion for demo purposes
// document.getElementById("myBtn").click();


// Open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}
</script>  
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="../member/bottom.jsp"></jsp:include>
</html>


