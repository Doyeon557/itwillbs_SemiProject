<%@page import="com.itwillbs.qnaBoard.db.qnaBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaboard/replywriteForm.jsp</title>

<script type="text/javascript">
	function check(){
		if(document.fr.content.value == ""){
			alert("내용을 입력해주세요.")
			document.fr.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
<%
//세션값 가져오기
String id = (String)session.getAttribute("id");
// id = "admin"; // TODO 관리자 하드코딩 해둿음
String qna_num = request.getParameter("Qna_num");
//<!-- 1.9일 수정  -->
// qnaBoardDTO dto = (qnaBoardDTO)request.getAttribute("dto");
%>
<!-- 살려줘유,,  -->
<div align=center>
<table width=800>
	<tr>
		<td align="center" height=25 bgcolor="lightgray">1:1문의 답변하기</td>
	</tr>
</table>
<br>
<form action="./QnaReplyBoardWritePro.ao" method="post" name="fr" onsubmit="return check()"> 
	<input type="hidden" name="Qna_num" value="<%=qna_num %>">
	<table width=1000 align=center>
		<tr>
			<td>
				<table align=center>
					<tr>
						<td width=10%>작성자</td>
<%-- 						<td width=90%><input type="text" name="User_ID" value="<%=id %>" readonly></td> --%>
						<td width=90%><input type="text" name="id" value="<%=id %>" readonly></td>
					</tr>
					<tr>
						<td width=10%>제목</td>
						<td width=90%><input type="text" name="title" value="고객님, 문의 답변 드립니다."></td>
					</tr>
					<tr>
						<td width=10%>내용</td>
						<td width=90%>
						
						<textarea name="content" id="content" rows="10" cols="50" wrap="hard"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
						<input type="submit" value="답변하기">
						<input type="reset" value="취소" onclick="location.href='./QnaBoardList.ao'">
					</td>
	 				</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</div>



<!-- 살려줘유..  -->
<!-- <h1><center>1:1문의 답변하기</center></h1> -->
<!-- <form action="./QnaReplyBoardWritePro.ao" method="post">  -->
<!-- <table border="1"> -->
<!-- <!-- <tr><td>작성자</td> --> -->
<%-- <%-- <td><input type="text" name="User_ID" value="<%=id %>" readonly></td></tr> --%> --%>
<!-- <tr><td>제목</td> -->
<!-- <td><input type="text" name="title" value="고객님, 문의 답변 드립니다."></td></tr> -->
<!-- <!-- <td>고객님, 문의사항 답변드립니다.</td> --> -->
<!-- <tr><td>작성자</td> -->
<%-- <td><input type="text" name="id" value="<%=id %>" readonly></td></tr> --%>
<!-- <tr><td>내용</td> -->
<!-- <td><textarea name="content" rows="10" cols="50"></textarea></td></tr> -->
<!-- <td colspan="2"><input type="submit" value="답변하기"> -->
<!-- <input type="reset" value="취소" onclick="location.href='./QnaBoardList.ao'"></td> -->
<!-- <!-- <td colspan="2"><input type="reset" value="취소"></td><br> --> -->
<!-- </table> -->
<%-- <%-- <input type="hidden" name="qna_num" value="<%=qna_num %>" > --%> --%>
<!-- <!-- 1.9일 수정  --> -->
<%-- <%-- <input type="hidden" name="ref" value="<%=dto.getQna_ref() %>"> --%> --%>
<%-- <%-- <input type="hidden" name="step" value="<%=dto.getQna_re_step() %>"> --%> --%>
<%-- <%-- <input type="hidden" name="level" value="<%=dto.getQna_re_level() %>"> --%> --%>
<!-- </form> -->
</body>
</html>