package com.RootFinder.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dao.UserDAO;
import com.RootFinder.dto.CoseDTO;
import com.RootFinder.dto.UserDTO;

public class RootScheduleFormAction implements Action{
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String code = request.getParameter("code");
	System.out.println(code);
	String url = "RootInform/rootSchedule.jsp";
	//루트를 작성한 사람의 정보 
	UserDAO userDAO = UserDAO.getInstance();
	UserDTO userDTO = userDAO.getOneCoseUserByCode(code);
	request.setAttribute("userDTO", userDTO);
	//루트 정보 
	CoseDAO coseDAO = CoseDAO.getInstance();
	ArrayList<CoseDTO> coseAboutCode = new ArrayList<CoseDTO>();
	coseAboutCode = coseDAO.getOneCoseByCode(code);
	System.out.println("일정표 : "+coseAboutCode);
	request.setAttribute("coseList", coseAboutCode);
	request.setAttribute("coseSchedule", coseAboutCode);
	//타이틀 따로 가져오기 
	String title = coseDAO.getTitleByCode(code);
	request.setAttribute("title", title);
	System.out.println("타이틀 : "+title);
	request.setAttribute("code", code);
	
	
	//CoseList에 존재하는 메인 이미지 가져오기
	String main_img = coseDAO.getMainImgByCode(code);
	
	request.setAttribute("main_img", main_img);
	
	RequestDispatcher rd = request.getRequestDispatcher(url);
	rd.forward(request, response);
}
}
