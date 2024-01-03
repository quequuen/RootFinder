package com.RootFinder.dao;

import java.util.ArrayList;

import java.sql.*;

import com.RootFinder.dto.CoseCommentDTO;
import com.RootFinder.dto.CoseDTO;
import com.RootFinder.dto.CoseListDTO;
import com.RootFinder.dto.UserDTO;

import util.DBManager;

public class CoseDAO {
	private CoseDAO() {
			
		}
		
   private static CoseDAO instance = new CoseDAO();
	   
   public static CoseDAO getInstance() {
	      return instance;
	   }
   
   //메인화면에 뿌릴 MBTI별 코스
   public ArrayList<CoseListDTO> selectMBTICose(String mbti)
   {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   
	   ArrayList<CoseListDTO> coseList = new ArrayList<CoseListDTO>();
	   
	   CoseListDTO cldto = null;
	   
	   String sql = "select * from cose_list_table"
	   		+ " where code IN(select distinct code from userinf join cose_table on userinf.id = cose_table.id where mbti=?) order by view_cnt desc";
	   
	   try {
		  
		  conn = DBManager.getConnection();
		  pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, mbti);
		  rs = pstmt.executeQuery();
		  
		  while(rs.next())
		  {
			cldto = new CoseListDTO();
			
			cldto.setCode(rs.getString("code"));
			cldto.setMain_addr(rs.getString("main_addr"));
			cldto.setMain_img(rs.getString("main_img"));
			cldto.setTitle(rs.getString("title"));
			cldto.setView_cnt(rs.getInt("view_cnt"));
			
			coseList.add(cldto);
		  }
		   
		   
	   }catch(Exception e)
	   {
		   e.printStackTrace();
	   }finally {
		   DBManager.close(conn, pstmt, rs);
	   }
	   
	   return coseList;
	   
   }
   
 //메인화면에 뿌릴 나이,성별 코스
   public ArrayList<CoseListDTO> selectAgeGenderCose(String age,String gender)
   {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   
	   ArrayList<CoseListDTO> coseList = new ArrayList<CoseListDTO>();
	   
	   CoseListDTO cldto = null;
	   

	   String sql = "select * from cose_list_table"
		   		+ " where code IN(select distinct code from userinf join cose_table on userinf.id = cose_table.id where birth like ?||'%' and gender=?) order by view_cnt desc";
	   try {
		  
		  conn = DBManager.getConnection();
		  pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, age);
		  pstmt.setString(2, gender);
		  rs = pstmt.executeQuery();
		  
		  while(rs.next())
		  {
			  
			  cldto = new CoseListDTO();
			  
			  cldto.setCode(rs.getString("code"));
			  cldto.setMain_addr(rs.getString("main_addr"));
			  cldto.setMain_img(rs.getString("main_img"));
			  cldto.setTitle(rs.getString("title"));
			  cldto.setView_cnt(rs.getInt("view_cnt"));
			  
			  coseList.add(cldto);
		  }
		   
		   
	   }catch(Exception e)
	   {
		   e.printStackTrace();
	   }finally {
		   DBManager.close(conn, pstmt, rs);
	   }
	   
	   System.out.println("나이성별"+coseList);
	   return coseList;
	   
   }
   
   
   
 //여행지 클릭시 지역별로 cose_table의 데이터를 가져오는 메소드
