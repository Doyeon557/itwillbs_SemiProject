<%@page import="com.itwillbs.qnaBoard.db.qnaBoardDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>공지사항</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- PG크로스브라우징필수내용 -->
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<!-- // PG크로스브라우징필수내용 -->
<!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&amp;family=Source+Serif+Pro:wght@300;400;700&amp;display=swap"
	rel="stylesheet" />
<link href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css"
	rel="stylesheet" />
<link rel="canonical" href="https://www.feminique.kr/board/notice/1/" />
<link rel="stylesheet" type="text/css"
	href="./qnalist_css/froala_style_ec.min.css" />
<link rel="stylesheet" type="text/css"
	href="./qnalist_css/optimizer.css" />
<link rel="stylesheet" type="text/css"
	href="./qnalist_css/optimizer2.css" />

<!--리스트 css  -->
<link rel="stylesheet" type="text/css"
	href="./qnalist_css/froala_style_ec.min.css" />
<link rel="stylesheet" type="text/css"
	href="./qnalist_css/optimizer.css" />
<link rel="stylesheet" type="text/css"
	href="./qnalist_css/optimizer2.css" />
<!--리스트 css  -->



<meta charset="UTF-8">
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

#table_search {
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
List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardList");
int startPage = (Integer) request.getAttribute("startPage");
int pageBlock = (Integer) request.getAttribute("pageBlock");
int currentPage = (Integer) request.getAttribute("currentPage");
int endPage = (Integer) request.getAttribute("endPage");
int pageCount = (Integer) request.getAttribute("pageCount");
%>
<body>
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
   </div>
  </nav>     
	<br>
	<br>
	<!-- <h1><center>공지사항</center></h1> -->
	<br>
	<br>
	<br>
	<jsp:include page="../member/top.jsp"></jsp:include>

	<hr class="layout" />
	<div
		class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
		<div
			class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
			<div class="path"></div>
			<div class="titleArea w1000">
				<h2>
					<font color="#000000">Notice</font>
				</h2>
			</div>
			<p class="imgArea"></p>
		</div>
		<div class="boardSort">
			<span
				class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002 "></span>
		</div>
		<div class="ec-base-table typeList gBorder">
			<table border="1" summary="">
				<caption>공지사항 목록</caption>
				<thead
					class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
					<tr style="">
						<th scope="col">&nbsp;&nbsp;No.</th>
						<th scope="col">&nbsp;&nbsp;Title</th>
						<th scope="col">&nbsp;&nbsp;Name</th>
						<th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date</th>
						<th scope="col">&nbsp;&nbsp;View</th>
				</thead>
				<!--                 -->
				<tr style="background-color: #FFFFFF; color: #000000;"
					class="xans-record-">
				<tr style="background-color: #FFFFFF; color: #000000;"
					class="xans-record-">
					<%
					// 날짜 => 모양 문자열 변경
					for (int i = 0; i < boardList.size(); i++) {
						BoardDTO dto = boardList.get(i);
					%>
				
				<tr>
					<td><%=dto.getNotice_num()%></td>
					<td><a href="./BoardContent.bo?num=<%=dto.getNotice_num()%>">
							<%=dto.getNotice_title()%></a></td>
					<td><%=dto.getManager_Num()%></td>
					<td><%=dto.getNotice_date()%></td>
					<td><%=dto.getNotice_view()%></td>
				</tr>
				<%
				}
				%>
				</tbody>
			</table>

			<%
			//세션값이 있으면 (로그인 함) => 글쓰기 버튼 보이기
			if (id != null) {
				if (id.equals("admin")) {
			%>
			<form>
				<br> <br>
				<div align="right">
					<input type="button" class="btnEmFix" value="글쓰기 "
						onclick="location.href='./BoardWriteForm.bo'">
				</div>
				<br> <br>
			</form>
			<%
				}
			}
			%>
			
			
			<br>
			<br>
			<div
				class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
				<a href="?board_no=1&page=1" class="prev"> <img
					src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev.gif"
					alt="이전 페이지" /></a>
				<ol>
					<%
					if (startPage > pageBlock) {
					%>
					<a href="./BoardList.bo?pageNum=<%=startPage - pageBlock%>"
						class="this">Prev</a>
					<%
					}
					for (int i = startPage; i <= endPage; i++) {
					%>
					<a href="./BoardList.bo?pageNum=<%=i%>" class="this"><%=i%></a>
					<%
					}
					if (endPage < pageCount) {
					%><a href="./BoardList.bo?pageNum=<%=startPage + pageBlock%>"
						class="this">Next</a>
					<%
					}
					%>
					<li class="xans-record-"><a href="?board_no=1&page=1"
						class="this">1</a></li>
				</ol>
				<a href="?board_no=1&page=1" class="next"><img
					src="//img.echosting.cafe24.com/skin/base/common/btn_page_next.gif"
					alt="다음 페이지" /></a>
			</div>
			<p style="border: 0;"
				class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone "></p>
		</div>
		<div
			class="xans-element- xans-board xans-board-buttonlist-1002 xans-board-buttonlist xans-board-1002 ec-base-button displaynone ">
			<span class="gRight"> <!--             <a href="/board/free/write.html?board_no=1" class="btnSubmitFix sizeS displaynone">글쓰기</a> -->
			</span>
		</div>
	</div>

	<form id="boardSearchForm" name="" action="/board/free/list.html"
		method="get" target="_top" enctype="multipart/form-data">
		<input id="board_no" name="board_no" value="1" type="hidden" /> <input
			id="page" name="page" value="1" type="hidden" />
	</form>

	<div id="tgg_common_bottom_script" style="display: none;">
		<div id="wp_tg_cts" style="display: none;"></div>
		<script type="text/javascript" defer
			src="//cdn-aitg.widerplanet.com/js/wp_astg_2.0_mall.js"></script>
	</div>

	<jsp:include page="../member/bottom.jsp"></jsp:include>
</body>
</html>