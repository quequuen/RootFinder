package com.RootFinder.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dto.CoseCommentDTO;

public class AdminDeleteCommentView implements Action{
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String url = "admin_delete_comment_view.jsp";
	String code = request.getParameter("code");
	int prt_num = Integer.parseInt(request.getParameter("prt_num"));
	int cdr_num = Integer.parseInt(request.getParameter("cdr_num"));
	
	CoseDAO coseDAO = CoseDAO.getInstance();
	CoseCommentDTO commentDTO= new CoseCommentDTO();
	commentDTO = coseDAO.admin_select_comment(code, prt_num, cdr_num);
	request.setAttribute("commentList", commentDTO);
	RequestDispatcher rd = request.getRequestDispatcher(url);
	rd.forward(request, response);
}
}