public ArrayList<CoseListDTO> localCoseList(String local){
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
		
	ArrayList<CoseListDTO> localCoseList = new ArrayList<CoseListDTO>();
	
	CoseListDTO clDto = null;
	
	try {
		conn = DBManager.getConnection();
		
		// 인천/경기 와 같이 지역이 두 개씩 묶여있는 local값은 split을 통해 나눠서 실행함
		if(local.length() > 2)
		{
			String locals[] = local.split("/");
			sql = "select * from cose_list_table where main_addr like '%' || ? || '%' OR main_addr like '%' || ? || '%' order by view_cnt desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, locals[0]);
			pstmt.setString(2, locals[1]);
		}
		else {
			sql = "select * from cose_list_table where main_addr like '%' || ? || '%' order by view_cnt desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, local);
		}
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			clDto = new CoseListDTO();
			
			clDto.setCode(rs.getString("code"));
			clDto.setMain_img(rs.getString("main_img"));
			clDto.setTitle(rs.getString("title"));
			clDto.setMain_addr(rs.getString("main_addr"));
			clDto.setView_cnt(rs.getInt("view_cnt"));
			
			System.out.println("받아온 지역 코스 : "+clDto);
			
			localCoseList.add(clDto);
		}
		
		
	} catch(Exception e)
	{
		e.printStackTrace();
	} finally {
		DBManager.close(conn, pstmt, rs);
	}
	
	return localCoseList;
	
}


