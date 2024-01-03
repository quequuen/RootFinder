package com.RootFinder.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.UserDAO;
import com.RootFinder.dto.UserDTO;

public class AdminDeleteUserInfView implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="admin_delete_userinf_view.jsp";
		
		String id = request.getParameter("id");
		
		request.setAttribute("delete_id", id);
		
		UserDAO udao = UserDAO.getInstance();
		ArrayList<UserDTO> admin_user_list = udao.admin_userInf_list(id);
		
		request.setAttribute("admin_user_list", admin_user_list);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
