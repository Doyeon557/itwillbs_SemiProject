package com.itwillbs.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;

public class BoardList implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//사용 => BoardDAO 기억장소 할당(객체생성)
		BoardDAO dao=new BoardDAO();
		// List<BoardDTO> 리턴할형 getBoardList()메서드 정의

		// 한 화면에 보여줄 글 개수 설정 (10개 설정)
		int pageSize=10;
		System.out.println("pageSize="+pageSize);
		// http://localhost:8080/JspProject/board/list.jsp
		// http://localhost:8080/JspProject/board/list.jsp?pageNum=1
		// 현 페이지 번호 파라미터값 가져오기
		String pageNum=request.getParameter("pageNum");
		// 페이지 번호가 없으면 => "1" 설정
		if(pageNum==null){
			pageNum="1";
		}
		System.out.println("pageNum="+pageNum);
		//pageNum => 정수형 숫자 변경
		int currentPage=Integer.parseInt(pageNum);
		// 최근글 위로 정렬(num 기준으로 내림차순)
		// 구간값 가져오기 limit 시작행, 글개수
		// select * from board order by num desc limit 1,10
		// select * from board order by num desc limit 11,10
		// select * from board order by num desc limit 21,10
		// 시작행 알고리즘(계산식)으로 구하기
		// currentPage  pageSize => startRow
//		     1           10    => (1-1)*10+1=>0*10+1=> 0+1=>1
//		     2           10    => (2-1)*10+1=>1*10+1=>10+1=>11
//		     3           10    => (3-1)*10+1=>2*10+1=>20+1=>21
		int startRow=(currentPage-1)*pageSize+1;
		System.out.println("startRow="+startRow);
		//끝행 알고리즘(계산식)으로 구하기
		// startRow  pageSize => endRow
//		     1          10   =>   1+10-1=>10
//		    11          10   =>  11+10-1=>20
//		    21          10   =>  21+10-1=>30
		int endRow=startRow+pageSize-1;
		System.out.println("endRow="+endRow);

		//dao주소를 통해서 메서드 호출
		//여러글을 저장하는 List배열변수=dao.getBoardList();
		// List<BoardDTO> boardList =dao.getBoardList();
		//여러글을 저장하는 List배열변수=dao.getBoardList(시작행,글개수);
		List<BoardDTO> boardList =dao.getBoardList(startRow,pageSize);

		// 전체 게시판 글의 개수 가져오기
		// select count(*) from board
		int count=dao.getBoardCount();
		System.out.println("count="+count);
		
		//페이징
		
		//한 화면에 보여줄 페이지 개수 설정(10개 페이지) 
		int pageBlock=10; 
		// currentPage      pageBlock => startPage
//		    1 ~ 10(0~9)      10    =>    (0~9)/10*10+1=>0*10+1=> 0+1=> 1
		//   11 ~ 20(10~19)    10    =>  (10~19)/10*10+1=>1*10+1=>10+1=>11
		//   21 ~ 30(20~29)    10    =>  (20~29)/10*10+1=>2*10+1=>20+1=>21
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		System.out.println("startPage="+startPage);
		// startPage pageBlock => endPage
//		     1        10     =>   10
//		     11       10     =>   20
//		     21       10     =>   30
		int endPage=startPage+pageBlock-1;
		// 글이 있는 페이지만 보이기 1~10  => 1~2
		// 전체 페이지 개수 구하기  
		// 20개 글 / 10 글개수 나머지 0 => 2 페이지 + 나머지 없으면 0 
		// 15개 글 / 10 글개수 나머지 5 => 1 페이지 + 나머지 있으면 1 
		int pageCount = count/pageSize
		                +(count%pageSize==0 ? 0 : 1);
		System.out.println("pageCount="+pageCount);
		if(endPage > pageCount){
			endPage=pageCount;
		}
		System.out.println("endPage="+endPage);
		// 데이터를 담아서 list.jsp 이동
		request.setAttribute("boardList",boardList);
// startPage pageBlock currentPage endPage pageCount
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		ActionForward forward=new ActionForward();
		forward.setPath("./board/list.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
