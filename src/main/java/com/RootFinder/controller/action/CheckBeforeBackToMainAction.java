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
import com.RootFinder.dto.CoseListDTO;
import com.RootFinder.dto.UserDTO;



public class CheckBeforeBackToMainAction implements Action{

@Override

public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   // TODO Auto-generated method stub

   HttpSession session = request.getSession();

   UserDTO loginUser = (UserDTO)session.getAttribute("loginUser");

   String url = null;

   

   if(loginUser==null) {

      url = "mainpage.jsp";

   }else if(loginUser!=null) {
	   
	    String userid = request.getParameter("id");
		System.out.println("아이디 : "+userid);
		UserDAO uDao = UserDAO.getInstance();
		CoseDAO cDao = CoseDAO.getInstance();
		//로그인 성공시 회원정보를 가지고 메인 페이지(로그인 후)로 이동
		UserDTO uDto = uDao.getUser(userid);
		
		//로그인 성공시 회원과 동일한 MBTI를 가진 사용자가 올린 코스, 동일한 연령대와 성별을 가진 코스를 ArrayList에 삽입
		ArrayList<CoseListDTO> mbti_coseList = cDao.selectMBTICose(uDto.getMbti());
		ArrayList<CoseListDTO> age_gender_coseList = cDao.selectAgeGenderCose(uDto.getBirth(), uDto.getGender());
		
		session.setAttribute("mbti_coseList", mbti_coseList);
		
		System.out.println("mbtiList : "+mbti_coseList);
		session.setAttribute("age_gender_coseList", age_gender_coseList);
		System.out.println("age_gender_coseList : "+age_gender_coseList);
	   

      url = "mainpage_after_login.jsp";

   }

   

   RequestDispatcher rd = request.getRequestDispatcher(url);

   rd.forward(request, response);

}

}