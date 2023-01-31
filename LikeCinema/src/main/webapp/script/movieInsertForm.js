$(document).ready(function() {
    $('#insertBtn').click(function() {

     	let movie_ID = $('#movie_ID').val();
    	if (movie_ID == ""){
			alert("영화 ID를 입력하세요.");
			return false;
    	}
    })
});
