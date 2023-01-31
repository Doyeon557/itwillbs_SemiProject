<%@page import="java.util.Calendar"%>
<%@page import="com.itwillbs.reserve.db.ReserveDTO"%>
<%@page import="com.itwillbs.movie_Review.db.Movie_ReviewDAO"%>
<%@page import="com.itwillbs.movie_Info.db.Movie_InfoDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwillbs.movie_Review.db.Movie_ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화상세정보</title>
<!-- movieDetail css, 별점 css, 웹 폰트 -->
<link href="./css/movieDetail.css" rel="stylesheet" type="text/css">
<link href="./css/star.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">
</head>
<body>
<!-- header -->
<jsp:include page="../member/top.jsp"></jsp:include>
<!-- header -->

<%
String movie_ID=request.getParameter("movie_ID");
String id=(String)session.getAttribute("id");
Movie_InfoDTO dto=(Movie_InfoDTO)request.getAttribute("dto");
ReserveDTO rsdto=(ReserveDTO)request.getAttribute("rsdto");
Movie_ReviewDTO rvdto2=(Movie_ReviewDTO)request.getAttribute("rvdto2");
Movie_ReviewDAO rvdao = new Movie_ReviewDAO();
String Reserve_Num=rsdto.getReserveNum();
%>

<script type="text/javascript" src="./script/jquery-3.6.3.js"></script>
<script type="text/javascript" src="./script/movieDetail.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 관람평 작성 버튼 클릭
    $('#revBtn1').click(function() {
    	// 로그인 여부 확인
		let id = "${id}";
		if (id == ""){
			alert("관람평은 로그인 후 작성하실 수 있습니다.");
			return false;
    	}
		
		// 관람 내역 확인
		let Reserve_Num = $('#Reserve_Num').val();
		if (Reserve_Num == ""){
			alert("관람내역이 없습니다.");
			return false;
    	}
		
		// 1영화 1리뷰
    	let reviewNum = $('#reviewNum').val();
    	if (reviewNum != "0") {
    		alert("실관람평이 존재합니다. 확인해 주세요.");
    		return false;
    	}
		
		// 별점 체크 확인
		if ($("input:radio[name='Review_Score']").is(":checked")==false) {
			alert("평점을 선택하세요.");
			return false;
        }
		
		// 관람평 작성 확인
     	let Review_Text = $('#Review_Text').val();
    	if (Review_Text == ""){
			alert("관람평을 작성하세요.");
			return false;
    	}
    	
    	
    })
});
</script>

<!-- top -->
<div id="top">

	<div id="top-left"> 
		<!-- 포스터, 예매하기 버튼 -->
		<img src="./img/<%=dto.getMovie_Picture() %>"><br>
		
			
		<%
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		String strToday = date.format(cal.getTime());
		System.out.println("Today=" + strToday);
		
		int intToday = Integer.parseInt(strToday);
		int rlsDate = Integer.parseInt(dto.getMovie_RlsDate());
		
		if(intToday < rlsDate) {
			%>
			<a href="#" class="soonBtn">개봉예정</a>
			<%
		} else {
			%>
			<button type="button" class="resBtn" onclick="location.href='./Reservation.re'">예매하기</button>
			<%
		}
		%>

	</div>

	<div id="top-right">
		<div id="top-right-top">
			<!-- 관람등급이미지, 영화제목, 관람객평점 -->
			<%if(dto.getMovie_Grade().equals("전체관람가"))%>		<img src="./img/all.png">
			<%if(dto.getMovie_Grade().equals("12세이상관람가"))%>	<img src="./img/12.png">
			<%if(dto.getMovie_Grade().equals("15세이상관람가"))%>	<img src="./img/15.png">
			<%if(dto.getMovie_Grade().equals("청소년관람불가"))%>	<img src="./img/18.png">
			<p id="title"><%=dto.getMovie_Title() %></p>
			<p id="scoreAvg">관람객 평점: <b><%=rvdao.averageReviewScore(movie_ID) %></b> / 5.0</p>
			<hr class="hr1">
		</div>
		
		<div id="top-right-bottom">
			<!-- 장르, 개봉일, 러닝타임, 나라, 감독, 출연, 등급 -->
			장르	<b><%=dto.getMovie_Genre() %></b> | 
				<b><%=dto.getMovie_RlsDate() %></b> 개봉 | 
				<b><%=dto.getMovie_RunTime() %></b>분<br>
			나라	<b><%=dto.getMovie_Country() %></b><br>
			감독	<b><%=dto.getMovie_Director() %></b><br>
			출연	<b><%=dto.getMovie_Cast() %></b><br>
			등급	<b><%=dto.getMovie_Grade() %></b><br>
		</div>
		
	</div>
</div><!-- top -->

