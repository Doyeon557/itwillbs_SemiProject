package com.itwillbs.Reboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.Reboard.db.reBoardDAO;
import com.itwillbs.Reboard.db.reBoardDTO;

public class BoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 HttpSession session = request.getSession();
		 String id = (String)session.getAttribute("id"); //���ǿ� ����� id�� ���� ��ư���� ������.
		 request.setCharacterEncoding("UTF-8");
		 ActionForward forward = new ActionForward();
		 
		 boolean result = false;
		 
		 int num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		 
		 reBoardDAO boarddao=new reBoardDAO();
		 reBoardDTO boarddata=new reBoardDTO();
		 
//		 boolean usercheck=boarddao.isBoardWriter(id, num);
//		 if(usercheck==false){
//		   		response.setContentType("text/html;charset=euc-kr");
//		   		PrintWriter out=response.getWriter();
//		   		out.println("<script>");
//		   		out.println("alert('�ۼ��ڸ� ������ �� �ֽ��ϴ�.');");
//		   		out.println("location.href='./BoardList.bo';");
//		   		out.println("</script>");
//		   		out.close();
//		   		return null;
//		 }
		 
		 try{
			 boarddata.setBOARD_NUM(num);
			 boarddata.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
			 boarddata.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
			 
			 result = boarddao.boardModify(boarddata);
			 if(result==false){
		   		System.out.println("�Խ��� ���� ����");
		   		return null;
		   	 }
		   	 System.out.println("�Խ��� ���� �Ϸ�");
		   	 
		   	 forward.setRedirect(true);
		   	 forward.setPath("./BoardDetailAction.re?num="+boarddata.getBOARD_NUM());
		   	 return forward;
	   	 }catch(Exception ex){
	   			ex.printStackTrace();	 
		 }
		 
		 return null;
	 }

}
