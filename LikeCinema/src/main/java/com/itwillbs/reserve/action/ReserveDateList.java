package com.itwillbs.reserve.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.itwillbs.reserve.db.ReserveDAO;
import com.itwillbs.reserve.db.ReserveDTO;

public class ReserveDateList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String movieId = request.getParameter("movie");
		String location = request.getParameter("location");
		
		ReserveDAO dao = new ReserveDAO();
		List<ReserveDTO> dateList = dao.ReserveDateList(movieId, location);
		
		JSONArray dateArr = new JSONArray();
		
		for(int i = 0; i < dateList.size(); i++) {
			ReserveDTO dto = dateList.get(i);
			System.out.println("ReserveDateList.java: " + dto.getMovieDate());
			
			JSONObject object = new JSONObject();
			
			object.put("date", dto.getMovieDate());
			
			dateArr.add(object);
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		//join 화면으로 결과값 출력
		out.print(dateArr);
		out.close();
		
		return null;
	}

}
