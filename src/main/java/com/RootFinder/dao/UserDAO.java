package com.RootFinder.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.RootFinder.dto.UserDTO;

import util.DBManager;



public class UserDAO {
	private UserDAO() {
		
	}
	
	 private static UserDAO instance = new UserDAO();
	   
	   public static UserDAO getInstance() {
	      return instance;
	   }
	   
	   
	   public int userCheck(String userid, String pwd) {
		      int result = -1;
		      String sql = "select pwd from userInf where id=?";
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      System.out.println(userid + "   " + pwd);
		      
		      try {
		         conn = DBManager.getConnection();
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, userid);
		         rs = pstmt.executeQuery();
		         if(rs.next()) {
		            if(rs.getString("pwd") != null && rs.getString("pwd").equals(pwd)) {
		               result = 1;  // 아이디와 패스워드가 일치
		            }else {
		               result = 0; // 아이디는 있는데 패스워드가 일치하지 않을때
		            }
		         }else {
		            result = -1;  // 아이디도 존재하지 않을때
		            
		         }
		         
		         
		      }catch(Exception e) {
		         e.printStackTrace();
		      }finally {
		         DBManager.close(conn, pstmt, rs);
		      }
		      return result;
		   
		   }
	   
	   public UserDTO getUser(String userid) {
		   UserDTO uDto = null;
		   String sql="select * from userInf where id=?";
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   try {
			   
			   uDto = new UserDTO();
			   conn= DBManager.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, userid);
			   rs=pstmt.executeQuery();
			   if(rs.next()) {
				   uDto = new UserDTO();
				   uDto.setId(rs.getString("id"));
				   uDto.setPwd(rs.getString("pwd"));
				   uDto.setUsername(rs.getString("username"));
				   uDto.setEmail(rs.getString("email"));
				   uDto.setMbti(rs.getString("mbti"));
				   uDto.setPhone(rs.getString("phone"));
				   uDto.setBirth(rs.getString("birth"));
				   uDto.setGender(rs.getString("gender"));
				   uDto.setProfile_img(rs.getString("profile_img"));
			   }
			   
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally {
			   DBManager.close(conn, pstmt, rs);
			   
		   }
		   return uDto;
	   }
	   
	   public int confirm(String userid) {
		   int result = -1;
		   String sql = "select id from userInf where id=?";
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   
		   try {
			   conn = DBManager.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, userid);
			   rs= pstmt.executeQuery();
			   
			   if(rs.next()) {
				   result=1; //아이디가 존재할 때
			   }else {
				   result=-1; //아이디가 존재하지 않을 때
			   }
		   }catch(Exception e){
			   e.printStackTrace();
		   }finally {
			  DBManager.close(conn, pstmt, rs);
		   }
		   return result;
	   }
	   
	 //회원가입 메소드
	   public int insertMember(UserDTO uDto) {
		   int result=-1;
		   String sql="insert into userInf values(?,?,?,?,?,?,?,?,?)";
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   try {
			   conn= DBManager.getConnection();
			   pstmt= conn.prepareStatement(sql);
			   pstmt.setString(1, uDto.getId());
			   pstmt.setString(2, uDto.getPwd());
			   pstmt.setString(3, uDto.getUsername());
			   pstmt.setString(4, uDto.getEmail());
			   pstmt.setString(5, uDto.getMbti());
			   pstmt.setString(6, uDto.getPhone());
			   pstmt.setString(7, uDto.getBirth());
			   pstmt.setString(8, uDto.getGender());
			   pstmt.setString(9, null);
			   
			   result = pstmt.executeUpdate();
		   }catch(Exception e){
			   e.printStackTrace();
			   
		   }finally {
			   DBManager.close(conn, pstmt);
		   }
		   return result;
	   }
	   
	   //회원 정보 수정에 대한 메소드
	   public int updateMember(UserDTO uDto) {
		   int result = -1;
		   String sql= "update userInf set pwd=?,username=?,email=?,mbti=?,phone=?,where id=?";
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   try {
			   conn= DBManager.getConnection();
			   pstmt= conn.prepareStatement(sql);
			   pstmt.setString(1, uDto.getPwd());
			   pstmt.setString(2, uDto.getUsername());
			   pstmt.setString(3, uDto.getEmail());
			   pstmt.setString(4, uDto.getMbti());
			   pstmt.setString(5, uDto.getPhone());
			   
			   
			   result = pstmt.executeUpdate();
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally {
			   DBManager.close(conn, pstmt);
		   }
		   return result;
	   }
	   
	   public int confirmNick(String nickname) {
			int result = -1;
			String sql = "select username from userInf where username=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = DBManager.getConnection();
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, nickname);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = 1; //id가 존재
				}else {
					result = -1; //id가 존재하지 않음
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, pstmt, rs);
			}
			return result;
			
		}
	   
	   // 가져온 코드를 통해 그 유저의 정보 가져오기(가연)
	   public UserDTO getOneCoseUserByCode(String code) {
		UserDTO userDTO = new UserDTO();
		CoseDAO coseDAO = CoseDAO.getInstance();
		String id = coseDAO.getIdByCode(code);
		System.out.println(id);
		String sql = "select * from userInf where id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 try {
			 conn = DBManager.getConnection();
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 userDTO.setUsername(rs.getString("username"));
				 userDTO.setId(rs.getString("id"));
				 userDTO.setProfile_img(rs.getString("profile_img"));
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 DBManager.close(conn, pstmt, rs);
		 }
		return userDTO;
	   }
	  
	   
	// 프로필 이미지 업로드
	   public int profileUpdate(String profile_img, String id) {
	      String sql = "update userinf set profile_img=? where id=?";
	      // System.out.println("id: " + id);
	      // System.out.println("profile_img: " + profile_img);
	      Connection conn = null;
	      PreparedStatement pstmt = null;

	      try {
	         conn = DBManager.getConnection();
	         pstmt = conn.prepareStatement(sql);

	         pstmt.setString(1, profile_img);
	         pstmt.setString(2, id);
	         
	         pstmt.executeUpdate();

	         return 1;
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         DBManager.close(conn, pstmt);
	      }
	      return -1;
	   }
	   
	   //id를 통해 댓글창에 뿌릴 username 가져오는 메소드(가연)
	   public String getUserNameById(String id) {
		   UserDTO userDTO = new UserDTO();
		   String username = null;
		   String sql = "select username from userInf where id = ? ";
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   try {
			   conn = DBManager.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, id);
			   rs = pstmt.executeQuery();
			   
			   if(rs.next()) {
				   userDTO.setUsername(rs.getString("username"));
				   username = userDTO.getUsername();
			   }
		   }catch(Exception e) {
			   e.printStackTrace();
		   }finally {
			   DBManager.close(conn, pstmt, rs);
		   }
		   return username;
	   }
	   
	// 회원 정보 수정
		public int updateMember(UserDTO uDto, boolean isChangePass) {
			int result = -1;

			String sql = null;
			Connection conn = null;
			PreparedStatement pstmt = null;

			try {
				conn = DBManager.getConnection();

				if (isChangePass) { // 비밀번호 변경 O
					sql = "update userInf set pwd=?,username=?,email=?,mbti=?,phone=?,birth=?,gender=?,profile_img=? where id=?";
					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, uDto.getPwd());
					pstmt.setString(2, uDto.getUsername());
					pstmt.setString(3, uDto.getEmail());
					pstmt.setString(4, uDto.getMbti());
					pstmt.setString(5, uDto.getPhone());
					pstmt.setString(6, uDto.getBirth());
					pstmt.setString(7, uDto.getGender());
					pstmt.setString(8, uDto.getProfile_img());
					pstmt.setString(9, uDto.getId());
				} else { // 비밀번호 변경 X, 패스워드 값 제외하고 수정
					sql = "update userInf set username=?,email=?,mbti=?,phone=?,birth=?,gender=?,profile_img=? where id=?";
					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, uDto.getUsername());
					pstmt.setString(2, uDto.getEmail());
					pstmt.setString(3, uDto.getMbti());
					pstmt.setString(4, uDto.getPhone());
					pstmt.setString(5, uDto.getBirth());
					pstmt.setString(6, uDto.getGender());
					pstmt.setString(7, uDto.getProfile_img());
					pstmt.setString(8, uDto.getId());
				}

				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
			return result;
		}
	   
	   
