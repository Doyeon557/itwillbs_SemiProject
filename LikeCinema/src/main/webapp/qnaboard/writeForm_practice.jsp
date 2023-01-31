<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaboard/writeForm.jsp</title>
<script type="text/javascript">

function check(){
	if(document.fr.title.value == ""){
		alert("제목을 입력해주세요.")
		document.fr.title.focus();
		return false;
	}
	
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
%>
<table border="1">
<!-- <tr><td>작성자</td> -->
<%-- <td><input type="text" name="User_ID" value="<%=id %>" readonly></td></tr> --%>
<div align=center>
<table width=800>
	<tr>
		<td align="center" height=25 bgcolor="lightgray">1:1문의하기</td>
	</tr>
</table>
<br>
<!-- <form action="./QnaBoardWritePro.ao" method="post">  -->
<form action="./QnaBoardWritePro.ao" method="post" name="fr" onsubmit="return check()"> 
	<table width=1000 align=center>
		<tr>
			<td>
				<table align=center>
					<tr>
						<td width=10%>제목</td>
						<td width=90%><input type="text" name="title" id="title" size="30" ></td>
					</tr>
					<tr>
						<td width=10%>작성자</td>
						<td width=90%><input type="text" name="id" value="<%=id %>" size="10"></td>
					</tr>
					<tr>
						<td width=10%>내용</td>
						<td width=90%><textarea name="content" id="content" rows="10" cols="50" wrap="hard"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
						<input type="submit" value="문의하기">
						<input type="reset" value="취소" onclick="location.href='./QnaBoardList.ao'">
					</td>
	 			</tr>
			</table>
		</td>
	</tr>
	</table>
</form>
</div>
<!-- <input type="hidden" name="ref" > -->
<!-- <input type="hidden" name="step"> -->
<!-- <input type="hidden" name="level"> -->
<!-- <td colspan="2"><input type="reset" value="취소"></td><br> -->
<!-- <input type="hidden" name="ref" value="0"> -->
<!-- <input type="hidden" name="step" value="1"> -->
<!-- <input type="hidden" name="level" value="1"> -->

</body>
</html>