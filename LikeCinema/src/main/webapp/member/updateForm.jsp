<%@page import="com.itwillbs.member.db.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=1450" />
<meta content="d79fb1b9-c9c4-433e-ba21-691571497096" name="csrf-token">


  <meta property="groobee:member_id" content="1-1Z111IA"/>
  <meta property="groobee:member_age" content="1994"/>
  <meta property="groobee:member_gender" content="f"/>
  <meta property="groobee:member_grade" content=""/>
  <meta property="groobee:member_type" content="NORMAL"/>


<link rel="stylesheet" href="./member/css/application-6d2c67e2ec.css" />
<link rel="stylesheet" href="./member/css/application-c4201fbe7b.css" />
<link rel="stylesheet" href="./member/css/application-c78e11e17a.css" />
<link rel="stylesheet" href="./member/css/common-ab37aac59e.css" />
<link rel="stylesheet" href="./member/css/desktop-af50e2e80a.bundle.css" />
<link rel="stylesheet" href="./member/css/MembershipV2.css" />


<title>회원정보수정</title>
<script type="text/javascript" src="./script/jquery-3.6.3.js"></script>
<script type="text/javascript">

        function check_pw() {
			
            var pw = document.getElementById('pw').value;
            var SC = ["!","@","#","$","%"];
            var check_SC = false;

            // 비밀번호 자릿수 체크
            if(pw.length < 6 || pw.length>16){
                window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
                document.getElementById('pw').value='';
                return;
            }
           
            // 특수문자 여부 체크
            for(var i=0;i<SC.length;i++){
                if(pw.indexOf(SC[i]) != -1){
                    check_SC = true; // 특수문자 있으면
                }
            }
            if(!check_SC){
                window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
                document.getElementById('pw').value='';
                return;
            }
           
            if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
                if(document.getElementById('pw').value==document.getElementById('pw2').value) {
                    document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('check').style.color='blue';
                }
                else{
                    document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('check').style.color='red';
                }
            }
           
        }
       
      </script>  

<script type="text/javascript">
function update(){
	
	if(document.fr.pass.value == ""){
		alert("기존 비밀번호를 입력해 주세요.");
		document.fr.pass.focus();
		return false;
	}
	
	var pass2 = document.fr.pass2.value;
	var pass3 = document.fr.pass3.value;
	
	if(pass2 != pass3){
		alert("비밀번호를 다시 확인 해주세요.");
		document.fr.pass3.focus();
		return false;
	
	}
	
	if(document.fr.phone.value == ""){
		alert("전화번호를 입력해 주세요.");
		document.fr.phone.focus();
		return false;
	}
	

	if(document.fr.email.value == ""){
		alert("이메일을 입력해 주세요.");
		document.fr.email.focus();
		return false;
	}
	
	// 이메일
//		debugger;
	var email = document.fr.email.value;
	var regex = '^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
	if (email.match(regex) == null) {
	   alert('이메일 형식을 맞춰주세요');
	   document.fr.email.focus();
	   return false;
	}
	
	
}

var chechResult = false;
var checkPassResult = false;

