<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="./member/assets/css/reset19.css">
    <link rel="stylesheet" href="./member/assets/css/style19.css">
    <link rel="stylesheet" href="./member/assets/css/swiper.css">
     <% 
    String id = (String)session.getAttribute("id");
    %> 
<header id="header">
        <div class="container">
            <div class="row">
                <div class="header clearfix">
                    <h1>
                        <a href="#"></a>    
                    </h1>
                    <nav id="mNav">
                        <h2 class="ir_so">메가박스 전체메뉴</h2>
                        <a href="#" class="ham"><span></span></a>
                    </nav>
                    <nav class="nav">
                        <ul class="clearfix">
                            <li><a href="MemberMain.me">메인</a></li>
<!--                             <li><a href="#">큐레이션</a></li> -->
<!--                             <li><a href="#">영화관</a></li> -->
<!--                             <li><a href="#">특별관</a></li> -->
<!--                             <li><a href="main.jsp">이벤트</a></li> -->
                               <% 
                                 if(id == null) {
                                	%>
                                	<li><a href="./MemberLoginForm.me">로그인</a></li>            	 
                                	<%
                                }else{
                                	%>
                                	<li><a href="./MemberLogout.me">로그아웃</a></li> 		
                                	<%
                                }	
                               %>
                         	   <% 
                         	 	if(id != null){ // 로그인은 한상태
                         	 		if(id.equals("admin")) {
                                    	%>
                                    	<li><a href="./BoardMypage.bo">관리자</a></li>            	 
                                    	<%
                                    } else {
                                    	%>
                                    	<li><a href="./BoardMypage.bo">MY</a></li>            	 
                                    	<%
                                    }
                         	 	}
                              %>
                        </ul>
                    </nav>    
                </div>
            </div>
        </div>
    </header>