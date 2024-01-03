package com.RootFinder.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dto.CoseListDTO;

public class MyViewCoseFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String id = request.getParameter("id");
		
		CoseListDTO cldto = new CoseListDTO();
		
		CoseDAO cdao = CoseDAO.getInstance();
		
		ArrayList<CoseListDTO> view_cose_list = cdao.MyViewCose(id);
		
		request.setAttribute("view_cose_list", view_cose_list);
		
		RequestDispatcher rd = request.getRequestDispatcher("MyViewCose.jsp");
		rd.forward(request, response);
		
	}

}
