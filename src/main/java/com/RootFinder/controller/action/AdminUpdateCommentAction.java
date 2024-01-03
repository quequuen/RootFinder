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

public class AdminUpdateCommentAction implements Action{
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	CoseDAO cDao = CoseDAO.getInstance();
	
	String code = request.getParameter("code");
	int prt_num = Integer.parseInt(request.getParameter("prt_num"));
	int cdr_num = Integer.parseInt(request.getParameter("cdr_num"));
	
	CoseCommentDTO commentDTO = new CoseCommentDTO();
	commentDTO.setId(request.getParameter("id"));
	commentDTO.setComment_write_time(request.getParameter("comment_write_text"));
	commentDTO.setComment_text(request.getParameter("comment_text"));
	
	int result =  cDao.admin_update_comment(commentDTO,code,prt_num,cdr_num);
	
	
	if(result == 1)
	{
		System.out.println("관리자_댓글 수정 성공");
	} else {
		System.out.println("관리자_댓글 수정 실패");
	}
	
	//DB변경 후 변경된 값을 재호출 하기
	
	UserDAO udao = UserDAO.getInstance();
	HttpSession session = request.getSession();
	
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
