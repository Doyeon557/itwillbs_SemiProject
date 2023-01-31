<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(function() {
    let y = new Date();
    y.setDate(y.getDate()-1);
    let str = y.getFullYear() + "-"
    + ("0" + (y.getMonth() + 1)).slice(-2) + "-"
    + ("0" + y.getDate()).slice(-2);
    $("#date").attr("max",str);

    // 버튼의 클릭 이벤트
    $("#mybtn").click(function() {
        let d = $("#date").val();//YYYY-MM-dd
        const regex = /-/g;
        let d_str = d.replace(regex,"")//YYYYMMdd 
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=69bf9abe51a89b5e644877846eb15b18&targetDt="+d_str

         $.getJSON(url, function(data) {
             let movieList = data.boxOfficeResult.dailyBoxOfficeList;
             $("#list").empty();
             $("#list").append(d+" 박스 오피스 순위<br>");
             for(let i in movieList){
                 $("#list").append("<div class='movie' id="+movieList[i].movieCd+">"+(parseInt(i)+1)+". "+movieList[i].movieNm+"</div><hr>");
             }
            });
    });//button click
    
    $("#searchBtn").click(function() {
		let search =  $("#search").val();
		let url2 = "https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=f5eef3421c602c6cb7ea224104795888&movieNm="+search
				
		$.getJSON(url2, function(data) {
			let List2 = data.movieListResult.movieList;
			$("#list").empty();
			$("#list").append(search +" 검색 결과<br>");
            for(let i in List2){
                $("#list").append("<div class='movie' id="+List2[i].movieCd+">" + (parseInt(i)+1) + ". " + List2[i].movieNm + " | 감독: " + List2[i].directors[0].peopleNm + " | 개봉: " + List2[i].openDt+"</div><hr>");
            }
		})
    
    })
    
    //영화 제목 클릭시 영화 정보 출력
//     $("#boxoffice").on("click",".movie", function(){
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

<div id="top" text-align="center">

영화 검색 <input type="text" id="search" size="50" value=""><button type="submit" id="searchBtn">확인</button><br>
<div id="list">

</div>

<input type="date" id="date"><button type="button" id="mybtn">확인</button>
<div id="boxoffice">
    박스 오피스 순위<br>
</div>
</div>

<div id="bottom">

<form action="">

영화ID <input type="text" id="movie_ID" name="movie_ID" value="" readonly><br>
제목 <input type="text" id="movie_Title" name="movie_Title" value="" readonly><br>
장르 <input type="text" id="movie_Genre" name="movie_Genre" value=""><br>
나라 <input type="text" id="movie_Country" name="movie_Country" value=""><br>
감독 <input type="text" id="movie_Director" name="movie_Director" value=""><br>
출연 <input type="text" id="movie_Cast" name="movie_Cast" value=""><br>
등급 <input type="text" id="movie_Grade" name="movie_Grade" value=""><br>
상영시간 <input type="text" id="movie_RunTime" name="movie_RunTime" value=""><br>
개봉 <input type="text" id="movie_RlsDate" name="movie_RlsDate" value=""><br>
예고편 <input type="text" id="movie_Video" name="movie_Video" value=""><br>
줄거리 <input type="text" id="movie_Story" name="movie_Story" value=""><br>
포스터 <input type="text" id="movie_Picture" name="movie_Picture" value=""><br>

</form>


</div>






</body>
</html>