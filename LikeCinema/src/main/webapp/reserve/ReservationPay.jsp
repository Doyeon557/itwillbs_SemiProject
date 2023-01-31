<%@page import="com.itwillbs.member.db.MemberDTO"%>
<%@page import="com.itwillbs.reserveBoard.db.ReserveBoardDAO"%>
<%@page import="com.itwillbs.reserve.db.ReserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project/ReservationPay.jsp</title>

<%	//예매번호 구해오기
	ReserveBoardDAO dao = new ReserveBoardDAO();
	int reserveNum = dao.getReserveNum();
	System.out.println("pay.jsp의 reserveNum 예약번호: " + reserveNum);
	
	//예약자 정보
// 	session = request.getSession();
// 	String id = (String)session.getAttribute("id");
	
	ReserveDAO reservedao = new ReserveDAO();
	MemberDTO memberDto = reservedao.getReserveUserInfo("lskn741");
	
%>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<script type="text/javascript">
  var IMP = window.IMP; // 생략 가능
  IMP.init("imp47177580"); // 가맹점 식별 코드
  
  function 
	requestPay() {

		// IMP.request_pay(param, callback) 결제창 호출
		IMP.request_pay({
			//param
			pg : "html5_inicis", //KG 이니시스 코드값
			pay_method : "card",//결제 수단
			merchant_uid : "<%=reserveNum%>", //예약번호 (주문번호)
			name : "영화", // 영화 이름
			amount : 1000, //금액
			buyer_name : "<%=memberDto.getUser_Name()%>", //주문자 이름
			buyer_tel : "<%=memberDto.getUser_Phone()%>", //주문자 전화번호
			buyer_email : "<%=memberDto.getUser_Email()%>", //주문자 이메일
			buyer_addr : "<%=memberDto.getUser_Address()%>"//주문자 주소
			
		},function(rsp) {//collback
			if (rsp.success) { // 결제 성공 시,
				alert("결제 성공!");
				//jQuery로 HTTP 요청
				$.ajax({
					url: "./ReservationInsertPro.rb", //서버의 결제 정보를 받는 endpoint
		            method: "post",
		            data: {
		                imp_uid: rsp.imp_uid, //아임포트 고유 결제 번호
		                merchant_uid: rsp.merchant_uid, //예매번호(주문번호)
		                pay_method: rsp.pay_method, //결제 수단
		                paid_amount: rsp.paid_amount //결제 금액
		            },
					success : function (data, statusText, jqXHR){
	                	console.log(data); //응답 body부 데이터
	                	console.log(statusText); //"succes"로 고정인듯함
	                	console.log(jqXHR);
	                	window.location.href = "./ReservationComplete.re"; 
	                							//결제 성공 시 페이지 이동
	                },
					error : function (jqXHR, textStatus, errorThrown){
	                	console.log(jqXHR);  //응답 메시지
	                	console.log(textStatus); //"error"로 고정인듯함
	                	console.log(errorThrown);
	                }
		            
				});
				
			} else { //결제 실패 시, 에러메세지 -> 예매페이지로 돌아가기
				
				alert("결제 실패: "+ rsp.error_msg +"\n영화 예매페이지로 돌아갑니다.");
				//돌아가기 링크 "./Reservation.re"
				location.href = "./Reservation.re";
			}

		});//IMP.request_pay

	}//requestPay()
	
</script>
</head>
<body>
	<h1>결제</h1>
	<button onclick="requestPay()">결제하기</button><br>
	
<!-- 	<form action="./ReservationComplete.re" method="post" > -->
<!-- 	<input type="submit" value="결제하기" onclick="requestPay()"> -->
<!-- 	</form> -->
</body>
</html>