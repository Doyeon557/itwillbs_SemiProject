<%@page import="com.itwillbs.qnaBoard.db.qnaBoardDTO"%>
<%@page import="com.itwillbs.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style>
<style>

* {
/* 	margin: 3px 0; */
}
element.style {
float: right
}

.controller {
	padding: 25px 0;
	margin: auto;
	width: 840px;
	font-size: 35px;
}

.controller table {
	font-size: 15px;
}

#wriTitle{
	text-align: center;
	background-color: rgb(100, 100, 100);
	width: 800px;
	height: 40px;
	padding: 12px 0;
	color: white;
}
table {
	width: 840px;
	margin: 25px 0;
	padding: 20px;
	border-collapse: collapse;
}

#category {
	width: 100px;
	height: 30px;
}

#title {
	width: 400px;
	height: 24px;
}

textarea {
	width: 800px;
	height: 400px;
}

.button {
	width: 90px;
	padding: 5px 10px;
	border: none;
	background-color: rgb(150, 60, 60);
	color: white;
}

button {
	padding: 5px 12px;
	background-color: white;
	border-color: rgb(180, 180, 180);
	border-width: 3px;
}

.resButton {
	background-color: #503396;
	border: none;
	color: white;
	padding: 10px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 12px;
	font-size: 16px;
}

textarea {
	resize: none;
}
</style>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<div><jsp:include page="../member/top.jsp"></jsp:include></div>	
<body>
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
qnaBoardDTO dto = (qnaBoardDTO)request.getAttribute("dto");
//TODO 하드코딩해둠
// String id1 = "admin";
%>
<br>
<br>	
	<div class="controller">
	<div id="wriTitle"><b>1:1 문의게시판</b></div>
		<form action="memberUpdate.do" method="post" name="frm">
<br>
<br>
<br>
	<table>
		<tr>
			<td>글번호</td><td><%=dto.getQna_num() %></td><
		</tr>
		<tr>
			<td>글작성자</td><td><%=dto.getUser_ID() %></td>
		</tr>
		<tr>
			<td>제 목</td><td><%=dto.getQna_title() %></td>
		</tr>
		<tr>
			<td>글내용</td><td><%=dto.getQna_content() %></td>
		</tr>
		<tr>
			<td>등록일</td><td><%=dto.getQna_date() %></td>
		</tr>
<tr><td colspan="2">

<% 
//세션값 가져오기
String id=(String)session.getAttribute("id");
if(dto.getUser_ID().equals(id)){
	%>
<input type="button" value="문의글수정" 
	   onclick = "location.href='./QnaBoardUpdateForm.ao?Qna_num=<%=dto.getQna_num() %>'">
<input type="button" value="문의글삭제" 
	   onclick = "location.href='./QnareplyBoardDelete.ao?Qna_num=<%=dto.getQna_num() %>'">
	<%
} else if(id.equals("admin")) { //TODO 고치기
	%>
<input type="button" value="문의글수정" 
	   onclick = "location.href='./QnaReplyBoardUpdateForm.ao?Qna_num=<%=dto.getQna_num() %>'">
<input type="button" value="문의글삭제" 
	   onclick = "location.href='./QnareplyBoardDelete.ao?Qna_num=<%=dto.getQna_num() %>'">	
<input type="button" value="답변하기" 
   onclick = "location.href='./QnaReplyForm.ao?Qna_num=<%=dto.getQna_num()%>'">
	<%
}
	%>
<input type="button" value="글목록"  onclick = "location.href='./QnaBoardList.ao?'">
</td></tr>
</table>
</form>
</div>
<br>
<br>
<br>
<jsp:include page="../member/bottom.jsp"></jsp:include>
</body>
</html>