package com.RootFinder.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DateParse;

public class RootWriteFormAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "rootWrite.jsp";
		String userid = request.getParameter("id");
		String title = request.getParameter("title");
		String startDay = request.getParameter("startDate");
		String endDay = request.getParameter("endDate");
		System.out.println(startDay);
		System.out.println(endDay);
		System.out.println(title);
		HttpSession session = request.getSession();
		
		int day = 1;
		int lastday = DateParse.dateDif(startDay, endDay);
		System.out.println(lastday+1);
		session.setAttribute("title",title);
		session.setAttribute("lastday",lastday+1);
		session.setAttribute("startDay",startDay);
		session.setAttribute("day", day);
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

}
