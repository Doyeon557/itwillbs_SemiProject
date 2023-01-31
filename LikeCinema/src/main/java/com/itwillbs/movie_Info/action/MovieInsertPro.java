package com.itwillbs.movie_Info.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.movie_Info.db.Movie_InfoDAO;
import com.itwillbs.movie_Info.db.Movie_InfoDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MovieInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 파일 업로드 => 프로그램 설치
		// http://www.servlets.com/cos/
		// cos-22.05.zip 다운로드 => 압축풀기 => lib => cos.jar
		// WEB-INF -  lib - cos.jar 붙여넣기
		
		// cos.jar 파일 안에 MultipartRequest 객체 생성 
		// => 파일업로드, 파라미터 정보 multi에 저장
		// 1. request 정보
		// 2. 파일 업로드 할 웹서버 물리적인 경로
		//	  webapp - upload 폴더 만들기 => 물리적 경로
		String uploadPath=request.getRealPath("\\img");
		System.out.println(uploadPath);
		// 3. 업로드할 최대 파일크기 10M
		int maxSize=10*1024*1024;
		// 4. 한글처리 utf-8
		// 5. 업로드 파일이름이 동일할 경우 => 파일이름 변경하는 프로그램
		//	  new DefaultFileRenamePolicy()
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
		// 파일 이름 가져오기
		String movie_Picture = multi.getFilesystemName("movie_Picture");
		
		Movie_InfoDTO dto = new Movie_InfoDTO();
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
		// 추가 첨부파일 저장
		dto.setMovie_Picture(movie_Picture);
		
		Movie_InfoDAO dao=new Movie_InfoDAO();
		dao.insertMovie(dto);
		
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
