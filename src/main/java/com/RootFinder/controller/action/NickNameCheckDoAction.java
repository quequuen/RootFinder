package com.RootFinder.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.UserDAO;

public class NickNameCheckDoAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		String nickname = request.getParameter("name");
		
		UserDAO uDao = UserDAO.getInstance();
		int result = uDao.confirmNick(nickname);
		
		request.setAttribute("name", nickname);
		request.setAttribute("result", result);
		
		RequestDispatcher rd = request.getRequestDispatcher("nicknamecheck.jsp");
		rd.forward(request, response);
		
	}
	

}
