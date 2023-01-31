package com.itwillbs.Reboard.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.Reboard.db.reBoardDAO;
import com.itwillbs.Reboard.db.reBoardDTO;
import com.itwillbs.board.action.ActionForward;
import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardAddAction implements Action {

	@Override
	public com.itwillbs.Reboard.action.ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 글쓰기 폼에서 입력한 내용을 서버에 전달하면 
		// 내장객체 request에 저장
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		// request name,subject,content 파라미터 가져와서 변수에 저장
		String BOARD_PASS=request.getParameter("BOARD_PASS");
		String BOARD_SUBJECT=request.getParameter("BOARD_SUBJECT");
		String BOARD_CONTENT=request.getParameter("BOARD_CONTENT");
		

		
		// 패키지board 파일이름BoardDTO 자바 클래스 만들기
		// 멤버변수 num,name,subject,content,readcount,date
		// set() get() 메서드 정의

		// BoardDTO객체생성(기억장소 할당)
		reBoardDTO dto=new reBoardDTO();
		// set메서드 호출 파라미터값 저장
		dto.setBOARD_PASS(BOARD_PASS);
		dto.setBOARD_SUBJECT(BOARD_SUBJECT);
		dto.setBOARD_CONTENT(BOARD_CONTENT);
		// 현시스템 날짜시간
//		dto.setBOARD_DATE(new Timestamp(System.currentTimeMillis()));
		//조회수 0 설정
		dto.setBOARD_READCOUNT(0);
		// 글번호 num => BoardDAO에서 작업


		// 패키지board 파일이름BoardDAO 자바 클래스 만들기
		// BoardDAO 객체생성(기억장소 할당)
		reBoardDAO dao=new reBoardDAO();
		// 리턴할형 없음 insertBoard(BoardDTO 주소값 저장하는 변수) 메서드 정의 
		// BoardDAO주소.insertBoard(BoardDTO 주소)메서드 호출
		dao.boardInsert(dto);
		//글목록 이동
//		response.sendRedirect("list.jsp");
		com.itwillbs.Reboard.action.ActionForward forward = new com.itwillbs.Reboard.action.ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		return forward;
		
		
		
//		reBoardDAO boarddao=new reBoardDAO();
//		reBoardDTO boarddata=new reBoardDTO();
//	   	ActionForward forward=new ActionForward();
//	   	HttpSession session = request.getSession();
//	   	String id = (String)session.getAttribute("id");
//		String realFolder="";
//   		String saveFolder="boardupload";
////   		System.out.println("출력되나요ㅕ????/");
//   		int fileSize=5*1024*1024;
//   		
//   		realFolder=request.getRealPath(saveFolder);
//   		
//   		boolean result=false;
//   		
////   		try{
//   			
//   			MultipartRequest multi=null;
//   			
//   			multi=new MultipartRequest(request,
//   					realFolder,
//   					fileSize,
//   					"UTF-8",
//   					new DefaultFileRenamePolicy());
//   			
//   			boarddata.setBOARD_NAME(id);
//   			boarddata.setBOARD_PASS(multi.getParameter("BOARD_PASS"));
//	   		boarddata.setBOARD_SUBJECT(multi.getParameter("BOARD_SUBJECT"));
//	   		boarddata.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));
//	   		boarddata.setBOARD_FILE(
//	   				multi.getFilesystemName((String)multi.getFileNames().nextElement()));
//	   		
//	   		result=boarddao.boardInsert(boarddata);
//	   		
//	   		if(result==false){
//	   			System.out.println("�Խ��� ��� ����");
//	   			return null;
//	   		}
//	   		System.out.println("�Խ��� ��� �Ϸ�");
//	   	
//	   		forward.setPath("/BoardList.re");
//	   		forward.setRedirect(true);
//	   		return forward;
	   		
//  		}catch(Exception ex){
//   			ex.printStackTrace();
//   		}
//  		return null;
	}  	

}