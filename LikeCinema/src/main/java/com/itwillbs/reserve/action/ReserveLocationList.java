package com.itwillbs.reserve.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.itwillbs.reserve.db.ReserveDAO;
import com.itwillbs.reserve.db.ReserveDTO;

public class ReserveLocationList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String movieId = request.getParameter("movie");
		
		System.out.println("받아온 movieId: "+ movieId);
		
		ReserveDAO dao = new ReserveDAO();
		List<ReserveDTO> locationList = dao.ReserveLocationList(movieId);
		
		JSONArray locationArr = new JSONArray();
		
		for(int i = 0; i < locationList.size(); i++) {
			
			ReserveDTO dto = locationList.get(i);
			System.out.println(dto.getScreenLocation());
			
			JSONObject object = new JSONObject();
			
			object.put("location", dto.getScreenLocation());
			
			locationArr.add(object);
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		//join 화면으로 결과값 출력
		out.print(locationArr);
		out.close();
		
		return null;
	}

}
