package com.RootFinder.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dao.UserDAO;
import com.RootFinder.dto.CoseCommentDTO;
import com.RootFinder.dto.CoseDTO;
import com.RootFinder.dto.CoseListDTO;
import com.RootFinder.dto.UserDTO;

public class LoginDoAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "login.jsp";
		String userid = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		UserDAO uDao = UserDAO.getInstance();
		CoseDAO cDao = CoseDAO.getInstance();
		
		//메인 로그인/ 댓글 로그인 
		String where = request.getParameter("where");

	    String code = request.getParameter("code");

		
		
		int result = uDao.userCheck(userid, pwd);
		if(result==1) {
		
			
			if(where.equals("main")) {
			//로그인 성공시 회원정보를 가지고 메인 페이지(로그인 후)로 이동
			UserDTO uDto = uDao.getUser(userid);
			
			//로그인 성공시 회원과 동일한 MBTI를 가진 사용자가 올린 코스, 동일한 연령대와 성별을 가진 코스를 ArrayList에 삽입
			ArrayList<CoseListDTO> mbti_coseList = cDao.selectMBTICose(uDto.getMbti());
			ArrayList<CoseListDTO> age_gender_coseList = cDao.selectAgeGenderCose(uDto.getBirth(), uDto.getGender());
			HttpSession session = request.getSession(); 
			
			session.setAttribute("loginUser", uDto);
			
			session.setAttribute("mbti_coseList", mbti_coseList);
			
			System.out.println("mbtiList : "+mbti_coseList);
			session.setAttribute("age_gender_coseList", age_gender_coseList);
			System.out.println("age_gender_coseList : "+age_gender_coseList);

			url="mainpage_after_login.jsp";
			
			if(userid.equals("hmjcp") && pwd.equals("1234"))
			{
				ArrayList<UserDTO> allUserInf = uDao.allUserInf(userid);
				session.setAttribute("allUserInf", allUserInf);
				
				ArrayList<CoseListDTO> allCoseList = cDao.allCoseList();
				session.setAttribute("allCoseList", allCoseList);
				
				
				ArrayList<CoseCommentDTO> allCommentList = cDao.allCommentList();
				session.setAttribute("allCommentList", allCommentList);
				url="admin_mainpage.jsp";
			}
			
			 }else if(where.equals("comment")){
				 UserDTO uDto = uDao.getUser(userid);

                 HttpSession session = request.getSession();

                 session.setAttribute("loginUser", uDto);

                 System.out.println(code);

                 request.setAttribute("code", code);

                url="RootFinderServlet?command=root_comment_check";

           }

			
			
		}else if(result==0){
			request.setAttribute("message", "비밀번호가 맞지 않습니다");
			request.setAttribute("logincheck", "nopwd");
		}else if(result==-1){
			request.setAttribute("message", "존재하지 않는 회원입니다");
			request.setAttribute("logincheck", "no");
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
