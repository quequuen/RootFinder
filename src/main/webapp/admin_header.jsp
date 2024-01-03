<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel='stylesheet' href='css/header.css?v=1'>
<body>
<header>

		<div class="left-side"> 
			<nav>
				<a class="logo" href="#">
					<picture>
						<img src="./image/logo.png" />
					</picture>
					
				</a>
				<div>
					<a href="#user">회원 관리</a>
				</div>
				<div>

					<a href="#cose">코스 관리</a>
				</div>
				<div>
					<a href="#comment">댓글 관리</a>
				</div>
				
			</nav>
					
			<div class="login">
				<span class="username">관리자 페이지 입니다!</span><span style="font-size:13px;"></span>
				<input class="btn-logout" type="button" value="로그아웃" onclick="location.href='RootFinderServlet?command=logout_do'">
			</div>
			
			
		</div>
		</header>
