<%-- <%@page import="java.text.SimpleDateFormat"%> --%>
<%@page import="com.itwillbs.qnaBoard.db.qnaBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>qnaboard/list.jsp</title> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.w3-sidebar a {
	font-family: "Roboto", sans-serif
}

body, h1, h2, h3, h4, h5, h6, .w3-wide {
	font-family: "Montserrat", sans-serif;
}



#table_search{
 float: right
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<style type="text/css">

/* boardcss_list 에서 사용되는 글 등록 버튼 테이블 크기 */
#boardcss_list_add_button_table {
	width: 100%;
	margin: 0 auto 15px;
	/*position: relative; background: #bddcff; font-weight: bold;*/
}

/* 화면에 보여지는 글 등록 버튼 */
#boardcss_list_add_button_table .add_button {
	cursor: pointer;
	border: 1px solid #bebebe;
	position: absolute;
	right: 10px;
	top: 10px;
	width: 85px;
	padding: 6px 0 6px;
	text-align: center;
	font-weight: bold;
}

#boardcss_list_add_button_table .add_button a {
	color: #ffffff;
}

#boardcss_list_add_button_table .add_button {
	float: right
}
/* 글 등록 버튼과 글 목록이 겹치지 않게 만들어준 아무것도 아닌것 */
#boardcss_list_add_button_table .boardcss_list_add_button ul {
	width: 100%;
	overflow: hidden;
	height: 10px;
}

/* boardcss_list 에서 사용하는 글 목록 테이블 크기*/
.boardcss_list_table {
	width: 50%;
	font-size: 60px;
}

/* 화면에 보여지는 글 목록 테이블 */
.list_table {
	width: 100%;
}

/* 화면에 보여지는 caption */
.list_table caption {
	display: none;
}

/* list_table 에서 사용되는 thead */
.list_table thead th {
	text-align: center;
	border-top: 1px solid #e5e5e5;
	border-bottom: 1px solid #e5e5e5;
	padding: 8px 0;
	background: #faf9fa;
}

/* list_table 에서 사용되는 tbody */
.list_table tbody td {
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
	padding: 5px 0;
}

/* boardcss_list 에서 사용되는 글 검색 테이블 크기 */
#boardcss_list_search {
	width: 100%;
}

#boardcss_list_search ul {
	float: right;
	width: 550px;
	display: inline;
	margin-right: -130px;
}

#boardcss_list_search ul li {
	display: inline;
	font-weight: bold;
}

/* input 상자 모양 */
#search {
	width: 200px;
	height: 30px;
	text-align: center;
	border: 1px solid #cfcfcf;
	vertical-align: middle;
	line-height: 29px;
}

#search2 {
	width: 100px;
	height: 30px;
	text-align: center;
	border: 1px solid #cfcfcf;
	vertical-align: middle;
	line-height: 29px;
}

/* 검색 버튼 */
#boardcss_list_search ul li.search_button {
	cursor: pointer;
	width: 60px;
	text-align: center;
	border: 1px solid #bebebe;
	padding: 6px 0 6px;
	vertical-align: middle;
	font-weight: bold;
	margin-right: 10px; /* background: #77b32f; */
}

#boardcss_list_search ul li.search_button a {
	color: #ffffff;
}

/* 상세 검색버튼 */
#boardcss_list_search ul li.detail_button {
	cursor: pointer;
	width: 100px;
	text-align: center;
	border: 1px solid #bebebe;
	padding: 6px 0 6px;
	vertical-align: middle;
	font-weight: bold; /* background: #77b32f; */
}

#boardcss_list_search ul li.detail_button a {
	color: #ffffff;
}

/* 상세검색 테이블 */
.detailSearch {
	width: 100%;
	border-top: 1px solid #e5e5e5;
}

.detailSearch .detailSearch_table {
	width: 100%;
	border-top: 0;
	border-bottom: 1px solid #e5e5e5;
}

.detailSearch .detailSearch_table tbody td {
	padding: 5px 0;
}

.detailSearch .detailSearch_table tbody td.detailSearch_td {
	vertical-align: middle;
	height: 30px;
}

.detail_td {
	width: 100%;
	position: relative;
	height: 30px;
}

.detail_td .detailSearch_button {
	cursor: pointer;
	width: 54px;
	position: absolute;
	border: 1px solid #bebebe;
	padding: 6px 0 6px;
	text-align: center;
	font-weight: bold;
	right: 44px;
	display: block; /* background: #77b32f; */
}

.detail_td .detailSearch_button a {
	color: #ffffff;
}

/* 상세검색 닫기 */
.closeButton_table {
	width: 100%;
	text-align: right;
}

