package com.RootFinder.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AgeGenderListViewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		
		String url = "age_gender_list.jsp";
		
		request.setAttribute("age", age);
		request.setAttribute("gender", gender);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

}
