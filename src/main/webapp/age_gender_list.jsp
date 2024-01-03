<%@page import="com.RootFinder.dao.CoseDAO"%>
<%@page import="com.RootFinder.dto.CoseListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="css/mainpage_after.css">
<%@ include file="../header.jsp" %>
<h1>나이 성별 리스트</h1>
<%
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
%>

<div class="two_page">
		<section id="trip">
			<div class="mbti">
				<div class="text">
					<h3>AGE</h3>
				</div>
				<div class="sub_text">
					요즘<%=age%>대 <%=gender %>들의 인기 여행지에요!
				</div>
				<!-- 마지막 추천일정 더보기 버튼을 출략하기위해  for문의 마지막번째에 버튼을 추가한 리스트 화면을 출력 -->
				<c:forEach items="${age_gender_coseList}" var="age_gender_cose" varStatus="status">
				
							<div class="picture">
							<a href="RootFinderServlet?command=root_summary_form&code=${age_gender_cose.code}&type=first_click&id=${loginUser.id}" class="box">
								<div class="inner">
									<div class="inner_text">
										<span></span>
										<span class="tourday"></span><br>
										<!-- "따뜻한날 제주도에서 드라이브 너무 좋아요" -->
										<H4>${age_gender_cose.title}</H4>
									</div>
								</div>
								<div class="trip_picture">
									<img src="./image/${age_gender_cose.main_img}" style="width:100%; height:100%">
								</div>
								<div class="trip_inner">
									<span></span>
									
									<div class="fr list_view_icon">${age_gender_cose.view_cnt}</div>
									
									
									<div class="clear"></div>
		
									<div class="list_city">${age_gender_cose.main_addr}</div>
		
									<div class="clear"></div>
									
										<%
   											// EL을 사용하여 얻은 값을 변수에 저장
										   CoseListDTO coseList = (CoseListDTO)pageContext.getAttribute("age_gender_cose");
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
<%@include file="../footer.jsp" %>
