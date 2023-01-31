package com.itwillbs.reserve.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.itwillbs.reserve.db.ReserveDAO;
import com.itwillbs.reserve.db.ReserveDTO;

public class ReserveTimeList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String movieId = request.getParameter("movie");
		String location = request.getParameter("location");
		String date = request.getParameter("date");
		
		ReserveDAO dao = new ReserveDAO();
		List<ReserveDTO> timeList = dao.reserveTimeList(movieId, location, date);
		
		JSONArray timeArr = new JSONArray();
		
		for(int i = 0; i < timeList.size(); i++) {
			ReserveDTO dto = timeList.get(i);
			System.out.println(dto.getScreenStartTime());
			
			JSONObject object = new JSONObject();
			object.put("time", dto.getScreenStartTime());
			
			timeArr.add(object);
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		//join 화면으로 결과값 출력
		out.print(timeArr);
		out.close();
		
		return null;
	}

}
