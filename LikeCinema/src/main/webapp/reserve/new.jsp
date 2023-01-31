<%@page import="com.itwillbs.member.db.MemberDTO"%>
<%@page import="com.itwillbs.reserveBoard.db.ReserveBoardDAO"%>
<%@page import="com.itwillbs.reserve.db.ReserveDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.reserve.db.ReserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>영화예매</title>
<link rel="stylesheet" href="./reserve/new.css">
<link rel="stylesheet" href="./member/assets/css/style19.css">
<link rel="stylesheet" href="./member/assets/css/swiper.css">
<link rel="stylesheet" href="./member/assets/css/reset19.css">

<link rel="stylesheet" href="./member/assets/css/common.css">
<link rel="stylesheet" href="./member/assets/css/reservation.css">

<!-- 영화선택 jQuery -->
<script type="text/javascript" src="./script/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="./script/jquery-3.6.3.js"></script>
<script type="text/javascript" src="./script/Reserve.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	$(document).ready(function () {
		
		//영화 고르면 지역 나옴
		var movieClick = document.querySelectorAll('#movie_click');
		movieClick.forEach(function(mbtn) {
			mbtn.onclick = function() {
				var movie = mbtn.value;
				document.getElementById('Movie_Id').value = movie;
				$('.locationList').empty();
				$('#selectedLocation').empty();
				$('.dateList').empty();
				$('#selectedDate').empty();
				$('.timeList').empty();
				$('#selectedTime').empty();
				
				console.log(movie);
				//선택한 영화 정보 가져오는 ajax
				$.ajax({
					url : './ReserveMovieInfo.re',
					type: 'post',
					data: {'movie': movie},
					dateType : 'json',
					success : function(object){
						var movieInfo = JSON.parse(object);
						console.log(movieInfo.title);
						$('#selectedMovie').html(movieInfo.title);
						document.getElementById('selectedMovie').value = movie;
						document.getElementById('Movie_Title').value = movieInfo.title;
						$('.ticket_movie_poster').html('<img class="poster" src="./img/'+ movieInfo.img +'" width="80">');
					},error(){
						console.log("선택한 영화 정보 가져오는 ajax 실패");
					}
				});
				// 영화 선택 시 지역 정보
				$.ajax({
					url : './ReserveLocationList.re',
					type: 'post',
					data: {'movie': movie},
					dateType : 'json',
					success : function(locationArr) {
						$.each(JSON.parse(locationArr), function(index, lo) {
							$('.locationList').append('<list><button id="location_click" value="'+lo.location+'"> 부산 ' + lo.location + '</button></list><br>')
							
							// 지역 고르면 관람날짜 나옴
							var locationClick = document.querySelectorAll('#location_click');
							locationClick.forEach(function(lbtn){
								lbtn.onclick = function() {
									var location = lbtn.value;
									$('#selectedLocation').html("부산 " + location);
									document.getElementById('selectedLocation').value = location;
									document.getElementById('Reserve_Location').value = location; //hidden value에 전달
// 									$('#selectedLocation').val(location); 최승현 천재 value값 부여
									$('.dateList').empty();
									$('#selectedDate').empty();
									$('.timeList').empty();
									$('#selectedTime').empty();
									
									console.log(movie, location);
									$.ajax({
										url : './ReserveDateList.re',
										type: 'post',
										data: {
											'movie':movie,
											'location':location},
										dateType : 'json',
										success : function(dateArr){
											$.each(JSON.parse(dateArr), function (index, da) {
												$('.dateList').append('<list><button id="date_click" value="'+da.date+'">' + da.date + '</button></list><br>')
												
												//날짜 고르면 상영 시작 시간 나옴
												var dateClick = document.querySelectorAll('#date_click');
												dateClick.forEach(function(dbtn){
													dbtn.onclick = function() {
														var date = dbtn.value;
														$('#selectedDate').html('상영 날짜: ' + date);
														document.getElementById('selectedDate').value = date;
														document.getElementById('Reserve_Date').value = date;
														$('.timeList').empty();
														$('#selectedTime').empty();
														console.log(movie, location, date);
														$.ajax({
															url: './ReserveTimeList.re',
															type: 'post',
															data:{
																'movie':movie,
																'location':location,
																'date':date},
															dateType: 'json',
															success :function(timeArr){
																$.each(JSON.parse(timeArr), function(index, ti) {
																	$('.timeList').append('<list><button id="time_click" value="'+ ti.time +'">' + ti.time + '</button></list><br>')
																	
																	var timeClick = document.querySelectorAll('#time_click');
																	timeClick.forEach(function(tbtn){
																		tbtn.onclick = function() {
																			var time = tbtn.value;
																			$('#selectedTime').html('상영 시간: ' + time);
																			document.getElementById('selectedTime').value = time;
																			document.getElementById('Reserve_Time').value = time;
																		}
																	});
																});
															},//dateClick_success
															error:function(request, status, error){
																alert("영화고르기 에러\n"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
															}
														});
													};
												});
											});
										},//locationClick_success
										error:function(request, status, error){
											alert("영화고르기 에러\n"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
										}
									});//location_ajax
								};
							});//locationClick
						});
					},//movieClick_success
					error:function(request, status, error){
						alert("영화고르기 에러\n"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});//movie_ajax
			};
		}); //movieClick
		 
	}); //ready
	
	
</script>

</head>
<body>

	<!-- 	 헤더들어가는 곳  -->
	<jsp:include page="../member/top.jsp"></jsp:include>
	<!-- 	 헤더들어가는 곳  -->

	<div id="container">
		<h2 class="ticket_title">영화예매</h2>

		<!-- 		 예매 영화 내역 정보  -->
		<div class="ticket_info_area">

			<ul class="ticket_info">

				<!-- 선택한 값이 뜨게 구현 -->

				<li><span class="ticket_movie_poster"></span> 
					<!--포스터 -->
					<div class="ticket_movie">
						<div class="ticket_info_title">영화</div>
						<div id="selectedMovie"></div>
					</div></li>

				<li>
					<div class="ticket_info_title">극장</div>
					<div id="selectedLocation"></div>
				</li>
				<li>
					<div class="ticket_info_title">관람일시</div>
					<div id="selectedDate"></div>
					<div id="selectedTime"></div>
				</li>

						<% 
						String seat = request.getParameter("Reserve_Seat"); // 좌석
						String ReserveAdult = request.getParameter("Reserve_Adult"); // 일반
						String ReserveTeenager = request.getParameter("Reserve_Teenager"); // 청소년
						String ReservePreferential = request.getParameter("Reserve_Preferential"); // 우대
						String ReservePayPrice = request.getParameter("Reserve_Pay_Price"); // 금액

						seat = seat == null ? "" : seat;
						ReserveAdult = ReserveAdult == null ? "" : ReserveAdult;
						ReserveTeenager = ReserveTeenager == null ? "" : ReserveTeenager;
						ReservePreferential = ReservePreferential == null ? "" : ReservePreferential;
						ReservePayPrice = ReservePayPrice == null ? "0" : ReservePayPrice;
 						%>

				<li>
	               <div class="ticket_info_title">결제금액</div>
	               <div class="ticket_price">
	                  <span><input type="text" class="ticket_price" id="Pay_Price" name="Pay_Price" value="" 
	                  style="color: white;  font-size: 24px; width: 200px; background: transparent; text-align:right; padding-right: 5px;"></span>원 
	               </div>
            	</li>

			</ul>
		</div>

		<!-- 예매 시작 -->
		<div class="layout_content reserve_wrap">
			<div class="box_step">

				<dl class="movie_choice">
					<dt>
						<span class="round">STEP 1</span>영화 선택
					</dt>
					<dd>
						<table class="choice_list" id="movielist">
							<%
							ReserveDTO reserveInfo = new ReserveDTO();

							ReserveDAO dao = new ReserveDAO();
							List<ReserveDTO> movieList = dao.ReserveMovieList();

							for (int i = 0; i < movieList.size(); i++) {
								ReserveDTO dto = movieList.get(i);
								String grade = dto.getMovieGrade().substring(0, 2);
								System.out.println(grade);
								if (grade.equals("12")) {
							%>
							<tr>
								<td><img src="./img/grade/12.jpg" width="20" height="20"><br></td>
								<td><button type="button" id="movie_click"
										value="<%=dto.getMovieId()%>">
										<%=dto.getMovieTitle()%></button></td>
							</tr>
							<%
							} else if (grade.equals("15")) {
							%>
							<tr>
								<td><img src="./img/grade/15.jpg" width="20" height="20"><br></td>
								<td><button type="button" id="movie_click"
										value="<%=dto.getMovieId()%>">
										<%=dto.getMovieTitle()%></button></td>
							</tr>
							<%
							} else if (grade.equals("18")) {
							%>
							<tr>
								<td><img src="./img/grade/18.jpg" width="20" height="20"><br></td>
								<td><button type="button" id="movie_click"
										value="<%=dto.getMovieId()%>">
										<%=dto.getMovieTitle()%></button></td>
							</tr>
							<%
							} else {
							%>
							<tr>
								<td><img src="./img/grade/all.jpg" width="20" height="20"><br></td>
								<td><button type="button" id="movie_click"
										value="<%=dto.getMovieId()%>">
										<%=dto.getMovieTitle()%></button></td>
							</tr>
							<%
							}
							}
							%>
						</table>
					</dd>
				</dl>


				<dl class="cinema_choice">
					<dt>
						<span class="round">STEP 2</span>영화관 선택
					</dt>
					<dd>
						<ul class="locationList"></ul>
					</dd>
				</dl>



				<dl class="date_choice">
					<dt>
						<span class="round">STEP 3</span>관람일 선택
					</dt>
					<dd>
						<ul class="dateList"></ul>
					</dd>
				</dl>

				<dl class="time_choice">
					<dt>
						<span class="round">STEP 4</span>관람시간 선택
					</dt>
					<dd>
						<ul class="timeList"></ul>
					</dd>
				</dl>

				<dl class="seat_choice">
					<dt>
						<span class="round">STEP 5</span>인원선택
					</dt>
					<dd>


						<form action="./SelectSeat.re" method="post" onsubmit="return checkSubmit()">
							<!-- onsubmit="return checkSubmit()" -->
							<!-- <p class="select_message">관람시간을 선택해주세요.</p> -->

							<div>
								<p class="select_caption">※ 최대 5명까지 선택가능 합니다.</p>
							</div>
							<br>

							<div class="seat-count" style="min-height: 52px">

								<div id="nopContainer" class="numberofpeople-select"
									style="min-width: 426px;">


									<div id="div2" class="select_person-area">
										<div class="group adult" id="nop_group_adult"
											style="display: block;">
											<span class="title">일반</span>
											<ul>
												<li data-count="0" id="memberzero" class="li selected"
													type="adult"><a href="#" onclick="return false;">
														<span class="sreader mod">일반</span>0<span class="sreader">명</span>
												</a></li>

												<li data-count="1" class="li" type="adult"><a href="#"
													onclick="return false;"> <span class="sreader mod">일반</span>1<span
														class="sreader">명</span></a></li>

												<li data-count="2" class="li" type="adult"><a href="#"
													onclick="return false;"> <span class="sreader mod">일반</span>2<span
														class="sreader">명</span></a></li>

												<li data-count="3" class="li" type="adult"><a href="#"
													onclick="return false;"> <span class="sreader mod">일반</span>3<span
														class="sreader">명</span></a></li>

												<li data-count="4" class="li" type="adult"><a href="#"
													onclick="return false;"> <span class="sreader mod">일반</span>4<span
														class="sreader">명</span></a></li>

												<li data-count="5" class="li" type="adult"><a href="#"
													onclick="return false;"> <span class="sreader mod">일반</span>5<span
														class="sreader">명</span></a></li>
											</ul>

										</div>
									</div>
									<br>
									<br>


									<div id="div2" class="select_person-area">
										<div class="group youth" id="nop_group_youth"
											style="display: block;">
											<span class="title">청소년</span>
											<ul>
												<li data-count="0" id="memberzero" class="li selected"
													type="youth"><a href="#" onclick="return false;">
														<span class="sreader mod">청소년</span>0<span class="sreader">명</span>
												</a></li>

												<li data-count="1" type="youth" class="li"><a href="#"
													onclick="return false;"> <span class="sreader mod">청소년</span>1<span
														class="sreader">명</span></a></li>

												<li data-count="2" type="youth" class="li"><a href="#"
													onclick="return false;"> <span class="sreader mod">청소년</span>2<span
														class="sreader">명</span></a></li>

												<li data-count="3" type="youth" class="li"><a href="#"
													onclick="return false;"> <span class="sreader mod">청소년</span>3<span
														class="sreader">명</span></a></li>

												<li data-count="4" type="youth" class="li"><a href="#"
													onclick="return false;"> <span class="sreader mod">청소년</span>4<span
														class="sreader">명</span></a></li>

												<li data-count="5" type="youth" class="li"><a href="#"
													onclick="return false;"> <span class="sreader mod">청소년</span>5<span
														class="sreader">명</span></a></li>
											</ul>
										</div>
									</div>
									<br>
									<br>

									<div id="div3" class="select_person-area">
										<div class="group special hide" id="nop_group_special"
											style="display: block;">
											<span class="title">우대</span>
											<ul>
												<li data-count="0" id="memberzero" class="li selected"
													type="special"><a href="#" onclick="return false;">
														<span class="sreader mod">우대</span>0<span class="sreader">명</span>
												</a></li>

												<li data-count="1" type="special" class="li"><a
													href="#" onclick="return false;"> <span
														class="sreader mod">우대</span>1<span class="sreader">명</span></a></li>

												<li data-count="2" type="special" class="li"><a
													href="#" onclick="return false;"> <span
														class="sreader mod">우대</span>2<span class="sreader">명</span></a></li>

												<li data-count="3" type="special" class="li"><a
													href="#" onclick="return false;"> <span
														class="sreader mod">우대</span>3<span class="sreader">명</span></a></li>

												<li data-count="4" type="special" class="li"><a
													href="#" onclick="return false;"> <span
														class="sreader mod">우대</span>4<span class="sreader">명</span></a></li>

												<li data-count="5" type="special" class="li"><a
													href="#" onclick="return false;"> <span
														class="sreader mod">우대</span>5<span class="sreader">명</span></a></li>
											</ul>

										</div></div></div>

							</div><br><br>
							<div>
								<input type="hidden" id="id" value="<%=(String)session.getAttribute("id")%>">
								<input type="submit" value="좌석 선택" class="seat_choice2" > <br>
								<input type="hidden" id="hidden" name="hidden" value="" style="width: 200px">
								<input type="text" id="hidden2" name="hidden2" value="" style="width: 300px; border: none;background: transparent;font-size: 16px;color: black;"> 
								<input type="hidden" id ="Movie_Id" name="Movie_Id" value="">
								<input type="hidden" id ="Movie_Title" name="Movie_Title" value="">
								<input type="hidden" id ="Reserve_Location" name="Reserve_Location" value="">
								<input type="hidden" id ="Reserve_Date" name="Reserve_Date" value="">
								<input type="hidden" id ="Reserve_Time" name="Reserve_Time" value="">
								<input type="hidden" id="Reserve_Adult" name="Reserve_Adult" value="<%=ReserveAdult%>"> 
								<input type="hidden" id="Reserve_Teenager" name="Reserve_Teenager" value="<%=ReserveTeenager%>" style="background: transparent; border: none;"> 
								<input type="hidden" id="Reserve_Preferential" name="Reserve_Preferential" value="<%=ReservePreferential%>"> 
								<input type="hidden" class="ticket_price" id="Reserve_Pay_Price" name="Reserve_Pay_Price" value="" style="color: black;">
							</div>
						</form>
					</dd>
				</dl>
			</div>


			<!-- 안내사항 -->
			<div class="reserve-note">
				<div class="precautions">
					<strong>예매 시 주의사항</strong>
				</div>
				<div class="precautions-content">
					<p>※ 예매시 주의 사항</p>
					<p>1. 홈페이지 예매 후 현장에서 결제수단을 변경 할 수 없습니다.</p>
					<p>2. 영화 날짜 및 시간 변경은 취소 후 다시 예매 진행을 하셔야 합니다.</p>
					<p>3. 부분 취소 환불은 불가능합니다.</p>
					<ul class="reserve-rule">
						<li>※예매 취소 및 환불 규정</li>
						<li>&nbsp; &nbsp;· 인터넷(모바일)예매 : 영화 상영 시간 20분 전까지 환불 가능.<br>
							&nbsp; &nbsp; &nbsp; &nbsp;(인터넷(모바일)예매 후 현장에서 결제수단변경을 원하실 경우 상영시간
							20분전까지 직접 예매 취소 후 재결제 하셔야 합니다.)
						</li>
						<li>&nbsp; &nbsp;· 현장예매 : 영화상영시간 전까지 취소 및 환불 가능.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 	 푸터들어가는 곳  -->
	<jsp:include page="../member/bottom.jsp"></jsp:include>
	<!-- 	 푸터들어가는 곳  -->

</body>
</html>