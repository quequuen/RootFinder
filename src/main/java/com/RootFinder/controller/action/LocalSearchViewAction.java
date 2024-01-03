package com.RootFinder.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dto.CoseDTO;
import com.RootFinder.dto.CoseListDTO;

public class LocalSearchViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "local_search_view.jsp";

		String search = request.getParameter("search");
		
		
		
		CoseDAO cdao = CoseDAO.getInstance();
		
		ArrayList<CoseListDTO> cose_search_list = cdao.selectSearch(search);
		
		if(cose_search_list.size() > 0)
		{
			request.setAttribute("result", 1);
			request.setAttribute("search", search+"과(와) 관련된 검색결과입니다.");
			request.setAttribute("cose_search_list", cose_search_list);
		}else {
			request.setAttribute("result", 0);
			request.setAttribute("search", search+"과(와) 관련된 검색결과가 존재하지 않습니다.");
		}
		 

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
