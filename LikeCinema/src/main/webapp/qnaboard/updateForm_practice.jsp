<%@page import="com.itwillbs.qnaBoard.db.qnaBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/updateForm.jsp</title>
</head>
<body>
<%
qnaBoardDTO  dto = (qnaBoardDTO)request.getAttribute("dto");
// String id = request.getParameter("id");
String id = (String)session.getAttribute("id");
%>
<div align=center>
	<table width=800>
		<tr>
			<td align="center" height=25 bgcolor="lightgray">1:1문의 수정</td>
		</tr>
	</table>
<br>
	<form action="./QnaBoardUpdatePro.ao" method="post">
	<input type="hidden" name="num" value="<%=dto.getQna_num() %>">
		<table width=1000 align=center>
			<tr>
				<td>
					<table align=center>
						<tr>
							<td width=10%>글쓴이</td>
							<td width=90%><input type="text" name="id" value="<%=id %>" readonly></td>
						</tr>
						<tr>
							<td width=10%>글제목</td>
							<td width=90%><input type="text" name="title" value="<%=dto.getQna_title()%>"></td>
						</tr>
						<tr>
							<td width=10%>글내용</td>
							<td width=90%><textarea name="content" rows="10" cols="20"><%=dto.getQna_content() %></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="글수정">
							<input type="reset" value="취소" onclick="location.href='./QnaBoardList.ao'"></td>
						</tr>
					</table>	
				</td>
			</tr>
		</table>
	</form>
</div>


<input type="hidden" name="num" value="<%=dto.getQna_num()%>">
</body>
</html>
