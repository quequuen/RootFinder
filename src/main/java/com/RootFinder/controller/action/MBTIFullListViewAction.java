package com.RootFinder.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dto.CoseListDTO;

public class MBTIFullListViewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "mbti_full_list.jsp";
		String mbti = request.getParameter("mbti");
		
		request.setAttribute("mbti", mbti);
	
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

}
