package com.RootFinder.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RootFinder.dao.UserDAO;
import com.RootFinder.dto.UserDTO;

public class JoinDoAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //setAttribute 는 response
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String mbti = request.getParameter("mbtiresult");
		String birth = request.getParameter("userNum_front");
		String gender_num = request.getParameter("userNum_back");
		int age = Integer.parseInt(birth);
		
		//주민번호 뒷자리의 첫번째 숫자를 가져와서 몇년 생인지에 따라 성별을 알아냄
		String b_usernum_first = gender_num.trim();
		
		String gender_str = "";
		//앞자리중 몇년생인지 파악하기 위해 10000으로 나누어 앞에 두자리만 알 수 있도록함
		int f_birth = age / 10000;
		System.out.println("주민번호 뒷자리: "+b_usernum_first);
		
		if(f_birth >=0 && f_birth <=23)
		{
			if(b_usernum_first.equals("3"))
				gender_str = "남자";
			if(b_usernum_first.equals("4"))
				gender_str = "여자";
			
			//뒷자리 시작이 0부터 23사이면 2000년 이후에 태어난 사람이기때문에 2000을 더한다.
			age = 2023 - (2000+f_birth);
			
		} else {
			if(b_usernum_first.equals("1"))
				gender_str = "남자";
			if(b_usernum_first.equals("2"))
				gender_str = "여자";
			
			//뒷자리 시작이 0부터 23사이가 아니라면 2000년 이전에 태어난 사람이기때문에 1900을 더한다.
			age = 2023 - (1900+f_birth);
		}
	
		UserDTO uDto = new UserDTO();
		uDto.setUsername(name);
		uDto.setId(userid);
		uDto.setPwd(pwd);
		uDto.setEmail(email);
		uDto.setPhone(phone);
		uDto.setMbti(mbti);
		uDto.setBirth(Integer.toString(age));
		uDto.setGender(gender_str);
		
		UserDAO uDao = UserDAO.getInstance();
		
		int result = uDao.insertMember(uDto);
		
		HttpSession session = request.getSession();
		if(result==1) {
			session.setAttribute("id", uDto.getId());
			session.setAttribute("message", "회원가입에 성공했습니다");
			
		}else {
			request.setAttribute("message", "회원가입에 실패하였습니다");
		}
		RequestDispatcher rd = request.getRequestDispatcher("RootFinderServlet?command=login_view&where=main");
		rd.forward(request, response);
		session.setAttribute("message", "");
		
	}
	

}
