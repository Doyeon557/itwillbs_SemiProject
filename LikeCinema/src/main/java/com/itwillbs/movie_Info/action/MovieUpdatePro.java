package com.itwillbs.movie_Info.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.movie_Info.db.Movie_InfoDAO;
import com.itwillbs.movie_Info.db.Movie_InfoDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class MovieUpdatePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String uploadPath=request.getRealPath("/img");
		int maxSize=10*1024*1024;
		MultipartRequest multi = 
		new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		String movie_ID=multi.getParameter("movie_ID");
		String movie_Title=multi.getParameter("movie_Title");
		String movie_Genre=multi.getParameter("movie_Genre");
		String movie_Country=multi.getParameter("movie_Country");
		String movie_Director=multi.getParameter("movie_Director");
		String movie_Cast=multi.getParameter("movie_Cast");
		String movie_Grade=multi.getParameter("movie_Grade");
		String movie_RunTime=multi.getParameter("movie_RunTime");
		String movie_RlsDate=multi.getParameter("movie_RlsDate");
		String movie_Video=multi.getParameter("movie_Video");
		String movie_Story=multi.getParameter("movie_Story");

		// 수정할 첨부파일
		String movie_Picture = multi.getFilesystemName("movie_Picture");
		// 수정할 첨부파일이 없으면 => oldfile 설정
		if(movie_Picture==null) {
			movie_Picture=multi.getParameter("oldfile");
		}
		
		Movie_InfoDTO dto=new Movie_InfoDTO();
		dto.setMovie_ID(movie_ID);
		dto.setMovie_Title(movie_Title);
		dto.setMovie_Genre(movie_Genre);
		dto.setMovie_Country(movie_Country);
		dto.setMovie_Director(movie_Director);
		dto.setMovie_Cast(movie_Cast);
		dto.setMovie_Grade(movie_Grade);
		dto.setMovie_RunTime(movie_RunTime);
		dto.setMovie_RlsDate(movie_RlsDate);
		dto.setMovie_Video(movie_Video);
		dto.setMovie_Story(movie_Story);
		dto.setMovie_Picture(movie_Picture);

		Movie_InfoDAO dao=new Movie_InfoDAO();
		dao.updateMovie(dto);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.print("<script>");
		out.print("opener.document.location.reload();");
		out.print("self.close();");
		out.print("</script>");
		out.close();

		return null;
	}

}
