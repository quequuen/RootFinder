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
					<a href="#user">ȸ�� ����</a>
				</div>
				<div>

					<a href="#cose">�ڽ� ����</a>
				</div>
				<div>
					<a href="#comment">��� ����</a>
				</div>
				
			</nav>
					
			<div class="login">
				<span class="username">������ ������ �Դϴ�!</span><span style="font-size:13px;"></span>
				<input class="btn-logout" type="button" value="�α׾ƿ�" onclick="location.href='RootFinderServlet?command=logout_do'">
			</div>
			
			
		</div>
		</header>
