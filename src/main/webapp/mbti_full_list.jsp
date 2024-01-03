<%@page import="com.RootFinder.dao.CoseDAO"%>
<%@page import="com.RootFinder.dto.CoseListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<link rel="stylesheet" href="css/mainpage_after.css">

<%@ include file="../header.jsp" %>

<%
String mbti = request.getAttribute("mbti").toString();

%>
<h1><%=mbti%>들의 여행 코스!</h1>

<div class="one_page">
		<section id="trip">
			<div class="mbti">
				<div class="text">
					<h3>MBTI</h3>
				</div>
				<div class="sub_text">
					${loginUser.mbti}들의 인기 여행지에요!
				</div>
				<c:forEach items="${mbti_coseList}" var="mbti_full_cose" varStatus="status">
							<div class="picture">
							<a href="RootFinderServlet?command=root_summary_form&code=${mbti_full_cose.code}&type=first_click&id=${loginUser.id}" class="box">
								<div class="inner">
									<div class="inner_text">
										<span></span>
										<span class="tourday"></span><br>
										<!-- "따뜻한날 제주도에서 드라이브 너무 좋아요" -->
										<H4>${mbti_full_cose.title}</H4>
									</div>
								</div>
								<div class="trip_picture">
									<img src="./image/${mbti_full_cose.main_img}" style="width:100%; height:100%"> 
								</div>
								
								<div class="trip_inner">
								
									<span></span>
									
									<div class="fr list_view_icon">${mbti_full_cose.view_cnt}</div>
									
									
									<div class="clear"></div>
		
									<div class="list_city">${mbti_full_cose.main_addr}</div>
		
									<div class="clear"></div>
		
		
									<%
   											// EL을 사용하여 얻은 값을 변수에 저장
										   CoseListDTO coseList = (CoseListDTO)pageContext.getAttribute("mbti_full_cose");
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
<%@ include file="../footer.jsp" %>
	