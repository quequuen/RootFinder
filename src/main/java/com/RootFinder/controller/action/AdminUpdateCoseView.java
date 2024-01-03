package com.RootFinder.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dto.CoseDTO;

public class AdminUpdateCoseView implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		String url = "admin_update_cose_view.jsp";
		
		CoseDAO cdao = CoseDAO.getInstance();
		
		ArrayList<CoseDTO> cose_list = cdao.AdminCoseByCode(code);
		request.setAttribute("admin_cose_list", cose_list);
		request.setAttribute("content",cose_list.get(0).getContent());
		
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		
	}

}
