<%@page import="com.RootFinder.dao.CoseDAO"%>
<%@page import="com.RootFinder.dto.CoseListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="css/local_coseList.css?v=1">


<body>

<%@ include file="../header.jsp" %> 


<div id="wrap">
<article>
<h1>지역명</h1>
<br>

   <%
      String local ="";
      try{   
         local =request.getAttribute("localName").toString();
         out.print("<h2 style='color:red;'>"+local+"</h2>");
      } catch(Exception e)
      {
         e.printStackTrace();
      }
   %>
   <br>
   
   <div class="one_page">
      <section id="trip">
         <div class="mbti">
            <div class="text">
               <h3>지역</h3>
               <ul>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=인천/경기">인천/경기</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=서울">서울</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=강원">강원</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=충북">충북</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=대전/충남">대전/충남</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=전북">전북</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=광주/전남">광주/전남</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=대구/경북">대구/경북</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=부산/경남">부산/경남</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=제주">제주</a></li>
               </ul>
            </div>
            <div class="sub_text">
               <%=local %>의 인기 여행지에요!
            </div>
            <c:forEach items="${localCoseList}" var="local_cose" varStatus="status">
            
                     <div class="picture">
 <a href="RootFinderServlet?command=root_summary_form&code=${local_cose.code}&id=${loginUser.id}&type=first_click" class="box">                        <div class="inner">
                           <div class="inner_text">
                              <span></span>
                              <span class="tourday"></span><br>
                              <!-- "따뜻한날 제주도에서 드라이브 너무 좋아요" -->
                              <H4>${local_cose.title}</H4>
                           </div>
                        </div>
                        <div class="trip_picture">
                           <img src="./image/${local_cose.main_img}" style="width:100%; height:100%"> 
                        </div>
                        <div class="trip_inner">
                           <span></span>
                           
                           <div class="fr list_view_icon">${local_cose.view_cnt}</div>
                           
                           
                           <div class="clear"></div>
      
                           <div class="list_city">${local_cose.main_addr}</div>
      
                           <div class="clear"></div>
                           
                           <%
                                    // EL을 사용하여 얻은 값을 변수에 저장
                                 CoseListDTO coseList = (CoseListDTO)pageContext.getAttribute("local_cose");
                                 CoseDAO cdao = CoseDAO.getInstance();
                                 String username = cdao.getUsernameByCode(coseList.getCode());
                                 
                              %>
      
                           <div class="list_user"><%=username %></div>
                        </div>
                        
                     </a>
                     </div>
                     </c:forEach> 
      </section>
   </div>
                     
</article>
</div>
<%@ include file="../footer.jsp" %>
</body>