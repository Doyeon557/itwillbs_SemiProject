/**
 * 
 */
 //jQuery url
	/*<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>*/
	
	function loadJQuery() {
    var oScript = document.createElement("script");
    oScript.type = "text/javascript";
    oScript.charset = "utf-8";		  
    oScript.src = "http://code.jquery.com/jquery-latest.js";	
    document.getElementsByTagName("head")[0].appendChild(oScript);
}
	
    $(document).ready(function () {
        var seatSum = [];
        //영화관 선택
        $('.cinema-choice-list>li>button').on('click', function () {
          $(".cinema-choice-list>li>button").removeClass("active");
          $(this).addClass("active");
          $('.choice-list-detail').removeClass("on");
          $(this).siblings('.choice-list-detail').addClass("on");
        });
        
        //영화도시,관람일
        $('.cinema-choice-list').on('click', '.choice-list-detail>li>button', function () {
          $(".choice-list-detail>li>button").removeClass("active");
          $(this).addClass("active");
          if (!$(this).hasClass('active')) {
            $('.date_choice>dd>.choice-list').removeClass('on');
          } else {
            $('.date_choice>dd>.select-message').hide();
            $('.date_choice .choice-list').addClass('on');
          }
        });
        
        //관람일 선택
        $(document).on('click', '.date_choice .choice-list>li>button', function () {
          $(".date_choice .choice-list>li>button").removeClass("active");
          $(this).addClass("active");
          $('#txtDate').text($(this).text());
        });
        
        // 관람시간
        $(document).on('click', '.date_choice .choice-list>li>button', function () {
          if (!$(this).hasClass('active')) {
            $('.time_choice>dd>.choice-list').removeClass('on');
          } else {
            $('.time_choice>dd>.select-message').hide();
            $('.time_choice .choice-list').addClass('on');
          }
        });
        
        //관심시간 선택
        $(document).on('click', '.time_choice .choice-list>li>button', function () {
          $(".time_choice .choice-list>li>button").removeClass("active");
          $(this).addClass("active");
          $('#txtTime').text($(this).text());
        });
       //});
	//----------------------------------------------------------------------
 	//$(document).ready(function(){
// 		//관람시간 선택
// 		${document}.on('click', '#dateList>li>button',function(){
// 			dates = $(this).val;
// 			$.ajax({
// 				url: '//ReservationForm.re'
// 				type: 'post',
// 				success: function (data) {
// 					console.log(data);
// 					var timeList = "";
// 					$.each(data, function (index, item) {
// 						timeList += "<li><button value=" + item + ">" + item + "</button><li>"
// 					});
// 					$("#timeList").html(timeList);
// 					},error: function () {
// 						console.log("실패")
// 					}
// 				} //관람 ajex 종료
// 			}) //관람시간 선택
// 		})
		
		//${'#movielist'}.click(function(){
			alert("영화를 고르세요");
			/*$.ajax({
				url: "./ReserveMovieList.re",
				dateType: 'json',
				success:function(){
					
				}//success
			});//ajax */
		//}); //movie_list.click
	});
	
	
	
	
	
	
	