//가연 추가
//가져온 코드를 통해 타이틀 가져오기 
	public String getTitleByCode(String code) {
		String sql = "select title from cose_list_table where code = ? ";
		
		CoseListDTO clDTO = new CoseListDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String title = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				clDTO.setTitle(rs.getString("title"));
				title = clDTO.getTitle();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return title;
	}
	
	
	
	   
	
   
		//검색으로 코스 찾기
		public ArrayList<CoseListDTO> selectSearch(String search)
		{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			CoseListDTO clDto = null;
			
			ArrayList<CoseListDTO> search_cose_list = new ArrayList<CoseListDTO>();
			
			String sql = "select * from cose_list_table where main_addr like '%' || ? || '%' order by view_cnt desc";
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, search);
				rs = pstmt.executeQuery();
				
				while(rs.next())
				{
					clDto = new CoseListDTO();
					
					clDto.setCode(rs.getString("code"));
					clDto.setMain_addr(rs.getString("main_addr"));
					clDto.setMain_img(rs.getString("main_img"));
					clDto.setTitle(rs.getString("title"));
					clDto.setView_cnt(rs.getInt("view_cnt"));
					
					search_cose_list.add(clDto);
				}
				
			} catch(Exception e)
			{
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			
			return search_cose_list;
		}
		
	
		
		//code를 통해 코스를 올린 사용자명 가져오기
		
		public String getUsernameByCode(String code)
		{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select userinf.username from cose_table join userinf on cose_table.id = userinf.id where code=?";
				
			
			String username="";
			
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, code);
				rs = pstmt.executeQuery();
				
				if(rs.next())
				{
					username = rs.getString("username");
				}
				
				
			} catch(Exception e)
			{
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
				
			}
			
			return username;
		}
		
		
		//----------------------------------------------
		
		//가연추가
		public String getTitle(String code) {

		      String sql = "select title from cose_list_table where code = ? ";

		      CoseListDTO clDTO = new CoseListDTO();

		      Connection conn = null;

		      PreparedStatement pstmt = null;

		      ResultSet rs = null;

		      String title= null;

		      

		      try {

		         conn = DBManager.getConnection();

		         pstmt = conn.prepareStatement(sql);

		         pstmt.setString(1, code);

		         rs = pstmt.executeQuery();

		         

		         if(rs.next()) {

		            clDTO.setTitle(rs.getString("title"));

		            title = clDTO.getTitle();

		         }

		         

		         

		      }catch(Exception e) {

		         e.printStackTrace();

		      }finally {

		         DBManager.close(conn, pstmt, rs);

		      }

		      return title;

		   }



		   

		   //가져온 코드를 통해 아이디 가져오기 (가연 추가)

		      public String getIdByCode(String code) {

		         String sql = "select id from cose_table where code = ? ";

		         CoseDTO coseDTO = new CoseDTO();

		         Connection conn = null;

		         PreparedStatement pstmt = null;

		         ResultSet rs = null;

		         String id = null;

		         

		         try {

		            conn = DBManager.getConnection();

		            pstmt = conn.prepareStatement(sql);

		            System.out.println(code);

		            pstmt.setString(1, code);

		            rs = pstmt.executeQuery();

		            

		            if(rs.next()) {

		               coseDTO.setId(rs.getString("id"));

		               id = coseDTO.getId();

		            }

		         }catch(Exception e) {

		            e.printStackTrace();

		         }finally {

		            DBManager.close(conn, pstmt, rs);

		         }

		         return id;

		      

		      }

		   

		      //가져온 코드를 통해 그 사람의 코스 다 가져오기(가연 추가)

		      public ArrayList<CoseDTO> getOneCoseByCode(String code){

		         ArrayList<CoseDTO> coseList = new ArrayList<CoseDTO>();

		         CoseDTO coseDTO = null;

		         String sql = "select * from cose_table where code = ?";

		         Connection conn = null;

		         PreparedStatement pstmt = null;

		         ResultSet rs = null;

		         

		         try {

		            conn = DBManager.getConnection();

		            pstmt = conn.prepareStatement(sql);

		            pstmt.setString(1, code);

		            rs = pstmt.executeQuery();

		            

		            while(rs.next()) {

		               coseDTO = new CoseDTO();

		               coseDTO.setId(rs.getString("id"));

		               coseDTO.setDay(rs.getString("day"));

		               coseDTO.setImg(rs.getString("img"));

		               coseDTO.setPlaceName(rs.getString("place_name"));

		               coseDTO.setAddr(rs.getString("addr"));

		               coseDTO.setPrice(rs.getString("price"));

		               coseDTO.setStarttime(rs.getString("starttime"));

		               coseDTO.setEndtime(rs.getString("endtime"));

		               coseDTO.setCose_date(rs.getDate("cose_date"));

		               coseDTO.setContent(rs.getString("content"));

		               

		               coseList.add(coseDTO);

		            }

		         }catch(Exception e) {

		            e.printStackTrace();

		         }finally {

		            DBManager.close(conn, pstmt, rs);

		         }

		         return coseList;

		      }

		   
		      
		      
		      
		      
		 


		    //민준 추가
				public int cosecodeInsert(String code,String id) {
					int result = -1;
					String sql = "INSERT INTO cose_code_table VALUES (?,?)";//code
					Connection conn = null;
				    PreparedStatement pstmt = null;
				    System.out.println(code);
				    try {
				        conn = DBManager.getConnection();
				        pstmt = conn.prepareStatement(sql);
				        pstmt.setString(1, code);
				        pstmt.setString(2, id);
				        result = pstmt.executeUpdate();
				    } catch (Exception e) {
				        e.printStackTrace();
				    } finally {
				        DBManager.close(conn, pstmt);
				    }
				    return result;
				}
				
				
				public int coseListInsert(String code,String id,String main_img,String title,String main_addr)
				{
					
					int result = -1;
					String sql = "insert into cose_list_table values(?,?,?,?,?,0)";
					Connection conn = null;
					PreparedStatement pstmt = null;
					
					try {
						conn = DBManager.getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, code);
						pstmt.setString(2, id);
						pstmt.setString(3, main_img);
						pstmt.setString(4, title);
						pstmt.setString(5, main_addr);
						
						result = pstmt.executeUpdate();
						
					}catch(Exception e)
					{
						e.printStackTrace();
					}finally {
						DBManager.close(conn, pstmt);
					}
					return result;
					
				}

				
				 public int rootInsert(CoseDTO rdto, String content) {
				      int result = -1;
				      String sql = "insert into cose_table values(?,?,?,?,?,?,?,?,?,?,?)";// (code,id,addr,price,starttime,endtime,cose_date,day,img,content,PLACE_NAME)
				      Connection conn = null;
				      PreparedStatement pstmt = null;
				      System.out.println(rdto);
				      java.util.Date utilDate = rdto.getCose_date();
				      java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
				      System.out.println(sqlDate);
				      try {
				         conn = DBManager.getConnection();
				         pstmt = conn.prepareStatement(sql);
				         pstmt.setString(1, rdto.getCode());
				         pstmt.setString(2, rdto.getId());
				         pstmt.setString(3, rdto.getAddr());
				         pstmt.setString(4, rdto.getPrice());
				         pstmt.setString(5, rdto.getStarttime());
				         pstmt.setString(6, rdto.getEndtime());
				         pstmt.setDate(7, sqlDate);
				         pstmt.setString(8, "Day" + rdto.getDay());
				         pstmt.setString(9, rdto.getImg());
				         pstmt.setString(10, content);
				         pstmt.setString(11, rdto.getPlaceName());
				         result = pstmt.executeUpdate();
				      } catch (Exception e) {
				         e.printStackTrace();

				      } finally {
				         DBManager.close(conn, pstmt);
				      }
				      return result;
				   }
				
				
				
				
				public ArrayList<CoseListDTO> allCoseList()
				{
					   Connection conn = null;
					   PreparedStatement pstmt = null;
					   ResultSet rs = null;
					   
					   ArrayList<CoseListDTO> allCoseList = new ArrayList<CoseListDTO>();
					   CoseListDTO cldto = null;
					   
					   String sql = "select * from cose_list_table";
					   
					   try {
						   conn = DBManager.getConnection();
						   pstmt = conn.prepareStatement(sql);
						   rs = pstmt.executeQuery();
						   
						   while(rs.next())
						   {
							   cldto = new CoseListDTO();
							   
							   cldto.setCode(rs.getString("code"));
							   cldto.setMain_addr(rs.getString("main_addr"));
							   cldto.setTitle(rs.getString("title"));
							   cldto.setMain_img(rs.getString("main_img"));
							   cldto.setView_cnt(rs.getInt("view_cnt"));
							   
							   allCoseList.add(cldto);
						   }
						   
					   }catch(Exception e)
					   {
						   e.printStackTrace();
					   }finally {
						   DBManager.close(conn, pstmt, rs);
					   }
					   return allCoseList;
				}
				
				
				public ArrayList<CoseCommentDTO> allCommentList()
				{
					   Connection conn = null;
					   PreparedStatement pstmt = null;
					   ResultSet rs = null;
					   
					   ArrayList<CoseCommentDTO> allCommentList = new ArrayList<CoseCommentDTO>();
					   CoseCommentDTO cmdto = null;
					   
					   String sql = "select * from cose_comment_table";
					   
					   try {
						   conn = DBManager.getConnection();
						   pstmt = conn.prepareStatement(sql);
						   rs = pstmt.executeQuery();
						   
						   while(rs.next())
						   {
							   cmdto = new CoseCommentDTO();
							   
							   cmdto.setCode(rs.getString("code"));
							   cmdto.setId(rs.getString("id"));
							   cmdto.setComment_write_time(rs.getString("comment_write_time"));
							   cmdto.setComment_text(rs.getString("comment_text"));
							   cmdto.setPrt_num(rs.getInt("prt_num"));
							   cmdto.setCdr_num(rs.getInt("cdr_num"));
							   
							   allCommentList.add(cmdto);
						   }
						   
					   }catch(Exception e)
					   {
						   e.printStackTrace();
					   }finally {
						   DBManager.close(conn, pstmt, rs);
					   }
					   return allCommentList;
				}
				
				
				//클릭시 조회수 증가 메소드
				public void view_cnt_increase(String code)
				{
					Connection conn = null;
					PreparedStatement pstmt =  null;
					
					String sql = "update cose_list_table set view_cnt = view_cnt + 1 where code = ?";
					
					try {
						conn = DBManager.getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, code);
						pstmt.executeUpdate();
					} catch(Exception e)
					{
						e.printStackTrace();
					} finally {
						DBManager.close(conn, pstmt);
					}
					
				}
				
				
				//코스 클릭시 내가 조회한 코스로 저장
				public int InsertMyViewCose(String id, String code)
				{
					Connection conn = null;
					PreparedStatement pstmt = null;
					
					String sql = "insert into view_cose_table values(?,?)";
					
					int result = -1;
					
					try {
						conn = DBManager.getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.setString(2,code);
						
						result = pstmt.executeUpdate();
						
					} catch(Exception e)
					{
						System.out.println(e.getMessage());
					} finally {
						DBManager.close(conn, pstmt);
					}
					
					return result;
				}
				
				
				//내가 조회한 코스 확인하기
				public ArrayList<CoseListDTO> MyViewCose(String id)
				{
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String sql ="select distinct * from view_cose_table join cose_list_table on view_cose_table.code = cose_list_table.code where view_cose_table.id = ?";
					
					ArrayList<CoseListDTO> view_cose_list = new ArrayList<CoseListDTO>();
					CoseListDTO cldto = null;
					
					try {
						conn = DBManager.getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						
						while(rs.next())
						{
							cldto = new CoseListDTO();
							cldto.setCode(rs.getString("code"));
							cldto.setMain_addr(rs.getString("main_addr"));
							cldto.setMain_img(rs.getString("main_img"));
							cldto.setTitle(rs.getString("title"));
							cldto.setView_cnt(rs.getInt("view_cnt"));
							
							view_cose_list.add(cldto);
						}
						
						
					} catch(Exception e)
					{
						System.out.println(e.getMessage());
					} finally {
						DBManager.close(conn, pstmt, rs);
					}
					
					return view_cose_list;
				}
	   
				
				
				
				//현재 시간을 기준으로 댓글 등록(가연 추가)
			      public void insertComment(String code, String id, String inputComment){
			    	 String sql = "insert into cose_comment_table values(?,?, to_char(CURRENT_TIMESTAMP,'YYYY-MM-DD HH24:MI'),?,prt_seq.nextval, 0)";
			    	 Connection conn=null;
			    	 PreparedStatement pstmt=null;
			    	 try {
			    		 conn = DBManager.getConnection();
			    		 pstmt = conn.prepareStatement(sql);
			    		 pstmt.setString(1, code);
			    		 pstmt.setString(2, id);
			    		 pstmt.setString(3, inputComment);
			    		 pstmt.executeUpdate();
			    		 
			    	 }catch(Exception e) {
			    		 e.printStackTrace();
			    	 }finally {
			    		 DBManager.close(conn, pstmt);
			    	 }
			      }
			      
			      
			    //현재시간을 기준으로 대댓글 등록(가연 추가)
			      public void insertReComment(String code, String id, String inputReComment, int prt_num, int cdr_num) {
			    	  String sql = "insert into cose_comment_table values(?,?,to_char(CURRENT_TIMESTAMP,'YYYY-MM-DD HH24:MI'),?,?,?)";
			    	  Connection conn = null;
			    	  PreparedStatement pstmt = null;
			    	  
			    	  try {
			    		  conn = DBManager.getConnection();
			    		  pstmt = conn.prepareStatement(sql);
			    		  pstmt.setString(1, code);
			    		  pstmt.setString(2, id);
			    		  pstmt.setString(3, inputReComment);
			    		  pstmt.setInt(4, prt_num);
			    		  pstmt.setInt(5, cdr_num);
			    		  pstmt.executeUpdate();
			    	  }catch(Exception e) {
			    		  e.printStackTrace();
			    	  }finally {
			    		  DBManager.close(conn, pstmt);
			    	  }
			      }
			      
			      //댓글 가져오기(가연 추가)
			      public ArrayList<CoseCommentDTO> getCommentByCode(String code){
			    	  ArrayList<CoseCommentDTO> commentList = new ArrayList<CoseCommentDTO>();
			    	  CoseCommentDTO commentDTO = null;
			    	  String sql = "select * from cose_comment_table where code = ? order by prt_num asc, cdr_num asc, comment_write_time asc";
			    	  Connection conn = null;
			    	  PreparedStatement pstmt = null;
			    	  ResultSet rs = null;
			    	  
			    	  try {
			    		  conn = DBManager.getConnection();
			    		  pstmt = conn.prepareStatement(sql);
			    		  pstmt.setString(1, code);
			    		  rs = pstmt.executeQuery();
			    		  
			    		  while(rs.next()) {
			    			 commentDTO = new CoseCommentDTO();
			    			 commentDTO.setCode(rs.getString("code"));
			    			 commentDTO.setId(rs.getString("id"));
			    			 commentDTO.setComment_write_time(rs.getString("comment_write_time"));
			    			 commentDTO.setComment_text(rs.getString("comment_text"));
			    			 commentDTO.setPrt_num(rs.getInt("prt_num"));
			    			 commentDTO.setCdr_num(rs.getInt("cdr_num"));
			    			 commentList.add(commentDTO);
			    		  }
			    	  }catch(Exception e) {
			    		  e.printStackTrace();
			    	  }
			    	  return commentList;
			      }
			      
			      
			      
			      //코드로 메인이미지 가져오기
			      public String getMainImgByCode(String code)
			      {
			    	  Connection conn = null;
			    	  PreparedStatement pstmt = null;
			    	  ResultSet rs = null;
			    	  
			    	  String sql = "select main_img from cose_list_table where code = ?";
			    	  
			    	  String main_img="";
			    	  
			    	  try {
			    		  conn = DBManager.getConnection();
			    		  pstmt = conn.prepareStatement(sql);
			    		  pstmt.setString(1, code);
			    		  rs = pstmt.executeQuery();
			    		  
			    		  if(rs.next())
			    		  {
			    			  main_img = rs.getString("main_img");
			    		  }
			    	  }catch(Exception e)
			    	  {
			    		  e.printStackTrace();
			    	  }finally {
			    		  DBManager.close(conn, pstmt, rs);
			    	  }
			    	  return main_img;
			      }
			      
			      
			      
			      public ArrayList<CoseListDTO> MyCose(String id)
					{
						Connection conn = null;
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						
						String sql ="select * from cose_list_table where id = ?";
						
						ArrayList<CoseListDTO> my_cose_list = new ArrayList<CoseListDTO>();
						CoseListDTO cldto = null;
						
						try {
							conn = DBManager.getConnection();
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, id);
							rs = pstmt.executeQuery();
							
							while(rs.next())
							{
								cldto = new CoseListDTO();
								cldto.setCode(rs.getString("code"));
								cldto.setMain_addr(rs.getString("main_addr"));
								cldto.setMain_img(rs.getString("main_img"));
								cldto.setTitle(rs.getString("title"));
								cldto.setView_cnt(rs.getInt("view_cnt"));
								
								my_cose_list.add(cldto);
							}
							
							
						} catch(Exception e)
						{
							System.out.println(e.getMessage());
						} finally {
							DBManager.close(conn, pstmt, rs);
						}
						
						return my_cose_list;
					}
		   
	      		      
