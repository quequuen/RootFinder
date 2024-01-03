package com.RootFinder.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dto.CoseListDTO;

public class MyCourseFormAction implements Action{
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String id = request.getParameter("id");
	
	CoseDAO cdao = CoseDAO.getInstance();
	
	ArrayList<CoseListDTO> my_cose_list = cdao.MyCose(id);
	
	request.setAttribute("my_cose_list", my_cose_list);
	
	RequestDispatcher rd = request.getRequestDispatcher("myCourse.jsp");
	rd.forward(request, response);
}
}
