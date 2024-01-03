package com.RootFinder.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dao.UserDAO;
import com.RootFinder.dto.CoseDTO;
import com.RootFinder.dto.UserDTO;



public class RootSummaryFormAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("code");
		String id = request.getParameter("id");
		
		System.out.println("코드 "+code);
		String url = "RootInform/rootSummary.jsp";
	
		System.out.println("아이디 : "+id);
		
		//헤더부분에 뿌려줄 해당 루트 작성자의 정보 
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = userDAO.getOneCoseUserByCode(code);
		request.setAttribute("userDTO", userDTO);
		System.out.println(userDTO);
		
		CoseDAO coseDAO = CoseDAO.getInstance();
		
		
		
		try {
			String type = request.getParameter("type");
			if(type.equals("first_click"))
			{
				if(!id.trim().equals(""))
				{
					coseDAO.view_cnt_increase(code);
					int res = coseDAO.InsertMyViewCose(id, code);
					
					if(res == 1)
					{
						System.out.println("조회목록 삽입 성공");
					} else {
						System.out.println("조회목록 삽입 실패");
					}
				}
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	
		
		//해당 루트에 대한 정보 
		ArrayList<CoseDTO> coseAboutCode = new ArrayList<CoseDTO>();
		coseAboutCode = coseDAO.getOneCoseByCode(code);
		request.setAttribute("coseList", coseAboutCode);
		//CoseDTO에 존재하는 타이틀 하나의 값만 가져오기 
		String title = coseDAO.getTitleByCode(code);
		System.out.println(title);
		
		request.setAttribute("title", title);
		
		request.setAttribute("code", code);
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
