<%@page import="com.itwillbs.member.db.MemberDTO"%>
<%@page import="com.itwillbs.member.db.MemberDAO"%>
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
<link rel="stylesheet" href="./member/css/MembershipV2.css" />

<title>비밀번호 확인</title>
     
</head>
<body>
<jsp:include page="../member/top.jsp"></jsp:include>
<br>
<br>
<%
String id = (String)session.getAttribute("id");

// Class.forName("com.mysql.cj.jdbc.Driver");
// String dbUrl="jdbc:mysql://localhost:3306/jspdb2?serverTimezone=Asia/Seoul"; // DBMS마다 방식이 다름,  UTC : 세계표준시간
// String dbUser="root";
// String dbPass="1234";
// Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

// String sql="select * from practice where id=?";
// PreparedStatement pstmt=con.prepareStatement(sql);
// pstmt.setString(1, id);
// ResultSet rs=pstmt.executeQuery();



MemberDAO dao = new MemberDAO();
// MemberDTO dto = dao.getMember(id);
MemberDTO dto = (MemberDTO)request.getAttribute("dto");

// if(rs.next()){

%>

<div class="sub kolon-wrap">
    <div class="kolon-content-wrap">
        
        <section id="kolon-content" class="membership">
            <article class="check-password center">

                <input type="hidden" id="csrf_token" name="CSRFToken" value="aba19720-08a9-4589-a1b7-6881a6df3071" />
                <input type="hidden" id="changePasswordType" value="0" />

                <h1>안전한 회원정보 변경을 위해<br>비밀번호를 다시 한번 입력해 주세요.</h1>
                
				<form action="./MemberRecheckPro.me">
	                <div class="account-info mt60 mx-60 oh">
	                    <label for="password">
	                        <dl class="w420 mx-auto">
	                        
	                            <dt>비밀번호</dt>
	                            <dd class="fs0">
	                                <input type="password" title="비밀번호 입력" id="password" name="pass" minlength="8" maxlength="16" spellcheck="false" autocomplete="off" data-validate="false" />
	                                <span class="placeholder"></span>
	                            </dd>
	                        </dl>
	                    </label>
	                </div>
	
	                <div class="w420 mx-auto">
	                    <a class="link-done">
	                        <center><input type="submit" class="btn2" id="checkPasswordBtn" value="확인"></center>
	                    </a>
	                </div>
                </form>
            </article>
        </section>
        
            <div class="crema-popup"></div>
        
    </div>
		    <div id="joykolonReactFloating"></div>
</div>
<br>
<br>
<br>

</body>
</html>