<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<Style>
.sub_header{
position:relative;
text-align:center;
display: block;
font-size: 20px;
height: 600px;
}

.sub_header h1{
margin-top: 40px;
margin-bottom: 10px;
}

.sub_header>a{
position:absolute;
top:100px;
left:20px;
   font-size: 20px; 
}
.sub_header>.cose_list li {
   list-style: none;
   float: left;
   margin-left:70px;
   padding-right: 12px;
   
}
.sub_header>.cose_list a{
text-decoration: none;
}
</Style>

</head>
<body>
<div class="sub_header">

<a href="mainpage_after_login.jsp">메인화면으로</a>
<h1>지역별 여행 코스 추천</h1>

<ul>
	<li><a href="RootFinderServlet?command=local_cose_view&local=인천/경기">인천/경기</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=서울">서울</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=강원">강원</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=충북">충북</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=대전/충남">대전/충남</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=전북">전북</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=광주/전남">광주/전남</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=대구/경북">대구/경북</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=부산/경남">부산/경남</a></li>
	<li><a href="RootFinderServlet?command=local_cose_view&local=제주">제주</a></li>
</ul>
	</div>
<br>
<hr>
