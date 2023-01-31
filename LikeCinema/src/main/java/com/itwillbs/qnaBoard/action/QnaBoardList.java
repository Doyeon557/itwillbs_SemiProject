package com.itwillbs.qnaBoard.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.qnaBoard.db.qnaBoardDAO;
import com.itwillbs.qnaBoard.db.qnaBoardDTO;

public class QnaBoardList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		qnaBoardDAO dao = new qnaBoardDAO();
		
		//한 화면에 보여주는 글 갯수
		int pageSize=10;
		System.out.println("pageSize="+pageSize);
		
		//페이지 파라미터 가져오기
		String pageNum=request.getParameter("pageNum");
		
		//페이지 번호가 없으면 = 1 설정
		if(pageNum==null){
			pageNum="1";
		}
		System.out.println("pageNum="+pageNum);
		
		int currentPage=Integer.parseInt(pageNum);
		// 최근글 위로 정렬(num 기준으로 내림차순)
		// 구간값 가져오기 limit 시작행, 글개수
		// select * from board order by num desc limit 1,10
		// select * from board order by num desc limit 11,10
		// select * from board order by num desc limit 21,10
		// 시작행 알고리즘(계산식)으로 구하기
		// currentPage  pageSize => startRow
//			     1           10    => (1-1)*10+1=>0*10+1=> 0+1=>1
//			     2           10    => (2-1)*10+1=>1*10+1=>10+1=>11
//			     3           10    => (3-1)*10+1=>2*10+1=>20+1=>21
		int startRow=(currentPage-1)*pageSize+1;
		System.out.println("startRow="+startRow);
		//끝행 알고리즘(계산식)으로 구하기
		// startRow  pageSize => endRow
//			     1          10   =>   1+10-1=>10
//			    11          10   =>  11+10-1=>20
//			    21          10   =>  21+10-1=>30
		int endRow=startRow+pageSize-1;
		System.out.println("endRow="+endRow);
		
		//dao주소를 통해서 메서드 호출
		//여러글을 저장하는 List배열변수=dao.getBoardList();
		// List<BoardDTO> boardList =dao.getBoardList();
		//여러글을 저장하는 List배열변수=dao.getBoardList(시작행,글개수);
		
		//TODO
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		if(id != null) {
			if(id.equals("admin")) {
				List<qnaBoardDTO> boardList = dao.getBoardList(startRow, pageSize, id);
				request.setAttribute("boardList", boardList);
			} else if(!id.equals("admin")){ 
				List<qnaBoardDTO> boardList2 = dao.getBoardList2(startRow, pageSize, id);
				request.setAttribute("boardList", boardList2);
			}
		}
		
//		List<qnaBoardDTO> boardList = dao.getBoardList(startRow, pageSize, id);
//		System.out.println("망해따");
		
		int count=dao.getBoardCount();
		System.out.println("count="+count);
		
		int pageBlock=10; 
		
		// currentPage      pageBlock => startPage
		//	    1 ~ 10(0~9)      10    =>    (0~9)/10*10+1=>0*10+1=> 0+1=> 1
		//   11 ~ 20(10~19)    10    =>  (10~19)/10*10+1=>1*10+1=>10+1=>11
		//   21 ~ 30(20~29)    10    =>  (20~29)/10*10+1=>2*10+1=>20+1=>21
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		System.out.println("startPage="+startPage);
		// startPage pageBlock => endPage
		//	     1        10     =>   10
		//	     11       10     =>   20
		//	     21       10     =>   30
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
//		request.setAttribute("boardList", boardList);
		// startPage pageBlock currentPage endPage pageCount
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		
		ActionForward forward=new ActionForward();
		forward.setPath("./qnaboard/list.jsp");
		forward.setRedirect(false);
		return forward;
				

	}
	
}
