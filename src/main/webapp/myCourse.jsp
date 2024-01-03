<%@page import="com.RootFinder.dao.CoseDAO"%>
<%@page import="com.RootFinder.dto.CoseListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/local_coseList.css"> 

<%@ include file="../header.jsp" %>  
<%@ include file="myMenu.jsp" %> 
<div id="wrap">
<article>
<br>

	
	
	<div class="one_page">
		<section id="trip">
			<div class="mbti">
				<div class="text2">
				<h2 style="font-size: 30px; text-align: center;">내가 올린 코스</h2>
				</div>
				<div class="sub_text">
				</div>
				<c:forEach items="${my_cose_list}" var="my_cose_list" varStatus="status">
				
							<div class="picture">
							<a href="RootFinderServlet?command=root_summary_form&code=${my_cose_list.code}&id=${loginUser.id}" class="box">
								<div class="inner">
									<div class="inner_text">
										<H4>${my_cose_list.title}</H4>
									</div>
								</div>
								<div class="trip_picture">
									<img src="./image/${my_cose_list.main_img}" style="width:100%; height:100%"> 
								</div>
								<div class="trip_inner">
									
									<div class="fr list_view_icon">${my_cose_list.view_cnt}</div>
								
									<div class="clear"></div>
		
									<div class="list_city">${my_cose_list.main_addr}</div>
		
									<div class="clear"></div>
									
									<%
   											// EL을 사용하여 얻은 값을 변수에 저장
										   CoseListDTO coseList = (CoseListDTO)pageContext.getAttribute("my_cose_list");
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

