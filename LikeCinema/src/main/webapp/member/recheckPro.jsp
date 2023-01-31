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
<title>loginPro</title>
</head>
<body>
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");

// Class.forName("com.mysql.cj.jdbc.Driver");
// String dbUrl = "jdbc:mysql://localhost:3306/jspdb2?serverTimezone=Asia/Seoul";
// String dbUser = "root";
// String dbPass = "1234";
// Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

// String sql="select * from practice where id=? and pass=?";
// PreparedStatement pstmt = con.prepareStatement(sql);
// pstmt.setString(1, id);
// pstmt.setString(2, pass);

// ResultSet rs = pstmt.executeQuery();

MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.userCheck(id, pass);

if(dto!=null){
	out.println("아이디 비밀번호 일치");
	session.setAttribute("id", id);
	%>
	<script type="text/javascript">
	alert("본인 확인이 되었습니다.");
	</script>
	<%
	response.sendRedirect("updateForm.jsp");
	
} else {
	out.println("아이디 비밀번호 불일치");
	
	%>
	<script type="text/javascript">
	alert("비밀번호를 확인해주세요.");
	history.back();
	</script>
	<%
}

%>
</body>
</html>