<!-- bottom -->
<div id="bottom">
	<div>
		<ul id="tab">
			<li><a href="#story">줄거리</a></li>
			<li><a href="#trailer">예고편</a></li>
			<li><a href="#comment">평점·관람평(<%=rvdao.countMovieReview(movie_ID) %>)</a></li>
		</ul>
	</div>
	
	<!-- #story -->
	<hr id="story" class="hr2">
	<p class="subject">줄거리</p>
	<p><%=dto.getMovie_Story() %><br></p><br><br>
	
	<!-- #trailer -->
	<hr id="trailer" class="hr2">
	<p class="subject">예고편</p>
		<div align="center">
			<iframe width="800" 
					height="535" 
					src="https://www.youtube.com/embed/<%=dto.getMovie_Video() %>" 
					title="YouTube video player" 
					frameborder="0" 
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
					allowfullscreen>
			</iframe>
		</div>
		<br><br>
	<!-- (지울예정)로그인 여부 확인 => 지우면서 <br><br> 추가하기 -->
	<!-- (지울예정)로그인 여부 확인 -->
	<!-- (지울예정)로그인 여부 확인 -->
<%-- 	<p><%=id %>님 로그인 완<br> --%>
<%-- 	예약정보: <%=Reserve_Num %></p> --%>

	
	<!-- #comment -->
	<hr id="comment" class="hr2">
	<div class="reviewWriteForm">
		<p class="subject">평점·관람평 작성</p>
		<form action="./MovieReviewWritePro.in" id="writeForm" method="post">
			<input type="hidden" name="movie_ID" value="<%=movie_ID %>">
			<input type="hidden" name="User_Id" value="<%=id %>"> <!-- id를 꼭 히든으로 넘겨야할까? -->
			<input type="hidden" name="Reserve_Num" id="Reserve_Num" value="<%=Reserve_Num %>">
			<fieldset>
				<div id="star">
					<input type="radio" name="Review_Score" id="star5" value="5"><label for="star5">★</label>
					<input type="radio" name="Review_Score" id="star4" value="4"><label for="star4">★</label>
					<input type="radio" name="Review_Score" id="star3" value="3"><label for="star3">★</label>
					<input type="radio" name="Review_Score" id="star2" value="2"><label for="star2">★</label>
					<input type="radio" name="Review_Score" id="star1" value="1"><label for="star1">★</label>
				</div>
			</fieldset>
			<table>
				<tr><td><textarea name="Review_Text" 
								  id="Review_Text" 
								  rows="5" 
								  cols="115"
								  placeholder="평점 및 영화 관람평을 작성해주세요."></textarea>
						<div class="count"><span>0</span>/200</div></td>
					<td><button type="submit" id="revBtn1">관람평작성</button></td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- reviewList -->
	<div id="reviewList">
		
		<p><b><%=dto.getMovie_Title() %></b>에 대한 <b><%=rvdao.countMovieReview(movie_ID) %></b>개의 관람평이 있어요!</p><br>
		
		<%
		List<Movie_ReviewDTO> reviewList=(List<Movie_ReviewDTO>)request.getAttribute("reviewList");
		int startPage=(Integer)request.getAttribute("startPage");
		int endPage=(Integer)request.getAttribute("endPage");
		int pageBlock=(Integer)request.getAttribute("pageBlock");
		int currentPage=(Integer)request.getAttribute("currentPage");
		int pageCount=(Integer)request.getAttribute("pageCount");
		%>
		
		<div id="container">
			<table>
			<%
	     	SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
		    for(int i = 0; i < reviewList.size(); i++) {
		    	Movie_ReviewDTO rvdto=reviewList.get(i);
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
	     		 		<a href="./MovieReviewDelete.in?movie_ID=<%=movie_ID %>&Review_Num=<%=rvdto.getReview_Num() %>" class="revBtn2" onclick="return confirm('삭제하신 관람평은 복구할 수 없습니다. \n정말 관람평을 삭제하시겠습니까?');">삭제</a>
						<input type="button" value="수정" class="revBtn2" onclick="window.open('./MovieReviewUpdateForm.in?movie_ID=<%=movie_ID %>&Review_Num=<%=rvdto.getReview_Num() %>','관람평 수정', 'width=445, height=400, left=500, top=100');">
	     	  		</td></tr>
	     				<%  
	     	  			} 
	     	  			%>
	
				<tr><td colspan="3"><%=rvdto.getReview_Text() %></td></tr>
				<tr><td colspan="3" class="reviewDate"><%=dateFormat.format(rvdto.getReview_Date()) %>
				<input type="hidden" id="reviewNum" value="<%=rvdto2.getReview_Num()%>"></td></tr>
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
			<a href="MovieDetail.in?movie_ID=<%=movie_ID %>&pageNum=<%=startPage-pageBlock%>">[10페이지 이전]</a>
		<%
		}
			for(int i = startPage; i <= endPage; i++){
				%>
				<a href="MovieDetail.in?movie_ID=<%=movie_ID %>&pageNum=<%=i %>"><%=i %></a>
				<%
			}
		
		// 10 페이지 다음
		if(endPage < pageCount){
				%>
				<a href="MovieDetail.in?movie_ID=<%=movie_ID %>&pageNum=<%=startPage+pageBlock%>">[10페이지 다음]</a>
				<%
		}
		%>
		</div><br><br>
		
		<div><span id="topBtn">top</span><br><br></div><br><br>
		
	</div><!-- reviewList -->
	
</div><!-- bottom -->

<!-- footer -->
<jsp:include page="../member/bottom.jsp"></jsp:include>
<!-- footer -->

</body>
</html>