package com.itwillbs.reserve.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.itwillbs.reserve.db.ReserveDAO;
import com.itwillbs.reserve.db.ReserveDTO;

public class getMovieInfo implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String movieId= request.getParameter("movie");
		
		ReserveDAO dao = new ReserveDAO();
		ReserveDTO dto = dao.getMovieInfo(movieId);
		
		JSONObject object = new JSONObject();
		
		object.put("title", dto.getMovieTitle());
		object.put("grade", dto.getMovieGrade());
		object.put("img", dto.getMoviePicture());
		
		String title = dto.getMovieTitle();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		//join 화면으로 결과값 출력
		out.print(object);
		out.close();
		
		return null;
	}

}
