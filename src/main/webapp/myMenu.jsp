<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<style type="text/css">
.profile{
height: 200px;
}

#profile_image{
margin: 0;
margin-top: 60px;
margin-left: 50px;
float: left;
}

#profile_image > img{
width: 80px;
height: 80px;
border-radius: 40px;
position : relative;
}

.profile h1{
	margin: 0;
	position: absolute;
	top: 180px;
	left: 200px; 
}



.hidden{
	margin: 0;
	position: absolute;
	display:none;
	top: 160px;
	left: 50px;
	width: 80px;
	height: 80px;
	border-radius: 40px;
	background-color: rgba(100,100,100,0.5);
	
	
	text-decoration: none;
	padding-top: 20px;
	font-size: 12px;
	text-align: center;
	line-height: 20px;
	color: white;
	font-weight: bold;
}

.img:hover+.hidden{
	display:block;
}

</style>
</head>
<link rel="stylesheet" href="css/myMenu.css?v=1"/>
<div class="mypage_main_menu">
<form action="RootFinderServlet" name="frm" method="post">
	<div class="profile">
		<div id="profile_image">
		<img src="image/${loginUser.profile_img}" class="img"/>
		<a href="RootFinderServlet?command=profileUpload" class="hidden">프로필 사진<br>수정</a>
			</div>
		<h1 style="font-size: 32px; padding-top: 0; padding-bottom: 50px;">${loginUser.username}님의 마이페이지</h1>
		
		
		
	</div>
	
	<div class="mypage">
		<div class="mypage_menu">
 			<a href="RootFinderServlet?command=my_cose&id=${loginUser.id}">내가 올린 코스 보기</a>
 		</div>
		  
		<div class="mypage_menu">
		    <a href="RootFinderServlet?command=my_view_cose&id=${loginUser.id}">내가 조회한 코스 보기</a>
		</div>
		  
		<div class="mypage_menu">
		    <a href="profileUpdate.jsp">프로필 수정</a>
		</div>
	</div>
</form>
</div>
</body>
</html>