function checkPass(pass2){
	// 패스워드 검사를 위한 정규표현식 패턴 작성 및 검사 결과에 따른 변수값 변경
	var span = document.getElementById('checkPassResult');
	
	// 정규표현식 패턴 정의
	var lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/; // 길이 및 사용 가능 문자 규칙
	var engUpperRegex = /[A-Z]/; // 대문자 규칙
	var engLowerRegex = /[a-z]/; // 소문자 규칙
	var numRegex = /[0-9]/;		 // 숫자 규칙
	var specRegex = /[!@#$%^&*]/;	 // 특수문자 규칙	
	
// 	var count = 0; // 각 규칙별 검사 결과를 카운팅 할 변수
	
	if(lengthRegex.exec(pass2)){
		
		chechResult = true;
		
		span.innerHTML = '사용 가능한 패스워드입니다.';
		span.style.color = 'GREEN';
		
// 		if(engUpperRegex.exec(pass2)) count++;
// 		if(engLowerRegex.exec(pass2)) count++;
// 		if(numRegex.exec(pass2)) count++;
// 		if(specRegex.exec(pass2)) count++;
		
// 		switch(count){
// 		case 4:	// 보안강도 우수
// 			span.innerHTML = '보안 강도 : 우수';
// 			span.style.color = 'GREEN';
// 			break;
// 		case 3:	// 보안강도 보통
// 			span.innerHTML = '보안 강도 : 보통';
// 			span.style.color = 'YELLOW';
// 			break;
// 		case 2:	// 보안강도 위험
// 			span.innerHTML = '보안 강도 : 위험';
// 			span.style.color = 'ORANGE';
// 			break;
// 		}
		
	} else {
		chechResult = false;
// 		span.innerHTML = '사용 불가능한 패스워드';
		span.innerHTML = '8 ~ 16 자리 영문자, 숫자, 특수문자(!@#$%^&*)는 필수 입력 값입니다.';
		span.style.color = 'RED';
	}
	
}

function checkRetypePass(){
	var span = document.getElementById('checkRetypePassResult');
	
	var pass2 = document.getElementById('pass2').value;
	var pass3 = document.getElementById('pass3').value;
	
	if(pass2 == pass3){
		span.innerHTML = '비밀번호가 일치합니다.';
		span.style.color = 'GREEN';
		checkPassResult = true;
		
	} else {
		span.innerHTML = '비밀번호를 다시 확인해 주세요';
		span.style.color = 'RED';
		checkPassResult = false;
	}
}

function replacePhone(){
	var phone = document.getElementById('phone').value;
	var phoneElem = document.getElementById('phone');
// 	console.log("value: " + document.getElementById('phone').value);
// 	console.log(document.getElementById('phone'));
	phoneElem.value = phone.replaceAll('-', '');
}

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

<jsp:include page="top.jsp"></jsp:include>

    
<body>


<%
MemberDTO dto = (MemberDTO)request.getAttribute("dto");
	%>


<!-- <form action="./MemberUpdatePro.me" method="get" name="fr" id="updateForm" onsubmit="return update()"> -->
<!-- <table border = "1px solid black">	 -->
<!-- <tr> -->
<!-- <td>아이디</td>  -->
<%-- <td><input type="text" name="id" value="<%=dto.getUser_ID() %>" readonly></td> --%>
<!-- </tr> -->

<!-- <tr> -->
<!-- <td>이름</td>  -->
<%-- <td><input type="text" name="name" value="<%=dto.getUser_Name() %>" readonly></td> --%>
<!-- </tr> -->

<!-- <tr> -->
<!-- <td>기존 비밀번호</td>  -->
<!-- <td><input type="password" name="pass" class="pass"></td> -->
<!-- </tr> -->

<!-- <tr> -->
<!-- <td>새 비밀번호</td>  -->
<!-- <td><input type="password" name="pass2" id="pass2" class="pass2" onkeyup="checkPass(this.value)"> -->
<!-- <span id="checkPassResult">패스워드 규칙 판별 결과 표시 영역</span><br> -->
<!-- </td> -->
<!-- </tr> -->

<!-- <tr> -->
<!-- <td>비밀번호 재확인</td>  -->
<!-- <td> -->
<!-- <input type="password" name="pass3" id="pass3" class="pass3" onkeyup="checkRetypePass()"><br> -->
<!-- <span id="checkRetypePassResult">패스워드 규칙 판별 결과 표시 영역</span><br> -->
<!-- </td> -->
<!-- </tr> -->

<!-- <tr> -->
<!-- <td>생년월일</td>  -->
<%-- <td><input type="text" name="birth" value="<%=dto.getUser_Birth() %>" readonly></td> --%>
<!-- </tr> -->

<!-- <tr> -->
<!-- <td>전화번호</td>  -->
<%-- <td><input type="text" name="phone" id="phone" value="<%=dto.getUser_Phone() %>" onkeyup="replacePhone()" onkeydown="replacePhone()"></td> --%>
<!-- </tr> -->

<!-- <tr> -->
<!-- <td>이메일</td>  -->
<%-- <td><input type="text" name="email" id="email" value="<%=dto.getUser_Email() %>" ></td> --%>
<!-- </tr> -->

<!-- <tr> -->
<!-- <td>주소</td>  -->
<!-- <td> -->
<%-- <%-- <input type="text" name="postcode" value="<%=dto.getUser_Address() %>"> --%>
<!-- <input type="text" id="address_kakao" name="address" readonly /> -->
<!-- <input type="text" name="address2" /> -->
<!-- </td> -->
<!-- </tr> -->
<!-- </table> -->
<!-- </form> -->







<div class="overlay-bg"></div>

<div class="sub kolon-wrap">
    <div class="kolon-content-wrap">
        <form action="./MemberUpdatePro.me" method="get" name="fr" id="updateForm" onsubmit="return update()">
	 <section id="kolon-content" class="membership">
            <article class="sign-form edit-user-inform">
                <div class="change-info-guide mb40">
                    <h1 class="title">회원정보 수정</h1>
                </div>
                <input type="radio" id="editUserInform" name="editUser" class="edit-tab edit-user" checked="">
                <label for="editUserInform">일반정보 수정</label>
                
	                <input type="radio" id="editUserPassword" name="editUser" class="edit-tab edit-password">
	                <label for="editUserPassword">비밀번호 수정</label>
                
                <div class="clearfix"></div>

                <h4 class="change-member-text">소중한 고객님의 정보가 보호되고 있습니다.</h4>

                <div class="change-info mt40">
                	
                       <input type="hidden" id="csrf_token" name="CSRFToken" >
                       <!-- 가입 사이트 아이디와 관심 브랜드는 JSON형태로 전달. 현재는 ,로 구분하여 데이터를 전송 하고 있지만 이것을 JSON형태로 만들어서 보내야함. -->
                       <!-- 가입사이트아이디, 사이트 정보 수신동의, 선택약관 동의 여부를 Json 형태로 만들어서 보내야함. -->
                       <input name="siteId" type="hidden">
                       <input name="uid" type="hidden">
                       <!-- 관심 브랜드(Json 형태로 값을 넘겨야함) -->
                       <input name="brands" id="brands" type="hidden">
                       <input type="hidden" name="originalEmail" id="originalEmail">
                       <input type="hidden" name="cellPhone" id="cellPhone" >
                    <!-- 생년월일 -->
                    <input name="birthday" type="hidden" >
                    <!-- 성별 -->
                    <input name="gender" type="hidden" >
                       <!-- 사이트 정보 수신 -->
                       <input type="hidden" name="siteEmailReceiveFlag" id="siteEmailReceiveFlagHidden">
                       <!-- 개인정보 수집 및 이용동의(선택) -->
                       <input name="usePersonalInfoFlag" id="usePersonalInfoFlagHidden" type="hidden" >
                       <!-- 제3자약관동의 -->
                       <input name="trustFlag" id="trustFlagHidden" type="hidden" >
                       <!-- 본인 인증 여부 -->
                       <input name="mobileCertificationYn" type="hidden">
                       <!-- 멤버쉽타입-->
                       <input name="membershipType" type="hidden" >
                       <!-- 채널 구분 -->
                       <input name="channelGb" type="hidden" >
                       <!-- 통신사 -->
                       <input name="telecomFlag" id="telecomFlag" type="hidden" >
                       <!-- 이메일 수신 -->
                       <input type="hidden" id="emailReceiveFlagHidden" name="emailReceiveFlag" >
                       <!-- SMS 수신 -->
                       <input type="hidden" id="smsReceiveFlagHidden" name="smsReceiveFlag" >
                       <!-- 개인정보 유효기간제 미적용 동의. 100년동의: 1, 3년동의: 2, 미동의: 3 -->
                       <input type="hidden" id="applyDormantPassFlagHidden" value="">
					<!-- 온라인 본인 인증 필요여부 -->
                    <input type="hidden" name="needOnlineCertificationYn" value="false">

                    <div class="cont">
                           <div class="row clearfix">
                               <div class="col empty-right">
                                   <label class="input-label id">아이디</label>
                                   <div class="input-wrap">
                                   	<input type="text" name="id" value="<%=dto.getUser_ID() %>" readonly>
                                   </div>
                               </div>
                               <div class="col empty-right">
                                   <label class="input-label">이름</label>
                                   <div class="input-wrap">
                                       <input type="text" name="name" value="<%=dto.getUser_Name() %>" readonly>
                                   </div>
                               </div>
                               <div class="col">
                                   <label class="input-label">생년월일</label>
                                   <div class="input-wrap">
<!--                                         <input id="birthdayText" type="text" value="1994년 02월 14일" readonly=""> -->
                                       <input type="text" name="birth" value="<%=dto.getUser_Birth() %>" readonly>
                                   </div>
                               </div>
                           </div>

                           <div class="row mt50 clearfix">
                               <div class="col">
                                   <label class="input-label">이메일</label>
                                   <div class="input-wrap">
<!--                                         <input type="email" id="memberEmail" name="email" title="이메일" placeholder="abcd1234@naver.com" value="highkick741@naver.com"> -->
                                       <input type="text" name="email" id="email" value="<%=dto.getUser_Email() %>" >
                                       <span id="email_tip" class="live-validation"></span>
                                   </div>
                               </div>
                               <div class="col mb0">
                                   <label class="input-label">휴대폰</label>
                                   <div class="input-wrap phone">
<!--                                         <button type="button" class="btn" id="changeMemberPhoneAuthBtn" onclick="phoneAuth()">인증하기</button> -->
                                       <input type="text" name="phone" id="phone" value="<%=dto.getUser_Phone() %>" onkeyup="replacePhone()" onkeydown="replacePhone()">
                                   </div>
                                   <label class="input-label auth-inform mt16">미인증 고객님 또는 휴대폰번호를 변경하실 경우 인증하기를 통해 진행해주세요.</label>
                               </div>
                               <div class="col mb0">
                                   <label class="input-label">주소(선택)</label>
                                   <div class="input-wrap">
                                       <input type="text" id="address_kakao" name="address" value="<%=dto.getUser_Address()%>" readonly />
                                   </div>
                                   <div class="input-wrap mt40" style="width: 100%">
                                 	    <input type="text" name="address2" />
                                   </div>
                               </div>
                           </div>
                           
                       </div>
               </div>
               	<div class="change-password">
                       <div class="account-info mt40 mx-60 oh">
                           <label for="old-password">
                               <dl class="fl w420 mx60">
                                   <dt>현재 비밀번호</dt>
                                   <dd class="fs0">
                                       <input type="password"  title="현재 비밀번호 입력" name="pass" id="pass" class="pass"minlength="8" maxlength="15" spellcheck="false" autocomplete="off" data-validate="false">
                                       <span class="placeholder">••••••••</span>
                                       <span id="old_password_tip" class="live-validation"></span>
                                   </dd>
                               </dl>
                           </label>
                           
                           <div class="clearfix"></div>
                           <label for="password_input">
                               <dl class="fl w420 mx60 mt60">
                                   <dt>새 비밀번호</dt>
                                   <dd class="fs0">
                                       <input type="password" title="새 비밀번호 입력" id="pass2" name="pass2" class="pass2" onkeyup="checkPass(this.value)" minlength="8" maxlength="15" spellcheck="false" autocomplete="off" data-validate="false">
                                       <span class="placeholder">••••••••</span>
                                       <span id="checkPassResult" class="live-validation"></span>
                                   </dd>
                               </dl>
                           </label>
                           <label for="confirm_password_input">
                               <dl class="fl w420 mx60 mt60">
                                   <dt>새 비밀번호 확인</dt>
                                   <dd class="fs0">
                                       <input type="password" title="새 비밀번호 입력" id="pass3" name="pass3" class="pass3" onkeyup="checkRetypePass()" minlength="8" maxlength="15" spellcheck="false" autocomplete="off" data-validate="false">
                                       <span class="placeholder">••••••••</span>
                                       <span id="checkRetypePassResult" class="live-validation"></span>
                                   </dd>
                               </dl>
                           </label>
                       </div>
					
                       <dl class="membership-policy-guide mt40 left">
                           <dt>비밀번호 변경 시 유의사항</dt>
                           <dd class="mt12 oh mx-60">
                               <ul class="list-dot-style fl w420 mx60">
                                   <li>영문, 숫자, 특수문자를 혼합하여 8~16자로 등록</li>
                                   <li>공백 및 Tab 등은 사용불가</li>
                                   <li>아이디 및 아이디를 포함한 문자 및 숫자 사용 자제</li>
                               </ul>
                               <ul class="list-dot-style fl w420 mx60">
                                   <li>타인이 알기 쉬운 번호 사용자제 (생일, 주민번호, 휴대폰번호)</li>
                                   <li>순서가 일정한 문자 또는 키보드상 연속된 배열 사용자제</li>
                                   <li>개인정보 강화를 위해 한달에 한번 비밀번호 주기적 변경</li>
                               </ul>
                           </dd>
                       </dl>
                  
              		 </div>
              <div class="mt80 center fs0">
                  <a class="link-done">
                      <button type="submit" class="btn" id="changeMemberSubmitButton">확인</button>
                  </a>
              	</div>
          	 </article>
      		</section> 
		</form> 
   </div>
   <div>
   
<script>
function btn(){
    alert('회원 탈퇴가 완료 되었습니다.');
}
</script>
   
   
   <form action="./MemberDeletePro.me" method="post" name="frm" onsubmit="javascript:btn()">
<!-- 		<form name="deleteMem">-->	

			<div class="mt80 fs0" >
				<a class="link-done2">
				<input type="hidden" name= "pass" value="<%=dto.getUser_Pass() %>">
					<button type="submit" class="btn1" id="id" value="">탈퇴</button>
					
				</a>
			</div>
			
		</form>
   	<!-- </form> -->

<div id="joykolonReactFloating"><div class="sc-pIIwi kCOxih"><button type="button" class="sc-pALIP lhXyXi topButton" style="opacity: 0; transform: translateY(0px);"><img src="/_next/static/public/static/images/floating_btn_top.bc0854946695663a9f25b390489b10dc.svg" alt="맨 위로 이동"></button><div class="sc-oToFz kEAjmo historyButton " style="opacity: 1; transform: translateY(0px);"><div class="sc-pbJGu fCInOI"><img src="/_next/static/public/static/images/floating-btn-history.bd1c943c14d4cae53da89748cc328d0d.svg" alt="쇼핑 히스토리"></div></div></div></div>
	    
</div>




<div class="overlay-loader-bg" style="display: none"><div class="progress"><div class="progress-circle-lg-white" style="display: block;"></div></div></div>
</body>
</html>