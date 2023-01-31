package com.itwillbs.qnaBoard.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

//import com.itwillbs.noticeBoard.db.noticeBoardDTO;



public class qnaBoardDAO {
	Connection con = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;


		public Connection getConnection() throws Exception { 
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Mysql");
			con = ds.getConnection();
			return con;
		} 
		
		public void close() {
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try{pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
			if(rs!=null) try{rs.close();}catch(SQLException ex) {}
			
		}
		// 1.8일 수정
		public void insertBoard(qnaBoardDTO dto) { 
			
			int Qna_ref = 0;
			int Qna_re_step = 1;
			int Qna_re_level = 1;
			
			try {
				//1,2 메서드 호출
				con = getConnection();
				//게시판 글번호 구하기 가장 큰번호 +1 => 이번에 입력할 글번호
				
				//3. select max(num) from qna_board; 
				String sql2 = "select max(Qna_num) as maxnum from Qna_board";
				pstmt2 = con.prepareStatement(sql2);
				
				//4. 실행 => 결과 저장
				rs= pstmt2.executeQuery(); //query, executeupdate
				
				//5https://letsgoit39.tistory.com/34. 결과접근 max(num)가져와서 +1
//				int num = 0;
//				if(rs.next()) { 
//					num = rs.getInt(1)+1;
//				}	
				//----------------------------------------
				
				//1.10수정
				int num = 0;
				if(rs.next()) {
					num = rs.getInt("maxnum")+1;
				}
				//----------------------------------------
				
				//1.8 문의글 작성
//				int Qna_ref = 0; 	  // 답글id
//				int Qna_re_step = 1;  // 답글순서 (2번)
//				int Qna_re_level = 1; // 들여쓰기 
				
//				String sql = "insert into Qna_board(Qna_num, User_ID, Qna_title, Qna_content,"
//						+ "					 	    Qna_date, Qna_ref, Qna_re_step, Qna_re_level) "
//						+ "value(0,?,?,?,?,?,?,?)";
				String sql = "insert into Qna_board(Qna_num, User_ID, Qna_title, Qna_content,"
						+ "					 	    Qna_date, Qna_ref, Qna_re_step, Qna_re_level) "
						+ "value(?,?,?,?,?,?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				
//				pstmt.setInt(1, num);
				
//				pstmt.setString(1, dto.getUser_ID());
//				pstmt.setString(2, dto.getQna_title());
//				pstmt.setString(3, dto.getQna_content());
//				pstmt.setDate(4, dto.getQna_date());
//				pstmt.setInt(5, Qna_ref);
//				pstmt.setInt(6, Qna_re_step);
//				pstmt.setInt(7, Qna_re_level);
				
				//1.10일 수정
				pstmt.setInt(1, num);
				pstmt.setString(2, dto.getUser_ID());
				pstmt.setString(3, dto.getQna_title());
				pstmt.setString(4, dto.getQna_content());
				pstmt.setDate(5, dto.getQna_date());
				pstmt.setInt(6, dto.getQna_num());
				pstmt.setInt(7, Qna_re_step);
				pstmt.setInt(8, Qna_re_level);
				
				pstmt.executeUpdate();
				
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close();
				
			}
		
		}//insertBoard 메서드
		
		//답글달기
		public void replyBoard(qnaBoardDTO dto) { 
			
			int qna_num = dto.getQna_num();
			int Qna_ref = qna_num;
			
			System.out.println("--------------------");
			System.out.println(qna_num);
			System.out.println(Qna_ref);
			
			try {
				con = getConnection();
				
				String sql2 = "UPDATE Qna_board SET Qna_re_level=Qna_re_level+1 WHERE qna_num = ?";
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setInt(1, qna_num);
				
				pstmt2.executeUpdate(); 
				
				
				//-------
//				int num = 0;
//				if(rs.next()) {
//					num = rs.getInt("maxnum")+1;
//				}	
//				
				String sql = "insert into Qna_board(Qna_num, User_ID, Qna_title, Qna_content, Qna_date"
						+ ", Qna_ref, Qna_re_step, Qna_re_level)"
						+ "value(0,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				
//				pstmt.setInt(1, num);
				pstmt.setString(1, dto.getUser_ID());
				pstmt.setString(2, dto.getQna_title());
				pstmt.setString(3, dto.getQna_content());
				pstmt.setDate(4,dto.getQna_date());
				pstmt.setInt(5, Qna_ref);
				pstmt.setInt(6, 2);
				pstmt.setInt(7, 2); //들여쓰기
				
				pstmt.executeUpdate();
				
				} catch (Exception e) {
				e.printStackTrace();
				} finally {
				close();
			}
			
		}//replyboard
			
		
		//-----------------------------------------------------------------------------------------
		
//		public void insertBoard(qnaBoardDTO dto) { 
//			
//			try {
//				//1,2 메서드 호출
//				con = getConnection();
//				//게시판 글번호 구하기 가장 큰번호 +1 => 이번에 입력할 글번호
//				
//				//3. select max(num) from qna_board; 
//				String sql2 = "select max(Qna_num) as maxnum from Qna_board";
//				pstmt2 = con.prepareStatement(sql2);
//				
//				//4. 실행 => 결과 저장
//				rs= pstmt2.executeQuery(); //query, executeupdate
//				
//				//5https://letsgoit39.tistory.com/34. 결과접근 max(num)가져와서 +1
//				
//				int num = 0;
//				if(rs.next()) { 
//					num = rs.getInt("maxnum")+1;
//				}	
//				//-------------------문의글 번호 1 자동설정 
//				
//				//1.8 문의글 작성
////				int Qna_ref = 0; 	  // 답글id
////				int Qna_re_step = 1;  // 답글순서 (2번)
////				int Qna_re_level = 1; // 들여쓰기 
//				
//				String sql = "insert into Qna_board(Qna_num, User_ID, Qna_title, Qna_content,"
//						+ "					 	    Qna_date, Qna_ref, Qna_re_step, Qna_re_level) "
//						+ "value(?,?,?,?,?,?,?,?)";
//				
//				pstmt = con.prepareStatement(sql);
//				
//				pstmt.setInt(1, num);
//				pstmt.setString(2, dto.getUser_ID());
//				pstmt.setString(3, dto.getQna_title());
//				pstmt.setString(4, dto.getQna_content());
//				pstmt.setDate(5, dto.getQna_date());
//				pstmt.setInt(6, dto.getQna_ref());
//				pstmt.setInt(7, dto.getQna_re_step());
//				pstmt.setInt(8, dto.getQna_re_level());
//				
//				pstmt.executeUpdate();
//				
//				} catch (Exception e) {
//					e.printStackTrace();
//				} finally {
//					close();
//				
//			}
//		
//		}//insertBoard 메서드
//		
//		//답글달기
//		public void replyBoard(qnaBoardDTO dto) { 
//			
//			int Qna_ref = dto.getQna_ref();
//			int Qna_re_step = dto.getQna_re_step();
//			int Qna_re_level = dto.getQna_re_level();
//			
//			try {
//				con = getConnection();
//				
//				String sql2 = "UPDATE Qna_board SET Qna_re_level=Qna_re_level+1 WHERE Qna_ref=? AND Qna_re_level>?";
//				pstmt2 = con.prepareStatement(sql2);
//				pstmt2.setInt(1, dto.getQna_ref());
//				pstmt2.setInt(2, dto.getQna_re_level());
//				
//				pstmt2.executeUpdate(); 
//				
//				
//				//-------
//				int num = 0;
//				if(rs.next()) {
//					num = rs.getInt("maxnum")+1;
//				}	
//				
//				String sql = "insert into Qna_board(Qna_num, User_ID, Qna_title, Qna_content, Qna_date"
//						+ ", Qna_ref, Qna_re_step, Qna_re_level)"
//						+ "value(?,?,?,?,?,?,?)";
//				pstmt = con.prepareStatement(sql);
//				
//				pstmt.setInt(1, num);
//				pstmt.setString(2, dto.getUser_ID());
//				pstmt.setString(3, dto.getQna_title());
//				pstmt.setString(4, dto.getQna_content());
//				pstmt.setDate(5,dto.getQna_date());
//				pstmt.setInt(6, dto.getQna_ref());
//				pstmt.setInt(7, dto.getQna_re_step()+1);
//				pstmt.setInt(8, dto.getQna_re_level()+1); //들여쓰기
//				
//				pstmt.executeUpdate();
//				
//				} catch (Exception e) {
//				e.printStackTrace();
//				} finally {
//				close();
//			}
//		}//replyboard
		
		public List<qnaBoardDTO> getBoardList2(int startRow, int pageSize, String id) {
			
				List<qnaBoardDTO> boardList = new ArrayList<qnaBoardDTO>();
				try {
					con = getConnection();
					
//					String sql = "select * from Qna_board where User_ID =? and ";
//					String sql = "select * from(Qna_board order by Qna_re_step desc, Qna_re_level) limit ?,?";
//					String sql = "WITH RECURSIVE cte AS ("
//							+ "   SELECT qna_num, qna_title, qna_content, qna_ref, qna_re_step,"
//							+ "         @rn:=(@rn+1) AS pnum "
//							+ "   FROM  ("
//							+ "		 SELECT * FROM qna_board ORDER BY qna_num DESC"
//							+ "         ) t1,"
//							+ "          (SELECT @rn:=0) t2"
//							+ "   WHERE qna_ref = 0"
//							+ "     and USER_ID = ?"
//							+ "   UNION  ALL          "
//							+ "   SELECT b.qna_num, CONCAT(' ▶ ', b.qna_title), b.qna_content as content, b.qna_ref,"
//							+ "           b.qna_re_step, p.pnum AS pnum"
//							+ "   FROM qna_board b INNER JOIN cte p"
//							+ "   ON p.qna_num = b.qna_ref"
//							+ "   where pnum < 3"
//							+ ")"
//							+ "SELECT * FROM cte ORDER BY pnum, qna_re_step;"
//							+ "";
					
					String sql = "WITH RECURSIVE cte AS ("
							+ "   SELECT qna_num, User_ID, Qna_title, Qna_content, Qna_ref, Qna_re_step,Qna_date,"
							+ "         @rn:=(@rn+1) AS pnum "
							+ "   FROM  ("
							+ "		 SELECT * FROM qna_board ORDER BY qna_num DESC"
							+ "         ) t1,"
							+ "          (SELECT @rn:=0) t2 "
							+ "   WHERE Qna_ref = 0"
							+ "     and User_ID = ?"
							+ "   UNION  ALL "
							+ "   SELECT b.qna_num, b.User_ID, CONCAT(' ▶ ', b.Qna_title), b.Qna_content as content, b.Qna_ref, "
							+ "           b.Qna_re_step,b.Qna_date, p.pnum AS pnum"
							+ "   FROM qna_board b INNER JOIN cte p"
							+ "   ON p.qna_num = b.Qna_ref"
							+ "   where pnum < 3"
							+")"
							+ "SELECT * FROM cte ORDER BY pnum, Qna_re_step;";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					System.out.println(pstmt);
					rs = pstmt.executeQuery(); 
					
					while(rs.next()) {
						qnaBoardDTO dto = new qnaBoardDTO();
						
						dto.setQna_num(rs.getInt("Qna_num"));
						dto.setUser_ID(rs.getString("User_ID"));
						dto.setQna_title(rs.getString("Qna_title"));
						dto.setQna_content(rs.getString("Qna_content"));
						dto.setQna_date(rs.getDate("Qna_date"));
						dto.setQna_ref(rs.getInt("Qna_ref"));
						dto.setQna_re_step(rs.getInt("Qna_re_step"));
						
						//배열 한칸에 글 저장
						boardList.add(dto);
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close();
				}
				//배열의 주소를 리턴
				return boardList;
			}//getBoardList();
		
		//-----------------------------------------------------------------------------------------
		//List<BoardDTO> 리턴할형 getBoardList()메서드 정의
		public List<qnaBoardDTO> getBoardList(int startRow, int pageSize, String id) { //admin일때
			List<qnaBoardDTO> boardList = new ArrayList<qnaBoardDTO>();
			
	//		System.out.println("배열의 주소: "+boardList);
			try {
				//1,2단계 db연결
				con = getConnection();
				
				//3.sql 
	//			String sql="select * from board";
	//			String sql="select * from board order by num desc limit 시작행-1,글개수";
//				String sql = "select * from Qna_board order by Qna_num desc, Qna_re_step asc limit ?,?";
//				String sql = "select * from(Qna_board order by Qna_re_step desc, Qna_re_level) limit ?,?";
				
				String sql= "WITH RECURSIVE cte AS ("
						+ "   SELECT Qna_num, User_ID, Qna_title, Qna_content, Qna_date, Qna_ref, Qna_re_step,          "
						+ "         @rn:=(@rn+1) AS pnum      "
						+ "   FROM  ("
						+ "            SELECT * FROM Qna_board ORDER BY Qna_num DESC"
						+ "          ) t1, "
						+ "          (SELECT @rn:=0) t2"
						+ "   WHERE Qna_ref = 0";
//						if(!id.equals("admin")) { sql += " and USER_ID = ?";};
					 sql += "  UNION  ALL "
						 + "   SELECT b.Qna_num, b.User_ID, concat(' ㄴ ', b.Qna_title),  b.Qna_content as content, b.Qna_date, b.Qna_ref,"
						 + "           b.Qna_re_step, p.pnum AS pnum                  "
						 + "   FROM Qna_board b INNER JOIN cte p"
						 + "   ON p.Qna_num = b.Qna_ref"
						 + ")"
						 + "SELECT * FROM cte ORDER BY pnum, Qna_re_step limit ?,?";
					 //1.12
//				String sql2 = "select * from qna_board where User_ID=?";
//				pstmt2 = con.prepareStatement(sql2);
//				rs=pstmt2.executeQuery();
				pstmt = con.prepareStatement(sql);
//				if(일반회원이면) pstmt.setString(1, "id");
				
				//1.12
//				if(!id.equals("admin")) { pstmt.setString(1, "id");}
				
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
				//4. 실행 => 결과저장
				rs = pstmt.executeQuery(); 
				
				//5. while 결과접근 => BoardDTO객체 생성 set호출 디비에서 가져온 값 저장
				while(rs.next()) { //한번씩 돌면서 dto에 하나씩 담는 것,,
					qnaBoardDTO dto = new qnaBoardDTO();
					
					dto.setQna_num(rs.getInt("Qna_num"));
					System.out.println(dto.getQna_num());
					dto.setUser_ID(rs.getString("User_ID"));
					dto.setQna_title(rs.getString("Qna_title"));
					dto.setQna_content(rs.getString("Qna_content"));
					dto.setQna_date(rs.getDate("Qna_date"));
//					dto.setNotice_file(rs.getString("Notice_File"));
					//1.8수정
					dto.setQna_ref(rs.getInt("Qna_ref"));
					dto.setQna_re_step(rs.getInt("Qna_re_step"));
					
					//배열 한칸에 글 저장
					boardList.add(dto);
				}
				// => 글 하나를 배열한칸에 저장 boardList.add();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			//배열의 주소를 리턴
			return boardList;
		}//getBoardList();
		
		
		
		public qnaBoardDTO getBoard(int num) {
					
			qnaBoardDTO dto = null; //참조형의 초기값 null
			try {
				//1,2디비연결
				con = getConnection();
				//3.sql실행
				String sql="select * from qna_board where Qna_num=?"; //기준값 = num
				//4.값저장
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num); 
				rs=pstmt.executeQuery();
				//값이 있으면 객체생성>set호출>디비에서 가져온 값 저장
				if(rs.next()) {
					//num에 대한 글있음
					dto = new qnaBoardDTO(); //생성되어있는 dto에 저장! 
					
					dto.setQna_num(rs.getInt("Qna_num"));
//					dto.setManager_Num(rs.getString("Manager_Num"));
					//1.9수정
					dto.setUser_ID(rs.getString("User_ID"));
					dto.setQna_title(rs.getString("Qna_title"));
					dto.setQna_content(rs.getString("Qna_content"));
					dto.setQna_date(rs.getDate("Qna_date"));
					
					//1.8수정
					dto.setQna_ref(rs.getInt("Qna_ref"));
					dto.setQna_re_step(rs.getInt("Qna_re_step"));
					dto.setQna_re_level(rs.getInt("Qna_re_level"));
//					dto.setNotice_file(rs.getString("Notice_File"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				close();
			}
			return dto;
			
		}//getBoard
		
		public void updateBoard(qnaBoardDTO dto) {
			
			try {
				//1,2디비연결
				con = getConnection();
				
				//3. sql
				String sql="update qna_board set Qna_title=?, Qna_content=? where qna_num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, dto.getQna_title()); 
				pstmt.setString(2, dto.getQna_content()); 
				pstmt.setInt(3, dto.getQna_num()); 
				//4. 실행
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
		}//update Board
////		
//		public void deleteBoard(int num) {
//			try {
//				//1,2디비연결
//				con = getConnection();
//				//3. sql
//				String sql="delete from Notice_board where Notice_Num=?";
//				pstmt=con.prepareStatement(sql);
//				pstmt.setInt(1, num); 
//				
//				//4. 실행
//				pstmt.executeUpdate();
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				close();
//			}
//			
//		}//deleteBoard
//	
//	//	int count = dao.getBoardCount();
		
	
		
		// 1.8수정-------------------------------------------------------------------------------------------
		public int getBoardCount() {
			int count = 0;
			try {
				//1,2디비연결
				con = getConnection();
				//3.sql
				String sql = "select count(*) from qna_board";
				pstmt = con.prepareStatement(sql);
				//4. 실행 => 결과 저장
				rs = pstmt.executeQuery();
				//5. 결과 접근, 글개수 가져오기
				if(rs.next()) {
					count = rs.getInt("count(*)");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return count;
		} //getBoardCount
		
		public void deleteReplyBoard(int num) {
			try {
				con = getConnection();
				if(num %2 == 0) { //건드리면안됨..
					String sql="delete from qna_board where qna_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, num); 
					//ref없애야하는디..
					pstmt.executeUpdate();
				} else {
					String sql="delete from qna_board where qna_num=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, num); 
					pstmt.executeUpdate();
				}
				//4. 실행
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
		
	}//deleteBoard
		
		
		//-------------------------------------------------------------------------------------------
//		public int getBoardCount() {
//			int count = 0;
//			try {
//				//1,2디비연결
//				con = getConnection();
//				//3.sql
//				String sql = "select count(*) from qna_board";
//				pstmt = con.prepareStatement(sql);
//				//4. 실행 => 결과 저장
//				rs = pstmt.executeQuery();
//				//5. 결과 접근, 글개수 가져오기
//				if(rs.next()) {
//					count = rs.getInt("count(*)");
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				close();
//			}
//			return count;
//		} //getBoardCount
		
		
		
		
	


}//qnaboard
