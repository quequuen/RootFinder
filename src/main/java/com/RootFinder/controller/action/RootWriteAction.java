package com.RootFinder.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.RootFinder.dto.CoseDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import util.DateParse;

public class RootWriteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String url = "rootWrite.jsp";
		String userid="";
		int lasttable=0;
		int lastday=0;
		int day=0;
		String title="";
		
		String date ="";
		HttpSession session = request.getSession();
		
		MultipartRequest multi = null;
		
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
		System.out.println("서버상의 실제 디렉토리");
		System.out.println(uploadFilePath);
		
		try {
			multi = new MultipartRequest(request// 요청
					, uploadFilePath, // 서버상의 실제 디렉토리
					maxSize, // 최대 업로드 파일 사이즈
					encType, // 인코딩 타입
					new DefaultFileRenamePolicy()
					
					
			// 동일이름 존재하면 이름변경
			);

			// 업로드 파일 이름 확인
			Enumeration files = multi.getFileNames();
			
			while (files.hasMoreElements()) {
				String file = (String) files.nextElement();
				String file_name = multi.getFilesystemName(file);
				String ori_file_name = multi.getOriginalFileName(file);
				
				
				System.out.println("원본 파일명"+file_name);
			}
			
			
			userid = multi.getParameter("id");
			lasttable = Integer.parseInt(multi.getParameter("lasttable"));
			System.out.println(lasttable);
			lastday = Integer.parseInt(multi.getParameter("lastday"));
			day = Integer.parseInt(multi.getParameter("day"));
				
			
			date =  (String) session.getAttribute("startDay");
			System.out.println(date);
			title = (String)session.getAttribute("title");
			date = DateParse.datePlus(date, day);
			
			
		} catch (Exception e) {
				System.out.println("코스등록 이미지 오류 : "+e.getMessage());
		} finally {

		}
		
		// 값을 세션에 저장

		ArrayList<CoseDTO> list = new ArrayList<CoseDTO>();
		Date insday = (Date) DateParse.strToDate(date);
		for (int i = 1; i <= lasttable; i++) {
			CoseDTO rdto = new CoseDTO();
			rdto.setCode(userid + title);
			rdto.setId(userid);
			rdto.setImg("\\" + multi.getFilesystemName("img_" + i)); 
			rdto.setPlaceName(multi.getParameter("place_" + i));
			rdto.setAddr( multi.getParameter("addr_" + i));
			rdto.setPrice(multi.getParameter("price_"+i));
			rdto.setStarttime( multi.getParameter("starttime_" + i) + ":" + multi.getParameter("starttimemin_" + i));
			rdto.setEndtime( multi.getParameter("endtime_" + i) + ":" + multi.getParameter("endtimemin_" + i));
			rdto.setCose_date(insday);
			rdto.setDay(multi.getParameter("day"));
			list.add(rdto);
		}
		session.setAttribute("list" + day, list);
		session.setAttribute("lasttable" + day,lasttable);
		session.setAttribute("code" , userid+title);
		System.out.println(lasttable);
		System.out.println(session.getAttribute("lasttable"+day));
		day++;
		if(day == lastday + 1) {
			url = "RootFinderServlet?command=root_insert_form"; // root_insert_form에서 마지막 소감 적어야함.
		}
		session.setAttribute("day", day);
		System.out.println(list);
		response.sendRedirect(url);
		
	}
	// 세션 객체 가져오기

}
