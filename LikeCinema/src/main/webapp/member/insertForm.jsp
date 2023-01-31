<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;

      /* background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); */
     /*  background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); */
     background-color: #000;/* 까만색(0,0,0) */
     box-shadow: 10px 10px #ffff;
     
    }
	#btn {
	background-color: #3a0e6a;
	}
	
    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
 
<script type="text/javascript" src="./script/jquery-3.6.3.js"></script>
<script type="text/javascript">

let checkResult = false;
let checkPassResult = false;
let checkBirthResult = false;
let checkEmailResult = false;
let checkPhoneResult = false;
let checkNameResult = false;


function nameCheck(){
	
	var name = $('#name').val();
	var span = document.getElementById('checkName');
	var nameRegex = /^[가-힣]{2,}|[a-zA-Z]{2,}\s[a-zA-Z]{2,}$/;
	
	if(nameRegex.exec(name)){
		checkNameResult = true;
		
		span.innerHTML = '';
		
	} else {
		span.innerHTML = '이름이 잘못되었습니다.';
		span.style.color = 'RED';
		checkNameResult = false;
	}
}	

function checkPass(pass) {
	// 패스워드 검사를 위한 정규표현식 패턴 작성 및 검사 결과에 따른 변수값 변경
	var span = document.getElementById('checkPassResult');
	
	// 정규표현식 패턴 정의
	var lengthRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/; // 길이 및 사용 가능 문자 규칙
	var engUpperRegex = /[A-Z]/; // 대문자 규칙
	var engLowerRegex = /[a-z]/; // 소문자 규칙
	var numRegex = /[0-9]/;		 // 숫자 규칙
	var specRegex = /[!@#$%^&*]/;	 // 특수문자 규칙	
	
// 	var count = 0; // 각 규칙별 검사 결과를 카운팅 할 변수
	
	if(lengthRegex.exec(pass)){
		
		checkResult = true;
		
		span.innerHTML = '사용 가능한 패스워드입니다.';
		span.style.color = 'GREEN';
		
		
	} else {
		checkResult = false;
		span.innerHTML = '8 ~ 16 자리 영문자, 숫자, 특수문자(@$!%*#?&)는 필수 입력 값입니다.';
		span.style.color = 'RED';
	}
	
	checkRetypePass();
	
}

function checkRetypePass() {
	var span = document.getElementById('checkRetypePassResult');
	
	var pass = document.getElementById('pass').value;
	var pass2 = document.getElementById('pass2').value;
	
	if(pass == pass2){
		
		checkPassResult = true;
		
		span.innerHTML = '비밀번호가 일치합니다.';
		span.style.color = 'GREEN';
		
	} else {
		span.innerHTML = '비밀번호를 다시 확인해 주세요';
		span.style.color = 'RED';
		checkPassResult = false;
	}
}

function birthCheck(){
	var birth = $('#birth').val();
	var span = document.getElementById('checkBirth');
	var birthElem = document.getElementById('birth');
	var birthRegex = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
		 
	if(birthRegex.exec(birth)){
		
		checkBirthResult = true;
		
		span.innerHTML = '';
	
			 
	} else {
		
		span.innerHTML = '생년월일 형식을 맞춰 주세요 (예)20010101';
		span.style.color = 'RED';
		birthElem.value = birth.replaceAll('-', ''); 
		
		checkBirthResult = false;
	
	}
}

function phoneCheck(){
	
	
	var phone = document.getElementById('phone').value;
	var phoneElem = document.getElementById('phone');
	var phoneRegex = /^(010|011|016|017|018|019)[0-9]{3,4}[0-9]{4}$/;
	var span = document.getElementById('checkPhone');

	phoneElem.value = phone.replaceAll('-', '');		
	
	if(phoneRegex.exec(phone)){
		checkPhoneResult = true;
		
		span.innerHTML = '';
		
		
	} else {
		span.innerHTML = '휴대전화 형식이 잘못되었습니다.';
		span.style.color = 'RED';
		checkPhoneResult = false;
	}

}

function emailCheck(){
	
	var email = $('#email').val();
	var span = document.getElementById('checkEmail');
	var emailRegex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
	
	if(emailRegex.exec(email)){
		checkEmailResult = true;
		
		span.innerHTML = '';
		
	} else {
		span.innerHTML = '이메일 형식이 잘못되었습니다.';
		span.style.color = 'RED';
		checkEmailResult = false;
	}
}	

function checkSubmit(){
	//		alert("회원가입");
		// class="id"
	//		alert($('.id').val());
		
	if($('#id').val() == "" ){
		alert("아이디 입력하세요");
		$('#id').focus();
		return false;
	}
	
	// name 제어
	if($('#name').val()==""){
		alert("이름 입력하세요");
		$('#name').focus();
		return false;
	}
	
	// pass 제어
	if($('#pass').val()==""){
		alert("비밀번호 입력하세요");
		$('#pass').focus();
		return false;
	}
	
	// pass2 제어
	if($('#pass2').val()=="" || $('#pass2').val() != $('#pass').val()){
		alert("비밀번호를 재확인 해주세요");
		$('#pass2').focus();
		return false;
	}
	
	// 생년월일 제어
	if($('#birth').val()==""){
		alert("생년월일을 입력하세요");
		$('#birth').focus();
		
		return false;
	}
	
	// 전화번호 제어
	if($('#phone').val()==""){
		alert("전화번호를 입력하세요");
		$('#phone').focus();
		return false;
	}
	
	//email 제어
	
	if($('#email').val()==""){
		alert("이메일 입력하세요");
		$('#email').focus();
		return false;
	}
	
	// null 체크 끝
	
	if(!checkNameResult){
		alert("이름을 다시 입력하세요.");
		$('#name').focus();
		return false;
	}
	
	if(!checkResult) {	// 비밀번호 유효성 체크
		alert('영문, 숫자, 특수문자를 혼합하여 입력하세요.');
		$('#pass').focus();
		return false;
	}
	
	if(!checkBirthResult){ // 생년월일 유효성 체크
		alert('생년월일을 다시 입력하세요.');
		$('#birth').focus();
		return false;
	}
	
	if(!checkPhoneResult){ // 휴대전화 유효성 체크
		alert('휴대전화를 다시 입력하세요.');
		$('#phone').focus();
		return false;
	}
	
	if(!checkEmailResult){ // 이메일 유효성 체크
		alert('이메일을 다시 입력하세요.');
		$('#email').focus();
		return false;
	}
	
	
		
	alert("회원가입이 완료되었습니다.");
}

 	$(document).ready(function() {
//  		alert("시작");
		// 대상.함수()  
		// 대상  : * , 태그 , id=이름 => #이름 , class=이름 => .이름
		// 함수 :  css(), attr(), html() , append()
		//     :  click(), submit(), val(), focus()
		//     :  each() , ajax()
		$('#id').blur(function(){
			
// 			alert("아이디 중복체크");
			//대상 가상주소 => 자바파일에 메서드
			$.ajax({
				url:'./MemberIdCheck.me',
				data:{'id':$('#id').val()},
				success: function(rdata){
					$('#checkid').html(rdata).css('color', 'red');
				}
			});
//          class="dupdiv"
// 			$('.dupdiv').html("아이디 중복").css('color','red');
// 			$('.dupdiv').html("아이디 사용가능").css('color','green');
		});	
		
		// id="join"
		$('#join').submit(checkSubmit);
		
 	});
 	
 	
 
</script>
 
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
//                 document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
                self.close();
              
            }
        }).open();
    });
   
}
</script>


