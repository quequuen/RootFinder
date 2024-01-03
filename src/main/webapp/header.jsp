<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel='stylesheet' href='css/header.css?v=1'>
<link rel="stylesheet" href='css/footer.css?v=1' />
<body>
<header>
<c:choose>
<c:when test="${empty loginUser}">
<div class="left-side">
			<nav>
				<a class="logo" href="mainpage.jsp">
					<picture>
						<img src="./image/logo.png" />
					</picture>
				</a>
				<div>
					<a href="RootFinderServlet?command=local_cose_view&local=인천/경기">여행지</a>
				</div>
				<div>
					<a href="RootFinderServlet?command=login_view&where=main" onclick="return msg()">코스 등록하기</a>
				</div>
				<div>
					<a href="https://www.agoda.com/">예약</a>
				</div>
				<div>
					<a href="RootFinderServlet?command=login_view&where=main" onclick="return msg()">마이페이지</a>
				</div>
			</nav>
			<div class="login">
				<button class="btn-login" type="button" onclick="location.href='RootFinderServlet?command=login_view&where=main'">로그인</button>
				<button class="btn-login" type="button" onclick="location.href='RootFinderServlet?command=join_view'">회원가입</button>
			</div>

		</div>
	</c:when>
	
	<c:otherwise>
		<div class="left-side"> 
			<nav>
				<a class="logo" href="mainpage_after_login.jsp">
					<picture>
						<img src="./image/logo.png" />
					</picture>
					
				</a>
				<div>
					<a href="RootFinderServlet?command=local_cose_view&local=인천/경기">여행지</a>
				</div>
				<div>
<!-- 					<a href="RootFinderServlet?command=root_write_form">코스 등록하기</a>
 -->					<a href="firstwrite.jsp">코스 등록하기</a>
				</div>
				<div>
					<a href="https://www.agoda.com/">예약</a>
				</div>
				<div>
					<a href="RootFinderServlet?command=my_cose&id=${loginUser.id}">마이페이지</a>
				</div>
			</nav>
			
				<div class="login">
					<span class="username">${loginUser.username}</span><span style="font-size:13px;">님 환영합니다!</span>
 					<input class="btn-logout" type="button" value="로그아웃" onclick="location.href='RootFinderServlet?command=logout_do'">
				
 				</div>
			</c:otherwise>
			
			</c:choose>
		</div>
				
		</header>
