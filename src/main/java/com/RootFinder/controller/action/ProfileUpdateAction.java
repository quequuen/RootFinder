package com.RootFinder.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RootFinder.dao.UserDAO;
import com.RootFinder.dto.UserDTO;

public class ProfileUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		// 입력된 값 가져오기
		// 나이, 성별은 변경 후에도 값 나타내는 것을 유지시키기 위해 넣음
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd"); // 로그인된 사용자의 비밀번호 (hidden값 가져옴)
		String oldPwd = request.getParameter("oldPwd"); // 입력한 기존 비밀번호
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String mbti = request.getParameter("mbtiresult");
		String phone = request.getParameter("phone");
		String img = request.getParameter("profile_img");
		String id = request.getParameter("userid");

		System.out.println("name: " + name);
		System.out.println("oldPwd: " + oldPwd);
		System.out.println("age: " + age);
		System.out.println("gender: " + gender);
		System.out.println("email: " + email);
		System.out.println("mbti: " + mbti);
		System.out.println("phone: " + phone);
		System.out.println("profile_img: " + img);
		System.out.println("id: " + id);

		// 입력한 값 객체에 담기
		UserDTO uDto = new UserDTO();
		uDto.setUsername(name);
		uDto.setPwd(oldPwd);
		uDto.setEmail(email);
		uDto.setBirth(age);
		uDto.setGender(gender);
		uDto.setMbti(mbti);
		uDto.setPhone(phone);
		uDto.setProfile_img(img);
		uDto.setId(id);

		// DB 연결
		UserDAO uDao = UserDAO.getInstance();

		// 로그인한 사용자 계정의 비밀번호와 입력한 기존 비밀번호 값이 일치한다면,
		if (pwd.equals(oldPwd)) {
			
			// 패스워드 변경 여부를 확인하는 변수 선언
			// true: 변경 O, false: 변경 X
			boolean isChangePass = false;

			// 새 패스워드 값 가져오기
			String newPwd1 = request.getParameter("newPwd1");

			// 새 패스워드 값이 있다면(입력했다면),
			if (newPwd1 != null && !newPwd1.equals("")) {
				uDto.setPwd(newPwd1); // 새 패스워드 값 담기
				System.out.println("newPwd1: " + newPwd1);
				isChangePass = true; // 변경하려 하기 때문에 true로 바꿔줌
			}

			// 결과 값을 변수에 할당
			int result = uDao.updateMember(uDto, isChangePass);

			if (result > 0) { // 변경된 값이 하나라도 있다면,
				session.setAttribute("loginUser", uDto);
				session.setAttribute("message", "회원정보 수정이 완료되었습니다.");
			} else { // 변경된 값이 없을 경우,
				session.setAttribute("message", "회원정보 수정에 실패했습니다.");
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("profileUpdate.jsp");
			rd.forward(request, response);

			session.setAttribute("message", "");
		} else {
			session.setAttribute("message", "회원정보 수정에 실패했습니다.");
			
			RequestDispatcher rd = request.getRequestDispatcher("profileUpdate.jsp");
			rd.forward(request, response);
		}

	}

}
