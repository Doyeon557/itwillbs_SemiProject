package com.itwillbs.Reboard.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.Reboard.db.reBoardDAO;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id"); //���ǿ� ����� id�� ���� ��ư���� ������.
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		
	   	boolean result=false;
	   	boolean usercheck=false;
	   	
//	   	int num=Integer.parseInt(request.getParameter("num")); // ��й�ȣ �޾ƿ��� 
	   	int num=Integer.parseInt(request.getParameter("num")); //get������� �Ѿ�� �Խ��� ��ȣ �޾ƿ���
	   	reBoardDAO boarddao=new reBoardDAO();
	   	usercheck=boarddao.isBoardWriter(id, num);
	   	
	   	if(usercheck==false){
	   		response.setContentType("text/html;charset=euc-kr");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('�ش� �Խñ� �ۼ��ڸ� ������ �� �ֽ��ϴ�.');");
	   		out.println("location.href='./BoardList.re';");
	   		out.println("</script>");
	   		out.close();
	   		return null;
	   	}
	   	
	   	result=boarddao.boardDelete(num);
	   	if(result==false){
	   		System.out.println("�Խ��� ���� ����");
	   		return null;
	   	}
	   	
	   	System.out.println("�Խ��� ���� ����");
	   	forward.setRedirect(true);
   		forward.setPath("./BoardList.re");
   		return forward;
	 }

}
