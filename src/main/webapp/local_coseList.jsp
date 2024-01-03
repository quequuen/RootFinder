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
<h1>������</h1>
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
               <h3>����</h3>
               <ul>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=��õ/���">��õ/���</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=����">����</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=����">����</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=���">���</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=����/�泲">����/�泲</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=����">����</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=����/����">����/����</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=�뱸/���">�뱸/���</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=�λ�/�泲">�λ�/�泲</a></li>
                  <li><a class="cose_list_area" href="RootFinderServlet?command=local_cose_view&local=����">����</a></li>
               </ul>
            </div>
            <div class="sub_text">
               <%=local %>�� �α� ����������!
            </div>
            <c:forEach items="${localCoseList}" var="local_cose" varStatus="status">
            
                     <div class="picture">
 <a href="RootFinderServlet?command=root_summary_form&code=${local_cose.code}&id=${loginUser.id}&type=first_click" class="box">                        <div class="inner">
                           <div class="inner_text">
                              <span></span>
                              <span class="tourday"></span><br>
                              <!-- "�����ѳ� ���ֵ����� ����̺� �ʹ� ���ƿ�" -->
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
                                    // EL�� ����Ͽ� ���� ���� ������ ����
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