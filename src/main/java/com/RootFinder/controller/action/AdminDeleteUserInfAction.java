package com.RootFinder.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dao.UserDAO;
import com.RootFinder.dto.CoseCommentDTO;
import com.RootFinder.dto.CoseListDTO;
import com.RootFinder.dto.UserDTO;

public class AdminDeleteUserInfAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String delete_id = request.getParameter("delete_id");
		
		HttpSession session = request.getSession();
		UserDAO udao = UserDAO.getInstance();
		
		int result = udao.AdminDeleteAll(delete_id);
		
		if(result == 1)
		{
			System.out.println("관리자_회원 탈퇴 성공");
		} else {
			System.out.println("관리자_회원 탈퇴 실패");
		}
		
		
		//DB변경 후 변경된 값을 재호출 하기
				CoseDAO cDao = CoseDAO.getInstance();
				
				ArrayList<UserDTO> allUserInf = udao.allUserInf("hmjcp");
				session.setAttribute("allUserInf", allUserInf);
				
				ArrayList<CoseListDTO> allCoseList = cDao.allCoseList();
				session.setAttribute("allCoseList", allCoseList);
				
				
				ArrayList<CoseCommentDTO> allCommentList = cDao.allCommentList();
				session.setAttribute("allCommentList", allCommentList);
				String url="admin_mainpage.jsp";
				
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
	}

}
