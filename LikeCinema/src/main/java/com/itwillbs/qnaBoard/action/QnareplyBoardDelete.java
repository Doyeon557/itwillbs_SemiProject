package com.itwillbs.qnaBoard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.qnaBoard.db.qnaBoardDAO;
import com.itwillbs.qnaBoard.db.qnaBoardDTO;



public class QnareplyBoardDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// board/delete.jsp
				// delete.jsp?num=1
				int num=Integer.parseInt(request.getParameter("Qna_num"));
				System.out.println(num);
				
				
				//BoardDAO 객체생성
				qnaBoardDAO dao=new qnaBoardDAO();
				dao.deleteReplyBoard(num);
				
//				// list.jsp 이동
//				response.sendRedirect("list.jsp");
				
				ActionForward forward = new ActionForward();
				forward.setPath("./QnaBoardList.ao"); //주소값을 담아서 true 주소를 바꾸면서 이동한다..뭔말
				forward.setRedirect(true); 
				
				return forward;
	
	}

}
