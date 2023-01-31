<%@page import="com.itwillbs.reserve_Info.db.Reserve_InfoDTO"%>
<%@page import="com.itwillbs.reserve_Info.db.Reserve_InfoDAO"%>
<%@page import="com.itwillbs.movie_Info.db.Movie_InfoDTO"%>
<%@page import="com.itwillbs.movie_Info.db.Movie_InfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewForm</title>
<script language="javascript">
function selfClose() {
	self.close();
}
</script>

</head>
<body>
<%
// Movie_ID 값 가져오기
String movie_ID=request.getParameter("movie_ID");
Movie_InfoDAO dao=new Movie_InfoDAO();
Movie_InfoDTO dto=dao.getMovieInfo(movie_ID);
String User_Id=(String)session.getAttribute("User_Id");
Reserve_InfoDAO rdao=new Reserve_InfoDAO(); 
Reserve_InfoDTO rdto=rdao.getReserveInfo(movie_ID, User_Id);

%>
예매번호: <%=rdto.getReserve_Num() %>
<div>
	<%=User_Id %>님 로그인 완
	<h1>관람평 작성</h1>
	<!-- 영화이름 가져오기 -->
	<h3><%=dto.getMovie_Title() %></h3>
</div>

<form action="../Movie_Review/writePro.jsp" method="get" name="write_review" onsubmit="return check()">
	<input type="hidden" name="movie_ID" id="movie_ID" value="movie_ID">
	<input type="hidden" name="User_Id" id="User_Id" value="<%=User_Id %>">
<%-- 	<input type="hidden" name="Reserve_Num" id="Reserve_Num" value="<%=Reserve_Num %>"> --%>
	<label><input type="radio" name="Review_Score" id="Review_Score1" value="1">★</label>
	<label><input type="radio" name="Review_Score" id="Review_Score2" value="2">★★</label>
	<label><input type="radio" name="Review_Score" id="Review_Score3" value="3">★★★</label>
	<label><input type="radio" name="Review_Score" id="Review_Score4" value="4">★★★★</label>
	<label><input type="radio" name="Review_Score" id="Review_Score5" value="5">★★★★★</label>
	<table border="1">
		<tr><td><textarea name="Review_Text" 
							id="Review_Text"
						  rows="5" 
						  cols="120" 
				   placeholder="평점 및 영화 관람평을 작성해주세요.
주제와 무관한 리뷰 또는 스포일러는 표시 제한 또는 삭제될 수 있습니다.
작성하신 평점 및 관람평은 2조시네마 App, 홈페이지, SNS 등에 인용될 수 있습니다."></textarea></td>
						<td><button type="submit" class="btn btn-info">관람평쓰기</button></td>
					</tr>
				</table>
</form>


</body>
</html>