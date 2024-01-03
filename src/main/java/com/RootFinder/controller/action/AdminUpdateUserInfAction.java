package com.RootFinder.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dao.UserDAO;
import com.RootFinder.dto.CoseCommentDTO;
import com.RootFinder.dto.CoseListDTO;
import com.RootFinder.dto.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminUpdateUserInfAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");

		
		String url = "";
		
		String update_username="";
		String fileName ="";
		String current_id = request.getParameter("current_id");
		String current_profile_img = request.getParameter("current_profile_img");
		System.out.println("현재 회원 계정 : "+current_id);
		
		MultipartRequest multi=null;
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		// 다운로드 경로 설정
		String savePath = "image";
		response.setContentType("text/html; charset=UTF-8");
		// 최대 업로드 사이즈 설정
		int maxSize = 5 * 1024 * 1024;
		// 인코딩 타입
		String encType = "UTF-8";

		ServletContext context = session.getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		System.out.println("서버상의 실제 디렉토리(관리자_프로필 이미지)");
		System.out.println(uploadFilePath);
		
		try {
			multi = new MultipartRequest(request// 요청
					, uploadFilePath, // 서버상의 실제 디렉토리
					maxSize, // 최대 업로드 파일 사이즈
					encType, // 인코딩 타입
					new DefaultFileRenamePolicy()
			// 동일이름 존재하면 이름변경
			);
			
			update_username = multi.getParameter("update_username");

			// 업로드 파일 이름 확인
			fileName = multi.getFilesystemName("update_profile_img");
			
			System.out.println(fileName);
			
			if(fileName == null)
			{
				System.out.println("관리자_프로필 이미지 파일이 업로드 되지 않았습니다.");
				fileName = current_profile_img;
			}else {
				System.out.println(fileName+"관리자_프로필 이미지 파일이 업로드 되었습니다.");

			}
		
		} catch (Exception e) {
			System.out.println("오류메시지 : "+e.getMessage());

		} finally {

		}
		
		
		UserDAO udao = UserDAO.getInstance();
		int result = udao.AdminUpdateUserInf(current_id,update_username, fileName);
		
		if(result == 1)
		{
			System.out.println("관리자_회원정보 수정 성공");
		}
		else {
			System.out.println("관리자_회원정보 수정 실패");
		}
		
		
		
		//DB변경 후 변경된 값을 재호출 하기
		CoseDAO cDao = CoseDAO.getInstance();
		
		ArrayList<UserDTO> allUserInf = udao.allUserInf("hmjcp");
		session.setAttribute("allUserInf", allUserInf);
		
		ArrayList<CoseListDTO> allCoseList = cDao.allCoseList();
		session.setAttribute("allCoseList", allCoseList);
		
		
		ArrayList<CoseCommentDTO> allCommentList = cDao.allCommentList();
		session.setAttribute("allCommentList", allCommentList);
		url="admin_mainpage.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

}
