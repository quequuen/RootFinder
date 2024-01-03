package com.RootFinder.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.UserDAO;
import com.RootFinder.dto.UserDTO;

public class UpdateUserInfAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		UserDAO uDao = UserDAO.getInstance();
		UserDTO uDto = uDao.getUser(userid);
		request.setAttribute("uDao", uDao);
		RequestDispatcher rd = request.getRequestDispatcher("userUpdate.jsp");
		rd.forward(request, response);
	}

}
