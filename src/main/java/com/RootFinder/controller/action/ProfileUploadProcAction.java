package com.RootFinder.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RootFinder.dao.UserDAO;
import com.RootFinder.dto.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProfileUploadProcAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "myCourse.jsp";
		String id;
		String fileName = null;
		String profile_img = null; // name 속성과 동일한 변수명으로 지정

		String realPath = request.getRealPath("image");
		System.out.println(realPath);
		// String contextPath = request.getServletContext().getContextPath();

		System.out.println("realPath: " + realPath);
		// System.out.println("contextPath: " + contextPath);

		try {
			// 객체 생성 후 즉시 업로드
			MultipartRequest multi = new MultipartRequest(
					request, // 요청 객체
					realPath, // 서버상의 실제 디렉토리
					1024 * 1024 * 5, // 최대 업로드 파일 사이즈 (5MB)
					"UTF-8", // 인코딩 방식
					new DefaultFileRenamePolicy() // 동일한 이름이 존재할 경우, 새로운 이름 부여
			);

			// 파일 이름 가져오기
			fileName = multi.getFilesystemName("profile_img");
			System.out.println("fileName: " + fileName);

			// id 읽어오기
			id = multi.getParameter("id");
			System.out.println("id: " + id);

			// /project/image/파일이름
			// profile_img = contextPath + "/image/" + fileName;
			// System.out.println("profile_img: " + profile_img);

			// DB 연결
			UserDAO uDao = UserDAO.getInstance();

			// 프로필 사진 변겅 메소드 호출
			int result = uDao.profileUpdate(fileName, id);

			if (result == 1) { // update문 정상 작동 시
				HttpSession session = request.getSession();
				UserDTO loginUser = uDao.getUser(id);
				session.setAttribute("loginUser", loginUser);

				System.out.println("업로드 성공");
				
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
				// System.out.println("loginUser: " + loginUser);
			} else {
				System.out.println("업로드 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
