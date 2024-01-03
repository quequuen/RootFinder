<%@page import="com.RootFinder.dao.CoseDAO"%>
<%@page import="com.RootFinder.dto.CoseListDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %> 
<link rel="stylesheet" href="css/mainpage_after.css">

<div id="wrap">
<article>	
	<h1>검색결과</h1>
	<p>${search}</p>
	
	<div class="one_page">
		<section id="trip">
			<div class="mbti">
				<div class="text">
					<h3>검색결과</h3>
				</div>
				<div class="sub_text">
					${search}
				</div>
				<c:choose>
					<c:when test="${result == 1 }">
					<c:forEach items="${cose_search_list}" var="cose_search_list" varStatus="status">
							<div class="picture">
							<a href="RootFinderServlet?command=root_summary_form&code=${cose_search_list.code}&type=first_click&id=${loginUser.id}" class="box">
								<div class="inner">
									<div class="inner_text">
										<span></span>
										<span class="tourday"></span><br>
										<!-- "따뜻한날 제주도에서 드라이브 너무 좋아요" -->
										<H4>${cose_search_list.title}</H4>
									</div>
								</div>
								<div class="trip_picture">
									<img src="./image/${cose_search_list.main_img}" style="width:100%; height:100%"> 
								</div>
								
								<div class="trip_inner">
								
									<span></span>
									
									<div class="fr list_view_icon">${cose_search_list.view_cnt}</div>
									
									
									<div class="clear"></div>
		
									<div class="list_city">${cose_search_list.main_addr}</div>
		
									<div class="clear"></div>
									
									<%
   											// EL을 사용하여 얻은 값을 변수에 저장
										   CoseListDTO coseList = (CoseListDTO)pageContext.getAttribute("cose_search_list");
										   CoseDAO cdao = CoseDAO.getInstance();
										   String username = cdao.getUsernameByCode(coseList.getCode());
										   
										%>
		
									<div class="list_user"><%=username %></div>
									
								</div>
								
							</a>
							</div>
					</c:forEach>
					</c:when>
				
					<c:otherwise>
					
					
					</c:otherwise>
				</c:choose>
				
				
		</section>
	</div>
</article>
</div>
<%@ include file="../footer.jsp" %> 