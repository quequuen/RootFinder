<%@page import="com.RootFinder.dto.CoseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp"%>
<%@ include file="rootHeader.jsp"%>

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

#wrap {
	width: 1200px;
	margin: 0 auto;
}
</style>
<style type="text/css">
.title {
	width: 1200px;
	height: 100px;
	margin: 0 auto;
	padding: 0;
	text-align: center;
}

.title>p {
	font-size: 3em;
	font-weight: bold;
	line-height: 100px;
	margin: 0;
	padding: 0;
	text-align: right;
}

.day {
	margin: 0;
	padding: 0;
	width: 150px;
	height: 60px;
	background-color: black;
	margin-top: 5px;
	margin-bottom: 5px;
}

.day>p {
	color: white;
	text-align: center;
	font_weight: bold;
	font-size: 2.5em;
	line-height: 60px;
}

.cosedetail {
	margin: 0;
	padding: 0;
	margin-left: 150px;
	margin-top: 10px;
	margin-bottom: 10px;
	width: 1000px;
	height: 300px;
	border: 1px solid black;
	border-radius: 50px;
}

.cosedetail .cosedetail_img {
	margin: 0;
	padding: 0;
	width: 250px;
	height: 280px;
	float: left;
	border: 1px solid black;
	margin-left: 70px;
	margin-top: 10px;
}

.cosedetail_detail {
	margin: 0;
	padding: 0;
	width: 595px;
	height: 58px;
	margin-left: 330px;
	margin-top: 12px;
	border: 1px solid black;
	line-height: 58px;
	font-size: 1.3em;
	padding-left: 15px;
}

.content{
	margin: 0;
	padding: 0;
	width: 1200px;
	height: 200px;
	margin-top: 20px;
	margin-bottom: 20px;
	border: 1px solid black;
	line-height: 40px;
	font-size: 1.3em;
	
}
</style>

</head>
<body>
	<div id="wrap">
		<form method="post" name="frm">
		<input type="hidden" name="code" value="${param.code}">
			<div class="title" style="font-size: 14px;">
				<% String title = (String)request.getAttribute("title"); %>
				<p><%= title %></p>

			</div>
				
			<%
			//CoseList에 있는 DAY 중복되지 않게 하나만 가져오기 
			ArrayList<CoseDTO> arr = (ArrayList) request.getAttribute("coseList");
			String day = "";
			for (int i = 0; i < arr.size(); i++) {
				if (!day.equals(arr.get(i).getDay())) {
					System.out.println(arr.get(i).getDay());
					day = arr.get(i).getDay();
			%>

			<div class="day">
				<p style="font-size:18px "><%=day%>
				</p>
			</div>
			<%
			}

			String img = arr.get(i).getImg();
			String placename = arr.get(i).getPlaceName();
			String addr = arr.get(i).getAddr();
			String price = arr.get(i).getPrice();
			String starttime = arr.get(i).getStarttime();
			String endtime = arr.get(i).getEndtime();
			%>
			<!— img와 함께 일정에 대한 정보 가져오 —>
			<div class="cosedetail" style="font-size: 12px;">
				<div class="cosedetail_img">
					<img src="image/<%=img%>" style="width: 250px; height: 280px">
				</div>
				<div class="cosedetail_detail"><%=placename%></div>
				<div class="cosedetail_detail"><%=addr%></div>
				<div class="cosedetail_detail"><%=price%> 원</div>
				<div class="cosedetail_detail"><%=starttime%>~
					<%=endtime%></div>
			</div>
			<%
			}
			
			String content = arr.get(0).getContent();
			%>
			
			<div class="content" style="font-size: 20px;">
			<p><%=content %></p>
			</div>
		</form>
	</div>
	<div class="detail_blank" style="height: 100px;">
	</div>
<%@ include file="../footer.jsp"%>