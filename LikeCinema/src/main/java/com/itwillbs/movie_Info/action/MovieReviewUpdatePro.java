package com.itwillbs.movie_Info.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.movie_Review.db.Movie_ReviewDAO;
import com.itwillbs.movie_Review.db.Movie_ReviewDTO;

public class MovieReviewUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// board/updatePro.jsp
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		// request 정보 가져오기
		// num name subject content 파라미터 가져와서 변수에 저장
		String movie_ID = request.getParameter("movie_ID");
		int Review_Num=Integer.parseInt(request.getParameter("Review_Num"));
		String Reserve_Num = request.getParameter("Reserve_Num");
		int Review_Score=Integer.parseInt(request.getParameter("Review_Score"));
		String Review_Text=request.getParameter("Review_Text");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		// BoardDTO 객체생성
		// set 메서드 호출 num name subject content 저장
		Movie_ReviewDTO dto=new Movie_ReviewDTO();
		dto.setUser_ID(id);
		dto.setReview_Num(Review_Num);
		dto.setReserve_Num(Reserve_Num);
		dto.setReview_Score(Review_Score);
		dto.setReview_Text(Review_Text);

		// 수정작업
		// BoardDAO 객체생성
		// 리턴할형없음 updateBoard(BoardDTO 변수) 메서드 정의
		// 디비작업 주소를 통해서 updateBoard(BoardDTO 주소값) 호출
		Movie_ReviewDAO dao=new Movie_ReviewDAO();
		dao.updateReview(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print("<script>");
		out.print("opener.document.location.reload();");
		out.print("self.close();");
		out.print("</script>");
		out.close();
		
//		ActionForward forward=new ActionForward();
//		forward.setPath("./MovieDetail.in?movie_ID="+movie_ID);
//		forward.setRedirect(true);
		
		return null;
	}

}
