<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="movie_screen_box">
		<ul class="tab_btn_type1">
			<li class=""><button type="button">
					<span>현재 상영작</span>
				</button></li>
			<li class="active"><button type="button">
					<span>상영 예정작</span>
				</button></li>
		</ul>
		<ul class="list_lnk" id="movietype1" style="display: none;">
			<li class=""><a href="#none" role="button">예매순</a></li>
			<li class=""><a href="#none" role="button">평점순</a></li>
			<li class=""><a href="#none" role="button">관람평 많은순</a></li>
			<li class=""><a href="#none" role="button">보고싶어요순</a></li>
		</ul>
		<ul class="list_lnk" id="movietype2" style="display: block;">
			<li class="on"><a href="#none" role="button">개봉일순</a></li>
			<li class=""><a href="#none" role="button">예매순</a></li>
			<li class=""><a href="#none" role="button">보고싶어요순</a></li>
		</ul>

	</div>
</body>
</html>