//---------------관리자 댓글 수정/삭제(가연)
			    //admin 계정으로 댓글 수정이나 삭제 할 때 수정(삭제)할 댓글을 가져오는 메소드(가연 추가)
					public CoseCommentDTO admin_select_comment(String code, int prt_num, int cdr_num) {
						Connection conn = null;
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						CoseCommentDTO commentDTO = new CoseCommentDTO();
						
						String sql = "select * from cose_comment_table where code = ? and prt_num = ? and cdr_num = ? ";
						
						try {
							conn = DBManager.getConnection();
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, code);
							pstmt.setInt(2, prt_num);
							pstmt.setInt(3, cdr_num);
							rs = pstmt.executeQuery();
							
							while(rs.next()) {
								commentDTO.setCode(rs.getString("code"));
								commentDTO.setId(rs.getString("id"));
								commentDTO.setComment_write_time(rs.getString("comment_write_time"));
								commentDTO.setComment_text(rs.getString("comment_text"));
								commentDTO.setPrt_num(rs.getInt("prt_num"));
								commentDTO.setCdr_num(rs.getInt("cdr_num"));
								
							}
						}catch(Exception e) {
							e.printStackTrace();
						}finally {
							DBManager.close(conn, pstmt, rs);
						}
						return commentDTO;
					}
					
					//admin 계정으로 댓글 수정하는 메소드(가연 추가)
					public int admin_update_comment(CoseCommentDTO commentDTO, String code, int prt_num, int cdr_num) {
						String sql = "update cose_comment_table set comment_text=? where code=? and prt_num=? and cdr_num=?";
						Connection conn = null;
						PreparedStatement pstmt = null;
						int result = -1;
						
						try {
							conn = DBManager.getConnection();
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, commentDTO.getComment_text());
							pstmt.setString(2, code);
							pstmt.setInt(3, prt_num);
							pstmt.setInt(4, cdr_num);
							result = pstmt.executeUpdate();
							
						}catch(Exception e) {
							e.printStackTrace();
						}finally {
							DBManager.close(conn, pstmt);
						}
						return result;
						
					
					}
					
					//admin 계정으로 댓글 삭제하는 메소드(가연 추가)
					public int admin_delete_comment(String code, int prt_num, int cdr_num) {
						
						Connection conn = null;
						PreparedStatement pstmt = null;
						int result = -1;
						
						
						if(cdr_num==0) {
							String sql = "delete from cose_comment_table where code=? and prt_num=?";
							try {
								conn = DBManager.getConnection();
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, code);
								pstmt.setInt(2, prt_num);
								result = pstmt.executeUpdate();
							}catch(Exception e) {
								e.printStackTrace();
							}finally {
								DBManager.close(conn, pstmt);
							}
						}else {
							String sql = "delete from cose_comment_table where code=? and prt_num=? and cdr_num=?";
							try {
								conn = DBManager.getConnection();
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, code);
								pstmt.setInt(2, prt_num);
								pstmt.setInt(3, cdr_num);
								result = pstmt.executeUpdate();
							}catch(Exception e) {
								e.printStackTrace();
							}finally {
								DBManager.close(conn, pstmt);
							}
						}
						
						return result;
					}
					
					public ArrayList<CoseDTO> AdminCoseByCode(String code)
					{
						Connection conn = null;
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						
						String sql ="select * from cose_table where code = ?";
						
						CoseDTO cdto = null;
						ArrayList<CoseDTO> cose_list = new ArrayList<CoseDTO>();
						
						try {
							conn = DBManager.getConnection();
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, code);
							rs = pstmt.executeQuery();
							
							while(rs.next())
							{
								cdto = new CoseDTO();
								
								cdto.setCode(rs.getString("code"));
								cdto.setId(rs.getString("id"));
								cdto.setAddr(rs.getString("addr"));
								cdto.setPrice(rs.getString("price"));
								cdto.setStarttime(rs.getString("starttime"));
								cdto.setEndtime(rs.getString("endtime"));
								cdto.setCose_date(rs.getDate("cose_date"));
								cdto.setDay(rs.getString("day"));
								cdto.setImg(rs.getString("img"));
								cdto.setContent(rs.getString("content"));
								cdto.setPlaceName(rs.getString("place_name"));
								
								cose_list.add(cdto);
							}
						} catch(Exception e)
						{
							System.out.println(e.getMessage());
						}finally{
							DBManager.close(conn, pstmt, rs);
						}
						
						System.out.println(cose_list);
						return cose_list;
						
					}
			      					
			  
}