//--------------------------------------------[관리자]------------------------------------------------------------------	   
	   //관리자 페이지에서 모든 회원 정보 가져오기
	   public ArrayList<UserDTO> allUserInf(String id)
	   {
		   
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   
		   ArrayList<UserDTO> allUserList = new ArrayList<UserDTO>();
		   UserDTO udto = null;
		   
		   String sql = "select * from userinf where id != ?";
		   
		   try {
			   conn = DBManager.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, id);
			   rs = pstmt.executeQuery();
			   
			   while(rs.next())
			   {
				   udto = new UserDTO();
				   udto.setId(rs.getString("id"));
				   udto.setPwd(rs.getString("pwd"));
				   udto.setUsername(rs.getString("username"));
				   udto.setEmail(rs.getString("email"));
				   udto.setMbti(rs.getString("mbti"));
				   udto.setPhone(rs.getString("phone"));
				   udto.setBirth(rs.getString("birth"));
				   udto.setGender(rs.getString("gender"));
				   udto.setProfile_img(rs.getString("profile_img"));
			   
				   allUserList.add(udto);
			   }
			   
		   }catch(Exception e)
		   {
			   e.printStackTrace();
		   }finally {
			   DBManager.close(conn, pstmt, rs);
		   }
		   return allUserList;
	   }
	   
	   
	   //관리자화면_회원관리에서 아이디 클릭시 회원 정보를 뿌리는 메소드
	   public ArrayList<UserDTO> admin_userInf_list(String id)
	   {
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   ResultSet rs = null;
		   
		   String sql = "select * from userInf where id = ?";
		   
		   ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
		   
		   UserDTO udto = null;
		   
		   try {
			   conn = DBManager.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, id);
			   rs = pstmt.executeQuery();
			   
			   if(rs.next())
			   {
				   udto = new UserDTO();
				   
				   udto.setId(rs.getString("id"));
				   udto.setPwd(rs.getString("pwd"));
				   udto.setUsername(rs.getString("username"));
				   udto.setEmail(rs.getString("email"));
				   udto.setMbti(rs.getString("mbti"));
				   udto.setPhone(rs.getString("phone"));
				   udto.setBirth(rs.getString("birth"));
				   udto.setGender(rs.getString("gender"));
				   udto.setProfile_img(rs.getString("profile_img"));
				   
				   userList.add(udto);
			   }
			   
		   } catch(Exception e)
		   {
			   e.printStackTrace();
		   } finally {
			   DBManager.close(conn, pstmt, rs);
		   }
		   
		   return userList;
	   }
	   
	   //관리자 화면에서 회원 정보 변경(ID,사용자명,프로필 사진)
	   public int AdminUpdateUserInf(String current_id,String update_username,String update_profile_img)
	   {
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   int result = -1;
		   
		   String sql = "update userinf set username = ?, profile_img = ? where id = ?";
		   
		   try {
			   conn = DBManager.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, update_username);
			   pstmt.setString(2, update_profile_img);
			   pstmt.setString(3, current_id);
			   
			   result = pstmt.executeUpdate();
			   
		   } catch(Exception e)
		   {
			   System.out.println("오류 메시지 : "+e.getMessage());
		   }
		   
		   return result;
	  }
	   
	   //관리자 화면에서 회원 탈퇴
	   public int AdminDeleteAll(String id)
	   {
		   Connection conn = null;
		   PreparedStatement pstmt = null;
		   
		   int result = -1;
		   
		   String sql= "delete from userinf where id = ?";   
		   
		   try {
			   conn = DBManager.getConnection();
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1,id);
			   result = pstmt.executeUpdate();
			   
		   } catch(Exception e)
		   {
			   System.out.println(e.getMessage());
		   } finally {
			   DBManager.close(conn, pstmt);
		   }
		   
		   return result;
		   
	   }
}
