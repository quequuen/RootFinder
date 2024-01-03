<%@page import="com.RootFinder.dto.CoseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="../script/RootFinder.js"></script>
<style type="text/css">
* {
	padding: 0;
	margin: 0 auto;
}

a {
	text-decoration: none;
	color: black;
}

li {
	list-style: none;
}
</style>
<style type="text/css">
#body {
	width: 100%;
	margin: 0 auto;
}

.rootpage_header {
	margin-top:140px;
	border: 1px solid black;
	width: 1200px;
	height: 250px;	
}

.a_tags{
	font-size:14px;
	margin: 0;
	padding: 0;
	width: 100px;
	margin-left: 1100px;
	height: 20px;
}

.a_tags >a {
	color: gray;
	margin: 0px;
	margin-left: 15px;
}

.a_tags >a:hover{
	color: black;
}
.rootpage_user {
	width: 800px;
	height: 150px;
	margin: 0 auto;
	padding: 0;
	margin-top: 55px;
}

.rootpage_user>.userimg {

	float: left;
	width: 80px;
	height: 80px;
	margin: 0;
	padding: 0;
	border-radius: 40px;
	
}

.rootpage_user>a {
	float: left;
	width: 150px;
	height: 50px;
	margin: 0;
	padding: 0;
	margin-top: 120px;
	margin-left: 10px;
}



.rootpage_user>p {
	float: left;
	width: 150px;
	height: 50px;
	margin: 0;
	padding: 0;
	text-align: left;
	line-height: 50px;
}



.travelname {
	width: 150px;
	height: 30px;
	margin: 0;
	padding: 0;
	margin-left: 95px;
}

.travelname>p {
	width: 150px;
	height: 30px;
	margin: 0;
	padding: 0;
}

.travelname>p {
	width: 150px;
	height: 30px;
	text-align: left;
	line-height: 30px;
}

.rootpage_menu {
	width: 1200px;
	height: 50px;
	margin-top:-20px;
}

.rootpage_menu>li {
	float: left;
	margin: 0;
	width: 100px;
	height: 50px;
}

.rootpage_menu>li>a {
	text-align: left;
	line-height: 50px;
	font-weight: bold;
}
</style>


<%

String main_img = request.getAttribute("main_img").toString();

%>

<div class="rootpage_header" style="background-image: url('image/<%=main_img %>'); background-size: 100% 100%;
    background-repeat: no-repeat;
    border:1px solid black;">
<div class="a_tags">

<a href="RootFinderServlet?command=check_before_back_to_main&id=${loginUser.id}">메인화면으로</a>

</div>
	<div class="rootpage_user" >
		<div class="userimg"><img src="image/${userDTO.profile_img}" width="80px" height="80px"></div>
		<h1 style="font-size: 22px; padding-top: 100px;">${userDTO.username} 님 </h1>
		<p style="font-size: 14px;">(${userDTO.id})</p>
	</div>
	
	<nav style="margin-top: 40px; font-size:14px; clear:both;">
		<ul class="rootpage_menu" style="padding-left: 70px; float: left;">
			<li><a href="RootFinderServlet?command=root_summary_form&code=${param.code}&id=${loginUser.id}">개요</a></li>
			<li><a href="RootFinderServlet?command=root_schedule_form&code=${param.code}">일정표</a></li>
			<li><a href="RootFinderServlet?command=root_comment_check&code=${param.code}">댓글</a></li>
		</ul>
	</nav>
	
</div>
