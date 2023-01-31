$(document).ready(function() {
	// review textarea 글자 수 200byte 제한
	$('.reviewWriteForm textarea').keyup(function() {
		var revText = $(this).val();
		$('.reviewWriteForm .count span').html(revText.length);
		if (revText.length>200){
			alert("최대 200자까지 입력 가능합니다.");
			$(this).val(revText.substring(0, 200));
			$('.reviewWriteForm .count span').html(200);
		}
	});
	
	// 상단 올라가기 버튼
	var topEle = $('#topBtn');
	var delay = 600;
	topEle.on('click', function() {
		$('html, body').stop().animate({scrollTop: 0}, delay);
	});
	
	// (리뷰수정폼) 확인 버튼 클릭
    $('.updateBtn').click(function() {

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
    });
	
});
