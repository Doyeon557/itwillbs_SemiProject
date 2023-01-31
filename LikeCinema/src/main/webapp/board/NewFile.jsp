<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/updateForm.jsp</title>
</head>
<body>
<%
BoardDTO dto=(BoardDTO)request.getAttribute("dto");
%>
<h1>글수정</h1>
<form action="./BoardUpdatePro.bo" method="post">
<input type="hidden" name="Notice_num" value="<%=dto.getNotice_num() %>">
<table border="1">
<tr><td>글쓴이</td>
<td><input type="text" name="Manager_Num" value="<%=dto.getManager_Num() %>" readonly></td></tr>
<tr><td>글제목</td>
<td><input type="text" name="Notice_title" value="<%=dto.getNotice_title()%>"></td></tr>
<tr><td>글내용</td>
<td><textarea name="Notice_content" rows="10" cols="20"><%=dto.getNotice_content() %></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
</table>
</form>
</body>
</html>


