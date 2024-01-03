package com.RootFinder.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RootFinder.dao.CoseDAO;
import com.RootFinder.dao.UserDAO;
import com.RootFinder.dto.CoseDTO;
import com.RootFinder.dto.CoseListDTO;
import com.RootFinder.dto.UserDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RootInsertAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		
		MultipartRequest multi=null;
		HttpSession session = request.getSession();
		String code = (String)session.getAttribute("code");
		String content = "";
		String title = (String)session.getAttribute("title");
		System.out.println(code);
		String url="rootSuccess.jsp";
		int lastday = (int)session.getAttribute("lastday"); 
		String fileName ="";
		
		
		//메인 주소와 이미지 추가
		
		String main_addr = "";
		
		
		
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
		System.out.println("서버상의 실제 디렉토리(메인 이미지)");
		System.out.println(uploadFilePath);
		
		try {
			multi = new MultipartRequest(request// 요청
					, uploadFilePath, // 서버상의 실제 디렉토리
					maxSize, // 최대 업로드 파일 사이즈
					encType, // 인코딩 타입
					new DefaultFileRenamePolicy()
			// 동일이름 존재하면 이름변경
			);
			
			content = multi.getParameter("content");
			System.out.println("내용 >>" +content);
			
			main_addr = multi.getParameter("main_addr");

			// 업로드 파일 이름 확인
			fileName = multi.getFilesystemName("main_img");
			
			System.out.println(fileName);
			
			if(fileName == null)
			{
				System.out.println("메인 이미지 파일이 업로드 되지 않았습니다.");
			}else {
				System.out.println(fileName+"메인 이미지 파일이 업로드 되었습니다.");

			}
		
		} catch (Exception e) {
			System.out.println("오류메시지 : "+e.getMessage());

		} finally {

		}
		
		
		String userid = multi.getParameter("id");
		System.out.println("아이디 : "+userid);
		
		CoseDAO rdao =CoseDAO.getInstance();
		rdao.cosecodeInsert(code,userid);
		int res =rdao.coseListInsert(code,userid,fileName,title,main_addr);
		if(res == 1)
			System.out.println("cose_list_table 삽입 성공");
		for(int i = 1; i <=lastday;i++) {
			ArrayList<CoseDTO> list = new ArrayList<CoseDTO>();
			list = (ArrayList<CoseDTO>) session.getAttribute("list"+i);
			System.out.println(list);
			int lasttable = (int) session.getAttribute("lasttable"+i);
			for(int j=0;j<lasttable;j++) {
				CoseDTO rDto = (CoseDTO) list.get(j);
				System.out.println(rDto);
				int result = rdao.rootInsert(rDto, content);
				System.out.println(result);
			}
		}
		
		
			
			UserDAO uDao = UserDAO.getInstance();
			CoseDAO cDao = CoseDAO.getInstance();
			//로그인 성공시 회원정보를 가지고 메인 페이지(로그인 후)로 이동
			UserDTO uDto = uDao.getUser(userid);
			
			//로그인 성공시 회원과 동일한 MBTI를 가진 사용자가 올린 코스, 동일한 연령대와 성별을 가진 코스를 ArrayList에 삽입
			ArrayList<CoseListDTO> mbti_coseList = cDao.selectMBTICose(uDto.getMbti());
			ArrayList<CoseListDTO> age_gender_coseList = cDao.selectAgeGenderCose(uDto.getBirth(), uDto.getGender());
			
			
			
			session.setAttribute("mbti_coseList", mbti_coseList);
			
			System.out.println("mbtiList : "+mbti_coseList);
			session.setAttribute("age_gender_coseList", age_gender_coseList);
			System.out.println("age_gender_coseList : "+age_gender_coseList);

			
		
		
		url = "mainpage_after_login.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
		
	}

}
