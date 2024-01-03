<%@page import="com.RootFinder.dao.CoseDAO"%>
<%@page import="com.RootFinder.dto.CoseListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.RootFinder.dto.UserDTO" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
  <c:if test="${empty loginUser}">
  <script>alert("해당 계정이 존재하지 않습니다.")</script>
  <input type="hidden" name="command" value="login_do">
  <jsp:forward page="RootFinderServlet"></jsp:forward>
  </c:if>
  
  <link rel="stylesheet" href="css/mainpage_after.css">
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지(로그인 후)</title>
</head>
<body>

<script src="script/RootFinder.js"></script>

<Script>

function searchLocal()
{
	
	const search = document.getElementById('search').value;
	
	if(event.keyCode == 13){ 
		
		location.href="RootFinderServlet?command=local_search_view&search="+search;
				
	}	
	
}
</Script>

<%@ include file="../header.jsp" %>

<div id="wrap">

	<main>
		<section id="harmony">
			<div class="section-content">
				<picture>
					<img src="./images/harmony.jpg" />
				</picture>
				<div class="text">
					<h2 data-motion="text">나만의 여행 플래너 루트파인더!</h2>
					<div class="description">
						<p data-motion="text" data-delay="500">쉽고 빠르게 여행을 계획하세요.</p>
						<div class="description_text">
							
							<input type="text" id="search" name="search" placeholder="국가명,도시명으로 검색"  
							onkeypress="searchLocal(${search})">
							
							<div class="last_search">
								<p>추천 도시 :&nbsp;<a href="#">강릉</a>&nbsp;,&nbsp;<a href="#">부산</a>&nbsp;,&nbsp;<a
										href="#">속초</a>&nbsp;</p>
							</div>
							<div class="map">
							
								<a href="#" onclick="MapOpen()">
									<p>지도에서 보기</p>
									<img src="./image/map.png">
								</a>

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<div class="clear"></div>


	<!-- 마지막 추천일정 더보기 버튼을 출략하기위해  for문의 마지막번째에 버튼을 추가한 리스트 화면을 출력 -->
		<div class="one_page">
		<section id="trip">
			<div class="mbti">
				<div class="text">
					<h3>MBTI</h3>
				</div>
				<div class="sub_text">
					${loginUser.mbti}들의 인기 여행지에요!
				</div>
				<c:forEach items="${mbti_coseList}" var="mbti_cose" varStatus="status">
				
				<c:choose>
				
					<c:when test="${status.count <= 6}" >
							<div class="picture">
							<a href="RootFinderServlet?command=root_summary_form&code=${mbti_cose.code}&id=${loginUser.id}&type=first_click" class="box">
								<div class="inner">
									<div class="inner_text">
										<span></span>
										<span class="tourday"></span><br>
										<!-- "따뜻한날 제주도에서 드라이브 너무 좋아요" -->
										<H4>${mbti_cose.title}</H4>
									</div>
								</div>
								<div class="trip_picture">
									<img src="./image/${mbti_cose.main_img}" style="width:100%; height:100%"> 
								</div>
								<div class="trip_inner">
									
									<div class="fr list_view_icon">${mbti_cose.view_cnt}</div>
									
									
									<div class="clear"></div>
		
									<div class="list_city">${mbti_cose.main_addr}</div>
		
									<div class="clear"></div>
									
										<%
   											// EL을 사용하여 얻은 값을 변수에 저장
										   CoseListDTO coseList = (CoseListDTO)pageContext.getAttribute("mbti_cose");
										   CoseDAO cdao = CoseDAO.getInstance();
										   String username = cdao.getUsernameByCode(coseList.getCode());
										   
										%>
									<div class="list_user"><%=username %></div>
								</div>
							</a>
							</div>
					</c:when>
				
				</c:choose>
				
				</c:forEach>
				<div class="more_button" style="width: 348px; height: 50px; text-align: center; margin: 0 auto;">
				<a href="RootFinderServlet?command=mbti_full_list&mbti=${loginUser.mbti}">
				<input type="button" id="more_if" name="more_if" value="추천일정 더보기" 
				style=" width: 200px;
				  height: 40px;
				  font-size: 14px;
				  color: #808080;
				  font-weight: bold;
				  border: 1px solid #dfdfdf;
				  background: white;
				  border-radius: 8px;"></a>
				</div>
					
		</section>
	</div>
	
	
	<div class="two_page">
		<section id="trip">
			<div class="mbti">
				<div class="text">
					<h3>AGE</h3>
				</div>
				<div class="sub_text">
				
				<!--나이대 변환/ 성별파악-->
				<%
				
					UserDTO udto = (UserDTO)session.getAttribute("loginUser");
					int age = Integer.parseInt(udto.getBirth().trim());
					String gender = udto.getGender();
					int ageRange= age/10 * 10;
					
				%>
				
				
					요즘 <%=ageRange%>대 <%=gender%>들의 인기 여행지에요!
				</div>
				
				
				<!-- 마지막 추천일정 더보기 버튼을 출략하기위해  for문의 마지막번째에 버튼을 추가한 리스트 화면을 출력 -->
				<c:forEach items="${age_gender_coseList}" var="age_gender_cose" varStatus="status">
				
				<c:choose>
					
					<c:when test="${status.count <= 6}" >
							<div class="picture">
							<a href="RootFinderServlet?command=root_summary_form&code=${age_gender_cose.code}&id=${loginUser.id}&type=first_click" class="box">
								<div class="inner">
									<div class="inner_text">
										
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
					
					</c:when>
					
				</c:choose>
				
				</c:forEach>
				<div class="more_button" style="width: 348px; height: 50px; text-align: center; margin: 0 auto;">
				<a href="RootFinderServlet?command=age_gender_full_list&age=<%=ageRange%>&gender=<%=gender%>">
				<input type="button" id="more_if" name="more_if" value="추천일정 더보기" 
				style=" width: 200px;
				  height: 40px;
				  font-size: 14px;
				  color: #808080;
				  font-weight: bold;
				  border: 1px solid #dfdfdf;
				  background: white;
				  border-radius: 8px;"></a>
				</div>
		</section>
	</div>
	
	</main>
</div>
	<%@include file="../footer.jsp" %>