.closeButton {
	width: 85px;
	text-align: center;
	display: inline-block;
	border: 1px solid #bebebe;
	padding: 6px 0 6px;
	cursor: pointer;
	font-weight: bold;
}
</style>
<%
List<qnaBoardDTO> boardList=(List<qnaBoardDTO>)request.getAttribute("boardList"); //set저장한걸 get으로 호출 저장..
//1.11수정
// qnaBoardDTO dto = (qnaBoardDTO)request.getAttribute("dto");
//startPage pageBlock currentPage endPage pageCount
int startPage 	= (Integer)request.getAttribute("startPage"); 
int pageBlock 	= (Integer)request.getAttribute("pageBlock"); 
int currentPage = (Integer)request.getAttribute("currentPage"); 
int endPage 	= (Integer)request.getAttribute("endPage"); 
int pageCount	= (Integer)request.getAttribute("pageCount");

// String id = (String)session.getAttribute("id");
%>
<body>
<!-- 사이드바 -->
	<nav class="w3-sCidebar w3-bar-block w3-white w3-collapse w3-top"
		style="width: 200px" id="mySidebar">
		<div class="w3-container w3-display-container w3-padding-16">
			<i onclick="w3_close()"
				class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
			<!--     <h3 class="w3-wide"><b>LOGO</b></h3> -->
		</div>
		<div class="w3-padding-64 w3-large w3-text-grey"
			style="font-weight: bold">
			<a href="BoardList.bo" class="w3-bar-item w3-button">공지사항</a> <a
				href="#" class="w3-bar-item w3-button">1:1문의</a> <a
				onclick="myAccFunc()" href="javascript:void(0)"
				class="w3-button w3-block w3-white w3-left-align" id="myBtn">
				회원정보 <i class="fa fa-caret-down"></i>
			</a>
			<div id="demoAcc"
				class="w3-bar-block w3-hide w3-padding-large w3-medium">
				<a href="MemberRecheckForm.me"
					class="w3-bar-item w3-button w3-light-grey"><i
					class="fa fa-caret-right w3-margin-right"></i>회원정보 수정</a> <a href="#"
					class="w3-bar-item w3-button">Relaxed</a> <a href="#"
					class="w3-bar-item w3-button">Bootcut</a> <a href="#"
					class="w3-bar-item w3-button">Straight</a>
			</div>
			<a href="#" class="w3-bar-item w3-button">Jackets</a> <a href="#"
				class="w3-bar-item w3-button">Gymwear</a> <a href="#"
				class="w3-bar-item w3-button">Blazers</a> <a href="#"
				class="w3-bar-item w3-button">Shoes</a>
		</div>
	</nav>
<!--사이드바 끝  -->

<!-- 헤더영역  -->
		<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="../member/top.jsp"></jsp:include>
<!-- 헤더영역  -->
<!-- 1:1문의 테이블  -->
	<div class="container" style="font-size: 30px">
		<div class="panel panel-default">
			<div class="panel-heading">
				1:1 문의게시판
				<%
				//세션값 가져오기
				String id = (String) session.getAttribute("id");
				%>
				</div>
				<div class="panel-body">
					<table class="table table-hover table-bordered"
						style="font-size: 20px">
						<tr class="active">
							<td>번호</td>
							<td>제목</td>
							<td>등록일</td>
						</tr>
					
<!-- 이동버튼 수정해야됨! -->					

<!-- dto에서 가져와서 아이디값 비교한다음 글 목록 보이게 -->
 	<%
	for(int i = 0; i < boardList.size(); i++) { 
		qnaBoardDTO dto = boardList.get(i); 
		%> 
		<tr><td><%=dto.getQna_num() %></td>
		<td>
		<a href="./QnaBoardContent.ao?Qna_num=<%=dto.getQna_num() %>">
		<!--1.8수정  -->
		<% 
		/*수정해야됨*/
		int Qna_re_level = dto.getQna_re_level();
	
		if(Qna_re_level > 0){
 			for(int j=0; j<Qna_re_level; j++){
 				out.println("&nbsp&nbsp");
			}
		}
	 	/*수정해야됨*/
	 	%> 
		<%=dto.getQna_title() %></a>
	</td>
	<td><%=dto.getQna_date() %></td></tr>	
	<%
		}
	%>
	
 	</table>
<!--   </tr> -->
<!-- </table> -->
</div>
	<div class="panel-body">
			<%
			//세션값이 있으면 (로그인 함) => 글쓰기 버튼 보이기
			if (id != null) {
// 				if (id.equals("admin")) { //TODO 고쳐야한다!
			%>
			<div id="table_search">
				<input type="button" value="문의글 쓰기" class="btn"
					onclick="location.href='./QnaBoardWriteForm.ao'">
			</div>
			<%
			}
