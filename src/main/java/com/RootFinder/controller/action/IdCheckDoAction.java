package com.RootFinder.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.UserDAO;

public class IdCheckDoAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		
		UserDAO uDao = UserDAO.getInstance();
		int result = uDao.confirm(userid);
		request.setAttribute("userid", userid);
		request.setAttribute("result", result);
		
		RequestDispatcher rd = request.getRequestDispatcher("idCheck.jsp");
		rd.forward(request, response);
		
	}
	

}
