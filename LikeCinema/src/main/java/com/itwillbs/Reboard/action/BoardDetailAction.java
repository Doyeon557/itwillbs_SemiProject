package com.itwillbs.Reboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.Reboard.db.reBoardDAO;
import com.itwillbs.Reboard.db.reBoardDTO;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
request.setCharacterEncoding("UTF-8");
   		
		reBoardDAO boarddao=new reBoardDAO();
		reBoardDTO boarddata=new reBoardDTO();
	   	
		int num=Integer.parseInt(request.getParameter("num")); // ��ȸ��
//		String id = (String)request.getParameter("id");
		
		boarddao.setReadCountUpdate(num);
					
	   	boarddata=boarddao.getDetail(num);
	   	
	   	if(boarddata==null){
	   		System.out.println("�󼼺��� ����");
	   		return null;
	   	}
	   	System.out.println("�󼼺��� ����");
	   	
	   	request.setAttribute("boarddata", boarddata);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
   		forward.setPath("./reboard/qna_board_view.jsp");
   		return forward;

	 }

}
