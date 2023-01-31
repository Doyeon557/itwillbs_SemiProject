<%@page import="com.itwillbs.Reboard.db.reBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%-- <%@ page import="net.board.db.*" %> --%>

<%
	List boardList=(List)request.getAttribute("boardlist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
	String id = (String)session.getAttribute("id");
%>

<html>
<head>
	<title>MVC 게시판</title>
	<link rel="stylesheet" href="./bootst/css/bootstrap.css">
</head>

<body>
<!-- 게시판 리스트 -->
<div class = "container">
<%if(id.equals("admin")){
	out.print(id+"님 안녕하세요");
%><a href="./MemberList.me"> 관리자모드 (회원목록 보기)</a>
<%}else {
	out.print(id+"님 안녕하세요");
}
%>
<table class = "table table-hover table-striped text-center">
	<tr align="center" valign="middle">
		<td colspan="4">MVC 게시판</td>
		<td align=right>
			<font size=2>글 개수 : ${listcount }</font>
		</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
			<div align="center">번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="50%">
			<div align="center">제목</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="14%">
			<div align="center">작성자</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="17%">
			<div align="center">날짜</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="11%">
			<div align="center">조회수</div>
		</td>
	</tr>   
	
	<%
		for(int i=0;i<boardList.size();i++){
			reBoardDTO bl=(reBoardDTO)boardList.get(i);
	%>
	<tbody>
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<%=bl.getBOARD_NUM()%>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			<%if(bl.getBOARD_RE_LEV()!=0){ %>
				<%for(int a=0;a<=bl.getBOARD_RE_LEV()*2;a++){ %>
				&nbsp;
				<%} %>
				▶
			<%}else{ %>
				▶
			<%} %>
			<a href="./BoardDetailAction.bo?num=<%=bl.getBOARD_NUM()%>&id=<%=id%>">
				<%=bl.getBOARD_SUBJECT()%>
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getBOARD_NAME() %></div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getBOARD_DATE() %></div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getBOARD_READCOUNT() %></div>
		</td>
	</tr>
	</tbody>
	<%} %>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<%if(nowpage<=1){ %>
			[이전]&nbsp;
			<%}else{ %>
			<a href="./BoardList.bo?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
			<%} %>
			
			<%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
				[<%=a %>]
				<%}else{ %>
				<a href="./BoardList.bo?page=<%=a %>">[<%=a %>]</a>&nbsp;
				<%} %>
			<%} %>
			
			<%if(nowpage>=maxpage){ %>
			[다음]
			<%}else{ %>
			<a href="./BoardList.bo?page=<%=nowpage+1 %>">[다음]</a>
			<%} %>
		</td>
	</tr>
	<tr align="right">
		<td colspan="5">
	   		<a href="./BoardWrite.bo">[글쓰기]</a>
		</td>
	</tr>
</table>
</div>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="bootst/js/bootstrap.js"></script>
</body>
</html>
<%-- <%@ include file="../template/logout.jsp" %> --%>
