package com.itwillbs.Reboard.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.Reboard.db.reBoardDAO;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		reBoardDAO boarddao=new reBoardDAO(); // DB��ü ����
		List<?> boardlist=new ArrayList<>(); // ����Ʈ ���� (�������� ���� ����� ����Ʈ)

		int page=1; // ����¡ �ּ� 
		int limit=10; // ����¡ �ִ�

		if(request.getParameter("page")!=null){ // 1.2.3.4.5 ���ڿ� url ?page=2 2 '2'
			page=Integer.parseInt(request.getParameter("page")); // '2' -> 2
		}

		int listcount=boarddao.getListCount(); // DAO�� ��� ���� �� ����Ʈ ���� �޾ƿ�.
		boardlist = boarddao.getBoardList(page,limit); // DAO�� ��� ���� ����Ʈ�� �޾ƿ�.

		//�� ������ ��.
		int maxpage=(int)((double)listcount/limit+0.95); //0.95�� ���ؼ� �ø� ó��.
		//���� �������� ������ ���� ������ ��(1, 11, 21 ��...)
		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
		//���� �������� ������ ������ ������ ��.(10, 20, 30 ��...)
		int endpage = maxpage;

		if (endpage>startpage+10-1) endpage=startpage+10-1;

		request.setAttribute("page", page);		  //���� ������ ��.
		request.setAttribute("maxpage", maxpage); //�ִ� ������ ��.
		request.setAttribute("startpage", startpage); //���� �������� ǥ���� ù ������ ��.
		request.setAttribute("endpage", endpage);     //���� �������� ǥ���� �� ������ ��.
		request.setAttribute("listcount",listcount); //�� ��.
		request.setAttribute("boardlist", boardlist); // �� ��� 

		ActionForward forward= new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./reboard/qna_board_list.jsp");
		return forward;
	}

}