</head>
<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" novalidate action="MemberInsertPro.me" method="post" name="fr" id="join" onsubmit="return check()">
          <div class="row">
            <div class="col-md-6 mb-3">
                <label for="id">id</label>
                <span class="point"></span>
                <input type="text" class="form-control" id="id" placeholder="영문 대/소문자, 숫자 4 ~ 12자" name="id" pattern="^[a-zA-z0-9]{4,12}$">
                <span id="checkid" class="live-validation"></span>
            </div>
            <div class="col-md-6 mb-3">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" placeholder="이름" name="name" onkeyup="nameCheck()">
                <span id="checkName" class="live-validation"></span>
            </div>
          </div>

          <div class="mb-3">
               <label for="pass">비밀번호</label>
               <span class="point"></span>
               <input type="password" class="form-control" id="pass" placeholder="비밀번호는 소문자, 특수문자, 숫자 포함 8자~16자" name="pass" onkeyup="checkPass(this.value)" >
               <span id="checkPassResult" class="live-validation"></span>
          </div>

          <div class="mb-3">
               <label for="pass2">비밀번호 확인</label>
               <input type="password" class="form-control" id="pass2" placeholder="비밀번호 확인" name="pass2" onkeyup="checkRetypePass()">
               <span id="checkRetypePassResult" class="live-validation"></span>
          </div>

          <div class="mb-3">
               <label for="num">생년월일</label>
               <input type="text" class="form-control" id="birth" placeholder="생년월일" name="birth" onkeyup="birthCheck()">
               <span id="checkBirth" class="live-validation"></span>
          </div>
		   
		   <div class="mb-3">
               <label for="phone">전화번호</label>
               <input type="text" class="form-control" id="phone" placeholder="전화번호 확인" name="phone" onkeyup="phoneCheck()">
               <span id="checkPhone" class="live-validation"></span>
          </div>
           
           <div class="mb-3">
               <label for="email">이메일</label>
               <input type="text" class="form-control" id="email" placeholder="이메일" name="email" onkeyup="emailCheck()">
               <span id="checkEmail" class="live-validation"></span>
          </div>	
          
           <div class="mb-3">
               <label for="address">주소(선택)</label>
               <input type="text" class="form-control" id="address_kakao" name="address" placeholder="주소" name="address">             
           </div>
       
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button id="btn" class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
        </form>
      </div>
    </div>
  </div>
    </body>
</html>