// 			}
			%>
			
<!--페이지처리 시작 -->
		<center>
			<div class="clear"></div>
			<div id="page_control">
<%

//10페이지 이전
if(startPage > pageBlock) { 
	%> 
	<a href="./QnaBoardList.ao?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
	<%
}
if(currentPage != 1){ 
	%> 
	<%
} 
for(int i = startPage; i <= endPage; i++){
	%>
	<tr>
	<td align="center"><a href="./QnaBoardList.ao?pageNum=<%=i%>"><%=i %></a></td>
	</tr>
	<%
}
if(currentPage < pageCount) {
	%>
	<%
}
if(endPage < pageCount) {
	%>
	<a href="./QnaBoardList.ao?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
	<%
}
%>
	</div>
				</center>
			</div>
		</div>
		<!-- 		</tbody> -->
		<!-- 	</table> -->
	</div>
	<!-- 테이블 종료 -->
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- <div style="margin-left:250px"></div> -->
	<jsp:include page="../member/bottom.jsp"></jsp:include>
</body>
</html>













<!-- 아님요!!!  -->
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>




<!-- 살려주세용  -->
<!-- <a href="./MemberMain.me">1:1 문의하기</a><br> -->
<!-- <a href="./QnaBoardWriteForm.ao">문의글 작성</a><br> -->
<!-- <table border="1"> -->
<!-- <tr><td>번호</td><td>제목</td><td>등록일</td></tr> -->
<%-- 	<% --%>
<!-- // 	for(int i = 0; i < boardList.size(); i++) {  -->
<!-- // 		qnaBoardDTO dto = boardList.get(i);  -->
<%-- 		%>  --%>
<%-- <tr><td><%=dto.getQna_num() %></td> --%>
<!-- 	<td> -->
<%-- 	<a href="./QnaBoardContent.ao?Qna_num=<%=dto.getQna_num() %>"> --%>
<!-- 	1.8수정  -->
<%-- 	<% --%>
<!-- // 	int Qna_re_level = dto.getQna_re_level(); -->
	
<!-- // 	if(Qna_re_level > 0){ -->
<!-- // 		for(int j=0; j<Qna_re_level; j++){ -->
<!-- // 			out.println("&nbsp"); -->
// 		}
// 	}
<%-- 	%> --%>
<%-- 	<%=dto.getQna_title() %></a> --%>
<!-- 	1.8수정  -->
	
	
<!-- 	</td> -->
<%-- 	<td><%=dto.getQna_date() %></td></tr>	 --%>
	
<%-- 		<% --%>
// 	}
<%-- %> --%>
<!-- </table> -->
<!-- <br> -->
<%-- <% --%>

// //10페이지 이전
// if(startPage > pageBlock) { // 10페이지 이전은 startpage가 10 초과일떄만 보여야함.
<%-- 	%>  --%>
<%-- 	<a href="./QnaBoardList.ao?pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a> --%>
<%-- 	<% --%>
// 	//기준값에서(startpage)에서 10(pageblock)을 빼주는것..ㅠ 뭔소리야..
// }

// // 이전 currentPage-1
// if(currentPage != 1){ //1페이지가 아닐때 감소시키는 버튼실행시키는 문법.. 페이지가 첫번째(0)은 안뜨게
<%-- 	%>  --%>
<%-- 	<a href="./BoardList.bo?pageNum=<%=currentPage-1%>">[1페이지 이전]</a> --%>
<%-- 	<% --%>
// } 

// for(int i = startPage; i <= endPage; i++){ //페이지목록
<%-- 	%> --%>
<%-- 	<a href="./QnaBoardList.ao?pageNum=<%=i%>"><%=i %></a> --%>
<%-- 	<% --%>
// }

// // 다음 currentPage +1
// if(currentPage < pageCount) { //현재 페이지와 마지막페이지가 같을때 또는 클때, 다음이 보이지 않게한다.
<%-- 	%> --%>
<%-- 	<a href="list.jsp?pageNum=<%=currentPage+1%>">[1페이지 다음]</a> --%>
<%-- 	<% --%>
// }

// //10페이지 다음
// if(endPage < pageCount) { //현재 페이지가 마지막페이지(pagecount)보다 작아야지 10개 다음이 보이기 때문
<%-- 	%> --%>
<%-- 	<a href="./QnaBoardList.ao?pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a> --%>
<%-- 	<% --%>
// }

<%-- %> --%>

<!-- </body> -->
<!-- </html> -->