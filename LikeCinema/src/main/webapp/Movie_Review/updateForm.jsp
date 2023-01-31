
<%@page import="com.itwillbs.movie_Review.db.Movie_ReviewDTO"%>
<%@page import="com.itwillbs.movie_Info.db.Movie_InfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관람평 수정</title>
<!-- ReviewUpdateForm css, 별점 css, 웹 폰트 -->
<link href="./css/ReviewUpdateForm.css" rel="stylesheet" type="text/css">
<link href="./css/star.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">
</head>
<body>

<% 
String movie_ID=request.getParameter("movie_ID");
Movie_InfoDTO dto=(Movie_InfoDTO)request.getAttribute("dto");
Movie_ReviewDTO rvdto=(Movie_ReviewDTO)request.getAttribute("rvdto");
%>

<script type="text/javascript" src="./script/jquery-3.6.3.js"></script>
<script type="text/javascript" src="./script/movieDetail.js"></script>
<script type="text/javascript">
function selfClose() {
	self.close();
}
</script>

<div class="reviewWriteForm">
	<p class="head">관람평 수정</p>
	<p class="title"><%=dto.getMovie_Title() %></p>
	<form action="./MovieReviewUpdatePro.in" class="update_review" method="post">
		<input type="hidden" name="movie_ID" id="movie_ID" value="<%=movie_ID %>">
		<input type="hidden" name="User_Id" value="<%=rvdto.getUser_ID() %>"> 
		<input type="hidden" name="Reserve_Num" value="<%=rvdto.getReserve_Num() %>"> 
		<input type="hidden" name="Review_Num" value="<%=rvdto.getReview_Num() %>">
		<div id="star">
			<input type="radio" name="Review_Score" id="star5" value="5"><label for="star5">★</label>
			<input type="radio" name="Review_Score" id="star4" value="4"><label for="star4">★</label>
			<input type="radio" name="Review_Score" id="star3" value="3"><label for="star3">★</label>
			<input type="radio" name="Review_Score" id="star2" value="2"><label for="star2">★</label>
			<input type="radio" name="Review_Score" id="star1" value="1"><label for="star1">★</label>
		</div>
		<table>
			<tr><td><textarea name="Review_Text"
							  id="Review_Text" 
							  rows="10" 
							  cols="62" 
							  ><%=rvdto.getReview_Text() %></textarea>
					<div class="count"><span>0</span>/200</div></td></tr>
			<tr><td colspan="2"><input type="button" value="닫기" class="closeBtn" onclick="selfClose()">
								<input type="submit" class="updateBtn" value="확인"></td></tr>
		</table>
	</form>
</div>
</body>
</html>