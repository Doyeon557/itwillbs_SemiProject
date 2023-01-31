<%@page import="com.itwillbs.qnaBoard.db.qnaBoardDTO"%>
<%@page import="com.itwillbs.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의사항</title>
</head>
<body>
<h3><center>1:1문의사항</center></h3>
<%
qnaBoardDTO dto = (qnaBoardDTO)request.getAttribute("dto");
//TODO 하드코딩해둠
// String id1 = "admin";
%>

<table border="1">
<!-- <input type="button" value="글수정"  -->
<%-- 	   onclick = "location.href='./BoardUpdateForm.bo?Notice_num=<%=dto.getNotice_num() %>'"> --%>
<!-- <input type="button" value="글삭제"  -->
<%-- 	   onclick = "location.href='./BoardDelete.bo?Notice_num=<%=dto.getNotice_num() %>'"> --%>
<!-- <input type="button" value="글목록"  -->
<!-- 	   onclick = "location.href='./BoardList.bo?'"><br> -->
<tr><td>글번호</td><td><%=dto.getQna_num() %></td></tr>
<tr><td>글작성자</td><td><%=dto.getUser_ID() %></td></tr>
<tr><td>제 목</td><td><%=dto.getQna_title() %></td></tr>
<tr><td>글내용</td><td><%=dto.getQna_content() %></td></tr>
<tr><td>등록일</td><td><%=dto.getQna_date() %></td></tr>
<tr><td colspan="2">
<% 
//세션값 가져오기
String id=(String)session.getAttribute("id");
//글쓴이와 로그인(세션값) 일치하면 => 글수정,글삭제 버튼 보이기
// if(dto.getUser_ID().equals(id) || dto.getUser_ID().equals("100")){
if(dto.getUser_ID().equals(id)){
	%>
<input type="button" value="문의글수정" 
	   onclick = "location.href='./QnaBoardUpdateForm.ao?Qna_num=<%=dto.getQna_num() %>'">
<input type="button" value="문의글삭제" 
	   onclick = "location.href='./QnareplyBoardDelete.ao?Qna_num=<%=dto.getQna_num() %>'">
	<%
} else if(dto.getUser_ID().equals("admin")) {
	%>
<input type="button" value="문의글수정" 
	   onclick = "location.href='./QnaBoardUpdateForm.ao?Qna_num=<%=dto.getQna_num() %>'">
<input type="button" value="문의글삭제" 
	   onclick = "location.href='./QnareplyBoardDelete.ao?Qna_num=<%=dto.getQna_num() %>'">	
<input type="button" value="답변하기" 
   onclick = "location.href='./QnaReplyForm.ao?Qna_num=<%=dto.getQna_num()%>'">
	<%
}
		%>
<!-- } else { -->
<!--     %> -->
<!-- 	<input type="button" value="답변하기"  -->
<!-- 	   onclick = "location.href='./QnaReplyForm.ao?'"> -->
<%-- 	<% --%>
<!-- // } -->
<%-- %> --%>


<input type="button" value="글목록"  onclick = "location.href='./QnaBoardList.ao?'">
</td></tr>
</table>


</body>
</html>