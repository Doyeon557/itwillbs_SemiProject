<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/logout.jsp</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	String center = request.getParameter("center");
%>
<%
	if(id!=null){
		%>
		<%=id %> 님
		<button onclick="location.href='main.jsp?logout=1'">로그아웃</button>
		<%
	}else if(center==null){
		//center에 값이 존재하는 경우에만 로그인버튼을 띄움.
		//처리를 안해주고 로그인 버튼을 누를시 LoginForm.jsp로 넘어가면 Top.jsp에 있는 로그인 버튼이 그대로 나옴.
		%>
		<button onclick="location.href='main.jsp?center=LoginForm.jsp'">로그인</button>
		<% 
	}	
	else{
		%>
	<%} 
	%>
<%
// 세션값 초기화 (세션내장객체 전체 삭제)
session.invalidate();
%>
<script type="text/javascript">
	alert("로그아웃");
	location.href="start.jsp";
</script>
</body>
</html>