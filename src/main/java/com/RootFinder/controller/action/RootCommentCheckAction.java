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

import com.RootFinder.dto.UserDTO;



public class RootCommentCheckAction implements Action {

   @Override

   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      // TODO Auto-generated method stub



      String url = null;

      

      // 전 페이지에서 코드 가져오기

            String code = request.getParameter("code");



            // 루트를 작성한 사람의 정보

            UserDAO userDAO = UserDAO.getInstance();

            UserDTO userDTO = userDAO.getOneCoseUserByCode(code);

            request.setAttribute("userDTO", userDTO);



            // 루트에 대한 댓글 가져오기

            CoseDAO coseDAO = CoseDAO.getInstance();

            ArrayList<CoseCommentDTO> coseCommentList = coseDAO.getCommentByCode(code);

            System.out.println(coseCommentList);

            request.setAttribute("commentList", coseCommentList);



            int commentCount = coseCommentList.size();

            request.setAttribute("commentCount", commentCount);

            

            // 해당 코드 타이틀 가져오기

            String title = coseDAO.getTitle(code);

            request.setAttribute("title", title);

      

          //CoseList에 존재하는 메인 이미지 가져오기
		String main_img = coseDAO.getMainImgByCode(code);
    		
		request.setAttribute("main_img", main_img);

      

      //현재 로그인되어있는지를 확인 

      HttpSession session = request.getSession();

      UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");



      

      //로그인 확인 후 댓글 등록 가능한 페이지와 불가능한 페이지로 나눔 

      if (loginUser == null) {

         url = "RootInform/rootComment_before.jsp";

         RequestDispatcher rd = request.getRequestDispatcher(url);

         rd.forward(request, response);

      } else if (loginUser != null) {

         url = "RootInform/rootComment.jsp";

         RequestDispatcher rd = request.getRequestDispatcher(url);

         rd.forward(request, response);



      }

   }

}