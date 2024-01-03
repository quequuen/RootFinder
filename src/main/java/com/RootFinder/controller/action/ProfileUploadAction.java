package com.RootFinder.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProfileUploadAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "profileUpload.jsp";	// 사진 업로드 페이지로 이동
		HttpSession session = request.getSession();
		
		// 로그인 정보가 없을 경우,
		if(session.getAttribute("loginUser") == null) {
			request.setAttribute("message", "잘못된 정보입니다.");
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	

}
