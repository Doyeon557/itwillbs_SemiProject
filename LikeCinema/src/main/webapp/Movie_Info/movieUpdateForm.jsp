<%@page import="com.itwillbs.movie_Info.db.Movie_InfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>movieUpdateForm</title>
<link href="./css/movieInsertForm.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./script/movieInsertForm.js"></script>
<script>
$(function() {

    $("#searchBtn").click(function() {
		let search =  $("#search").val();
		let url2 = "https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=f5eef3421c602c6cb7ea224104795888&movieNm="+search
				
		$.getJSON(url2, function(data) {
			let List2 = data.movieListResult.movieList;
			$("#list").empty();
			$("#list").append(search +" 검색 결과<br>");
            for(let i in List2){
                $("#list").append("<div class='movie' id="+List2[i].movieCd+">"+(parseInt(i)+1)+". " + List2[i].movieNm+"</div><hr>");
            }
		})
    
    })
    
    //영화 제목 클릭시 영화 정보 출력
    	$("#list").on("click",".movie", function(){
        let d = $(this);
        let movieCd = d.attr("id");
        let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=69bf9abe51a89b5e644877846eb15b18&movieCd="+movieCd;
        $.getJSON(url,function(res){
            let movie = res.movieInfoResult.movieInfo;
            $('input[name=movie_ID]').attr('value', movie.movieCd);
            $('input[name=movie_Title]').attr('value', movie.movieNm);
        	if(movie.genres[0] == null){
     			$('input[name=movie_Genre]').attr('value', "");
        	}else if(movie.genres[1] == null) {
     			$('input[name=movie_Genre]').attr('value', movie.genres[0].genreNm);
            } else {
     			$('input[name=movie_Genre]').attr('value', movie.genres[0].genreNm + ", " + movie.genres[1].genreNm);
            }
            if(movie.nations[0] == null) {
                $('input[name=movie_Country]').attr('value', "");
            }else {
                $('input[name=movie_Country]').attr('value', movie.nations[0].nationNm);
            }
			if(movie.directors[0] == null) {
	            $('input[name=movie_Director]').attr('value', "");
			}else{
	            $('input[name=movie_Director]').attr('value', movie.directors[0].peopleNm);
			}
            if(movie.actors[0] == null) {
                $('input[name=movie_Cast]').attr('value', "");
            } else if(movie.actors[1] == null){
            	$('input[name=movie_Cast]').attr('value', movie.actors[0].peopleNm);
            } else if(movie.actors[2] == null) {
            	$('input[name=movie_Cast]').attr('value', movie.actors[0].peopleNm + ", " + movie.actors[1].peopleNm);
            }else {
            	$('input[name=movie_Cast]').attr('value', movie.actors[0].peopleNm + ", " + movie.actors[1].peopleNm + ", " + movie.actors[2].peopleNm);
            }
            if(movie.audits[0] == null) {
                $('input[name=movie_Grade]').attr('value', "")
            }else {
                $('input[name=movie_Grade]').attr('value', movie.audits[0].watchGradeNm)
            }
            $('input[name=movie_RunTime]').attr('value', movie.showTm);
            $('input[name=movie_RlsDate]').attr('value', movie.openDt);
        })
    })
});//ready
</script>

</head>
<body>

<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
String movie_ID=request.getParameter("movie_ID"); 
Movie_InfoDTO dto=(Movie_InfoDTO)request.getAttribute("dto");

%>  
<div id="movieInsert">
<p id="title">영화 수정</p>

	<div id="movieInsert-left">
	
		영화 검색 <input type="text" id="search" size="30" value=""><button type="submit" id="searchBtn">확인</button><br>
		<div id="list">
		
		</div>
	</div>

	<div id="movieInsert-right">
	
	<form action="./MovieUpdatePro.in" method="post" enctype="multipart/form-data">
	
	<label for="movie_ID">영화ID</label>
	<input type="text" id="movie_ID" name="movie_ID" value="<%=dto.getMovie_ID() %>" readonly><br>
	<label for="movie_Title">제목</label>
	<input type="text" id="movie_Title" name="movie_Title" value="<%=dto.getMovie_Title() %>" readonly><br>
	<label for="movie_Genre">장르</label>
	<input type="text" id="movie_Genre" name="movie_Genre" value="<%=dto.getMovie_Genre() %>" ><br>
	<label for="movie_Country">나라</label>
	<input type="text" id="movie_Country" name="movie_Country" value="<%=dto.getMovie_Country() %>" ><br>
	<label for="movie_Director">감독</label>
	<input type="text" id="movie_Director" name="movie_Director" value="<%=dto.getMovie_Director() %>" ><br>
	<label for="movie_Cast">출연</label>	
	<input type="text" id="movie_Cast" name="movie_Cast" value="<%=dto.getMovie_Cast() %>" ><br>
	<label for="movie_Grade">등급</label>	
	<input type="text" id="movie_Grade" name="movie_Grade" value="<%=dto.getMovie_Grade() %>" ><br>
	<label for="movie_RunTime">상영시간</label>
	<input type="text" id="movie_RunTime" name="movie_RunTime" value="<%=dto.getMovie_RunTime() %>" ><br>
	<label for="movie_RlsDate">개봉</label>	
	<input type="text" id="movie_RlsDate" name="movie_RlsDate" value="<%=dto.getMovie_RlsDate() %>" ><br>
	<label for="movie_Video">예고편</label>
	<input type="text" id="movie_Video" name="movie_Video" value="<%=dto.getMovie_Video() %>" ><br>
<%-- 	줄거리 <input type="text" id="movie_Story" name="movie_Story" value="<%=dto.getMovie_Story() %>" ><br> --%>
	<label for="movie_Story">줄거리</label><br>
	<textarea name="movie_Story" id="movie_Story" rows="5" cols="35"><%=dto.getMovie_Story() %></textarea><br>
	<label for="movie_Picture">포스터</label><br>
	<input type="file" name="movie_Picture"> <%=dto.getMovie_Picture() %>
	<input type="hidden" name="oldfile" value="<%=dto.getMovie_Picture() %>"> <br>
	<button type="submit" id="insertBtn">등록</button>
	</form>
	
	
	</div>

</div>


</body>
</html>