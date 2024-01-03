package com.RootFinder.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dto.CoseListDTO;

public class LocalCoseViewAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String local = request.getParameter("local");
		String url = "local_coseList.jsp";
		
		CoseDAO cDao = CoseDAO.getInstance();
		
		ArrayList<CoseListDTO> localCoseList = cDao.localCoseList(local);
		
		System.out.println("받아온 지역 코스(action) : "+localCoseList);
		
		request.setAttribute("localCoseList",localCoseList );
		request.setAttribute("localName", local);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

}
