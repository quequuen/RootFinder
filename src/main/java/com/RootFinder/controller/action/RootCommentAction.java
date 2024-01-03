package com.RootFinder.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.RootFinder.dao.CoseDAO;

public class RootCommentAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String comment = request.getParameter("comment");
		CoseDAO coseDAO = CoseDAO.getInstance();
		String code = request.getParameter("code");
		String id = request.getParameter("id");
		
		//댓글을 등록할 경우 
		if(comment.equals("parent")) {
			String inputComment = request.getParameter("inputComment");
			//등록을 누르면 cose_comment_table에 입력 
			coseDAO.insertComment(code, id, inputComment);
		}
		//대댓글을 등록할 경우
		else if(comment.equals("child")) {
			int prt_num = Integer.parseInt(request.getParameter("prt_num"));
			System.out.println(prt_num);
			int cdr_num = Integer.parseInt(request.getParameter("cdr_num"));
			System.out.println(cdr_num);
			String inputComment = request.getParameter("inputReComment_"+prt_num);
			System.out.println(inputComment);
			coseDAO.insertReComment(code, id, inputComment, prt_num, cdr_num);
		}
		//원래 있던 댓글 페이지로 돌아가기 
		new RootCommentCheckAction().execute(request, response);
		
	}

}
